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
var _roleType = false;
var _roleType_Value;
$(document).ready(
		function() {		
			$('#roleType').combobox({
       onSelect: function(rec){
			if(rec.text=='')
					_roleType = false;
				 else 
					{_roleType = true;
					 _roleType_Value=rec.text;}
				}
	});
			
		$('#save').click(
		function() {
		if (_roleType == false)
			alert("请给此用户指定一个权限类型！");
		else
		    save();
		});
		
		$('#back').click(
		function() {
			$.ajax({
				url: "Person_roleaskforback.action", 
                dataType: "json",  
				success: function(data){ 
				if(data=='true')                      
				 alert("您的权限申请已撤销！"); 
				 else
				 alert("您没有任何申请，不需要撤销！"); 
                    }, 
                error: function(){
					alert("申请提交失败！");
				}
			});
		});
	
});

function save() {
				$.ajax({
				url: "Person_askfor.action",
				data:{"A":_roleType_Value},  
                dataType: "json",  
				success: function(data){ 
				if(data=='true')                      
				 alert("用户申请已提交，等待管理员审批！"); 
				 else
				 alert("用户申请已提交，请耐心等待，不要重复提交！"); 
                    }, 
                error: function(){
					alert("申请提交失败！");
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
          return "<div>"+"<p class='header'><strong>用户申请权限说明：</strong></p>"+
          "<p class='infor'>1、不同的权限类型，仅具有不同的系统功能，不同功能之间不存在相互管理能力；</p>"
          +"<p class='infor'>2、用户申请权限后，需要得到系统管理员的审批后，才能具有相应权限，申请不通过则无效；</p>"+
          "<p class='infor'>3、选择申请权限的类型后，点击“提交申请”按钮，申请将自动出现在管理员审批列表中；</p>"+
          "<p class='infor'>4、点击“撤销申请”，已发出的申请将自动从管理员审批列表中删除；</p>"+
          "<p class='infor'>5、请不要随意申请，增加系统管理员工作负担，发现恶意用户，将删除该用户；</p>"+
          "</div>";

      }
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
<label>个人资料管理</label> 
<img alt="" src="img/TableIcon/Cristal_Intense_069.png"/>
<label>用户权限申请</label>	
</div>		
			<fieldset id="fieldset-box">
			<legend style="color:red;">用户权限申请:</legend>
				<table id="newspaper-b">					
						<tr>
						<td>申请权限类型:*</td>
						<td class="buttom_right">
					<input id="roleType" name="roleType" placeholder="请选择权限类型" class="easyui-combobox" style="width:250px;height:30px;"
					data-options="
				url: 'data/role_type.json',
				method: 'get',
				valueField: 'id',
				textField: 'text'">
								</td>						
						<td style="text-align:center;"><button type="button" class="button blue"
								style="font-size:16px;margin:auto;" id="save">提&nbsp;交&nbsp;申&nbsp;请</button></td>
					<td style="text-align:center;"><button type="button" class="button blue"
								style="font-size:16px;margin:auto;" id="back">撤&nbsp;销&nbsp;申&nbsp;请</button></td>
					</tr>
				</table>
		<s:hidden id="id" name="id"></s:hidden>
		</fieldset>
<div class="savetishi"><img src="img/function/help.png" style="width:15px;height:15px;"/>&nbsp;<label class="infom">用户申请权限说明</label></div>
</div>
  </body>
</html>


