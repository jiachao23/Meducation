<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@ taglib uri="http://displaytag.sf.net" prefix="display" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<title>教师继续教育培训管理系统</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="教师继续教育培训管理系统">
<link href="./css/windows/main.css" rel="stylesheet" type="text/css" />
<link href="./css/windows/table.css" rel="stylesheet" type="text/css" />
<link href="./css/windows/button.css" rel="stylesheet" type="text/css" />
<link href="./css/windows/displaytag.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="./css/jqueryUI/combobox.css">
<link rel="stylesheet" href="./css/jqueryUI/jquery-ui.css" type="text/css">
<script type="text/javascript" src="js/jquery/jquery.js"></script>
<script type="text/javascript" src="js/jquery/jquery-ui.js"></script> 
<script type="text/javascript" src="js/jquery/jquery.easyui.min.js"></script>
<script src="dwr/engine.js" type="text/javascript"></script>
<script src="dwr/util.js" type="text/javascript"></script>
<script src="dwr/interface/schoolservice.js" type="text/javascript"></script>
<script type="text/javascript">
   
	var _belongDistrictName = false;
    var _schoolName = false;
    var _schoolCode = false;
	$(document).ready(
		function() {

	$('#schoolName').keyup(
			function() {
				var schoolName = $(this).val();
				if (schoolName == '') {
					_schoolName = false;
					$('#schoolName').focus();
				} else {
					_schoolName = true;
				}
			});
	$('#schoolCode').keyup(
			function() {
				var schoolCode = $(this).val();
				if (schoolCode == '') {
					_schoolCode = false;
					$('#schoolCode').focus();
				} else {
					_schoolCode = true;
				}
			});
			
	$('#belongDistrictName').combobox({
       onSelect: function(rec){
			if(rec.city=='')
					_belongDistrictName = false;
				 else 
					_belongDistrictName = true;
				}
	});
						
	$('#save').click(
		function() {
		if (_schoolName == true && _schoolCode == true && _belongDistrictName == true)
			save();
		else
		    alert("请先输入带（*）的内容再保存！")
		});	
});
    
	function save() {

		var School = {
		    "belongDistrictName" : $('#belongDistrictName').combobox('getText'),
		    "belongDistrictCode" : $('#belongDistrictName').combobox('getValue'),
		    "schoolName" : dwr.util.getValue("schoolName"),
		    "schoolCode" : dwr.util.getValue("schoolCode"),
			"schoolType" : $('#schoolType').combobox('getText'),
			"schoolAddress" : dwr.util.getValue("schoolAddress")
		};
		schoolservice.saveData(School, saveHandler);

		
	}
		function saveHandler(data) {
			if (data)
			{alert("信息保存完毕！");	
			window.location="SchoolInfo_browser.action";
			}
		}

		var myloader = function(success,error){
			$.ajax({
				url: "SchoolInfo_district.action",  
                dataType: "json",  
				success: function(data){                       
						var dd = $.parseJSON(data);
						$('#belongDistrictName').combobox('loadData', dd); 
                    }, 
                error: function(){
					alert("远程数据无法加载！");
				}
			});
		}
</script>

</head>
  
  <body>
<jsp:include page="/WEB-INF/component/head.jsp" flush="true" /> 
    <jsp:include page="/WEB-INF/component/left.jsp" flush="true" /> 

<div id="bodyColumn">
<div id="navigation">
<label class="first">您当前所在的位置：</label> 
<label>基础信息管理</label> 
<img alt="" src="img/TableIcon/Cristal_Intense_069.png"/>
<label>学校信息录入</label>	
</div>		
			<fieldset id="fieldset-box">
			<legend>信息录入:</legend>
				<table id="newspaper-b">
					<tr>
					<td class="buttom">所属区(县):*</td>
						<td class="buttom_right">
                        <input class="easyui-combobox" style="width:200px;height:30px;" id="belongDistrictName" name="belongDistrictName" data-options="
				loader: myloader,
				valueField: 'code',
				textField: 'district'">
                        </td>
						<td class="buttom">学校名称:*</td>
						<td class="buttom_right"><s:textfield id="schoolName" name="schoolName"
								cssClass="mytxt" placeholder="请输入学校名称" style="width:200px;" /></td>
						<td class="buttom">学校代码:*</td>
						<td class="buttom_right"><s:textfield id="schoolCode" name="schoolCode"
								cssClass="mytxt" placeholder="请输入学校代码" style="width:200px;" /></td>
						<td rowspan="2"><button type="button" class="button blue"
								style="font-size:16px;margin:auto;" id="save">保&nbsp;&nbsp;&nbsp;存</button></td>
					</tr>
					<tr>
					<td>学校类型:</td>
						<td style="border-style:none solid none none;border-width:1.5px;border-color:#69c;">
					<input id="schoolType" name="schoolType" placeholder="请选择学校类型" class="easyui-combobox" style="width:200px;height:30px;"
					data-options="
				url: 'data/school_type.json',
				method: 'get',
				valueField: 'id',
				textField: 'text'">
								</td>
					<td >学校地址:</td>
						<td style="border-style:none solid none none;border-width:1.5px;border-color:#69c;" colspan="3"><s:textfield id="schoolAddress" name="schoolAddress"
								cssClass="mytxt" placeholder="请输入学校地址" style="width:480px;" /></td>			
					</tr>
				</table>
			</fieldset>
			<div id="displayTable">
					<display:table name="pageList" id="table" export="true" requestURI="SchoolInfo_browser.action"
						defaultsort="1" defaultorder="descending">
						<display:column title="序号" sortable="true" headerClass="sortable"
							style="text-align:center;"> 
				${(pageList.pageNumber-1)*pageList.objectsPerPage+table_rowNum} 
			</display:column>
						<display:column property="belongDistrictName" title="所属区(县)" sortable="true"
							headerClass="sortable" style="text-align:center;" />
						<display:column property="schoolName" title="学校名称" sortable="true"
							headerClass="sortable" style="text-align:center;" />
						<display:column property="schoolCode" title="学校代码" sortable="true"
							headerClass="sortable" style="text-align:center;" />
						<display:column property="schoolType" title="学校类型" sortable="true"
							headerClass="sortable" style="text-align:center;" />
						<display:column property="schoolAddress" title="学校地址" sortable="true"
							headerClass="sortable" style="text-align:center;" />	
						<display:column title="编辑" media="html" style="text-align:center;">
							<s:url action="SchoolInfo_del" id="delcity">
								<s:param name="id" value="%{#attr.table.id}" />
								<s:param name="page">${pageList.pageNumber}</s:param>
							</s:url>
							<img src="./img/MenuIcon/FUNC20029.gif" id="space"/><a href="${delcity}" onclick="return window.confirm('您真的想删除本条记录吗？删除后将不可恢复！')">删除</a>&nbsp;
							<s:url action="SchoolInfo_edit" id="editcity">
								<s:param name="id" value="%{#attr.table.id}" />
								<s:param name="page">${pageList.pageNumber}</s:param>
							</s:url>							
							<img src="./img/MenuIcon/FUNC20071.gif" id="space"/><a href="${editcity}">修改</a>	
			</display:column>
						<display:setProperty name="export.pdf" value="false" />
						<display:setProperty name="export.csv" value="false" />
						<display:setProperty name="export.xml" value="false" />
						<display:setProperty name="export.excel.filename" value="school.xls" />
						<display:setProperty name="export.excel.include_header"
							value="true" />
					</display:table>		
			</div>
<jsp:include page="/WEB-INF/component/saveInformation.jsp" flush="true" /> 
</div>

  </body>
</html>
