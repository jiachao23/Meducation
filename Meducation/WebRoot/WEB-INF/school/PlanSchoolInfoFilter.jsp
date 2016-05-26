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
<script type="text/javascript">
  $(function() {
    $('#beginTime').datepicker();
    $('#endTime').datepicker();
    $('#createTime').datepicker(); 
	
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
<label>学校教育信息管理</label> 
<img alt="" src="img/TableIcon/Cristal_Intense_069.png"/>
<label>培训历史记录查询</label>	
</div>
<fieldset id="fieldset-box">
			<legend>信息查询:</legend>
         <s:form name="form" id="form" action="PlanSchool_historydQuery.action" method="post">
				<table id="newspaper-b">	
					<tr>
						<td class="buttom">培训计划名称:</td>
						<td class="buttom_right"><s:textfield id="planName" name="planName"
								cssClass="mytxt" placeholder="请输入培训计划名称" style="width:300px;" /></td>
						<td class="buttom">计划开始时间（大于）:</td>
						<td class="buttom_right"><s:textfield id="beginTime" name="beginTime"
								cssClass="mytxt" placeholder="请输入计划开始时间" style="width:150px;" /></td>
						<td class="buttom">计划结束时间（小于）:</td>
						<td class="buttom_right"><s:textfield id="endTime" name="endTime"
								cssClass="mytxt" placeholder="请输入计划结束时间" style="width:150px;" /></td>						
                        <td style="text-align:center;" class="buttom"><button type="button" class="button blue"
								style="font-size:16px;margin:auto;" id="query">查&nbsp;&nbsp;&nbsp;询</button></td>
					</tr>
				</table>
			</s:form>	
		</fieldset>	
	
			<div id="displayTable">
					<display:table name="pageList" id="table" export="true" requestURI="PlanSchool_historydQuery.action"
						defaultsort="1" defaultorder="descending">
						<display:column title="序号" sortable="true" headerClass="sortable"
							style="text-align:center;"> 
				${(pageList.pageNumber-1)*pageList.objectsPerPage+table_rowNum} 
			</display:column>
						<display:column property="planName" title="培训计划名称" sortable="true"
							headerClass="sortable" style="text-align:center;" />
						<display:column property="planNum" title="培训计划编号" sortable="true"
							headerClass="sortable" style="text-align:center;" />
							<display:column property="beginTime" title="计划开始时间" sortable="true"
							headerClass="sortable" style="text-align:center;" />
							<display:column property="endTime" title="计划结束时间" sortable="true"
							headerClass="sortable" style="text-align:center;" />						
						<display:column title="培训计划内容介绍" media="html" style="text-align:center;">
						<label class="seeinform" title="${table.introduce}" style="color:blue;">查看详细</label>
						</display:column>
						<display:column property="status" title="当前状态" sortable="true"
							headerClass="sortable" style="text-align:center;color:#a429c0;font-weight:bold;" />
						<display:column title="课程详细信息" media="html" style="text-align:center;color:green;font-weight:bold;">
						<img src="./img/MenuIcon/FUNC20071.gif"/>&nbsp;
						<a href="PlanSchool_lookCourse.action?Source=2&SchoolId=${table.schoolId}&PlanId=${table.planId}&page=${pageList.pageNumber}" style="color:green;">查看课程</a>
						</display:column>

                        <display:setProperty name="export.pdf" value="false" />
						<display:setProperty name="export.csv" value="false" />
						<display:setProperty name="export.xml" value="false" />
						<display:setProperty name="export.excel.filename" value="Plan.xls" />
						<display:setProperty name="export.excel.include_header"
							value="true" />
					</display:table>		
			</div>
<jsp:include page="/WEB-INF/component/queryInformation.jsp" flush="true" />
</div>
  </body>
</html>
