<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>

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
<link rel="stylesheet" href="./css/jqueryUI/jquery-ui.css" type="text/css">
<script type="text/javascript" src="js/jquery/jquery.js"></script>
<script type="text/javascript" src="js/jquery/jquery-ui.js"></script> 
<script src="dwr/engine.js" type="text/javascript"></script>
<script src="dwr/util.js" type="text/javascript"></script>
<script src="dwr/interface/trainingagencyservice.js" type="text/javascript"></script>
<script type="text/javascript">
	var _agenceName = true;
    var _agenceCode = true;
    var _agengcePerson = true;
	$(document).ready(
		function() {

	$('#agenceName').keyup(
			function() {
				var agenceName = $(this).val();
				if (agenceName == '') {
					_agenceName = false;
					$('#agenceName').focus();
				} else {
					_agenceName = true;
				}
			});
	$('#agenceCode').keyup(
			function() {
				var agenceCode = $(this).val();
				if (agenceCode == '') {
					_agenceCode = false;
					$('#agenceCode').focus();
				} else {
					_agenceCode = true;
				}
			});
	$('#agengcePerson').keyup(
			function() {
				var agengcePerson = $(this).val();
				if (agengcePerson == '') {
					_agengcePerson = false;
					$('#agengcePerson').focus();
				} else {
					_agengcePerson = true;
				}
			});
					
	$('#save').click(
		function() {
		if (_agenceName == true && _agenceCode == true && _agengcePerson == true)
			save();
		else
		    alert("请先输入带（*）的内容再保存！");
		});
		
		$('#backtoMain').click(
		function() {
		window.location="AgencyInfo_browser.action?page=${requestScope.page}";
		});			
			
});
    
	function save() {
		var TrainingAgency = {
		    "id":dwr.util.getValue("id"),
			"agenceName" : dwr.util.getValue("agenceName"),
			"agenceCode" : dwr.util.getValue("agenceCode"),
			"agenceIntroduce" : dwr.util.getValue("agenceIntroduce"),
			"tel" : dwr.util.getValue("tel"),
			"agengcePerson" : dwr.util.getValue("agengcePerson")
		};
		trainingagencyservice.saveOrUpdateData(TrainingAgency, saveHandler);
		
	}
		function saveHandler(data) {
			if (data)
			{alert("信息保存完毕！");	
			window.location="AgencyInfo_browser.action";
			}
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
<label>培训机构信息修改</label>	
</div>	
			<fieldset id="fieldset-box">
			<legend style="color:red;">信息修改:</legend>
				<table id="newspaper-b">
					<tr>
						<td>培训机构名称:*</td>
						<td class="right"><s:textfield id="agenceName" name="agenceName"
								cssClass="mytxt" placeholder="请输入培训机构名称" style="width:300px;" /></td>
						<td>培训机构代码:*</td>
						<td class="right"><s:textfield id="agenceCode" name="agenceCode"
								cssClass="mytxt" placeholder="请输入培训机构代码" style="width:300px;" /></td>
						<td class="buttom_right"><button type="button" class="button blue"
								style="font-size:16px;margin:auto;" id="save">修&nbsp;改&nbsp;保&nbsp;存</button></td>
					</tr>
					<tr>
						<td class="buttom">法定代表人:*</td>
						<td class="buttom_right"><s:textfield id="agengcePerson" name="agengcePerson"
								cssClass="mytxt" placeholder="请输入法定代表人名称" style="width:300px;" /></td>
						<td class="buttom">机构联系电话:</td>
						<td class="buttom_right"><s:textfield id="tel" name="tel"
								cssClass="mytxt" placeholder="请输入机构联系电话" style="width:300px;" /></td>
						<td><button type="button" class="button blue"
								style="font-size:16px;margin:auto;" id="backtoMain">取&nbsp;消&nbsp;返&nbsp;回</button></td>					
					</tr>
					<tr>
					<td colspan="5">培训机构简介:<br /> <s:textarea id="agenceIntroduce" name="agenceIntroduce" cols="180" rows="10" cssClass="mytextarea"/></td>
					</tr>
				</table>
				<s:hidden id="id" name="id"></s:hidden>
</fieldset>
<jsp:include page="/WEB-INF/component/modifyInformation.jsp" flush="true" /> 
</div>
  </body>
</html>
