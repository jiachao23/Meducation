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
          return "<div>"+"<p class='header'><strong>信息录入操作说明：</strong></p>"+
          "<p class='infor'>1、用户在输入框直接填写信息，并点击“保存”按钮，可完成信息录入工作。请注意：带（*）的信息栏必需填写；</p>"
          +"<p class='infor'>2、点击“删除”按钮将弹出确认提示框，确定后将删除记录，点击“修改”按钮将进入数据修改界面；</p>"+
          "</div>";

      }
    });
  });
</script>


<div class="savetishi"><img src="img/function/help.png" style="width:15px;height:15px;"/>&nbsp;<label class="infom">信息录入操作帮助说明</label></div>