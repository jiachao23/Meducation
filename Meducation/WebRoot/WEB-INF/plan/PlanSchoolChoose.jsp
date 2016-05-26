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
<script src="dwr/interface/planschoolservice.js" type="text/javascript"></script>
<script type="text/javascript">
 $(function() {		
		$('#query').click(
		function() {
		$('#form').prop('action','PlanSchool_showall2.action?PlanId=${sessionScope.G_PlanId}');
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
         window.location="PlanSchool_look.action?PlanId=${sessionScope.G_PlanId}&page=${sessionScope.firstlevel_page}&Source=${sessionScope.Source}";         
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

planschoolservice.saveData(SelectedItems, saveHandler);
});			

});


function saveHandler(data) {
			if (data)
			{alert("您所选的学校已添加至相关培训计划中，如需查看或删除，请点击查看结果按钮！");	
			
			}
		}
		 
var myloader = function(success,error){
			$.ajax({
				url: "SchoolInfo_district.action",  
                dataType: "json",  
				success: function(data){                       
						var dd = $.parseJSON(data);
						$('#DistrictName').combobox('loadData', dd); 
						$('#DistrictName').combobox('setText', $('#belongDistrictName').val()); 
                    }, 
                error: function(){
					alert("远程数据无法加载！");
				}
			});
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
<a href="PlanInfo_browser.action" style="color:blue;">教育培训计划录入</a>
<img alt="" src="img/TableIcon/Cristal_Intense_069.png"/>
<label>选择学校培训对象</label>		
</div>

<fieldset id="fieldset-box">
			<legend>教育培训计划相关简要信息:</legend>		
				<table id="newspaper-b">
					<tr>
						<td class="buttom">培训计划名称:</td>
						<td class="buttom_right" colspan="5"><s:textfield disabled="true" id="planName" name="planName" 
								cssClass="mytxt" placeholder="请输入培训计划名称" style="width:500px;" /></td>
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
			<legend>学校对象筛选:</legend>
         <s:form name="form" id="form" action="PlanSchoolInfo_planquery.action" method="post">
				<table id="newspaper-b">
					<tr>
					<td class="buttom">所属区(县):</td>
						<td class="buttom_right">
                        <input class="easyui-combobox" style="width:200px;height:30px;" id="DistrictName" name="DistrictName" data-options="
				loader: myloader,
				valueField: 'code',
				textField: 'district',
				onSelect: function(rec){
				$('#belongDistrictName').attr('value',rec.district);},
				onChange: function(){
				if($('#DistrictName').combobox('getText')=='')
				$('#belongDistrictName').attr('value','');
				}">
                        </td>
						<td class="buttom">学校名称:</td>
						<td class="buttom_right"><s:textfield id="schoolName" name="schoolName"
								cssClass="mytxt" placeholder="请输入学校名称" style="width:200px;" /></td>
						<td class="buttom">学校代码:</td>
						<td class="buttom_right"><s:textfield id="schoolCode" name="schoolCode"
								cssClass="mytxt" placeholder="请输入学校代码" style="width:200px;" /></td>
						<td>学校类型:</td>
						<td style="border-style:none solid none none;border-width:1.5px;border-color:#69c;">
					<input id="st" name="st" placeholder="请选择学校类型" class="easyui-combobox" style="width:130px;height:30px;"
					data-options="
				url: 'data/school_type.json',
				method: 'get',
				valueField: 'id',
				textField: 'text',
				onSelect: function(rec){
				$('#schoolType').attr('value',rec.text);},
				onChange: function(){
				if($('#st').combobox('getText')=='')
				$('#schoolType').attr('value','');},
				onLoadSuccess: function(){                       
				$('#st').combobox('setText', $('#schoolType').val()); 
                    }">
								</td>
						<td><button type="button" class="button blue"
								style="font-size:16px;margin:auto;" id="query">查&nbsp;&nbsp;&nbsp;询</button></td>
					</tr>
				</table>
				<s:hidden id="belongDistrictName" name="belongDistrictName"></s:hidden>
				<s:hidden id="schoolType" name="schoolType"></s:hidden>
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
					<display:table name="pageList" id="table" export="true" requestURI="PlanSchool_showall2.action"
						defaultsort="1" defaultorder="descending" decorator="checkboxDecorator">
						<display:column property="checkbox" style="text-align:center;" title="<input type='checkbox' id='checkall' value='all'/>全选"/>
						<display:column property="belongDistrictName" title="所属区(县)" sortable="true"
							headerClass="sortable" style="text-align:center;" />
						<display:column property="schoolName" title="学校名称" sortable="true"
							headerClass="sortable" style="text-align:center;" />
						<display:column property="schoolCode" title="学校代码" sortable="true"
							headerClass="sortable" style="text-align:center;" />
						<display:column property="schoolType" title="学校类型" sortable="true"
							headerClass="sortable" style="text-align:center;" />
						<display:column property="schoolAddress" title="学校地址" sortable="true"
							headerClass="sortable" style="text-align:center;" />	     
			            
						<display:setProperty name="export.pdf" value="false" />
						<display:setProperty name="export.csv" value="false" />
						<display:setProperty name="export.xml" value="false" />
						<display:setProperty name="export.excel.filename" value="school.xls" />
						<display:setProperty name="export.excel.include_header"
							value="true" />
					</display:table>		
			</div>
<jsp:include page="/WEB-INF/component/chooseInformation.jsp" flush="true" /> 			
</div>
  </body>
</html>
