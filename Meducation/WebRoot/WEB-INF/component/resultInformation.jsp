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
          return "<div>"+"<p class='header'><strong>查看对象说明：</strong></p>"+
          "<p class='infor'>1、计划实施状态显示了该对象正在实施培训计划的情况；</p>"
          +"<p class='infor'>2、用户只能删除处于计划创建状态的对象，其他状态均显示不可编辑；</p>"+
          "<p class='infor'>3、用户点击“返回上级”按钮，可返回上级界面；</p>"+
          "</div>";

      }
    });
  });
</script>


<div class="savetishi"><img src="img/function/help.png" style="width:15px;height:15px;"/>&nbsp;<label class="infom">查看对象说明</label></div>