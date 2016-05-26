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
<link rel="stylesheet" type="text/css" href="./css/jqueryUI/combobox.css">
<script type="text/javascript" src="js/jquery/jquery.js"></script>
<script type="text/javascript" src="js/jquery/jquery.easyui.min.js"></script>
<style> 
body{ text-align:center;background-image: url(img/login/main.jpg);background-repeat: no-repeat;} 
.div{ margin:auto;width:1000px;height:700px;} 
</style> 

<!-- DWR调用存储方法，执行提交功能 -->
<script src="dwr/engine.js" type="text/javascript"></script>
<script src="dwr/util.js" type="text/javascript"></script>
<script src="dwr/interface/personservice.js" type="text/javascript"></script>
<script type="text/javascript">
	function save() {	
var Person = {"loginName":dwr.util.getValue("username"), "realName":dwr.util.getValue("realname"), 
      			 "identifyNum":dwr.util.getValue("UserId") , "workPlace":dwr.util.getValue("workPlace"),
      			 "email":dwr.util.getValue("Email_address"), "tel":dwr.util.getValue("Tel"),
      			 "address":dwr.util.getValue("address"), "code":dwr.util.getValue("code"),
      			 "password":dwr.util.getValue("password"),"sex":dwr.util.getValue("sex"),
      			 "roleType":dwr.util.getValue("roleType")}; 		   
      personservice.save(Person, dwrHandler); 
	}

	function dwrHandler(data) {
		alert("用户注册成功，您将返回登录界面...");
		window.location="./index.jsp";
	}

</script>
<!-- DWR调用存储方法，执行提交功能 -->

<script type="text/javascript">
    var _username = false;
	var _pwd = false;
	var _repwd = false;
	var _id = false;
	var _email = false;
	var _realname = false;
	var _education = false;
	var _school = false;
	var _agency = false;		
	
