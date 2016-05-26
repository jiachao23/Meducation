<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>

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
<link rel="stylesheet" type="text/css" href="./css/jqueryUI/combobox.css">
<script type="text/javascript" src="js/jquery/jquery.js"></script>
<script type="text/javascript" src="js/jquery/jquery-ui.js"></script>
<script type="text/javascript" src="js/jquery/jquery.easyui.min.js"></script>
<script src="dwr/engine.js" type="text/javascript"></script>
<script src="dwr/util.js" type="text/javascript"></script>
<script src="dwr/interface/districtservice.js" type="text/javascript"></script>
<script type="text/javascript">
	var _districtName = true;
    var _districtCode = true;
    var _belongCityName = true;
	$(document).ready(
		function() {

	$('#districtName').keyup(
			function() {
				var districtName = $(this).val();
				if (districtName == '') {
					_districtName = false;
					$('#districtName').focus();
				} else {
					_districtName = true;
				}
			});
	$('#districtCode').keyup(
			function() {
				var districtCode = $(this).val();
				if (districtCode == '') {
					_districtCode = false;
					$('#districtCode').focus();
				} else {
					_districtCode = true;
				}
			});
	
	$('#CityName').combobox({
        onSelect: function(rec){
				$('#belongCityName').attr('value',rec.city); 
				$('#belongCityCode').attr('value',rec.code); 
				}
	});
					
	$('#save').click(
		function() {
		if (_districtName == true && _districtCode == true && _belongCityName == true)
			save();
		else
		    alert("请先输入带（*）的内容再保存！")
		});
		
		$('#backtoMain').click(
		function() {
		window.location="DistrictInfo_browser.action?page=${requestScope.page}";
		});				
});
    
	function save() {
		var District = {
		    "id":dwr.util.getValue("id"),
		    "belongCityName" : dwr.util.getValue("belongCityName"),
		    "belongCityCode" : dwr.util.getValue("belongCityCode"),
			"districtName" : dwr.util.getValue("districtName"),
			"districtCode" : dwr.util.getValue("districtCode")
		};
		districtservice.saveData(District, saveHandler);
		
	}
		function saveHandler(data) {
			if (data)
			{alert("信息保存完毕！");	
			window.location="DistrictInfo_browser.action";
			}
		}

var myloader = function(success,error){
			$.ajax({
				url: "DistrictInfo_city.action",  
                dataType: "json",  
				success: function(data){                       
						var dd = $.parseJSON(data);
						$('#CityName').combobox('loadData', dd); 
						$('#CityName').combobox('setText', $('#belongCityName').val());
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
<label>基础信息管理</label> 
<img alt="" src="img/TableIcon/Cristal_Intense_069.png"/>
<label>区县信息修改</label>	
</div>		
			<fieldset id="fieldset-box">
			<legend style="color:red;">信息修改:</legend>
				<table id="newspaper-b">
					<tr>
					<td>所属城市:*</td>
						<td style="border-style:none solid none none;border-width:1.5px;border-color:#69c;">
				<input class="easyui-combobox" style="width:200px;height:30px;" id="CityName" name="CityName" data-options="
				loader: myloader,
				valueField: 'code',
				textField: 'city'">
								</td>
						<td>区（县）名称:*</td>
						<td style="border-style:none solid none none;border-width:1.5px;border-color:#69c;"><s:textfield id="districtName" name="districtName"
								cssClass="mytxt" placeholder="请输入区（县）名称" style="width:200px;" /></td>
						<td>区（县）代码:*</td>
						<td style="border-style:none solid none none;border-width:1.5px;border-color:#69c;"><s:textfield id="districtCode" name="districtCode"
								cssClass="mytxt" placeholder="请输入区（县）代码" style="width:200px;" /></td>
						<td><button type="button" class="button blue"
								style="font-size:16px;margin:auto;" id="save">修&nbsp;改&nbsp;保&nbsp;存</button></td>
						<td><button type="button" class="button blue"
								style="font-size:16px;margin:auto;" id="backtoMain">取&nbsp;消&nbsp;返&nbsp;回</button></td>			
					</tr>
				</table>
				<s:hidden id="id" name="id"></s:hidden>
				<s:hidden id="belongCityCode" name="belongCityCode"></s:hidden>
				<s:hidden id="belongCityName" name="belongCityName"></s:hidden>
</fieldset>
<jsp:include page="/WEB-INF/component/modifyInformation.jsp" flush="true" /> 
</div>
  </body>
</html>
