<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<script type="text/javascript" src="./js/menu/admin.js"></script>
<script type="text/javascript" src="./js/menu/menu.js"></script>
<div id="leftColumn">

<ul id="nav" class="jing">
	<li id="firstlevel" class="left">个人资料管理</li>
	<li class="left"><img src="./img/MenuIcon/radio_green.gif"/><a href="person_findInfo.action">完善个人资料</a></li>
	<li class="left"><img src="./img/MenuIcon/radio_green.gif"/><a href="person_modifypw.action">修改登录密码</a></li>
	<li class="left"><img src="./img/MenuIcon/radio_green.gif"/><a href="person_askforpower.action">用户权限申请</a></li>
	
<s:if test="'教师'==#session.Person.roleType">
	<li id="firstlevel" class="left">学校教育信息管理</li>
	<li class="left"><img src="./img/MenuIcon/radio_green.gif"/><a href="PlanSchool_teacherbrowser.action">教育培训报名</a></li>
	<li class="left"><img src="./img/MenuIcon/radio_green.gif"/><a href="TeacherEnrollment_browser.action">教师课程查询</a></li>
</s:if>

<s:elseif test="'培训机构用户'==#session.Person.roleType">
	<li id="firstlevel" class="left">培训机构信息管理</li>
	<li class="left"><img src="./img/MenuIcon/radio_green.gif"/><a href="CourseInfo_search.action">培训课程信息查询</a></li>
	<li class="left"><img src="./img/MenuIcon/radio_green.gif"/><a href="AgencyCourse_historyQuery.action">培训历史记录查询</a></li>
	<li class="left"><img src="./img/MenuIcon/radio_green.gif"/><a href="TeacherEnrollment_EntergetScore.action">课程成绩查询</a></li>
</s:elseif>
<s:elseif test="'教育部门用户'==#session.Person.roleType">
	<li id="firstlevel" class="left">教育培训计划管理</li>
	<li class="left"><img src="./img/MenuIcon/radio_green.gif"/><a href="PlanInfo_search.action">教育培训计划查询</a></li>
	<li class="left"><img src="./img/MenuIcon/radio_green.gif"/><a href="TeacherEnrollment_EntergetScoreTotle.action">教师培训成绩查询</a></li>
	<li class="left"><img src="./img/MenuIcon/radio_green.gif"/><a href="AgencyCourse_historyQueryTotle.action">培训机构课程信息查询</a></li>
    
    <li id="firstlevel" class="left">基础信息管理</li>
	<li class="left"><img src="./img/MenuIcon/radio_green.gif"/><a href="baseinof_search.action">城市信息查询</a></li>
	<li class="left"><img src="./img/MenuIcon/radio_green.gif"/><a href="DistrictInfo_search.action">区县信息查询</a></li>
	<li class="left"><img src="./img/MenuIcon/radio_green.gif"/><a href="SchoolInfo_search.action">学校信息查询</a></li>
	<li class="left"><img src="./img/MenuIcon/radio_green.gif"/><a href="AgencyInfo_search.action">培训机构信息查询</a></li>
</s:elseif>
<s:elseif test="'学校级管理员'==#session.Person.roleType">
	<li id="firstlevel" class="left">学校教育信息管理</li>
	<li class="left"><img src="./img/MenuIcon/radio_green.gif"/><a href="PlanSchool_browser.action">实施培训计划</a></li>
	<li class="left"><img src="./img/MenuIcon/radio_green.gif"/><a href="PlanSchool_history.action">培训历史记录查询</a></li>
	<li class="left"><img src="./img/MenuIcon/radio_green.gif"/><a href="PlanSchool_teacherbrowser.action">教育培训报名</a></li>
	<li class="left"><img src="./img/MenuIcon/radio_green.gif"/><a href="TeacherEnrollment_browser.action">教师课程查询</a></li>
