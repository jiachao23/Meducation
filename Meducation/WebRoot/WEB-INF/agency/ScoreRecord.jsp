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
         $('#form').prop('action','TeacherEnrollment_scoreQuery.action?AgencyId=${sessionScope.G_AgencyId}&CourseId=${sessionScope.G_CourseId}');
         $('#form').submit();
		});
		
		$('#back').click(
		function() {		
         window.location="AgencyCourse_courseBrowser.action";          
		});	
		
$("#save").click(function(){
var items=new Array();
var i=0;
$("input[id='_scores']:text").each(function(){ 
if ($(this).val()!='') {
var User={"login_name":$(this).attr('name'),"password":$(this).val()};
items[i]=User; i++;
}});
var ScoresRecord={"items":items};
teacherenrollmentservice.saveScores(ScoresRecord, saveHandler);
});

	
});

function saveHandler(data) {
if (data)
{alert("成绩保存成功！");
$('#query').click();  
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
          return "<div>"+"<p class='header'><strong>记录成绩操作说明：</strong></p>"+
          "<p class='infor'>1、页面上列出了当前课程的学员名单，用户可根据关键词筛选出需要添加成绩的学员；</p>"
          +"<p class='infor'>2、在录入成绩栏的输入框中输入成绩，然后点击“保持成绩”按钮，可以为该页面学员记录成绩；</p>"+
          "<p class='infor'>3、每次翻页前请务必保存当前页输入的最新数据；</p>"+
          "<p class='infor'>4、点击“返回上级”按钮，返回登记课程成绩页面；</p>"+
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
<a href="AgencyCourse_courseBrowser.action">登记课程成绩</a>
<img alt="" src="img/TableIcon/Cristal_Intense_069.png"/>
<label>记录成绩</label>	
</div>		
       <fieldset id="fieldset-box">
			<legend>信息查询:</legend>
         <s:form name="form" id="form" action="" method="post">
				<table id="newspaper-b">	
					<tr>
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
						<td style="text-align:center;" class="buttom"><button type="button" class="button blue"
								style="font-size:16px;margin:auto;" id="save">保&nbsp;存&nbsp;成&nbsp;绩</button></td>
						<td style="text-align:center;" class="buttom"><button type="button" class="button blue"
								style="font-size:16px;margin:auto;" id="back">返&nbsp;回&nbsp;上&nbsp;级</button></td>				
					</tr>
				</table>
			</s:form>	
		</fieldset>	
			<div id="displayTable">
					<display:table name="pageList" id="table" export="true" requestURI="TeacherEnrollment_scoreQuery.action?AgencyId=${sessionScope.G_AgencyId}&CourseId=${sessionScope.G_CourseId}"
						defaultsort="1" defaultorder="descending">
						<display:column title="序号" sortable="true" headerClass="sortable"
							style="text-align:center;"> 
				${(pageList.pageNumber-1)*pageList.objectsPerPage+table_rowNum} 
			</display:column>
						<display:column property="planName" title="培训计划" sortable="true"
							headerClass="sortable" style="text-align:center;"/>
						<display:column property="courseName" title="课程名称" sortable="true"
							headerClass="sortable" style="text-align:center;" />
						<display:column property="courseCode" title="课程编号" sortable="true"
							headerClass="sortable" style="text-align:center;" />
							<display:column property="schoolName" title="学校名称" sortable="true"
							headerClass="sortable" style="text-align:center;" />
							<display:column property="teacherRealName" title="教师姓名" sortable="true"
							headerClass="sortable" style="text-align:center;" />
							<display:column property="teacherIdentifyNum" title="教师身份证号码" sortable="true"
							headerClass="sortable" style="text-align:center;" />
							<display:column property="courseScore" title="课程成绩" sortable="true"
							headerClass="sortable" style="text-align:center;color:green;font-weight:bold;" />
			 			<display:column title="录入成绩" media="html" style="text-align:center;">
							<input type="text" id="_scores" name="id_${table.id}"/>
			              </display:column>
			<%----%>			
						<display:setProperty name="export.pdf" value="false" />
						<display:setProperty name="export.csv" value="false" />
						<display:setProperty name="export.xml" value="false" />
						<display:setProperty name="export.excel.filename" value="Course.xls" />
						<display:setProperty name="export.excel.include_header"
							value="true" />
					</display:table>		
			</div>
<div class="savetishi"><img src="img/function/help.png" style="width:15px;height:15px;"/>&nbsp;<label class="infom">记录成绩操作说明</label></div>
</div>
  </body>
</html>
