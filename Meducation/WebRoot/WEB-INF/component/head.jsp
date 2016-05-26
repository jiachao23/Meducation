<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<script type="text/javascript">
$(document).ready(function() {
$('#day').text(showDate());     
});     

 function showDate()  
    {  
    var d = new Date();    
    var full=d.getFullYear()+"年"+d.getMonth()+"月"+d.getDate()+"日 ";  
    switch(d.getDay())  
    {  
     case 0:  
      full=full+"星期日";  
      break;  
     case 1:  
      full=full+"星期一";   
      break;  
     case 2:  
      full=full+"星期二";  
      break;  
     case 3:  
     full=full+"星期三";  
      break;  
     case 4:  
     full=full+"星期四";   
      break;  
     case 5:  
      full=full+"星期五";   
      break;  
     case 6:  
      full=full+"星期六";  
      break;  
    }  
    return full;   
    }
</script>  

<div id="banner"> 
<table style="margin:auto;width:98%;border:0;">
<tr>
<td style="font-family:'Microsoft Yahei';"><img src="./img/function/rockmelt.png" style="width:30px;height:30px;vertical-align:-40%;"><strong>今天是：</strong><label id="day"></label></td> 
<td rowspan="2" style="width:800px;height:75px;text-align:center;"><img src="./img/function/title.gif" alt=""> </td>
<td rowspan="2" style="width:300px;font-weight:bold;"><p style="float:right;"><img src="./img/function/big.png" style="width:40px;height:40px;vertical-align:-60%;"><a href="login_mainpage.action" style="font-size:17px;font-family:'幼圆';">首页</a>&nbsp;|&nbsp;<img src="./img/function/big.png" style="width:40px;height:40px;vertical-align:-60%;"><a href="login_logout.action" style="font-size:17px;font-family:'幼圆';" onclick="return window.confirm('确定要退出系统吗？欢迎再次登录系统！')">退出</a>&nbsp;|</p></td>

</tr>
<tr>
<td style="width:300px;"><p><img src="./img/function/rockmelt.png" style="width:30px;height:30px;vertical-align:-50%;"><strong>当前用户：</strong>${sessionScope.Person.realName } &nbsp;您好，祝您工作愉快！</p></td>
</tr>
</table>
</div>

 <div class="clear">
    <hr>
 </div>

