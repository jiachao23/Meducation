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
<link rel="stylesheet" href="./css/jqueryUI/jquery-ui.css" type="text/css">
<link rel="stylesheet" type="text/css" href="./css/jqueryUI/combobox.css">
<script type="text/javascript" src="js/jquery/jquery.js"></script>
<script type="text/javascript" src="js/jquery/jquery-ui.js"></script>
<script type="text/javascript" src="js/jquery/jquery.easyui.min.js"></script>
<script src="dwr/engine.js" type="text/javascript"></script>
<script src="dwr/util.js" type="text/javascript"></script>
<script src="dwr/interface/districtservice.js" type="text/javascript"></script>

<script type="text/javascript">
   
	var _districtName = false;
    var _districtCode = false;
    var _belongCityName = false;
	$(document).ready(
		function() {

	$('#districtName').keyup(
			function() {
				var districtName = $(this).val();
				if (districtName == '') {
					_districtName = false;
					$('#districtName').focus();
				} else {
					_districtName = true;
				}
			});
	$('#districtCode').keyup(
			function() {
				var districtCode = $(this).val();
				if (districtCode == '') {
					_districtCode = false;
					$('#districtCode').focus();
				} else {
					_districtCode = true;
				}
			});
			
	$('#belongCityName').combobox({
       onSelect: function(rec){
			if(rec.city=='')
					_belongCityName = false;
				 else 
					_belongCityName = true;
				}
	});
						
	$('#save').click(
		function() {
		if (_districtName == true && _districtCode == true && _belongCityName == true)
			save();
		else
		    alert("请先输入带（*）的内容再保存！")
		});	
});
    
	function save() {

		var District = {
		    "belongCityName" : $('#belongCityName').combobox('getText'),
		    "belongCityCode" : $('#belongCityName').combobox('getValue'),
			"districtName" : dwr.util.getValue("districtName"),
			"districtCode" : dwr.util.getValue("districtCode")
		};
		districtservice.saveData(District, saveHandler);

		
	}
		function saveHandler(data) {
			if (data)
			{alert("信息保存完毕！");	
			window.location="DistrictInfo_browser.action";
			}
		}

		var myloader = function(success,error){
			$.ajax({
				url: "DistrictInfo_city.action",  
                dataType: "json",  
				success: function(data){                       
						var dd = $.parseJSON(data);
						$('#belongCityName').combobox('loadData', dd); 
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
<label>区县信息录入</label>	
</div>		
			<fieldset id="fieldset-box">
			<legend>信息录入:</legend>
				<table id="newspaper-b">
					<tr>
					<td>所属城市:*</td>
						<td style="border-style:none solid none none;border-width:1.5px;border-color:#69c;">
                        <input class="easyui-combobox" style="width:200px;height:30px;" id="belongCityName" name="belongCityName" data-options="
				loader: myloader,
				valueField: 'code',
				textField: 'city'">
                        </td>
						<td>区（县）名称:*</td>
						<td style="border-style:none solid none none;border-width:1.5px;border-color:#69c;"><s:textfield id="districtName" name="districtName"
								cssClass="mytxt" placeholder="请输入区（县）名称" style="width:200px;" /></td>
						<td>区（县）代码:*</td>
						<td style="border-style:none solid none none;border-width:1.5px;border-color:#69c;"><s:textfield id="districtCode" name="districtCode"
								cssClass="mytxt" placeholder="请输入区（县）代码" style="width:200px;" /></td>
						<td><button type="button" class="button blue"
								style="font-size:16px;margin:auto;" id="save">保&nbsp;&nbsp;&nbsp;存</button></td>
					</tr>
				</table>
			</fieldset>
			<div id="displayTable">
					<display:table name="pageList" id="table" export="true" requestURI="DistrictInfo_browser.action"
						defaultsort="1" defaultorder="descending">
						<display:column title="序号" sortable="true" headerClass="sortable"
							style="text-align:center;"> 
				${(pageList.pageNumber-1)*pageList.objectsPerPage+table_rowNum} 
			</display:column>
						<display:column property="belongCityName" title="城市名称" sortable="true"
							headerClass="sortable" style="text-align:center;" />
						<display:column property="districtName" title="区（县）名称" sortable="true"
							headerClass="sortable" style="text-align:center;" />
						<display:column property="districtCode" title="区（县）代码" sortable="true"
							headerClass="sortable" style="text-align:center;" />
						<display:column title="编辑" media="html" style="text-align:center;">
							<s:url action="DistrictInfo_del" id="delcity">
								<s:param name="id" value="%{#attr.table.id}" />
								<s:param name="page">${pageList.pageNumber}</s:param>
							</s:url>
							<img src="./img/MenuIcon/FUNC20029.gif" id="space"/><a href="${delcity}" onclick="return window.confirm('您真的想删除本条记录吗？删除后将不可恢复！')">删除</a>&nbsp;
							<s:url action="DistrictInfo_edit" id="editcity">
								<s:param name="id" value="%{#attr.table.id}" />
								<s:param name="page">${pageList.pageNumber}</s:param>
							</s:url>							
							<img src="./img/MenuIcon/FUNC20071.gif" id="space"/><a href="${editcity}">修改</a>	
			</display:column>
						<display:setProperty name="export.pdf" value="false" />
						<display:setProperty name="export.csv" value="false" />
						<display:setProperty name="export.xml" value="false" />
						<display:setProperty name="export.excel.filename" value="district.xls" />
						<display:setProperty name="export.excel.include_header"
							value="true" />
					</display:table>		
			</div>
<jsp:include page="/WEB-INF/component/saveInformation.jsp"/> 
</div>
  </body>
</html>
