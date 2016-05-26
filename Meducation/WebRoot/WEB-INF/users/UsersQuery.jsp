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
<link rel="stylesheet" type="text/css" href="./css/jqueryUI/combobox.css">
<link rel="stylesheet" href="./css/jqueryUI/jquery-ui.css" type="text/css">
<script type="text/javascript" src="js/jquery/jquery.js"></script>
<script type="text/javascript" src="js/jquery/jquery-ui.js"></script> 
<script type="text/javascript" src="js/jquery/jquery.easyui.min.js"></script>
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

<div id="bodyColumn">
<div id="navigation">
<label class="first">您当前所在的位置：</label> 
<label>用户权限管理</label> 
<img alt="" src="img/TableIcon/Cristal_Intense_069.png"/>
<label>注册用户查看</label>	
</div>		
       <fieldset id="fieldset-box">
			<legend>信息查询:</legend>
         <s:form name="form" id="form" action="PersonInfo_query.action" method="post">
				<table id="newspaper-b">
					<tr>
					<td rowspan="2" class="buttom_right">查询条件:</td>
						<td class="buttom">用户名/昵称:</td>
						<td class="buttom_right"><s:textfield id="loginName" name="loginName"
								cssClass="mytxt" placeholder="请输入用户名/昵称" style="width:130px;" /></td>
						<td class="buttom">真实姓名:</td>
						<td class="buttom_right"><s:textfield id="realName" name="realName"
								cssClass="mytxt" placeholder="请输入真实姓名" style="width:130px;" /></td>
						<td class="buttom">身份证号码:</td>
						<td class="buttom"><s:textfield id="identifyNum" name="identifyNum"
								cssClass="mytxt" placeholder="请输入身份证号码" style="width:230px;" /></td>
						</tr>
						<tr>
						<td>工作单位:</td>
						<td style="border-style:none solid none none;border-width:1.5px;border-color:#69c;"><s:textfield id="workPlace" name="workPlace"
								cssClass="mytxt" placeholder="请输入工作单位" style="width:230px;" /></td>
						<td>权限类型:*</td>
						<td class="buttom_right">
					<input id="qxlx" name="qxlx" placeholder="请选择权限类型" class="easyui-combobox" style="width:150px;height:30px;"
					data-options="
				url: 'data/role_type.json',
				method: 'get',
				valueField: 'id',
				textField: 'text',
				onSelect: function(rec){
                $('#roleType').attr('value',rec.text);},
				onChange: function(){
				if($('#qxlx').combobox('getText')=='')
				$('#roleType').attr('value','');},
				onLoadSuccess: function(){                       
				$('#qxlx').combobox('setText', $('#roleType').val()); 
                    }">
								</td>								
						<td colspan="2" style="text-align:center;"><button type="button" class="button blue"
								style="font-size:16px;margin:auto;" id="query">查&nbsp;&nbsp;&nbsp;询</button></td>
					</tr>
				</table>
				<s:hidden id="roleType" name="roleType"></s:hidden>
		</s:form>
		</fieldset>
		<div id="displayTable">
					<display:table name="pageList" id="table" export="true" requestURI="PersonInfo_query.action"
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
						<display:column property="address" title="通讯地址" sortable="true"
							headerClass="sortable" style="text-align:center;" />
						<display:column property="code" title="邮编 " sortable="true"
							headerClass="sortable" style="text-align:center;" />
						<display:column property="roleType" title="用户类型 " sortable="true"
							headerClass="sortable" style="text-align:center;color:green;" />
						<display:column title="编辑" media="html" style="text-align:center;">
						   <s:url action="Person_applyrole" id="apply">
								<s:param name="id" value="%{#attr.table.id}" />
								<s:param name="page">${pageList.pageNumber}</s:param>
							</s:url>
							<img src="./img/MenuIcon/FUNC20029.gif"/><a href="${apply}">授权</a>&nbsp;
			            </display:column>								
						<display:setProperty name="export.pdf" value="false" />
						<display:setProperty name="export.csv" value="false" />
						<display:setProperty name="export.xml" value="false" />
						<display:setProperty name="export.excel.filename" value="person.xls" />
						<display:setProperty name="export.excel.include_header"
							value="true" />
					</display:table>		
			</div>
<jsp:include page="/WEB-INF/component/queryInformation.jsp" flush="true" />
</div>
  </body>
</html>

