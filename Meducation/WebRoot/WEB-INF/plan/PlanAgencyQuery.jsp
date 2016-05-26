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
         window.location="PlanAgency_showall3.action?PlanId=${sessionScope.G_PlanId}"; 
         else if(${sessionScope.Source}=='2')
          window.location="PlanInfo_approve.action?page=${sessionScope.firstlevel_page}";
         else if(${sessionScope.Source}=='3')
          window.location="PlanInfo_browser.action?page=${sessionScope.firstlevel_page}";           
		});	
});

</script>

</head>
  
  <body>
<jsp:include page="/WEB-INF/component/head.jsp" flush="true" /> 
<jsp:include page="/WEB-INF/component/left.jsp" flush="true" /> 

<div id="bodyColumn">
<div id="navigation">
<label class="first">您当前所在的位置：</label> 
<label>教育培训计划管理</label> 
<img alt="" src="img/TableIcon/Cristal_Intense_069.png"/>
<a href="PlanInfo_browser.action" style="color:blue;">教育培训计划录入</a>
<img alt="" src="img/TableIcon/Cristal_Intense_069.png"/>
<label>查看机构对象</label>		
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
					<display:table name="pageList" id="table" export="true" requestURI="PlanAgency_look.action"
						defaultsort="1" defaultorder="descending">
						<display:column title="序号" sortable="true" headerClass="sortable"
							style="text-align:center;"> 
				${(pageList.pageNumber-1)*pageList.objectsPerPage+table_rowNum} 
			</display:column>
						<display:column property="planName" title="培训计划名称" sortable="true"
							headerClass="sortable" style="text-align:center;" />
						<display:column property="planNum" title="培训计划编号" sortable="true"
							headerClass="sortable" style="text-align:center;" />
						<display:column property="agencyName" title="培训机构名称" sortable="true"
							headerClass="sortable" style="text-align:center;" />
						<display:column property="agencyCode" title="培训机构编号" sortable="true"
							headerClass="sortable" style="text-align:center;" />
						<display:column property="status" title="计划实施状态" sortable="true"
							headerClass="sortable" style="text-align:center;color:#a429c0;font-weight:bold;" />										
						<display:column title="编辑" media="html" style="text-align:center;">
							<s:url action="PlanAgency_querydel" id="delcity">
								<s:param name="id" value="%{#attr.table.id}" />
								<s:param name="page">${pageList.pageNumber}</s:param>
								<s:param name="PlanId">${sessionScope.G_PlanId}</s:param>
							</s:url>							
							<s:if test="#attr.table.status=='计划创建'">
							<img src="./img/MenuIcon/FUNC20029.gif"/><a href="${delcity}" onclick="return window.confirm('您真的想删除本条记录吗？删除后将不可恢复！')">删除</a>&nbsp;
			                 </s:if>
			                 <s:else><img src="./img/MenuIcon/FUNC20029.gif"/><label>不可编辑</label></s:else>
			            </display:column>
			            <display:setProperty name="export.pdf" value="false" />
						<display:setProperty name="export.csv" value="false" />
						<display:setProperty name="export.xml" value="false" />
						<display:setProperty name="export.excel.filename" value="PlanSchool.xls" />
						<display:setProperty name="export.excel.include_header"
							value="true" />
					</display:table>		
			</div>
<jsp:include page="/WEB-INF/component/resultInformation.jsp" flush="true" />
</div>
  </body>
</html>

