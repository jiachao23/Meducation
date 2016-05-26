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
 $(function() {		
	$('#back').click(
		function() {		
         window.location="PlanSchool_teacherbrowser.action?page=${sessionScope.firstlevel_page}";        
		});
		
	$('#enrollment').click(
		function() {		
         window.location="PlanSchool_test.action";        
		});
		
   $('#checkall').change(
		function() {		
         $("input[name='_chk']:checkbox").prop('checked',this.checked);           
		});
		
$("#add").click(function(){
  var items=new Array();
  var i=0;
$("input[name='_chk']:checkbox").each(function(){ 
if (true == $(this).prop("checked")) {
items[i]=$(this).attr('value'); i++;
}});
var SelectedItems = {"planID":${sessionScope.G_PlanId},
 "items":items};
teacherenrollmentservice.saveData(SelectedItems, saveHandler);
});	
		
});

function saveHandler(data) {
			if (data)
			{alert("您已报名成功！");	
			
			}
		}
</script>
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
          return "<div>"+"<p class='header'><strong>教师个人选课操作说明：</strong></p>"+
          "<p class='infor'>1、当前页面列出了培训计划、培训实施机构及相关培训课程；</p>"
          +"<p class='infor'>2、教师可点击课程列表中的“全选”按钮，选择全部课程，或点击任意复选框，选择部分课程；</p>"+
          "<p class='infor'>3、用户选择完要上的课程后，请点击“我要报名”，确定报名信息；</p>"+
          "<p class='infor'>4、用户如需查询或修改已报名课程，可进入“教师课程查询”界面进行操作；</p>"+
           "<p class='infor'>5、点击“返回上级”按钮，将返回“教育培训报名”界面；</p>"+
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
<a href="PlanSchool_teacherbrowser.action?page=${sessionScope.firstlevel_page}">教育培训报名</a>
<img alt="" src="img/TableIcon/Cristal_Intense_069.png"/>
<label>教师个人选课报名</label>		
</div>

<fieldset id="fieldset-box">
			<legend>培训内容综合信息:</legend>		
				<table id="newspaper-b">
					<tr>
						<td class="buttom">培训计划名称:</td>
						<td class="buttom_right" colspan="3"><s:textfield disabled="true" id="planName" name="planName" 
								cssClass="mytxt" placeholder="请输入培训计划名称" style="width:600px;" /></td>
						<td class="buttom">		
								<button type="button" class="button blue"
								style="font-size:16px;margin:auto;" id="add">我&nbsp;要&nbsp;报&nbsp;名</button></td>
						<td class="buttom">		
								<button type="button" class="button blue"
								style="font-size:16px;margin:auto;" id="back">返&nbsp;回&nbsp;上&nbsp;级</button></td>		
					</tr>
					<tr>
					<td class="buttom">培训计划编号:</td>
						<td class="buttom_right"><s:textfield  disabled="true" id="planNum" name="planNum"
								cssClass="mytxt" placeholder="请输入培训计划编号" style="width:200px;" /></td>
						<td class="buttom">计划开始时间:</td>
						<td class="buttom_right"><s:textfield  disabled="true" id="beginTime" name="beginTime"
								cssClass="mytxt" placeholder="请输入计划开始时间" style="width:200px;" /></td>
						<td class="buttom">计划结束时间:</td>
						<td class="buttom_right"><s:textfield disabled="true" id="endTime" name="endTime"
								cssClass="mytxt" placeholder="请输入计划结束时间" style="width:200px;" /></td>		
					</tr>
					<tr>						
						<td colspan="6">培训计划具体内容:<br /> <s:textarea id="introduce" name="introduce" cols="160" rows="6" disabled="true" cssClass="mytextarea"/></td>										
					</tr>
				</table>
				<table id="newspaper-b">
					<tr>
						<td class="buttom">培训机构名称:*</td>
						<td class="buttom_right"><s:textfield id="agenceName" name="agenceName" disabled="true"
								cssClass="mytxt" placeholder="请输入培训机构名称" style="width:300px;" /></td>
						<td class="buttom">培训机构代码:*</td>
						<td class="buttom_right"><s:textfield id="agenceCode" name="agenceCode" disabled="true"
								cssClass="mytxt" placeholder="请输入培训机构代码" style="width:300px;" /></td>
					</tr>
					<tr>
						<td class="buttom">法定代表人:*</td>
						<td class="buttom_right"><s:textfield id="agengcePerson" name="agengcePerson" disabled="true"
								cssClass="mytxt" placeholder="请输入法定代表人名称" style="width:300px;" /></td>
						<td class="buttom">机构联系电话:</td>
						<td class="buttom_right"><s:textfield id="tel" name="tel" disabled="true"
								cssClass="mytxt" placeholder="请输入机构联系电话" style="width:300px;" /></td>		
					</tr>
					<tr>
					<td colspan="4">培训机构简介:<br /> <s:textarea id="agenceIntroduce" name="agenceIntroduce" cols="160" rows="6" disabled="true" cssClass="mytextarea"/></td>
					</tr>
				</table>
		</fieldset>	
<% 
org.displaytag.decorator.CheckboxTableDecorator decorator = new org.displaytag.decorator.CheckboxTableDecorator();
decorator.setId("id");
pageContext.setAttribute("checkboxDecorator", decorator);
%>
			<div id="displayTable">
					<display:table name="pageList" id="table" export="true" requestURI="PlanSchool_teacherlookCourse.action"
						defaultsort="1" defaultorder="descending" decorator="checkboxDecorator">
						<display:column property="checkbox" style="text-align:center;" title="<input type='checkbox' id='checkall' value='all'/>全选"/>
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
						
						<display:setProperty name="export.pdf" value="false" />
						<display:setProperty name="export.csv" value="false" />
						<display:setProperty name="export.xml" value="false" />
						<display:setProperty name="export.excel.filename" value="Course.xls" />
						<display:setProperty name="export.excel.include_header"
							value="true" />
					</display:table>		
			</div>
<div class="savetishi"><img src="img/function/help.png" style="width:15px;height:15px;"/>&nbsp;<label class="infom">教师个人选课操作说明</label></div>			
</div>
  </body>
</html>
