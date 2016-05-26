<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

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
          return "<div>"+"<p class='header'><strong>信息修改操作说明：</strong></p>"+
          "<p class='infor'>1、用户在输入框直接修改信息，并点击“修改保存”按钮，既可完成信息修改工作。修改完成后将自动返回上级界面；</p>"
          +"<p class='infor'>2、请注意：带（*）的信息栏必需填写，不可遗漏；</p>"
          +"<p class='infor'>3、如果没有信息需要修改，用户可点击“取消返回”按钮，重新返回信息录入界面；</p>"+
          "</div>";

      }
    });
  });
</script>


<div class="savetishi"><img src="img/function/help.png" style="width:15px;height:15px;"/>&nbsp;<label class="infom">信息修改操作帮助说明</label></div>