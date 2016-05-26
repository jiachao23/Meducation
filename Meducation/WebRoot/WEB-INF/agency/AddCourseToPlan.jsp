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
          return "<div>"+"<p class='header'><strong>添加课程操作说明：</strong></p>"+
          "<p class='infor'>1、培训计划实施状态包括：“拟定具体课程”——“正在执行”——“培训完毕”；</p>"
          +"<p class='infor'>2、处于“拟定具体课程”的培训计划，需要首先该计划添加课程，点击记录对应的“选择”按钮，可以执行添加课程操作；</p>"+
          "<p class='infor'>3、点击培训计划对应的“查看”按钮，可查看该计划相应课程列表；</p>"+
          "<p class='infor'>4、为培训计划选课完毕后，请点击该计划对应的“开始实施”按钮，由此学校用户才能够查看本培训机构的课程，并开始报名；</p>"+
           "<p class='infor'>5、培训计划时间达到后，系统将自动关闭相应的培训计划，用户也可以点击“结束培训”按钮，完成培训计划的实施工作；</p>"+
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
<label>培训机构信息管理</label> 
<img alt="" src="img/TableIcon/Cristal_Intense_069.png"/>
<label>实施培训计划</label>	
</div>
	
			<div id="displayTable">
					<display:table name="pageList" id="table" export="true" requestURI="PlanAgency_browser.action"
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
						<display:column title="添加课程" media="html" style="text-align:center;color:green;font-weight:bold;">
						<img src="./img/MenuIcon/FUNC20071.gif"/>&nbsp;
						<a href="AgencyCourse_showInAgency.action?Source=1&PlanId=${table.planId}&page=${pageList.pageNumber}" style="color:green;">选择</a>&nbsp;|&nbsp;
						<a href="CourseChoose_look.action?Source=3&PlanId=${table.planId}&page=${pageList.pageNumber}" style="color:green;">查看</a>
						</display:column>
                        <display:column title="工作流转" media="html" style="text-align:center;color:green;font-weight:bold;">
						<img src="./img/MenuIcon/FUNC20071.gif"/>&nbsp;
                           <s:url action="PlanAgency_closePlan" id="closePlan">
								<s:param name="id" value="%{#attr.table.id}" />
								<s:param name="page">${pageList.pageNumber}</s:param>
								<s:param name="planId" value="%{#attr.table.planId}"></s:param>
							</s:url>
                        <s:if test="'正在执行'==#attr.table.status">
						<a href="${closePlan}" onclick="return window.confirm('确定结束该培训计划吗？历史记录可在“培训历史记录查询”中查看！')" style="color:green;">结束培训</a>&nbsp;
						</s:if>
						 <s:url action="PlanAgency_startwork" id="startwork">
								<s:param name="id" value="%{#attr.table.id}" />
								<s:param name="page">${pageList.pageNumber}</s:param>
								<s:param name="planId" value="%{#attr.table.planId}"></s:param>
							</s:url>
						<s:elseif test="#attr.table.status=='拟定具体课程'">
						<a href="${startwork}" onclick="return window.confirm('请确保本次培训的课程已经选定,确定开始实施该培训计划吗？')" style="color:green;">开始实施</a>
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
<div class="savetishi"><img src="img/function/help.png" style="width:15px;height:15px;"/>&nbsp;<label class="infom">添加课程操作说明</label></div>
</div>
  </body>
</html>
