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
<script src="dwr/interface/schoolservice.js" type="text/javascript"></script>
<script type="text/javascript">
   
	var _belongDistrictName = true;
    var _schoolName = true;
    var _schoolCode = true;
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
	
	$('#DistrictName').combobox({
        onSelect: function(rec){
				$('#belongDistrictName').attr('value',rec.district); 
				$('#belongDistrictCode').attr('value',rec.code); 
				}
	});
						
	$('#save').click(
		function() {
		if (_schoolName == true && _schoolCode == true && _belongDistrictName == true)
			save();
		else
		    alert("请先输入带（*）的内容再保存！")
		});	
		
		$('#backtoMain').click(
		function() {
		window.location="SchoolInfo_browser.action?page=${requestScope.page}";
		});				
});
    
	function save() {
		var School = {
			"id" : dwr.util.getValue("id"),
		    "belongDistrictName" : dwr.util.getValue("belongDistrictName"),
		    "belongDistrictCode" : dwr.util.getValue("belongDistrictCode"),
		    "schoolName" : dwr.util.getValue("schoolName"),
		    "schoolCode" : dwr.util.getValue("schoolCode"),
			"schoolType" : $('#st').combobox('getText'),
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
						$('#DistrictName').combobox('loadData', dd);
						$('#DistrictName').combobox('setText', $('#belongDistrictName').val()); 
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
<label>学校信息修改</label>	
</div>		
			<fieldset id="fieldset-box">
			<legend style="color:red;">信息修改:</legend>
				<table id="newspaper-b">
					<tr>
					<td class="buttom">所属区(县):*</td>
						<td class="buttom_right">
                        <input class="easyui-combobox" style="width:200px;height:30px;" id="DistrictName" name="DistrictName" data-options="
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
						<td class="buttom_right"><button type="button" class="button blue"
								style="font-size:16px;margin:auto;" id="save">修&nbsp;改&nbsp;保&nbsp;存</button></td>
					</tr>
					<tr>
					<td>学校类型:</td>
						<td style="border-style:none solid none none;border-width:1.5px;border-color:#69c;">
					<input id="st" name="st" placeholder="请选择学校类型" class="easyui-combobox" style="width:200px;height:30px;"
					data-options="url: 'data/school_type.json',valueField: 'id',textField: 'text',
					onLoadSuccess: function(){                       
						$('#st').combobox('setText', $('#schoolType').val()); 
                    }"/>
								</td>
					<td >学校地址:</td>
						<td style="border-style:none solid none none;border-width:1.5px;border-color:#69c;" colspan="3"><s:textfield id="schoolAddress" name="schoolAddress"
								cssClass="mytxt" placeholder="请输入学校地址" style="width:480px;" /></td>
					<td><button type="button" class="button blue"
								style="font-size:16px;margin:auto;" id="backtoMain">取&nbsp;消&nbsp;返&nbsp;回</button></td>								
					</tr>
				</table>
			</fieldset>
			<s:hidden id="id" name="id"></s:hidden>
			<s:hidden id="belongDistrictName" name="belongDistrictName"></s:hidden>
			<s:hidden id="belongDistrictCode" name="belongDistrictCode"></s:hidden>
			<s:hidden id="schoolType" name="schoolType"></s:hidden>
<jsp:include page="/WEB-INF/component/modifyInformation.jsp" flush="true" /> 
</div>
  </body>
</html>
