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

<script type="text/javascript">
 $(function() {		
	$('#back').click(
		function() {
		  if(${sessionScope.Source}=='1')		
          window.location="AgencyCourse_showInAgency.action?PlanId=${sessionScope.G_PlanId}"; 
          else if(${sessionScope.Source}=='3')
          window.location="PlanAgency_browser.action?page=${sessionScope.firstlevel_page}";          
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
<label>培训机构信息管理</label> 
<img alt="" src="img/TableIcon/Cristal_Intense_069.png"/>
<a href="PlanInfo_browser.action" style="color:blue;">实施培训计划</a>
<img alt="" src="img/TableIcon/Cristal_Intense_069.png"/>
<label>查看课程信息</label>		
</div>

	<div style="text-align:center;">
	<table>
	  <tr>					
        <td style="width:1500px;text-align:right;"><button type="button" class="button black"
			style="font-size:16px;margin:auto;" id="back">返&nbsp;回&nbsp;上&nbsp;级</button> </td>
	  </tr>
	</table>		
	</div>		
 
			<div id="displayTable">
					<display:table name="pageList" id="table" export="true" requestURI="CourseChoose_look.action"
						defaultsort="1" defaultorder="descending">
						<display:column title="序号" sortable="true" headerClass="sortable"
							style="text-align:center;"> 
				${(pageList.pageNumber-1)*pageList.objectsPerPage+table_rowNum} 
			</display:column>
						<display:column property="planName" title="培训计划名称" sortable="true"
							headerClass="sortable" style="text-align:center;" />
						<display:column property="planCode" title="培训计划编号" sortable="true"
							headerClass="sortable" style="text-align:center;" />
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
						<display:column title="编辑" media="html" style="text-align:center;">
							<s:url action="AgencyCourse_querydel" id="delcity">
								<s:param name="id" value="%{#attr.table.id}" />
								<s:param name="page">${pageList.pageNumber}</s:param>
								<s:param name="PlanId">${sessionScope.G_PlanId}</s:param>
							</s:url>
							<img src="./img/MenuIcon/FUNC20029.gif"/>&nbsp;
							<s:if test="#attr.table.status=='正在执行'">	
							<label class="seeinform">不可编辑</label>
							</s:if>
							<s:else>						
							<a href="${delcity}" onclick="return window.confirm('您真的想删除本条记录吗？删除后将不可恢复！')">删除</a>
			                </s:else> 
			             </display:column>
			            <display:setProperty name="export.pdf" value="false" />
						<display:setProperty name="export.csv" value="false" />
						<display:setProperty name="export.xml" value="false" />
						<display:setProperty name="export.excel.filename" value="PlanSchool.xls" />
						<display:setProperty name="export.excel.include_header"
							value="true" />
					</display:table>		
			</div>
			<s:hidden id="pid" name="pid"></s:hidden>
<jsp:include page="/WEB-INF/component/resultInformation.jsp" flush="true" />
</div>
  </body>
</html>