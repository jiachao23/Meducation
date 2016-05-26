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

<script type="text/javascript" src="js/jquery/jquery.js"></script>

  </head>
  
  <body>
<jsp:include page="/WEB-INF/component/head.jsp" flush="true" /> 
<jsp:include page="/WEB-INF/component/left.jsp" flush="true" /> 

<div id="bodyColumn"  style="background-color: #e2f3b8;">
<div id="navigation">
<label class="first">您当前所在的位置：</label> 
<label>用户权限管理</label> 
<img alt="" src="img/TableIcon/Cristal_Intense_069.png"/>
<label>系统角色说明</label>	
</div>	
<h2 style="padding:10px;margin:10px;width:1000px;">系统用户角色说明</h2>
<div style="margin:5px;width:500px;float:left;">

    <p style="padding:5px;margin:5px;font-size:16px;"><strong>1、教师：</strong></p>   
    <ul style="margin:0 60px;font-size:16px;">
    <li>报名参加培训计划；</li>
    <li>查看培训课程内容；</li>
    <li>查看上课地点、上课时间；</li>
    <li>查看自己的课程成绩；</li>
    <li>查看培训历史记录；</li>
    </ul>
    
    <p style="padding:5px;margin:5px;font-size:16px;"><strong>2、市、区县级系统管理员：</strong></p>
    <ul style="margin:0 60px;font-size:16px;">
    <li>录入、维护学校、培训机构等基础信息；</li>
    <li>制定培训计划；</li>
    <li>上报、下达培训计划；</li>
    <li>查看培训机构课程信息；</li>
    <li>查看学校教师报名情况；</li>
    <li>查看用户个人培训成绩及培训历史记录；</li>
    <li>查看、管理用户权限；</li>
    </ul>
    
    <p style="padding:5px;margin:5px;font-size:16px;"><strong>3、市、区县级审批人：</strong></p>
    <ul style="margin:0 60px;font-size:16px;">
    <li>查看、审核培训计划；</li>
    <li>查看培训机构课程信息；</li>
    <li>查看学校教师报名情况；</li>
    <li>查看用户个人培训成绩及培训历史记录；</li>
    </ul>
</div> 
<div style="margin:5px;width:500px;float:left;">   
    <p style="padding:5px;margin:5px;font-size:16px;"><strong>4、学校级系统管理员：</strong></p>
    <ul style="margin:0 60px;font-size:16px;">
    <li>查看培训机构课程，选定培训机构；</li>
    <li>管理培训计划报名；</li>
    <li>查看学校教师报名情况；</li>
    <li>查看用户个人培训成绩及培训历史记录；</li>
    </ul>
    
    <p style="padding:5px;margin:5px;font-size:16px;"><strong>5、培训机构系统管理员：</strong></p>
    <ul style="margin:0 60px;font-size:16px;">
    <li>定制培训课程，录入、维护培训课程信息；</li>
    <li>为培训计划选择培训课程；</li>
    <li>查看课程报名情况；</li>
    <li>为课程学员录入成绩；</li>
    <li>查看课程成绩及培训历史记录；</li>
    </ul>
</div>    
   
</div>

  </body>
</html>
