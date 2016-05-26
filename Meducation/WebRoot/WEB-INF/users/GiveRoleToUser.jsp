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
		window.location="PersonInfo_browser.action?page="+${page};
		});	
	
});

function save() {
				$.ajax({
				url: "Person_roleUpdate.action",
				data:{"A":_roleType_Value,
				      "B":$('#id').val() },  
                dataType: "json",  
				success: function(data){                       
						alert("用户权限更新成功，返回上级查看！"); 
                    }, 
                error: function(){
					alert("权限更新失败！");
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
      items: "label.infom",
      content: function() {
          return "<div>"+"<p class='header'><strong>用户授权说明：</strong>（权限类型*）中列出了系统内部的全部角色类型，为用户选择合适的角色权限后，点击“授权”按钮，将完成用户授权操作！</p>"+
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
<label>用户权限管理</label> 
<img alt="" src="img/TableIcon/Cristal_Intense_069.png"/>
<label>注册用户查看</label>
<img alt="" src="img/TableIcon/Cristal_Intense_069.png"/>
<label>用户授权</label>		
</div>		
			<fieldset id="fieldset-box">
			<legend style="color:red;">注册用户授权:</legend>
				<table id="newspaper-b">
					<tr>
					<td class="buttom">用户名/昵称:</td>
						<td class="buttom_right"><s:textfield id="loginName" name="loginName"
								cssClass="mytxt" placeholder="请输入用户名/昵称" style="width:200px;" /></td>
						<td class="buttom">真实姓名:</td>
						<td class="buttom_right"><s:textfield id="realName" name="realName"
								cssClass="mytxt" placeholder="请输入真实姓名" style="width:200px;" /></td>
						<td class="buttom">身份证号码:</td>
						<td class="buttom_right"><s:textfield id="identifyNum" name="identifyNum"
								cssClass="mytxt" placeholder="请输入身份证号码" style="width:300px;" /></td>
						</tr>
						<tr>
						<td>工作单位:</td>
						<td class="buttom_right"><s:textfield id="workPlace" name="workPlace"
								cssClass="mytxt" placeholder="请输入工作单位" style="width:300px;" /></td>
						<td>权限类型:*</td>
						<td class="buttom_right">
					<input id="roleType" name="roleType" placeholder="请选择权限类型" class="easyui-combobox" style="width:200px;height:30px;"
					data-options="
				url: 'data/role_type.json',
				method: 'get',
				valueField: 'id',
				textField: 'text'">
								</td>						
						<td style="text-align:center;"><button type="button" class="button blue"
								style="font-size:16px;margin:auto;" id="save">授&nbsp;&nbsp;&nbsp;权</button></td>
					<td style="text-align:center;"><button type="button" class="button blue"
								style="font-size:16px;margin:auto;" id="back">返&nbsp;回&nbsp;上&nbsp;级</button></td>			
					</tr>
				</table>
		<s:hidden id="id" name="id"></s:hidden>
		</fieldset>
<div class="savetishi"><img src="img/function/help.png" style="width:15px;height:15px;"/>&nbsp;<label class="infom">用户授权说明</label></div>
</div>
  </body>
</html>


