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

	var _courseName = true;
    var _courseNum = true;
    var _courseSubject = true;
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
		
	 $('#backtoMain').click(
		function() {
		window.location="CourseInfo_browser.action?page=${requestScope.page}";
		});			
});
    
	function save() {
		var Course = {
			"id":dwr.util.getValue("id"),
			"courseName" : dwr.util.getValue("courseName"),
			"courseSubject" : dwr.util.getValue("courseSubject"),
			"courseNum" : dwr.util.getValue("courseNum"),
			"courseContant" : dwr.util.getValue("courseContant"),
			"courseTeacher" : dwr.util.getValue("courseTeacher"),
			"coursePlace" : dwr.util.getValue("coursePlace"),
			"courseBeginTime" : dwr.util.getValue("courseBeginTime"),
			"courseEndTime" : dwr.util.getValue("courseEndTime")
		};
		courseservice.saveOrUpdateData(Course, saveHandler);
		
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

<div id="bodyColumn">
<div id="navigation">
<label class="first">您当前所在的位置：</label> 
<label>培训机构信息管理</label> 
<img alt="" src="img/TableIcon/Cristal_Intense_069.png"/>
<label>培训课程信息修改</label>	
</div>	
			<fieldset id="fieldset-box">
			<legend style="color:red;">信息修改:</legend>
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
						<td class="buttom"><button type="button" class="button blue"
								style="font-size:16px;margin:auto;" id="save">修&nbsp;改&nbsp;保&nbsp;存</button></td>
						<td class="buttom" style="text-align:center;"><button type="button" class="button blue"
								style="font-size:16px;margin:auto;" id="backtoMain">取&nbsp;消&nbsp;返&nbsp;回</button></td>				
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
					<td colspan="8">课程内容介绍:<br /> <s:textarea id="courseContant" name="courseContant" cols="180" rows="10" cssClass="mytextarea"/></td>
					</tr>
				</table>
				<s:hidden id="id" name="id"></s:hidden>
		</fieldset>	
<jsp:include page="/WEB-INF/component/modifyInformation.jsp" flush="true" /> 			
</div>
  </body>
</html>
