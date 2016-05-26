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
	<meta http-equiv="description" content="This is my page">
	<link href="./css/windows/table.css" rel="stylesheet" type="text/css" />
	<link href="./css/windows/button.css" rel="stylesheet" type="text/css" />
<style> 
body{ text-align:center;background-image: url(img/login/main3.jpg);background-repeat: no-repeat;} 
.div{ margin:auto;width:450px; height:450px; } 
</style> 	
	
<script type="text/javascript" src="js/jquery/jquery.js"></script>
<script type="text/javascript">

	$(function() {
		$('#kaptcha').click(
				function() {//生成验证码  
					$(this).hide().attr('src',
							'Kaptcha.jpg?' + Math.floor(Math.random() * 100))
							.fadeIn();
				})

	
	$('#register').click(
	function() {
		window.location="login_toRegister.action";
          });
		   
    $('#login').click(
	function() {
	if ($('#login_name').val() != '' && $('#password').val() != '' && $('#validate_code').val()!='')
		$('#form').submit();
		else
	alert("请先输入用户名、密码及验证码！");

          });

	});
</script>

</head>
  
  <body>
  
<div class="div">
<table>
<tr><td height="180px" ></td>
</tr>
</table>
<table width="455px" height="425px">

  <tr>
   <td style="background-image: url(img/login/login_back.gif);">
   <br/>
   <br/>
  <s:form name="form" id="form" action="login_check.action" method="post">
  	<table id="newspaper-b" style="border:none;">
			<tr>
				<td style="color:red;align:center;" colspan="2">
				<s:if test="hasActionErrors()">
						<s:actionerror/>
				</s:if></td>
			</tr>
			<tr style="height:6px;">
				<td style="width:80px;">用户名：</td>
				<td>	<s:textfield id="login_name" name="login_name" cssClass="mytxt" style="width:300px;"
							placeholder="身份证号码/用户名（昵称）"
							onkeydown="if(event.keyCode==13){document.getElementById('password').focus();}" />
				</td>
			</tr>
  		<tr>
  			<td style="width:80px;">密 码：</td>
  			<td><s:password id="password" name="password" cssClass="mytxt" type="password" style="width:300px;"
  			placeholder="请输入登陆密码"
  						onkeydown="if(event.keyCode==13){document.getElementById('validate_code').focus();}"/>
  			</td>
  		</tr>
  		<tr>
  			<td style="width:80px;">验证码：</td>
  			<td><input id="validate_code" class="mytxt" type="text" style="width:300px;"
  						maxlength="5"
  						onkeydown="if(event.keyCode==13){document.forms[0].submit();}"
  						name="validate_code" value="" size="8" style="width:130px;">
  			</td>
  		</tr>
  		<tr>
  			<td class="logintd" colspan="2">
  				<img src="Kaptcha.jpg" class="kaptcha" id="kaptcha"
  					width="150px;" />
  				<span>看不清？点击图片重换一张</span>
  			</td>
  		</tr>
			<tr>
				<td style="color:red;align:center;" colspan="2">
				<s:if test="hasActionMessages()">
						<s:actionmessage />
				</s:if></td>
			</tr>
  		<tr>
  			<td colspan="2">
  				
  				<span style="width:160px;text-align:center;float:left;">
  				<button type="button" class="button blue"
								style="font-size:15px;margin:auto;width:100px;" id="login">登&nbsp;&nbsp;&nbsp;陆</button>
				</span >
				
				<span style="width:155px;text-align:center;float:left;">
  					<button type="button" class="button blue"
								style="font-size:16px;margin:auto;width:100px;" id="register">注&nbsp;&nbsp;&nbsp;册</button>
  				</span >
			  								
				<span style="text-align:right;float:right;margin:11px 0;">
  					<a href="login_toremember.action">忘记密码？</a>
  				</span >	
  			</td>
  		</tr>
			
		</table>
  	
  </s:form>
 
</td>
  </tr>

</table>
</div>


</body>
</html>
