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

<style type="text/css">
<!--
div.savetishi{
margin:0 20px;
color:0B33B0;
vertical-align:text-bottom;
font-weight:bold;
}

p.header{
padding:5px;margin:5px;font-size:15px;
}
p.infor{
margin:0 40px;font-size:15px;
}
-->
</style>
<script>
  $(function() {
    $( document ).tooltip({
     show: {effect: "slideDown",delay: 250},
     hide: {effect: "explode",delay: 250},
      items: "label.infom",
      content: function() {
          return "<div>"+"<p class='header'><strong>综合信息查看说明：</strong></p>"+
          "<p class='infor'>1、当前界面列出了培训计划、培训实施机构、及培训课程的全部相关信息；</p>"
          +"<p class='infor'>2、用户如需更换培训机构及课程，请点击“返回上级”按钮，并点击“选择机构”按钮，重新进行选课；</p>"+
          "</div>";
      }
    });  

	$('#back').click(
		function() {
		if(${sessionScope.Source}=='1')	
         window.location="PlanSchool_browser.action?page=${sessionScope.firstlevel_page}"; 
         else if(${sessionScope.Source}=='2')
         window.location="PlanSchool_history.action?page=${sessionScope.firstlevel_page}";       
		});
});
</script>

</head>
  
<body>
<jsp:include page="/WEB-INF/component/head.jsp" flush="true" /> 
<jsp:include page="/WEB-INF/component/left.jsp" flush="true" /> 
<jsp:include page="/WEB-INF/component/tooltip.jsp" flush="true" /> 
<div id="bodyColumn">
<div id="navigation">
<label class="first">您当前所在的位置：</label> 
<label>学校教育信息管理</label> 
<img alt="" src="img/TableIcon/Cristal_Intense_069.png"/>
<a href="PlanSchool_browser.action?page=${sessionScope.firstlevel_page}">实施培训计划</a>
<img alt="" src="img/TableIcon/Cristal_Intense_069.png"/>
<label>查看培训内容综合信息</label>		
</div>

<fieldset id="fieldset-box">
			<legend>培训内容综合信息:</legend>		
				<table id="newspaper-b">
					<tr>
						<td class="buttom">培训计划名称:</td>
						<td class="buttom_right" colspan="4"><s:textfield disabled="true" id="planName" name="planName" 
								cssClass="mytxt" placeholder="请输入培训计划名称" style="width:800px;" /></td>
						<td class="buttom">		
								<button type="button" class="button blue"
								style="font-size:16px;margin:auto;" id="back">返&nbsp;回&nbsp;上&nbsp;级</button></td>
					</tr>
					<tr>
					<td class="buttom">培训计划编号:</td>
						<td class="buttom_right"><s:textfield  disabled="true" id="planNum" name="planNum"
								cssClass="mytxt" placeholder="请输入培训计划编号" style="width:200px;" /></td>
						<td class="buttom">计划开始时间:</td>
						<td class="buttom_right"><s:textfield  disabled="true" id="beginTime" name="beginTime"
								cssClass="mytxt" placeholder="请输入计划开始时间" style="width:200px;" /></td>
						<td class="buttom">计划结束时间:</td>
						<td class="buttom_right"><s:textfield disabled="true" id="endTime" name="endTime"
								cssClass="mytxt" placeholder="请输入计划结束时间" style="width:200px;" /></td>		
					</tr>
					<tr>						
						<td colspan="6">培训计划具体内容:<br /> <s:textarea id="introduce" name="introduce" cols="160" rows="6" disabled="true" cssClass="mytextarea"/></td>										
					</tr>
				</table>
				<table id="newspaper-b">
					<tr>
						<td class="buttom">培训机构名称:*</td>
						<td class="buttom_right"><s:textfield id="agenceName" name="agenceName" disabled="true"
								cssClass="mytxt" placeholder="请输入培训机构名称" style="width:300px;" /></td>
						<td class="buttom">培训机构代码:*</td>
						<td class="buttom_right"><s:textfield id="agenceCode" name="agenceCode" disabled="true"
								cssClass="mytxt" placeholder="请输入培训机构代码" style="width:300px;" /></td>
					</tr>
					<tr>
						<td class="buttom">法定代表人:*</td>
						<td class="buttom_right"><s:textfield id="agengcePerson" name="agengcePerson" disabled="true"
								cssClass="mytxt" placeholder="请输入法定代表人名称" style="width:300px;" /></td>
						<td class="buttom">机构联系电话:</td>
						<td class="buttom_right"><s:textfield id="tel" name="tel" disabled="true"
								cssClass="mytxt" placeholder="请输入机构联系电话" style="width:300px;" /></td>		
					</tr>
					<tr>
					<td colspan="4">培训机构简介:<br /> <s:textarea id="agenceIntroduce" name="agenceIntroduce" cols="160" rows="6" disabled="true" cssClass="mytextarea"/></td>
					</tr>
				</table>
		</fieldset>	
				
			
			<div id="displayTable">
					<display:table name="pageList" id="table" export="true" requestURI="PlanSchool_lookCourse.action"
						defaultsort="1" defaultorder="descending">
						<display:column title="序号" sortable="true" headerClass="sortable"
							style="text-align:center;"> 
				${(pageList.pageNumber-1)*pageList.objectsPerPage+table_rowNum} 
			</display:column>
						<display:column property="courseName" title="课程名称" sortable="true"
							headerClass="sortable" style="text-align:center;" />
						<display:column property="courseCode" title="课程编号" sortable="true"
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
						
						<display:setProperty name="export.pdf" value="false" />
						<display:setProperty name="export.csv" value="false" />
						<display:setProperty name="export.xml" value="false" />
						<display:setProperty name="export.excel.filename" value="Course.xls" />
						<display:setProperty name="export.excel.include_header"
							value="true" />
					</display:table>		
			</div>
<div class="savetishi"><img src="img/function/help.png" style="width:15px;height:15px;"/>&nbsp;<label class="infom">综合信息查看说明</label></div>
			
</div>
  </body>
</html>
