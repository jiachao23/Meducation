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
    $( document ).tooltip();
    $('#beginTime').datepicker();
    $('#endTime').datepicker();
    $('#createTime').datepicker();
  });
  
</script>
  
<script type="text/javascript">
	var _planName = true;
    var _planNum = true;

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
		
				$('#backtoMain').click(
		function() {
		window.location="PlanInfo_browser.action?page=${requestScope.page}";
		});	
});
    
	function save() {
		var TrainingPlan = {
			"id":dwr.util.getValue("id"),
			"planName" : dwr.util.getValue("planName"),
			"planNum" : dwr.util.getValue("planNum"),
			"beginTime" : dwr.util.getValue("beginTime"),
			"endTime" : dwr.util.getValue("endTime"),
			"introduce" : dwr.util.getValue("introduce"),
			"creator" : dwr.util.getValue("creator"),
			"createTime" : dwr.util.getValue("createTime")
		};
		planservice.saveOrUpdateData(TrainingPlan, saveHandler);
		
	}
		function saveHandler(data) {
			if (data)
			{alert("信息保存完毕！");	
			window.location="PlanInfo_browser.action";
			}
		}

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
<label>教育培训计划信息修改</label>	
</div>
	
			<fieldset id="fieldset-box">
			<legend style="color:red;">信息修改:</legend>
				<table id="newspaper-b">
					<tr>
						<td class="buttom">培训计划名称:*</td>
						<td class="buttom_right" colspan="3"><s:textfield id="planName" name="planName" 
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
						<td style="text-align:center;" class="buttom"><button type="button" class="button blue"
								style="font-size:16px;margin:auto;" id="save">修&nbsp;改&nbsp;保&nbsp;存</button></td>
						<td style="text-align:center;" class="buttom_right"><button type="button" class="button blue"
								style="font-size:16px;margin:auto;" id="backtoMain">取&nbsp;消&nbsp;返&nbsp;回</button></td>										
					</tr>
					<tr>
					<td colspan="8">培训计划内容介绍:<br /> <s:textarea id="introduce" name="introduce" cols="180" rows="15" cssClass="mytextarea"/></td>
					</tr>
				</table>
				<s:hidden id="id" name="id"></s:hidden>
		</fieldset>	
		<jsp:include page="/WEB-INF/component/modifyInformation.jsp" flush="true" /> 
</div>
  </body>
</html>
