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
<script type="text/javascript" src="js/jquery/jquery.ui.datepicker-zh-CN.js"></script>   
<script src="dwr/engine.js" type="text/javascript"></script>
<script src="dwr/util.js" type="text/javascript"></script>
<script src="dwr/interface/planservice.js" type="text/javascript"></script>
 
    
<script>
  $(function() {
    $('#beginTime').datepicker();
    $('#endTime').datepicker();
    $('#createTime').datepicker(); 
  });

  </script>  
    
<script type="text/javascript">
	var _planName = false;
    var _planNum = false;

	$(document).ready(function() {

	$('#planNum').keyup(
			function() {
				var planNum = $(this).val();
				if (planNum == '') {
					_planNum = false;
					$('#planNum').focus();
				} else {
					_planNum = true;
				}
			});
	$('#planName').keyup(
			function() {
				var planName = $(this).val();
				if (planName == '') {
					_planName = false;
					$('#planName').focus();
				} else {
					_planName = true;
				}
			});
					
	$('#save').click(
		function() {
		if (_planName == true && _planNum == true)
			save();
		else
		    alert("请先输入带（*）的内容再保存！");
		});
		
	$('#creator').attr('value','${sessionScope.Person.realName}');	
	
});

function delplan(status){
if(status=="计划创建"){
  if(window.confirm('您真的想删除本条记录吗？删除后将不可恢复！'))
  return true;
 } 
else {
  if(window.confirm('该培训计划已开始实施，全部相关信息将同时被删除，您确定要执行删除操作吗？'))
  return true;
}
 
return false; 
}
    
	function save() {
		var TrainingPlan = {
			"planName" : dwr.util.getValue("planName"),
			"planNum" : dwr.util.getValue("planNum"),
			"beginTime" : dwr.util.getValue("beginTime"),
			"endTime" : dwr.util.getValue("endTime"),
			"introduce" : dwr.util.getValue("introduce"),
			"creator" : dwr.util.getValue("creator"),
			"createTime" : dwr.util.getValue("createTime"),
			"status" : "计划创建"
		};
		planservice.saveData(TrainingPlan, saveHandler);
		
	}
		function saveHandler(data) {
			if (data)
			{alert("信息保存完毕！");	
			window.location="PlanInfo_browser.action";
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
          return "<div>"+"<p class='header'><strong>培训计划信息操作说明：</strong></p>"+
          "<p class='infor'>1、新建培训计划后，需要在“培训学校对象”及“培训机构对象”下点击“选择”按钮，从而为该计划添加培训的对象及实施的机构；</p>"
          +"<p class='infor'>2、点击“培训学校对象”及“培训机构对象”下的查看按钮，能够浏览与本计划相关的学校及培训机构的详细信息列表；</p>"+
          "<p class='infor'>3、点击删除按钮后，与本培训计划关联的信息会全部删除；</p>"+
          "<p class='infor'>4、与培训计划相关的状态包括：“计划创建”——“等待审批”——“通过审批”或“未通过审批”——“计划实施”，点击工作流转下的按钮，将依次推进培训计划工作的进行；</p>"+
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
<label>教育培训计划信息录入</label>	
</div>
<fieldset id="fieldset-box">
			<legend>信息录入:</legend>		
				<table id="newspaper-b">
					<tr>
						<td class="buttom">培训计划名称:*</td>
						<td class="buttom_right" colspan="2"><s:textfield id="planName" name="planName" 
								cssClass="mytxt" placeholder="请输入培训计划名称" style="width:400px;" /></td>
						<td class="buttom">培训计划编号:*</td>
						<td class="buttom_right"><s:textfield id="planNum" name="planNum"
								cssClass="mytxt" placeholder="请输入培训计划编号" style="width:150px;" /></td>		
						<td class="buttom">计划创建人:</td>
						<td class="buttom_right"><s:textfield id="creator" name="creator"
								cssClass="mytxt" placeholder="请输入计划创建人" style="width:150px;" /></td>

					</tr>
					<tr>						
						<td class="buttom">计划开始时间:</td>
						<td class="buttom_right"><s:textfield id="beginTime" name="beginTime"
								cssClass="mytxt" placeholder="请输入计划开始时间" style="width:150px;" /></td>
						<td class="buttom">计划结束时间:</td>
						<td class="buttom_right"><s:textfield id="endTime" name="endTime"
								cssClass="mytxt" placeholder="请输入计划结束时间" style="width:150px;" /></td>
						<td class="buttom">计划创建时间:</td>
						<td class="buttom_right"><s:textfield id="createTime" name="createTime"
								cssClass="mytxt" placeholder="请输入计划创建时间" style="width:150px;" /></td>
						<td style="text-align:center;" class="buttom_right"><button type="button" class="button blue"
								style="font-size:16px;margin:auto;" id="save">保&nbsp;&nbsp;&nbsp;存</button></td>						
					</tr>
					<tr>
					<td colspan="8">培训计划内容介绍:<br /> <s:textarea id="introduce" name="introduce" cols="200" rows="6" /></td>
					</tr>
				</table>
		</fieldset>	
			<div id="displayTable">
					<display:table name="pageList" id="table" export="true" requestURI="PlanInfo_browser.action"
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
						<img src="./img/MenuIcon/FUNC20071.gif"/>&nbsp;<a href="PlanSchool_showall.action?Source=1&PlanId=${table.id}&page=${pageList.pageNumber}" style="color:green;">选择</a>&nbsp;|&nbsp;
						<a href="PlanSchool_look.action?Source=3&PlanId=${table.id}&page=${pageList.pageNumber}" style="color:green;">查看</a>
						</display:column>
						<display:column title="培训机构对象" media="html" style="text-align:center;">
						<img src="./img/MenuIcon/FUNC20071.gif"/>&nbsp;<a href="PlanAgency_showall3.action?Source=1&PlanId=${table.id}&page=${pageList.pageNumber}" style="color:green;">选择
						</a>&nbsp;|&nbsp;<a href="PlanAgency_look.action?Source=3&PlanId=${table.id}&page=${pageList.pageNumber}" style="color:green;">查看</a>
						</display:column>	
						<display:column title="编辑" media="html" style="text-align:center;">
							<s:url action="PlanInfo_del" id="delcity">
								<s:param name="id" value="%{#attr.table.id}" />
								<s:param name="page">${pageList.pageNumber}</s:param>
							</s:url>
							<img src="./img/MenuIcon/FUNC20029.gif"/>&nbsp;<a href="${delcity}" onclick="return delplan('${table.status}');">删除</a>&nbsp;|&nbsp;
							<s:url action="PlanInfo_edit" id="editcity">
								<s:param name="id" value="%{#attr.table.id}" />
								<s:param name="page">${pageList.pageNumber}</s:param>
							</s:url>							
							<a href="${editcity}">修改</a>
                       </display:column>
						<display:column title="当前状态" media="html" style="text-align:center;color:#a429c0;font-weight:bold;">
						<label class="seeinform" title="审批人：${table.authorizedPerson} 审批时间：${table.authorizedTime}" style="color:#a429c0;font-weight:bold;">${table.status}</label>
						</display:column>	
						<display:column title="工作流转" media="html" style="text-align:center;">
						<s:url action="PlanAgency_down" id="nextplan">
								<s:param name="planID" value="%{#attr.table.id}" />
								<s:param name="page">${pageList.pageNumber}</s:param>
						</s:url>
						<img src="./img/MenuIcon/FUNC20071.gif"/>&nbsp;
						<s:if test="#attr.table.status=='计划创建'">
						<a href="${nextplan}" id="down1" onclick="return window.confirm('请确保培训计划信息完整，参加培训的学校与实施培训的机构已经选定！确定提交审批吗？')" style="color:red;font-weight:bold;">请求审批</a>
						</s:if>
						<s:elseif test="#attr.table.status=='等待审批'">
						<a href="javascript:void(0);" id="down2" onclick="javascript:alert('计划正在审批当中，请耐心等待！')" style="color:red;font-weight:bold;">等待审批</a>
						</s:elseif>
						<s:elseif test="#attr.table.status=='通过审批'">
						<a href="PlanInfo_planissued.action?planID=${table.id}&page=${pageList.pageNumber}" id="down3" onclick="return window.confirm('确定下发培训计划吗？下发后培训计划信息不可再编辑！')" style="color:red;font-weight:bold;">下发计划</a>
						</s:elseif>
						<s:elseif test="#attr.table.status=='未通过审批'">
						<a href="${nextplan}" id="down4" onclick="return window.confirm('请确保培训计划信息完整，参加培训的学校与实施培训的机构已经选定！确定提交审批吗？')" style="color:red;font-weight:bold;">重新审批</a>
						</s:elseif>
						<s:elseif test="#attr.table.status=='计划实施'">
						<a href="javascript:void(0);" onclick="javascript:alert('下级部门正在积极组织实施培训计划！')" style="color:red;font-weight:bold;">正在执行</a>
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
<div class="savetishi"><img src="img/function/help.png" style="width:15px;height:15px;"/>&nbsp;<label class="infom">培训计划信息操作说明</label></div>
</div>
  </body>
</html>
