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
<script type="text/javascript" src="js/jquery/jquery.js"></script>
<script src="dwr/engine.js" type="text/javascript"></script>
<script src="dwr/util.js" type="text/javascript"></script>
<script src="dwr/interface/personservice.js" type="text/javascript"></script>
</head>

<body>
<jsp:include page="/WEB-INF/component/head.jsp" flush="true" /> 
    <jsp:include page="/WEB-INF/component/left.jsp" flush="true" /> 

	<script type="text/javascript">
		var _id = false;
		var _pwd = false;
		var _repwd = false;

		$(document).ready(
						function() {
							$('#newpw')
									.keyup(
											function() {
												if ($(this)
														.val()
														.replace(
																/[^a-zA-Z\d\u4e00-\u9fa5,.!?()，。．；;？]/g,
																"") == '') {
													$('#errPwd').html(
															'登陆密码不能为空!');
													_pwd = false;
													$('#newpw').focus();
												} else {
													$('#errPwd').html(
															'请再次输入新密码，进行确认!');
													_pwd = true;
												}
											});

							$('#againpassword')
									.keyup(
											function() {
												if ($(this)
														.val()
														.replace(
																/[^a-zA-Z\d\u4e00-\u9fa5,.!?()，。．；;？]/g,
																"") == '') {
													$('#reerrPwd').html(
															'密码不能为空!');
													_repwd = false;
												} else if ($(this).val() != $(
														'#newpw').val()) {
													$('#reerrPwd').html(
															'对不起，两次密码不一致!');
													_repwd = false;
												} else {
													$('#reerrPwd').html('验证通过');
													$('#errPwd').html('验证通过');
													_repwd = true;
												}
											});

							$('#oldpw').keyup(
									function() {
										personservice.PersonExistPW($(this)
												.val(), dwrHandler);
									});

							$('#save')
									.click(
											function() {
												if ((_pwd == true)
														&& (_repwd == true)
														&& (_id == true)) {
													personservice
															.updatePersonPW(
																	dwr.util
																			.getValue("againpassword"),
																	saveHandler);
												} else {
													alert("请确认带（*）号的字段，全部验证通过后才能保存！");
												}
											});
						});

		function dwrHandler(flag) {
			if (flag == false) {
				$('#errId').html('旧密码不正确，不能进行修改操作！');
				_id = false;
			} else {
				$('#errId').html('验证通过');
				_id = true;
			}
		}

		function saveHandler(data) {
			if (data)
				alert("新密码已修改成功！");
		}
	</script>
<div id="bodyColumn">
<div id="navigation">
<label class="first">您当前所在的位置：</label> 
<label>个人资料管理</label> 
<img alt="" src="img/TableIcon/Cristal_Intense_069.png"/>
<label>修改登录密码</label>	
</div>
	<table id="newspaper-b">
		<tr>
			<td>旧密码:</td>
			<td width="270px;"><s:password id="oldpw" name="oldpw"
					cssClass="mytxt" placeholder="请输入您的原密码" /></td>
			<td>*</td>
			<td><span id="errId"></span></td>
		</tr>
		<tr>
			<td>用户新密码:</td>
			<td width="270px;"><s:password id="newpw" name="newpw"
					cssClass="mytxt" placeholder="请输入您的新密码" /></td>
			<td>*</td>
			<td><span id="errPwd"></span></td>
		</tr>
		<tr>
			<td>确认新密码:</td>
			<td width="270px;"><s:password id="againpassword"
					name="againpassword" cssClass="mytxt" placeholder="请确认您的新密码" /></td>
			<td>*</td>
			<td><span id="reerrPwd"></span></td>
		</tr>

		<tr>
			<td colspan="3" align="center">
				<button type="button" class="button blue" style="font-size:16px;"
					id="save">保&nbsp;&nbsp;&nbsp;存</button>
			</td>
			<td><span></span></td>
		</tr>

	</table>
</div>
</body>
</html>
