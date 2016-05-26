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
<script type="text/javascript" src="js/jquery/jquery.js"></script>
<script type="text/javascript" src="js/jquery/jquery-ui.js"></script>
<script src="dwr/engine.js" type="text/javascript"></script>
<script src="dwr/util.js" type="text/javascript"></script>
<script src="dwr/interface/cityservice.js" type="text/javascript"></script>
<script type="text/javascript">
	var _cityName = false;
    var _cityCode = false;
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
			save();
		else
		    alert("请先输入带（*）的内容再保存！");
		});	
});
    
	function save() {
		var City = {
			"cityName" : dwr.util.getValue("cityName"),
			"cityCode" : dwr.util.getValue("cityCode")
		};
		cityservice.saveData(City, saveHandler);
		
	}
		function saveHandler(data) {
			if (data)
			{alert("信息保存完毕！");	
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
<label>城市信息录入</label>
</div>

	
			<fieldset id="fieldset-box">
			<legend>信息录入:</legend>
				<table id="newspaper-b">
					<tr>
						<td>城市名称:*</td>
						<td style="border-style:none solid none none;border-width:1.5px;border-color:#69c;"><s:textfield id="cityName" name="cityName"
								cssClass="mytxt" placeholder="请输入城市名称" style="width:300px;" /></td>
						<td>城市代码:*</td>
						<td style="border-style:none solid none none;border-width:1.5px;border-color:#69c;"><s:textfield id="cityCode" name="cityCode"
								cssClass="mytxt" placeholder="请输入城市代码" style="width:300px;" /></td>
						<td><button type="button" class="button blue"
								style="font-size:16px;margin:auto;" id="save">保&nbsp;&nbsp;&nbsp;存</button></td>
					</tr>
				</table>
			</fieldset>
			<div id="displayTable">
					<display:table name="pageList" id="table" export="true" requestURI="baseinof_citybrowser.action"
						defaultsort="1" defaultorder="descending">
						<display:column title="序号" sortable="true" headerClass="sortable"
							style="text-align:center;"> 
				${(pageList.pageNumber-1)*pageList.objectsPerPage+table_rowNum} 
			</display:column>
						<display:column property="cityName" title="城市名称" sortable="true"
							headerClass="sortable" style="text-align:center;" />
						<display:column property="cityCode" title="城市代码" sortable="true"
							headerClass="sortable" style="text-align:center;" />
						<display:column title="编辑" media="html" style="text-align:center;">
							<s:url action="baseinof_citydel" id="delcity">
								<s:param name="id" value="%{#attr.table.id}" />
								<s:param name="page">${pageList.pageNumber}</s:param>
							</s:url>
							<img src="./img/MenuIcon/FUNC20029.gif" id="space"/><a href="${delcity}" onclick="return window.confirm('您真的想删除本条记录吗？删除后将不可恢复！')">删除</a>&nbsp;
							<s:url action="baseinof_cityedit" id="editcity">
								<s:param name="id" value="%{#attr.table.id}" />
								<s:param name="page">${pageList.pageNumber}</s:param>
							</s:url>							
							<img src="./img/MenuIcon/FUNC20071.gif" id="space"/><a href="${editcity}">修改</a>	
			</display:column>

						<display:setProperty name="export.pdf" value="false" />
						<display:setProperty name="export.csv" value="false" />
						<display:setProperty name="export.xml" value="false" />
						<display:setProperty name="export.excel.filename" value="city.xls" />
						<display:setProperty name="export.excel.include_header"
							value="true" />
					</display:table>		
			</div>
<jsp:include page="/WEB-INF/component/saveInformation.jsp" flush="true" /> 
</div>


  </body>
</html>
