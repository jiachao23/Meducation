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
<link rel="stylesheet" type="text/css" href="./css/jqueryUI/combobox.css">
<link rel="stylesheet" href="./css/jqueryUI/jquery-ui.css" type="text/css">
<script type="text/javascript" src="js/jquery/jquery.js"></script>
<script type="text/javascript" src="js/jquery/jquery-ui.js"></script>
<script type="text/javascript" src="js/jquery/jquery.easyui.min.js"></script>
<script src="dwr/engine.js" type="text/javascript"></script>
<script src="dwr/util.js" type="text/javascript"></script>
<script src="dwr/interface/planagencyservice.js" type="text/javascript"></script>
<script type="text/javascript">
 $(function() {		
		$('#query').click(
		function() {
		$('#form').prop('action','PlanAgency_showall4.action?PlanId=${sessionScope.G_PlanId}');
         $('#form').submit();
		});	
		
	 $('#checkall').change(
		function() {		
         $("input[name='_chk']:checkbox").prop('checked',this.checked);           
		});
		
	$('#back').click(
		function() {		
         window.location="PlanInfo_browser.action?page=${sessionScope.firstlevel_page}";          
		});
	
	$('#see').click(
		function() {		
         window.location="PlanAgency_look.action?PlanId=${sessionScope.G_PlanId}&page=${sessionScope.firstlevel_page}&Source=${sessionScope.Source}";         
		});	

	
$("#add").click(function(){
  var items=new Array();
  var i=0;
$("input[name='_chk']:checkbox").each(function(){ 
if (true == $(this).prop("checked")) {
items[i]=$(this).attr('value'); i++;
}
 });

 var SelectedItems = {"planID":${sessionScope.G_PlanId},
 "items":items};
planagencyservice.saveData(SelectedItems, saveHandler);
});			

});


function saveHandler(data) {
			if (data)
			{alert("您所选的培训机构已添加至相关计划中，如需查看或删除，请点击查看结果按钮！");	
			
			}
		}
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
<a href="PlanInfo_browser.action" style="color:blue;">教育培训计划录入</a>
<img alt="" src="img/TableIcon/Cristal_Intense_069.png"/>
<label>选择培训机构对象</label>		
</div>

<fieldset id="fieldset-box">
			<legend>教育培训计划相关简要信息:</legend>		
				<table id="newspaper-b">
					<tr>
						<td class="buttom">培训计划名称:</td>
						<td class="buttom_right" colspan="5"><s:textfield disabled="true" id="planName" name="planName" 
								cssClass="mytxt" placeholder="请输入培训计划名称" style="width:400px;" /></td>
						<td class="buttom">培训计划编号:</td>
						<td class="buttom_right"><s:textfield  disabled="true" id="planNum" name="planNum"
								cssClass="mytxt" placeholder="请输入培训计划编号" style="width:150px;" /></td>
					</tr>
					<tr>						
						<td class="buttom">计划开始时间:</td>
						<td class="buttom_right"><s:textfield  disabled="true" id="beginTime" name="beginTime"
								cssClass="mytxt" placeholder="请输入计划开始时间" style="width:150px;" /></td>
						<td class="buttom">计划结束时间:</td>
						<td class="buttom_right"><s:textfield disabled="true" id="endTime" name="endTime"
								cssClass="mytxt" placeholder="请输入计划结束时间" style="width:150px;" /></td>
												<td class="buttom">计划创建人:</td>
						<td class="buttom_right"><s:textfield disabled="true" id="creator" name="creator"
								cssClass="mytxt" placeholder="请输入计划创建人" style="width:150px;" /></td>		
						<td class="buttom">计划创建时间:</td>
						<td class="buttom_right"><s:textfield disabled="true" id="createTime" name="createTime"
								cssClass="mytxt" placeholder="请输入计划创建时间" style="width:150px;" /></td>					
					</tr>
				</table>
		</fieldset>	
				
       <fieldset id="fieldset-box">
			<legend>培训机构对象筛选:</legend>
         <s:form name="form" id="form" action="AgencyInfo_query.action" method="post">
				<table id="newspaper-b">				
				<tr>
						<td class="buttom">培训机构名称:</td>
						<td class="buttom_right"><s:textfield id="agenceName" name="agenceName"
								cssClass="mytxt" placeholder="请输入培训机构名称" style="width:200px;" /></td>
						<td class="buttom">培训机构代码:</td>
						<td class="buttom_right"><s:textfield id="agenceCode" name="agenceCode"
								cssClass="mytxt" placeholder="请输入培训机构代码" style="width:200px;" /></td>
						<td class="buttom">法定代表人:</td>
						<td class="buttom_right"><s:textfield id="agengcePerson" name="agengcePerson"
								cssClass="mytxt" placeholder="请输入法定代表人名称" style="width:200px;" /></td>
						<td style="text-align:center;" class="buttom"><button type="button" class="button blue"
								style="font-size:16px;margin:auto;" id="query">查&nbsp;&nbsp;&nbsp;询</button></td>
						
					</tr>
				</table>
		</s:form>
			</fieldset>
			
	<div style="text-align:center;">
	<table>
	  <tr>					
		<td style="width:500px;text-align:center;"><button type="button" class="button black"
			style="font-size:16px;margin:auto;" id="add">添&nbsp;加&nbsp;对&nbsp;象</button></td>
		<td style="width:500px;text-align:center;"><button type="button" class="button black"
			style="font-size:16px;margin:auto;" id="see">查&nbsp;看&nbsp;结&nbsp;果</button></td>
        <td style="width:500px;text-align:center;"><button type="button" class="button black"
			style="font-size:16px;margin:auto;" id="back">返&nbsp;回&nbsp;上&nbsp;级</button> </td>
	  </tr>
	</table>		
	</div>		
			
<% 
org.displaytag.decorator.CheckboxTableDecorator decorator = new org.displaytag.decorator.CheckboxTableDecorator();
decorator.setId("id");
pageContext.setAttribute("checkboxDecorator", decorator);
%>			
			<div id="displayTable">
					<display:table name="pageList" id="table" export="true" requestURI="PlanAgency_showall4.action"
						defaultsort="1" defaultorder="descending" decorator="checkboxDecorator">
						<display:column property="checkbox" style="text-align:center;" title="<input type='checkbox' id='checkall' value='all'/>全选"/>
						<display:column property="agenceName" title="培训机构名称" sortable="true"
							headerClass="sortable" style="text-align:center;" />
						<display:column property="agenceCode" title="培训机构代码" sortable="true"
							headerClass="sortable" style="text-align:center;" />
							<display:column property="agengcePerson" title="法定代表人" sortable="true"
							headerClass="sortable" style="text-align:center;" />
							<display:column property="tel" title="机构联系电话" sortable="true"
							headerClass="sortable" style="text-align:center;" />
						<display:column title="培训机构简介" media="html" style="text-align:center;">
						<img src="./img/MenuIcon/FUNC20071.gif" id="space"/><label class="seeinform" title="${table.agenceIntroduce}" style="color:blue;">查看详细</label>
						</display:column>	
				
						<display:setProperty name="export.pdf" value="false" />
						<display:setProperty name="export.csv" value="false" />
						<display:setProperty name="export.xml" value="false" />
						<display:setProperty name="export.excel.filename" value="agency.xls" />
						<display:setProperty name="export.excel.include_header"
							value="true" />
					</display:table>		
			</div>
<jsp:include page="/WEB-INF/component/chooseInformation.jsp" flush="true" /> 			
</div>
  </body>
</html>