</s:elseif>
<s:elseif test="'市、区县级管理员'==#session.Person.roleType">
	<li id="firstlevel" class="left">教育培训计划管理</li>
	<li class="left"><img src="./img/MenuIcon/radio_green.gif"/><a href="PlanInfo_browser.action">教育培训计划录入</a></li>
	<li class="left"><img src="./img/MenuIcon/radio_green.gif"/><a href="PlanInfo_search.action">教育培训计划查询</a></li>
	<li class="left"><img src="./img/MenuIcon/radio_green.gif"/><a href="PlanInfo_approve.action">审批培训计划</a></li>
	<li class="left"><img src="./img/MenuIcon/radio_green.gif"/><a href="TeacherEnrollment_EntergetScoreTotle.action">教师培训成绩查询</a></li>
	<li class="left"><img src="./img/MenuIcon/radio_green.gif"/><a href="AgencyCourse_historyQueryTotle.action">培训机构课程信息查询</a></li>
	
    <li id="firstlevel" class="left">用户权限管理</li>
	<li class="left"><img src="./img/MenuIcon/radio_green.gif"/><a href="Person_giverole.action">用户角色授权</a></li>
	<li class="left"><img src="./img/MenuIcon/radio_green.gif"/><a href="Person_applyroleQuery.action">查看授权记录</a></li>
	<li class="left"><img src="./img/MenuIcon/radio_green.gif"/><a href="PersonInfo_browser.action">注册用户查看</a></li>
	<li class="left"><img src="./img/MenuIcon/radio_green.gif"/><a href="Users_roleuser.action">系统角色说明</a></li>
	
	<li id="firstlevel" class="left">基础信息管理</li>
	<li class="left"><img src="./img/MenuIcon/radio_green.gif"/><a href="baseinof_citybrowser.action">城市信息录入</a></li>
	<li class="left"><img src="./img/MenuIcon/radio_green.gif"/><a href="baseinof_search.action">城市信息查询</a></li>
	<li class="left"><img src="./img/MenuIcon/radio_green.gif"/><a href="DistrictInfo_browser.action">区县信息录入</a></li>
	<li class="left"><img src="./img/MenuIcon/radio_green.gif"/><a href="DistrictInfo_search.action">区县信息查询</a></li>
	<li class="left"><img src="./img/MenuIcon/radio_green.gif"/><a href="SchoolInfo_browser.action">学校信息录入</a></li>
	<li class="left"><img src="./img/MenuIcon/radio_green.gif"/><a href="SchoolInfo_search.action">学校信息查询</a></li>
	<li class="left"><img src="./img/MenuIcon/radio_green.gif"/><a href="AgencyInfo_browser.action">培训机构信息录入</a></li>
	<li class="left"><img src="./img/MenuIcon/radio_green.gif"/><a href="AgencyInfo_search.action">培训机构信息查询</a></li>
</s:elseif>
<s:elseif test="'市、区县级审批人'==#session.Person.roleType">
	<li id="firstlevel" class="left">教育培训计划管理</li>
	<li class="left"><img src="./img/MenuIcon/radio_green.gif"/><a href="PlanInfo_approve.action">审批培训计划</a></li>
	<li class="left"><img src="./img/MenuIcon/radio_green.gif"/><a href="PlanInfo_search.action">教育培训计划查询</a></li>	
	<li class="left"><img src="./img/MenuIcon/radio_green.gif"/><a href="TeacherEnrollment_EntergetScoreTotle.action">教师培训成绩查询</a></li>
	<li class="left"><img src="./img/MenuIcon/radio_green.gif"/><a href="AgencyCourse_historyQueryTotle.action">培训机构课程信息查询</a></li>
	
    <li id="firstlevel" class="left">用户权限管理</li>
	<li class="left"><img src="./img/MenuIcon/radio_green.gif"/><a href="PersonInfo_browser.action">注册用户查看</a></li>
	<li class="left"><img src="./img/MenuIcon/radio_green.gif"/><a href="Users_roleuser.action">系统角色说明</a></li>
</s:elseif>
<s:elseif test="'培训机构级管理员'==#session.Person.roleType">
	<li id="firstlevel" class="left">培训机构信息管理</li>
	<li class="left"><img src="./img/MenuIcon/radio_green.gif"/><a href="CourseInfo_browser.action">培训课程信息录入</a></li>
	<li class="left"><img src="./img/MenuIcon/radio_green.gif"/><a href="CourseInfo_search.action">培训课程信息查询</a></li>
	<li class="left"><img src="./img/MenuIcon/radio_green.gif"/><a href="PlanAgency_browser.action">实施培训计划</a></li>
	<li class="left"><img src="./img/MenuIcon/radio_green.gif"/><a href="AgencyCourse_historyQuery.action">培训历史记录查询</a></li>
	<li class="left"><img src="./img/MenuIcon/radio_green.gif"/><a href="AgencyCourse_courseBrowser.action">登记课程成绩</a></li>
	<li class="left"><img src="./img/MenuIcon/radio_green.gif"/><a href="TeacherEnrollment_EntergetScore.action">课程成绩查询</a></li>
</s:elseif>

    <li id="bar" class="left">
</ul>

</div>

<div class="picBox" onclick="switchSysBar()" id="switchPoint" ></div>