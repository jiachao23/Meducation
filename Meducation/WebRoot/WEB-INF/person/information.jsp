<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%> 
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
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
<script type="text/javascript" src="js/jquery/jquery.js"></script>
<script src="dwr/engine.js" type="text/javascript"></script>
<script src="dwr/util.js" type="text/javascript"></script>
<script src="dwr/interface/personservice.js" type="text/javascript"></script>
<script type="text/javascript">
	function save() {
		var Person = {
			"loginName" : dwr.util.getValue("loginName"),
			"realName" : dwr.util.getValue("realName"),
			"identifyNum" : dwr.util.getValue("identifyNum"),
			"workPlace" : dwr.util.getValue("workPlace"),
			"email" : dwr.util.getValue("email"),
			"tel" : dwr.util.getValue("tel"),
			"address" : dwr.util.getValue("address"),
			"code" : dwr.util.getValue("code"),
			"sex" : dwr.util.getValue("sex")
		};
		personservice.updatePersonInfo(Person, dwrHandler);
	}

	function dwrHandler(data) {
		if (data)
			alert("新的用户个人资料保存完毕！");
	}
</script>
</head>

<body>
<jsp:include page="/WEB-INF/component/head.jsp" flush="true" /> 
    <jsp:include page="/WEB-INF/component/left.jsp" flush="true" /> 

	<script type="text/javascript">
    var _username = true;
	var _id = true;
	var _email = true;
	var _realname = true;
	var _school = true;	
$(document).ready(function(){

	$('#loginName').keyup(
			function() {
				var loginName = $(this).val();
				if (loginName == '') {
					$('#errName').html('对不起，用户名或昵称不能为空!');
					_username = false;
					$('#loginName').focus();
				} else {
					$('#errName').html('');
					_username = true;
				}
			});
			
   $('#realName').keyup(
			function() {
				var realName = $(this).val();
				if (realName == '') {
					$('#errRealName').html('对不起，真实姓名不能为空!');
					_realname = false;
					$('#realName').focus();
				} else {
					$('#errRealName').html('');
					_realname = true;
				}
			});

			
	$('#workPlace').keyup(
			function() {
				var workPlace = $(this).val();
				if (workPlace == '') {
					$('#errSchool').html('学校名称不能为空!');
					_school = false;
				} else {
					$('#errSchool').html('');
					_school = true;
				}
			});
	
 $('#email').keyup(
					function() {
						//$(this).css('background-color','#D6D6FF');
						var reg = /^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/;
			 		    if (!reg.test($(this).val())) {
							$('#errEmail').html("邮箱格式不正确，请重新输入!");
							_email = false;

						} else {
							$('#errEmail').html('');
									_email = true;
						}
					});

							$('#tel').keyup(
									function() {
										var tel = $(this).val().replace(
												/^[1][3-8]\\d{9}$/, "");
										if (tel.length != 11) {
											$('#errTel')
													.html('对不起，电话号码长度为11位!');
											_tel = false;
										} else {
											$('#errTel').html('');
											_tel = true;
										}
									});
									
				$('#save').click(
									function() {
										if ((_username == true)
												&& (_email == true)
												&& (_realname == true)
												&& (_school == true)
												&& (_id = true)) {
											save();
										} else {
											alert("请确认带（*）号的字段是否填写正确！否则不能保存！");
										}
									});
														
	
							});
	</script>
	
<div id="bodyColumn">
<div id="navigation">
<label class="first">您当前所在的位置：</label> 
<label>个人资料管理</label> 
<img alt="" src="img/TableIcon/Cristal_Intense_069.png"/>
<label>完善个人资料</label>	
</div>	
	
	<s:form action="person_saveInfo.action" method="post">
		<table id="newspaper-b">
			<tr>
				<td>用户名(昵称):</td>
				<td width="270px;"><s:textfield id="loginName" name="loginName"
						cssClass="mytxt" placeholder="请输入您的用户名(昵称)" /></td>
				<td>*</td>
				<td><span id="errName"></span></td>
			</tr>
			<tr>
				<td>真实姓名:</td>
				<td width="270px;"><s:textfield id="realName" name="realName"
						cssClass="mytxt" placeholder="请输入您的真实姓名" /></td>
				<td>*</td>
				<td><span id="errRealName"></span></td>
			</tr>
			<tr>
				<td>性别:</td>
				<td width="270px;"><s:radio id="sex" name="sex"
						list="#{'男':'男','女':'女'}" /></td>
				<td></td>
				<td><span id="errRealName"></span></td>
			</tr>
			<tr>
				<td>工作单位:</td>
				<td width="270px;"><s:textfield name="workPlace" id="workPlace"
						cssClass="mytxt" placeholder="请输入您的工作单位" /></td>
				<td>*</td>
				<td><span id="errSchool"></span></td>
			</tr>
			<tr>
				<td>身份证号码:</td>
				<td><s:textfield disabled="true" readonly="true"
						name="identifyNum" id="identifyNum" cssClass="mytxt"
						placeholder="请输入您的身份证号码" /></td>
				<td style="color:red;font-weight:bold;">(不可修改)</td>
				<td><span id="errId" style="color: red"></span></td>
			<tr>
				<td>电子邮箱:</td>
				<td><s:textfield id="email" name="email" cssClass="mytxt"
						placeholder="请输入您的电子邮箱" /></td>
				<td>*</td>
				<td><span id="errEmail"></span></td>
			</tr>
			<tr>
				<td>联系电话:</td>
				<td><s:textfield id="tel" name="tel" cssClass="mytxt"
						placeholder="请输入您的联系电话" /></td>
				<td>*</td>
				<td><span id="errTel"></span></td>
			</tr>
			<tr>
				<td>通讯地址:</td>
				<td><s:textfield id="address" name="address" cssClass="mytxt"
						placeholder="请输入您的通讯地址" /></td>
				<td>*</td>
				<td><span id="errAddress"></span></td>
			</tr>
			<tr>
				<td>邮编:</td>
				<td><s:textfield id="code" name="code" cssClass="mytxt"
						placeholder="请输入您的邮编" /></td>
				<td></td>
				<td><span id="errCode"></span></td>
			</tr>
			<tr>
				<td colspan="3" align="center">
					<button type="button" class="button blue" style="font-size:16px;"
						id="save">保&nbsp;&nbsp;&nbsp;存</button>
					<button type="button" class="button blue" style="font-size:16px;"
						id="cancel" onclick="window.location='person_findInfo.action';">取&nbsp;&nbsp;&nbsp;消</button>
				</td>
				<td><span></span></td>
			</tr>

		</table>
	</s:form>
</div>	
</body>
</html>
