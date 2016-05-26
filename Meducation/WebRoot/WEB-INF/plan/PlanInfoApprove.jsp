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
<script src="dwr/interface/planservice.js" type="text/javascript"></script>
    
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
          return "<div>"+"<p class='header'><strong>培训计划审批操作说明：</strong></p>"+
          "<p class='infor'>1、市、区县级管理员创建培训计划，并点击请求审批后，培训计划状态将自动进入等待审批阶段；</p>"
          +"<p class='infor'>2、该界面如果没有任何记录，表示没有需要审批的计划，需要审批的计划将自动列出；</p>"+
          "<p class='infor'>3、点击“培训学校对象”及“培训机构对象”下的查看按钮，能够浏览与本计划相关的学校及培训机构的详细信息列表；</p>"+
          "<p class='infor'>4、点击“审批通过”按钮，培训计划状态将进入“通过审批”，同时记录将自动流回上级界面；</p>"+
          "<p class='infor'>5、点击“驳回”按钮，培训计划状态将进入“未通过审批”，同时记录将自动流回上级界面，管理员修改计划信息后，可重新提交审批；</p>"+
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
<label>教育培训计划管理</label> 
<img alt="" src="img/TableIcon/Cristal_Intense_069.png"/>
<label>审批培训计划</label>	
</div>
	
			<div id="displayTable">
					<display:table name="pageList" id="table" export="true" requestURI="PlanInfo_approve.action"
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
							<display:column property="creator" title="计划创建人" sortable="true"
							headerClass="sortable" style="text-align:center;" />
							<display:column property="createTime" title="计划创建时间" sortable="true"
							headerClass="sortable" style="text-align:center;" />
						<display:column title="培训计划内容介绍" media="html" style="text-align:center;">
						<label class="seeinform" title="${table.introduce}" style="color:blue;">查看详细</label>
						</display:column>
						<display:column title="培训学校对象" media="html" style="text-align:center;">
						<img src="./img/MenuIcon/FUNC20071.gif"/>&nbsp;<a href="PlanSchool_look.action?Source=2&PlanId=${table.id}&page=${pageList.pageNumber}" style="color:green;">查看</a>
						</display:column>
						<display:column title="培训机构" media="html" style="text-align:center;">
						<img src="./img/MenuIcon/FUNC20071.gif"/>&nbsp;<a href="PlanAgency_look.action?Source=2&PlanId=${table.id}&page=${pageList.pageNumber}" style="color:green;">查看</a>
						</display:column>	
						<display:column property="status" title="当前状态" sortable="true"
							headerClass="sortable" style="text-align:center;color:#a429c0;font-weight:bold;" />
						<display:column title="工作流转" media="html" style="text-align:center;">
						<img src="./img/MenuIcon/FUNC20071.gif"/>&nbsp;
						<a href="PlanInfo_agree.action?PlanId=${table.id}" id="down" style="color:red;font-weight:bold;" onclick="return window.confirm('点击查看可以了解培训学校对象及培训实施机构对象情况，确定审批通过后，计划将下发执行！确定了解了详情，并同意该培训计划吗？')">审批通过</a>&nbsp;|&nbsp;
						<a href="PlanInfo_notagree.action?PlanId=${table.id}" style="color:red;font-weight:bold;" onclick="return window.confirm('培训计划驳回后，系统管理员可以修改培训计划信息，并重新上报审批！确定驳回计划吗？')">驳回</a>
                        </display:column>

						<display:setProperty name="export.pdf" value="false" />
						<display:setProperty name="export.csv" value="false" />
						<display:setProperty name="export.xml" value="false" />
						<display:setProperty name="export.excel.filename" value="Plan.xls" />
						<display:setProperty name="export.excel.include_header"
							value="true" />
					</display:table>		
			</div>
<div class="savetishi"><img src="img/function/help.png" style="width:15px;height:15px;"/>&nbsp;<label class="infom">培训计划审批操作说明</label></div>
</div>
  </body>
</html>
