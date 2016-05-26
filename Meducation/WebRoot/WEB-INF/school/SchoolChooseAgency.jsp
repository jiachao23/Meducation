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
<script src="dwr/interface/schoolAgencyService.js" type="text/javascript"></script> 
<script type="text/javascript">

$(document).ready(function() {
	
$("#save").click(function(){
    if($('#schoolAdmin').val()==''||$('#courseNum').combobox('getText')=='')
    alert("请填写带(*)的信息！");
    else{
  var items=new Array();
  items[0]=${sessionScope.G_SchoolId};
  items[1]=$('#schoolAdmin').val();
  items[2]=$('#courseNum').combobox('getValue');
 var SelectedItems = {"planID":${sessionScope.G_PlanId},
 "items":items};
schoolAgencyService.saveData(SelectedItems, saveHandler);
}
});	
		
	$('#back').click(
		function() {		
          window.location="PlanSchool_browser.action?page=${sessionScope.firstlevel_page}";           
		});				
		
});

function saveHandler(data) {
			if (data)
			{alert("您所选的培训机构已添加，如需更换，可以重新选择，并点击确定选择按钮！");	
			
			}
		}
		
var myloader = function(success,error){
			$.ajax({
				url: "PlanSchool_AgencyName.action",  
                dataType: "json",  
				success: function(data){                       
						var dd = $.parseJSON(data);
						$('#courseNum').combobox('loadData', dd); 
                    }, 
                error: function(){
					alert("远程数据无法加载！");
				}
			});
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
          return "<div>"+"<p class='header'><strong>选择培训机构操作说明：</strong></p>"+
          "<p class='infor'>1、通过数据列表，查看各培训机构课程信息；</p>"
          +"<p class='infor'>2、点击培训机构名称下拉列表，选择一个机构，同时填写该培训计划的学校负责人姓名，点击确定选择按钮，确定本校培训实施机构及欲培训课程；</p>"+
          "<p class='infor'>3、如需更换培训机构及其课程，重新选择培训机构名称，并点击确定选择按钮即可；</p>"+
          "<p class='infor'>4、点击“返回上级”按钮，返回上级界面；</p>"+
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
<a href="PlanSchool_browser.action?page=${sessionScope.firstlevel_page}">实施培训计划</a>
<img alt="" src="img/TableIcon/Cristal_Intense_069.png"/>
<label>选择培训机构</label>		
</div>	
<fieldset id="fieldset-box">
			<legend>信息录入:</legend>		
				<table id="newspaper-b">
					<tr>
						<td class="buttom">学校负责人:*</td>
						<td class="buttom_right"><s:textfield id="schoolAdmin" name="schoolAdmin"
								cssClass="mytxt" placeholder="请输入学校管理员" style="width:200px;" /></td>
						<td class="buttom">培训机构名称:*</td>
						<td class="buttom_right">
				<input class="easyui-combobox" style="width:300px;height:30px;" id="courseNum" name="courseNum" data-options="
				loader: myloader,
				valueField: 'id',
				textField: 'agencyName'">	
						</td>		
						<td style="text-align:center;" class="buttom"><button type="button" class="button blue"
								style="font-size:16px;margin:auto;" id="save">确&nbsp;定&nbsp;选&nbsp;择</button></td>
						<td style="text-align:center;" class="buttom"><button type="button" class="button blue"
								style="font-size:16px;margin:auto;" id="back">返&nbsp;回&nbsp;上&nbsp;级</button></td>		
					</tr>
				</table>
		</fieldset>	
			<div id="displayTable">
					<display:table name="pageList" id="table" export="true" requestURI="PlanSchool_showAllAgencyAndCourse.action"
						defaultsort="1" defaultorder="descending">
						<display:column title="序号" sortable="true" headerClass="sortable"
							style="text-align:center;"> 
							${(pageList.pageNumber-1)*pageList.objectsPerPage+table_rowNum} 
						</display:column>
						<display:column property="planName" title="培训计划名称" sortable="true"
							headerClass="sortable" style="text-align:center;" group="1"/>					
						<display:column property="agencyName" title="培训机构名称" sortable="true"
							headerClass="sortable" style="text-align:center;" group="2"/>
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
<div class="savetishi"><img src="img/function/help.png" style="width:15px;height:15px;"/>&nbsp;<label class="infom">选择培训机构操作说明</label></div>
</div>
  </body>
</html>
