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
<link href="./css/windows/displaytag.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="./css/jqueryUI/jquery-ui.css" type="text/css">
<script type="text/javascript" src="js/jquery/jquery.js"></script>
<script type="text/javascript" src="js/jquery/jquery-ui.js"></script>
<script src="dwr/engine.js" type="text/javascript"></script>
<script src="dwr/util.js" type="text/javascript"></script>
<script src="dwr/interface/cityservice.js" type="text/javascript"></script>
<script type="text/javascript">
	var _cityName = true;
    var _cityCode = true;
	$(document).ready(
		function() {

	$('#cityName').keyup(
			function() {
				var cityName = $(this).val();
				if (cityName == '') {
					_cityName = false;
					$('#cityName').focus();
				} else {
					_cityName = true;
				}
			});
	$('#cityCode').keyup(
			function() {
				var cityCode = $(this).val();
				if (cityCode == '') {
					_cityCode = false;
					$('#cityCode').focus();
				} else {
					_cityCode = true;
				}
			});
					
	$('#save').click(
		function() {
		if (_cityName == true && _cityCode == true)
			modify();
		else
		    alert("请先输入再保存！");
		});
		
	
		$('#backtoMain').click(
		function() {
		window.location="baseinof_citybrowser.action?page=${requestScope.page}";
		});	
		
});
    
	function modify() {
		var City = {
		    "id":dwr.util.getValue("id"),
			"cityName" : dwr.util.getValue("cityName"),
			"cityCode" : dwr.util.getValue("cityCode")
		};
      cityservice.saveOrUpdateData(City, modifyHandler);
		
	}
		function modifyHandler(data) {
			if (data)
			{alert("信息修改成功！");	
			window.location="baseinof_citybrowser.action";
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
<label>城市信息修改</label>	
</div>		
		<fieldset id="fieldset-box">
			<legend  style="color:red;">信息修改:</legend>
				<table id="newspaper-b">
					<tr>
						<td>城市名称:*</td>
						<td style="border-style:none solid none none;border-width:1.5px;border-color:#69c;"><s:textfield id="cityName" name="cityName"
								cssClass="mytxt" placeholder="请输入城市名称" style="width:300px;" /></td>
						<td>城市代码:*</td>
						<td style="border-style:none solid none none;border-width:1.5px;border-color:#69c;"><s:textfield id="cityCode" name="cityCode"
								cssClass="mytxt" placeholder="请输入城市代码" style="width:300px;" /></td>
						<td><button type="button" class="button blue"
								style="font-size:16px;margin:auto;" id="save">修改&nbsp;保&nbsp;存</button></td>
						<td><button type="button" class="button blue"
								style="font-size:16px;margin:auto;" id="backtoMain">取&nbsp;消&nbsp;返&nbsp;回</button></td>		
					</tr>
				</table>
				<s:hidden id="id" name="id"></s:hidden>
</fieldset>
<jsp:include page="/WEB-INF/component/modifyInformation.jsp" flush="true" /> 
</div>
  </body>
</html>