$(document).ready(function(){
 $('#Email_address').keyup(
					function() {
						//$(this).css('background-color','#D6D6FF');
						var reg = /^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/;
			 		    if (!reg.test($(this).val())) {
							$('#errEmail').html("邮箱格式不正确，请重新输入!");
							_email = false;
							$('#Email_address').focus();

						} else {
							$('#errEmail').html('恭喜您，该邮箱可用!');
									_email = true;
						}
					});

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
	
	$('#username').keyup(
			function() {
				var username = $(this).val();
				if (username == '') {
					$('#errName').html('对不起，用户名或昵称不能为空!');
					_username = false;
					$('#username').focus();
				} else {
				
           personservice.PersonExist("t.loginName='" + $(this).val() + "'", function(flag) {
			if (flag == true) {				
			   $('#errName').html('该用户名已经被注册过了，不可用！');
			   _username = false;
			} else {
			$('#errName').html('用户名可用!');
			_username = true;
			}
			});	
				}
			});
			
   $('#realname').keyup(
			function() {
				var realname = $(this).val();
				if (realname == '') {
					$('#errRealName').html('对不起，真实姓名不能为空!');
					_realname = false;
					$('#realname').focus();
				} else {
					$('#errRealName').html('ok');
					_realname = true;
				}
			});

			
	$('#education').keyup(
			function() {
				var education = $(this).val();
				if (education == '') {
					$('#errSchool3').html('工作单位名称不能为空!');
					_education = false;
				} else {
					$('#errSchool3').html('ok');
					_education = true;
				}
			});		
			
	$('#UserId').keyup(
			function() {
				var name = $(this).val().replace(
						/[^a-zA-Z\d\u4e00-\u9fa5,.!?()，。．；;？]/g, "");
				if (name == '') {
					$('#errId').html('身份证号不能为空!');
					_id = false;
					$('#UserId').focus();
				} else if (name.length != 18) {
					$('#errId').html('对不起，身份证号长度为18位!');
					_id = false;
					$('#UserId').focus();
				} else {                
				personservice.PersonExist("t.identifyNum='" + $(this).val() + "'", function(flag) {
			if (flag == true) {
				if(confirm("该身份证号码已注册过！点击确定按钮，将进入登录页面，点击取消按钮，继续重新输入身份证号码。"))
               { 
               window.location='./index.jsp';
				} 
			else {
				$('#errId').html('该身份证号码不可用！');
				_id = false;
				$('#UserId').focus();
			   }
			} else {
			$('#errId').html('恭喜您，该身份证号码可用！');
			_id = true;
			}
			});
			}
		});

							$('#Tel').keyup(
									function() {
										var tel = $(this).val().replace(
												/^[1][3-8]\\d{9}$/, "");
										if (tel.length != 11) {
											$('#errTel')
													.html('对不起，电话号码长度为11位!');
											_tel = false;
											$('#Tel').focus();
										} else {
											$('#errTel').html('输入正确!');
											_tel = true;
										}
									});

							$('#agreeit').click(function() {
								if ($('#subbtn').prop('disabled') == true) {
									$('#subbtn').attr('disabled', false);
								} else {
									$('#subbtn').attr('disabled', true);
								}
							});
							$('#subbtn').click(
									function() {
										if ((_username == true)
												&& (_repwd == true)
												&& (_pwd == true)
												&& (_email == true)
												&& (_realname == true)
												&& ((_agency == true) ||(_school== true)||(_education== true))
												&& (_id = true)) {
											save();
										} else {
											alert("请确认带（*）号的字段是否填写正确！否则不能保存！");
										}
									});
	$('#agency').combobox({
	onSelect: function(rec){
                $('#workPlace').attr('value',rec.agenceName); 
                $('#errSchool1').html('ok');
					_agency = true;},
	onChange: function(){
				if($('#agency').combobox('getText')=='')
				{$('#workPlace').attr('value','');
				$('#errSchool1').html('工作单位名称不能为空!');
					_agency = false;
				}
				}
	});
	
									
	$('#school').combobox({
	onLoadSuccess: function(){
	var dd = $.parseJSON($('#school').combobox('getData'));
	$('#school').combobox('loadData', dd); 		
	},
	onSelect: function(rec){
    $('#workPlace').attr('value',rec.school); 
    $('#errSchool2').html('ok');
	 _school = true;},
	onChange: function(){
	if($('#school').combobox('getText')=='')
	{$('#workPlace').attr('value','');
	 $('#errSchool2').html('工作单位名称不能为空!');
	 _school = false;
	}
	}
});								
									

	$('#education').keyup(function() {
	$('#workPlace').attr('value',$(this).val());
						});
						
	$('#chongzhi').click(function() {
							window.location = "login_toRegister.action";
						});
						
	$('#choose2').hide();
	$('#choose3').hide();
	$('input[name=type]').click(function() {
	var type = $(this).val();
	if(type=="1")
	{$('#choose1').show();$('#choose2').hide();$('#choose3').hide();
	$('#roleType').attr('value',"教师");
	}
	else if(type=="2")
	{$('#choose2').show();$('#choose1').hide();$('#choose3').hide();
	$('#roleType').attr('value',"培训机构用户");}
	else if(type=="3")
	{$('#choose3').show();$('#choose1').hide();$('#choose2').hide();
	$('#roleType').attr('value',"教育部门用户");}
	});
	
	$('#roleType').attr('value',"教师");		
});
					
	var myloader_school = function(success,error){
			$.ajax({
				url: "login_school.action",  
                dataType: "json",  
				success: function(data){                      
						var dd = $.parseJSON(data);
						$('#school').combobox('loadData', dd); 
                    }, 
                error: function(){
					alert("远程数据无法加载！");
				}
			});
		}
		
		var myloader = function(success,error){
			$.ajax({
				url: "login_district.action",  
                dataType: "json",  
				success: function(data){                       
						var dd = $.parseJSON(data);
						$('#belongDistrictName').combobox('loadData', dd); 
                    }, 
                error: function(){
					alert("远程数据无法加载！");
				}
			});
		}
		
		var myloader_agency = function(success,error){
			$.ajax({
				url: "login_agency.action",  
                dataType: "json",  
				success: function(data){                     
						var dd = $.parseJSON(data);
						$('#agency').combobox('loadData', dd); 
                    }, 
                error: function(){
					alert("远程数据无法加载！");
				}
			});
		}								

		
							
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
    <td style="color:#663333;font-weight:bold;font-size:20px;text-align:center;" colspan="4">新用户注册</td>
            </tr>
				<tr>
					<td>用户名(昵称):</td>
					<td>
						<s:textfield name="username" id="username" cssClass="mytxt" style="width:300px;"
							placeholder="请输入您的用户名(昵称)"
							onkeydown="if(event.keyCode==13){document.getElementById('realname').focus();}" />
						</td>
					<td>*</td>
					<td style="width:260px;"><span id="errName">可使用英文名字</span></td>
				</tr>
				<tr>
					<td>真实姓名:</td>
					<td>
						<s:textfield name="realname" id="realname" cssClass="mytxt" style="width:300px;"
							placeholder="请输入您的真实姓名"
							onkeydown="if(event.keyCode==13){document.getElementById('sex').focus();}" />
						</td>
					<td>*</td>
					<td><span id="errRealName">必填</span></td>
				</tr>
				<tr>
					<td>性别:</td>
					<td><input type="radio" name="sex" value="男"
						checked="checked" />男 <input type="radio" name="sex" value="女" />女
					</td>
					<td></td>
					<td><span id="errRealName">可选项</span></td>
				</tr>
				<tr>
					<td>工作单位类型:</td>
					<td><input type="radio" name="type" value="1"
						checked="checked" />学校 <input type="radio" name="type" value="2" />培训机构
						<input type="radio" name="type" value="3" />教育部门
					</td>
					<td><s:hidden id="roleType" name="roleType"></s:hidden></td>
					<td><span id="errRealName">请选择其中一种</span></td>
				</tr>
				<tr id="choose2">
					<td>工作单位:</td>
                    <td><input class="easyui-combobox" style="width:300px;height:30px;" id="agency" name="agency" data-options="
				loader: myloader_agency,
				valueField: 'id',
				textField: 'agenceName'"></td>
                    <td>*</td>
                    <td><span id="errSchool1">必填</span></td>
				</tr>
				<tr id="choose1">
					<td >工作单位:</td>
					<td>
				<input class="easyui-combobox" style="width:110px;height:30px;" id="belongDistrictName" name="belongDistrictName" data-options="
				loader: myloader,
				valueField: 'code',
				textField: 'district',
				onSelect: function(rec){
				var url = 'login_school.action?code='+rec.code;
                $('#school').combobox('reload', url);
			    }">	
				<input class="easyui-combobox" style="width:185px;height:30px;text-align:left;" id="school" name="school" data-options="valueField:'id',textField:'school'" />							
						</td>
					<td>*</td>
					<td><span id="errSchool2">必填</span></td>
				</tr>
				<tr id="choose3">
					<td>工作单位:</td>
					<td> <s:textfield name="education" id="education" cssClass="mytxt" style="width:300px;"
							placeholder="请输入您的工作单位"
							onkeydown="if(event.keyCode==13){document.getElementById('UserId').focus();}" />
						</td>
					<td>*</td>
					<td><span id="errSchool3" style="color: red">必填</span></td>
				<tr>
				<tr>
					<td>身份证号码:</td>
					<td> <s:textfield name="UserId" id="UserId" cssClass="mytxt" style="width:300px;"
							placeholder="请输入您的身份证号码"
							onkeydown="if(event.keyCode==13){document.getElementById('Email_address').focus();}" />
						</td>
					<td>*</td>
					<td><span id="errId" style="color: red">身份证号码长度为18位</span></td>
				<tr>
					<td>电子邮箱:</td>
					<td>
						<s:textfield name="Email_address" id="Email_address" cssClass="mytxt" style="width:300px;"
							placeholder="请输入您的电子邮箱"
							onkeydown="if(event.keyCode==13){document.getElementById('Tel').focus();}" />
						</td>
					<td></td>
					<td><span id="errEmail">格式：XXX@xxx.xxx</span></td>
				</tr>
				<tr>
					<td>联系电话:</td>
					<td><s:textfield name="Tel" id="Tel" cssClass="mytxt" style="width:300px;"
							placeholder="请输入您的联系电话"
							onkeydown="if(event.keyCode==13){document.getElementById('address').focus();}" />
						</td>
					<td></td>
					<td><span id="errTel">电话号码长度为11位数字</span></td>
				</tr>
				<tr>
					<td>通讯地址:</td>
					<td><s:textfield name="address" id="address" cssClass="mytxt" style="width:300px;"
							placeholder="请输入您的通讯地址"
							onkeydown="if(event.keyCode==13){document.getElementById('code').focus();}" />
						</td>
					<td></td>
					<td><span id="errAddress"></span>请如实填写</td>
				</tr>
				<tr>
					<td>邮编:</td>
					<td> <s:textfield name="code" id="code" cssClass="mytxt" style="width:300px;"
							placeholder="请输入您的邮编"
							onkeydown="if(event.keyCode==13){document.getElementById('password').focus();}" />
						
						</td>
					<td></td>
					<td><span id="errCode">请如实填写</span></td>
				</tr>
				<tr>
					<td>登录密码:</td>
					<td>
						<s:password name="password" id="password" cssClass="mytxt" style="width:300px;"
							placeholder="登录密码"
							onkeydown="if(event.keyCode==13){document.getElementById('againpassword').focus();}" />
						</td>
					<td>*</td>
					<td><span id="errPwd">请使用数字+字母组合以增强安全性</span></td>
				</tr>
				<tr>
					<td>重新输入密码:</td>
					<td><s:password name="againpassword" id="againpassword" cssClass="mytxt" style="width:300px;"
							placeholder="再次输入密码" />
						</td>
					<td>*</td>
					<td><span id="reerrPwd">必填</span></td>
				</tr>

				<tr>
					<td colspan=4 class="buttom"><span id="agreereg"><input
							type="checkbox" class="checkbox" id="agreeit" name="agree" />
							我已同意<a href="#" style="color: blue;">注册协议</a></span>
							
					<s:hidden id="workPlace" name="workPlace"></s:hidden>		
							</td>
				</tr>

				<tr>
				<td align="center">
					<button disabled="disabled" type="button" class="button blue"
								style="font-size:15px;margin:auto;width:100px;" id="subbtn">提&nbsp;&nbsp;&nbsp;交</button>	
				</td>
					<td align="center">
					<button type="button" class="button blue"
								style="font-size:15px;margin:auto;width:100px;" id="chongzhi">重&nbsp;&nbsp;&nbsp;置</button>	
					</td>				
					<td align="center" colspan="2">
					<button type="button" class="button blue" onclick="window.location='./index.jsp';"
								style="font-size:15px;margin:auto;width:100px;" id="back">返&nbsp;&nbsp;&nbsp;回</button>		
						
				</td>
				</tr>
			    
		</table>
</form>




	</div>

</body>
</html>
