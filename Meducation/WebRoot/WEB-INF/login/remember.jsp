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
<link href="./css/windows/table.css" rel="stylesheet" type="text/css" />
<link href="./css/windows/button.css" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="js/jquery/jquery.js"></script>

<style> 
body{ text-align:center;background-image: url(img/login/regist.jpg);background-repeat: no-repeat;} 
.div{ margin:auto;width:800px;height:600px;} 
</style> 

<script src="dwr/engine.js" type="text/javascript"></script>
<script src="dwr/util.js" type="text/javascript"></script>
<script src="dwr/interface/personservice.js" type="text/javascript"></script>

<script type="text/javascript">

	var _pwd = false;
	var _repwd = false;
	var _personExist = false;
	var _realName = false;
	var _workPlace = false;
	var _identifyNum = false;
$(document).ready(function(){

	$('#realName').blur(
			function() {
				var realName = $(this).val();
				if (realName == '') {
					_realName = false;
				} else {
					_realName = true;
					if ((_realName == true)&&(_workPlace == true)&&(_identifyNum == true))
					$.xyz();	

				}
			});
$('#workPlace').blur(
			function() {
				var workPlace = $(this).val();
				if (workPlace == '') {
					_workPlace = false;
				} else {
					_workPlace = true;
					if ((_realName == true)&&(_workPlace == true)&&(_identifyNum == true))
					$.xyz();	

				}
			});
$('#identifyNum').blur(
			function() {
				var identifyNum = $(this).val();
				if (identifyNum == '') {
					_identifyNum = false;
				} else {
					_identifyNum = true;
					if ((_realName == true)&&(_workPlace == true)&&(_identifyNum == true))
					$.xyz();					
				}
			});
						
 $.xyz = function(){
       $.ajax({ url: "person_checkexist.action",
					         type:"post",
					         data:{
					         "realName" : $('#realName').val(),
					         "identifyNum" : $('#identifyNum').val(),
					         "workPlace" : $('#workPlace').val()
					         },
					         dataType: "json",
					    success: function(data){
					    var dd=eval("("+data+")");
					    if(dd.person=="true")
                       {$('#errId').html("验证通过！");
                       _personExist = true;
                       }
                        else
                        {$('#errId').html("输入信息有误，无法修改密码！");
                        _personExist = false;
                        }
                    }});
    }


	$('#password').keyup(
			function() {
				if ($(this).val().replace(
						/[^a-zA-Z\d\u4e00-\u9fa5,.!?()，。．；;？]/g, "") == '') {
					$('#errPwd').html('密码不能为空!');
					_pwd = false;
					$('#password').focus();
				} else {
					$('#errPwd').html('请确认密码!');
					_pwd = true;
				}
			});

	$('#againpassword').keyup(
			function() {
				if ($(this).val().replace(
						/[^a-zA-Z\d\u4e00-\u9fa5,.!?()，。．；;？]/g, "") == '') {
					$('#reerrPwd').html('密码不能为空!');
					_repwd = false;
				} else if ($(this).val() != $('#password').val()) {
					$('#reerrPwd').html('对不起，两次密码不一致!');
					_repwd = false;
				} else {
					$('#reerrPwd').html('验证正确!');
					_repwd = true;
				}
			});

							$('#subbtn').click(
									function() {
										if ((_repwd == true)
												&& (_pwd == true)
												&& (_personExist = true)) {
	personservice.updatePersonPW(dwr.util.getValue("againpassword"),dwr.util.getValue("identifyNum"),saveHandler);
										} else {
											alert("信息不正确,无法修改密码！");
										}
									});
									
		function saveHandler(data) {
		alert("用户密码修改成功，返回登录界面...");
		window.location="./index.jsp";
	}					
});									
							
</script>
</head>

<body>
<div class="div">

<table>
<tr><td height="100px" ></td>
</tr>
</table>

   <form>
   <table id="newspaper-b">
   <tr>
    <td style="color:#663333;font-weight:bold;font-size:20px;text-align:center;" colspan="4">用户密码修改</td>
            </tr>
				<tr>
					<td>真实姓名:</td>
					<td>
						<s:textfield name="realName" id="realName" cssClass="mytxt" style="width:300px;"
							placeholder="请输入您的真实姓名"
							onkeydown="if(event.keyCode==13){document.getElementById('workPlace').focus();}" />
						</td>
					<td>*</td>
					<td rowspan="3"><span id="errId" style="color: red"></span></td>
				</tr>

				<tr>
					<td>所属学校:</td>
					<td>
					<s:textfield name="workPlace" id="workPlace" cssClass="mytxt" style="width:300px;"
							placeholder="请输入您所在的学校名称"
							onkeydown="if(event.keyCode==13){document.getElementById('identifyNum').focus();}" />
                    </td>
                    <td>*</td>
				</tr>
				<tr>
					<td>身份证号码:</td>
					<td> <s:textfield name="identifyNum" id="identifyNum" cssClass="mytxt" style="width:300px;"
							placeholder="请输入您的身份证号码"
							onkeydown="if(event.keyCode==13){document.getElementById('password').focus();}" />
						</td>
					<td>*</td>	
				<tr>
					<td>登录密码:</td>
					<td>
						<s:password name="password" id="password" cssClass="mytxt" style="width:300px;"
							placeholder="登录密码"
							onkeydown="if(event.keyCode==13){document.getElementById('againpassword').focus();}" />
						</td>
					<td>*</td>
					<td><span id="errPwd"></span></td>
				</tr>
				<tr>
					<td class="buttom">重新输入密码:</td>
					<td class="buttom"><s:password name="againpassword" id="againpassword" cssClass="mytxt" style="width:300px;"
							placeholder="再次输入密码" />
						</td>
					<td class="buttom">*</td>
					<td class="buttom"><span id="reerrPwd"></span></td>
				</tr>

				<tr>
				<td align="center" colspan="2">
					<button type="button" class="button blue" 
								style="font-size:15px;margin:auto 50px;width:100px;" id="subbtn">修&nbsp;改&nbsp;密&nbsp;码</button>
					<button type="button" class="button blue" onclick="window.location='./index.jsp';"
								style="font-size:15px;margin:auto 50px;width:100px;" id="back">返&nbsp;&nbsp;&nbsp;回</button>					
				</td>			
					<td align="center" colspan="2">
						
				</td>
				</tr>			    
		</table>
</form>
</div>

</body>
</html>
