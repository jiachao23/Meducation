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
<script src="dwr/interface/teacherenrollmentservice.js" type="text/javascript"></script>  
<script type="text/javascript">

$(document).ready(
		function() {		
		$('#query').click(
		function() {
         $('#form').submit();
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
<label>课程成绩查询</label>	
</div>		
       <fieldset id="fieldset-box">
			<legend>信息查询:</legend>
         <s:form name="form" id="form" action="TeacherEnrollment_getScore.action" method="post">
				<table id="newspaper-b">	
					<tr>
						<td class="buttom">课程名称:</td>
						<td class="buttom_right"><s:textfield id="courseName" name="courseName"
								cssClass="mytxt" placeholder="请输入课程名称" style="width:200px;" /></td>
					    <td class="buttom">学校名称:</td>
						<td class="buttom_right"><s:textfield id="schoolName" name="schoolName"
								cssClass="mytxt" placeholder="请输入学校名称" style="width:200px;" /></td>
						<td class="buttom">教师姓名:</td>
						<td class="buttom_right"><s:textfield id="teacherRealName" name="teacherRealName"
								cssClass="mytxt" placeholder="请输入教师姓名" style="width:200px;" /></td>
						<td class="buttom">身份证号码:</td>
						<td class="buttom_right"><s:textfield id="teacherIdentifyNum" name="teacherIdentifyNum"
								cssClass="mytxt" placeholder="请输入身份证号码" style="width:300px;" /></td>					
                        <td style="text-align:center;" class="buttom"><button type="button" class="button blue"
								style="font-size:16px;margin:auto;" id="query">查&nbsp;&nbsp;&nbsp;询</button></td>		
					</tr>
				</table>
			</s:form>	
		</fieldset>	
			<div id="displayTable">
					<display:table name="pageList" id="table" export="true" requestURI="TeacherEnrollment_getScore.action"
						defaultsort="1" defaultorder="descending">
						<display:column title="序号" sortable="true" headerClass="sortable"
							style="text-align:center;"> 
				${(pageList.pageNumber-1)*pageList.objectsPerPage+table_rowNum} 
			</display:column>
						<display:column property="planName" title="培训计划" sortable="true"
							headerClass="sortable" style="text-align:center;"/>
						<display:column property="agencyName" title="培训机构" sortable="true"
							headerClass="sortable" style="text-align:center;" />	
						<display:column property="courseName" title="课程名称" sortable="true"
							headerClass="sortable" style="text-align:center;" />
						<display:column property="courseCode" title="课程编号" sortable="true"
							headerClass="sortable" style="text-align:center;" />
							<display:column property="courseBeginTime" title="课程开始时间" sortable="true"
							headerClass="sortable" style="text-align:center;" />
							<display:column property="courseEndTime" title="课程结束时间" sortable="true"
							headerClass="sortable" style="text-align:center;" />	
							<display:column property="schoolName" title="学校" sortable="true"
							headerClass="sortable" style="text-align:center;" />
							<display:column property="teacherRealName" title="教师姓名" sortable="true"
							headerClass="sortable" style="text-align:center;" />
							<display:column property="teacherIdentifyNum" title="教师身份证号码" sortable="true"
							headerClass="sortable" style="text-align:center;" />
							<display:column property="courseScore" title="课程成绩" sortable="true"
							headerClass="sortable" style="text-align:center;color:green;font-weight:bold;" />
			 			
						<display:setProperty name="export.pdf" value="false" />
						<display:setProperty name="export.csv" value="false" />
						<display:setProperty name="export.xml" value="false" />
						<display:setProperty name="export.excel.filename" value="Course.xls" />
						<display:setProperty name="export.excel.include_header"
							value="true" />
					</display:table>		
			</div>
<jsp:include page="/WEB-INF/component/queryInformation.jsp" flush="true" />
</div>
  </body>
</html>
