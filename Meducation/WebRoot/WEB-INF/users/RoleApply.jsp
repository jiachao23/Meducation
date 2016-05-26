<%@ page language="java" import="java.util.*" contentType="text/html;charset=UTF-8" %>
<%@ page language="java" pageEncoding="UTF-8"%>
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
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
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
      items: "label.infom",
      content: function() {
         return "<div>"+"<p class='header'><strong>用户角色权限审批说明：</strong></p>"+
          "<p class='infor'>1、系统管理员点击授权栏“同意”按钮，系统将授予该用户申请的对应权限类型；</p>"
          +"<p class='infor'>2、审批通过的记录，可以通过“查看授权记录”功能进行查询；</p>"+
          "<p class='infor'>3、日后如果想要变更用户权限，可以到“注册用户查看”功能中，点击相关记录的“授权”按钮，进行权限变更操作；</p>"+
          "<p class='infor'>4、系统管理员点击授权栏“拒绝”按钮，系统将直接删除该用户申请；</p>"+
          "</div>";

      }
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
<label>用户权限管理</label> 
<img alt="" src="img/TableIcon/Cristal_Intense_069.png"/>
<label>用户角色授权</label>	
</div>		
       
		<div id="displayTable">
					<display:table name="pageList" id="table" export="true" requestURI="Person_giverole.action"
						defaultsort="1" defaultorder="descending">
						<display:column title="序号" sortable="true" headerClass="sortable"
							style="text-align:center;"> 
				${(pageList.pageNumber-1)*pageList.objectsPerPage+table_rowNum}
			</display:column>
						<display:column property="loginName" title="用户名/昵称" sortable="true"
							headerClass="sortable" style="text-align:center;" />
						<display:column property="realName" title="真实姓名" sortable="true"
							headerClass="sortable" style="text-align:center;" />
						<display:column property="identifyNum" title="身份证号码" sortable="true"
							headerClass="sortable" style="text-align:center;" />
						<display:column property="workPlace" title="工作单位" sortable="true"
							headerClass="sortable" style="text-align:center;" />
						<display:column property="sex" title="性别" sortable="true"
							headerClass="sortable" style="text-align:center;" />
						<display:column property="tel" title="联系电话" sortable="true"
							headerClass="sortable" style="text-align:center;" />
						<display:column property="email" title="电子邮箱" sortable="true"
							headerClass="sortable" style="text-align:center;" />	
						<display:column property="address" title="通讯地址" sortable="true"
							headerClass="sortable" style="text-align:center;" />
						<display:column property="code" title="邮编 " sortable="true"
							headerClass="sortable" style="text-align:center;" />
						<display:column property="applyType" title="用户申请权限类型 " sortable="true"
							headerClass="sortable" style="text-align:center;color:red;font-weight:bold;" />
						<display:column property="applyTime" title="申请时间 " sortable="true"
							headerClass="sortable" style="text-align:center;color:green;" />
						<display:column property="status" title="当前状态 " sortable="true"
							headerClass="sortable" style="text-align:center;color:green;font-weight:bold;" />
						
						<display:column title="授权" media="html" style="text-align:center;">
						   <s:url action="Person_adminYes" id="apply">
								<s:param name="id" value="%{#attr.table.id}" />
								<s:param name="page">${pageList.pageNumber}</s:param>
							</s:url>
							<img src="./img/MenuIcon/FUNC20029.gif"/><a href="${apply}">同意</a>&nbsp;
							<s:url action="Person_adminNo" id="deny">
								<s:param name="id" value="%{#attr.table.id}" />
								<s:param name="page">${pageList.pageNumber}</s:param>
							</s:url>
							<img src="./img/MenuIcon/FUNC20071.gif"/><a href="${deny}">拒绝</a>
			            </display:column>								
						<display:setProperty name="export.pdf" value="false" />
						<display:setProperty name="export.csv" value="false" />
						<display:setProperty name="export.xml" value="false" />
						<display:setProperty name="export.excel.filename" value="person.xls" />
						<display:setProperty name="export.excel.include_header"
							value="true" />
					</display:table>		
			</div>
<div class="savetishi"><img src="img/function/help.png" style="width:15px;height:15px;"/>&nbsp;<label class="infom">用户角色权限审批说明</label></div>
</div>
  </body>
</html>

