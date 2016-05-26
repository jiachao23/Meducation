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
<script type="text/javascript" src="js/jquery/jquery.ui.datepicker-zh-CN.js"></script>   
<script src="dwr/engine.js" type="text/javascript"></script>
<script src="dwr/util.js" type="text/javascript"></script>
<script src="dwr/interface/courseservice.js" type="text/javascript"></script>
  
<script>
  $(function() {
    $('#courseBeginTime').datepicker();
    $('#courseEndTime').datepicker();
  });
  
</script>
  
<script type="text/javascript">
	var _courseName = false;
    var _courseNum = false;
    var _courseSubject = false;
	$(document).ready(function() {

	$('#courseName').keyup(
			function() {
				var courseName = $(this).val();
				if (courseName == '') {
					_courseName = false;
					$('#courseName').focus();
				} else {
					_courseName = true;
				}
			});
	$('#courseNum').keyup(
			function() {
				var courseNum = $(this).val();
				if (courseNum == '') {
					_courseNum = false;
					$('#courseNum').focus();
				} else {
					_courseNum = true;
				}
			});
	$('#courseSubject').keyup(
			function() {
				var courseSubject = $(this).val();
				if (courseSubject == '') {
					_courseSubject = false;
					$('#courseSubject').focus();
				} else {
					_courseSubject = true;
				}
			});		
					
	$('#save').click(
		function() {
		if (_courseName == true && _courseNum == true && _courseSubject == true)
			save();
		else
		    alert("请先输入带（*）的内容再保存！");
		});	
});
    
	function save() {
		var Course = {
			"courseName" : $("#courseName").val(),
			"courseSubject" : $("#courseSubject").val(),
			"courseNum" : $("#courseNum").val(),
			"courseContant" : $("#courseContant").val(),
			"courseTeacher" : $("#courseTeacher").val(),
			"coursePlace" : $("#coursePlace").val(),
			"courseBeginTime" : $("#courseBeginTime").val(),
			"courseEndTime" : $("#courseEndTime").val()
		};
		courseservice.saveData(Course, saveHandler);
		
	}
		function saveHandler(data) {
			if (data)
			{alert("信息保存完毕！");	
			window.location="CourseInfo_browser.action";
			}
		}

</script>

</head>
  
  <body>
    <jsp:include page="/WEB-INF/component/head.jsp" flush="true" /> 
    <jsp:include page="/WEB-INF/component/left.jsp" flush="true" /> 
    <jsp:include page="/WEB-INF/component/tooltip.jsp" flush="true" /> 

