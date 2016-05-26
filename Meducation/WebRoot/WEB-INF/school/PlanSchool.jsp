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
          return "<div>"+"<p class='header'><strong>学校实施培训计划操作说明：</strong></p>"+
          "<p class='infor'>1、培训计划实施状态包括：“拟定实施方案”——“正在报名”——“报名结束”；</p>"
          +"<p class='infor'>2、处于“拟定实施方案”的培训计划，管理员需要首先为该计划选定培训机构及校内管理人员，点击记录对应的“选择机构”按钮，可以执行相应操作；</p>"+
          "<p class='infor'>3、点击实施培训机构对应的“查看课程”按钮，可查看到为该培训计划选定的相应课程列表；</p>"+
          "<p class='infor'>4、为培训计划选课完毕后，请点击该计划对应的“开始报名”按钮，由此学校教师才能够查看本培训计划的全部信息，并开始报名；</p>"+
           "<p class='infor'>5、培训计划时间达到后，系统将自动关闭相应的培训计划报名，用户也可以点击“结束报名”按钮，完成培训计划的实施工作；</p>"+
          "</div>";
      }
    });  
  });
  
Date.prototype.Format = function (fmt) { //author: meizz 
    var o = {
        "M+": this.getMonth() + 1, //月份 
        "d+": this.getDate(), //日 
        "h+": this.getHours(), //小时 
        "m+": this.getMinutes(), //分 
        "s+": this.getSeconds(), //秒 
        "q+": Math.floor((this.getMonth() + 3) / 3), //季度 
        "S": this.getMilliseconds() //毫秒 
    };
    if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
    for (var k in o)
    if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
    return fmt;
}
  
function endCourse(data){  
var d= new Date().Format("yyyy-MM-dd").toString();
if(d > data){
   if(window.confirm('是否结束报名？'))
   return true;
   else
   return false;
}
else
{
   if(window.confirm('截止时间还未到，是否一定要结束报名？'))
   return true;
   else
   return false;
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
<label>学校教育信息管理</label> 
<img alt="" src="img/TableIcon/Cristal_Intense_069.png"/>
<label>实施培训计划</label>	
</div>
	
			<div id="displayTable">
					<display:table name="pageList" id="table" export="true" requestURI="PlanSchool_browser.action"
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
						<a href="PlanSchool_showAllAgencyAndCourse.action?SchoolId=${table.schoolId}&PlanId=${table.planId}&page=${pageList.pageNumber}" style="color:green;">选择机构</a>&nbsp;|&nbsp;
						<s:if test="#attr.table.status=='拟定实施方案'">
						<label title="还未选定培训机构，无法查看！请先点击选择机构按钮，进行选择！" class="seeinform" style="color:green;">查看课程</label>
						</s:if>
						<s:else>
						<a href="PlanSchool_lookCourse.action?Source=1&SchoolId=${table.schoolId}&PlanId=${table.planId}&page=${pageList.pageNumber}" style="color:green;">查看课程</a>
						</s:else>
						</display:column>
						<display:column title="工作流转" media="html" style="text-align:center;color:green;font-weight:bold;">
						<img src="./img/MenuIcon/FUNC20071.gif"/>&nbsp;
						<s:if test="#attr.table.status=='课程已选定'">
						<a href="PlanSchool_beginCourse.action?SchoolId=${table.schoolId}&PlanId=${table.planId}&page=${pageList.pageNumber}" onclick="return window.confirm('请确保培训机构已选定，并开始本校教师报名？')" style="color:red;">开始报名</a>
						</s:if>
						<s:elseif test="#attr.table.status=='拟定实施方案'">
						<label title="还未选定培训机构，无法开始！请先点击选择机构按钮，进行选择！" class="seeinform" style="color:red;">开始报名</label>
						</s:elseif>
						<s:elseif test="#attr.table.status=='正在报名'">
						<a id="endcourse" href="PlanSchool_endCourse.action?SchoolId=${table.schoolId}&PlanId=${table.planId}&page=${pageList.pageNumber}" onclick="return endCourse('${table.endTime}');"  style="color:red;">报名结束</a>
						</s:elseif>
						<s:elseif test="#attr.table.status=='培训结束'">
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
<div class="savetishi"><img src="img/function/help.png" style="width:15px;height:15px;"/>&nbsp;<label class="infom">学校实施培训计划操作说明</label></div>
</div>
  </body>
</html>
