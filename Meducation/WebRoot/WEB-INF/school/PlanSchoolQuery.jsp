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
          return "<div>"+"<p class='header'><strong>教师培训报名操作说明：</strong></p>"+
          "<p class='infor'>1、当前页面列出了目前正在执行的培训计划，“当前状态”显示了培训计划目前的执行进度；</p>"
          +"<p class='infor'>2、教师如需参与该培训计划，可点击“培训报名”按钮，进行报名工作；</p>"+
          "</div>";
      }
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
<label>教育培训报名</label>	
</div>
	
			<div id="displayTable">
					<display:table name="pageList" id="table" export="true" requestURI="PlanSchool_teacherbrowser.action"
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
						<display:column title="实施培训机构" media="html" style="text-align:center;color:green;font-weight:bold;">
						<img src="./img/MenuIcon/FUNC20071.gif"/>&nbsp;
						<s:if test="#attr.table.status=='正在报名'">
						<a href="PlanSchool_teacherlookCourse.action?SchoolId=${table.schoolId}&PlanId=${table.planId}&page=${pageList.pageNumber}" style="color:red;">培训报名</a>
						</s:if>
						<s:elseif test="#attr.table.status=='培训工作结束'">
						<label class="seeinform" style="color:red;">培训工作结束</label>
						</s:elseif>
						</display:column>

                        <display:setProperty name="export.pdf" value="false" />
						<display:setProperty name="export.csv" value="false" />
						<display:setProperty name="export.xml" value="false" />
						<display:setProperty name="export.excel.filename" value="Plan.xls" />
						<display:setProperty name="export.excel.include_header"
							value="true" />
					</display:table>		
			</div>
<div class="savetishi"><img src="img/function/help.png" style="width:15px;height:15px;"/>&nbsp;<label class="infom">教师培训报名操作说明</label></div>
</div>
  </body>
</html>