<div id="bodyColumn">
<div id="navigation">
<label class="first">您当前所在的位置：</label> 
<label>培训机构信息管理</label> 
<img alt="" src="img/TableIcon/Cristal_Intense_069.png"/>
<label>培训课程信息录入</label>	
</div>	
<fieldset id="fieldset-box">
			<legend>信息录入:</legend>		
				<table id="newspaper-b">
					<tr>
						<td class="buttom">课程名称:*</td>
						<td class="buttom_right"><s:textfield id="courseName" name="courseName"
								cssClass="mytxt" placeholder="请输入课程名称" style="width:200px;" /></td>
						<td class="buttom">课程编号:*</td>
						<td class="buttom_right"><s:textfield id="courseNum" name="courseNum"
								cssClass="mytxt" placeholder="请输入课程编号" style="width:200px;" /></td>		
						<td class="buttom">课程学科类别:*</td>
						<td class="buttom_right"><s:textfield id="courseSubject" name="courseSubject"
								cssClass="mytxt" placeholder="请输入课程学科类别" style="width:200px;" /></td>
						<td colspan="2" style="text-align:center;" class="buttom"><button type="button" class="button blue"
								style="font-size:16px;margin:auto;" id="save">保&nbsp;&nbsp;&nbsp;存</button></td>
					</tr>
					<tr>						
						<td class="buttom">课程开始时间:</td>
						<td class="buttom_right"><s:textfield id="courseBeginTime" name="courseBeginTime"
								cssClass="mytxt" placeholder="请输入课程开始时间" style="width:200px;" /></td>
						<td class="buttom">课程结束时间:</td>
						<td class="buttom_right"><s:textfield id="courseEndTime" name="courseEndTime"
								cssClass="mytxt" placeholder="请输入课程结束时间" style="width:200px;" /></td>
						<td class="buttom">上课教师:</td>
						<td class="buttom_right"><s:textfield id="courseTeacher" name="courseTeacher"
								cssClass="mytxt" placeholder="请输入上课教师" style="width:200px;" /></td>
						<td class="buttom">上课地点:</td>
						<td class="buttom_right"><s:textfield id="coursePlace" name="coursePlace"
								cssClass="mytxt" placeholder="请输入上课地点" style="width:200px;" /></td>				
					</tr>
					<tr>
					<td colspan="8">课程内容介绍:<br /> <s:textarea id="courseContant" name="courseContant" cols="180" rows="6" cssClass="mytextarea"/></td>
					</tr>
				</table>
		</fieldset>	
			<div id="displayTable">
					<display:table name="pageList" id="table" export="true" requestURI="CourseInfo_browser.action"
						defaultsort="1" defaultorder="descending">
						<display:column title="序号" sortable="true" headerClass="sortable"
							style="text-align:center;"> 
				${(pageList.pageNumber-1)*pageList.objectsPerPage+table_rowNum} 
			</display:column>
						<display:column property="courseName" title="课程名称" sortable="true"
							headerClass="sortable" style="text-align:center;" />
						<display:column property="courseNum" title="课程编号" sortable="true"
							headerClass="sortable" style="text-align:center;" />
							<display:column property="courseSubject" title="课程学科类别" sortable="true"
							headerClass="sortable" style="text-align:center;" />
							<display:column property="courseBeginTime" title="课程开始时间" sortable="true"
							headerClass="sortable" style="text-align:center;" />
							<display:column property="courseEndTime" title="课程结束时间" sortable="true"
							headerClass="sortable" style="text-align:center;" />
							<display:column property="courseTeacher" title="上课教师" sortable="true"
							headerClass="sortable" style="text-align:center;" />
							<display:column property="coursePlace" title="上课地点" sortable="true"
							headerClass="sortable" style="text-align:center;" />
						<display:column title="课程内容介绍" media="html" style="text-align:center;">
						<img src="./img/MenuIcon/FUNC20071.gif" id="space"/><label class="seeinform" title="${table.courseContant}" style="color:blue;">查看详细</label>
						</display:column>	
						<display:column title="编辑" media="html" style="text-align:center;">
							<s:url action="CourseInfo_del" id="delcity">
								<s:param name="id" value="%{#attr.table.id}" />
								<s:param name="page">${pageList.pageNumber}</s:param>
							</s:url>
							<img src="./img/MenuIcon/FUNC20029.gif" id="space"/><a href="${delcity}" onclick="return window.confirm('您真的想删除本条记录吗？删除后将不可恢复！')">删除</a>&nbsp;
							<s:url action="CourseInfo_edit" id="editcity">
								<s:param name="id" value="%{#attr.table.id}" />
								<s:param name="page">${pageList.pageNumber}</s:param>
							</s:url>							
							<img src="./img/MenuIcon/FUNC20071.gif" id="space"/><a href="${editcity}">修改</a>	
			</display:column>
						
						<display:setProperty name="export.pdf" value="false" />
						<display:setProperty name="export.csv" value="false" />
						<display:setProperty name="export.xml" value="false" />
						<display:setProperty name="export.excel.filename" value="Course.xls" />
						<display:setProperty name="export.excel.include_header"
							value="true" />
					</display:table>		
			</div>
<jsp:include page="/WEB-INF/component/saveInformation.jsp" flush="true" />
</div>
  </body>
</html>
