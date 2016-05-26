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
          return "<div>"+"<p class='header'><strong>信息查询操作说明：</strong></p>"
          +"<p class='infor'>1、本系统查询方式为“组合模糊查询”；</p>"
          +"<p class='infor'>2、不输人任何关键字的情况下，查询全部获得全部结果，结果大于10条，将分页显示；</p>"
          +"<p class='infor'>3、输入一个或多个关键字的情况下，将根据关键字的合并关系进行查询，结果大于10条，将分页显示；</p>"
          +"<p class='infor'>4、查询关键字不需要精确输入，系统将查询与关键字类似的全部结果；</p>"
          +"</div>";

      }
    });
  });
</script>


<div class="savetishi"><img src="img/function/help.png" style="width:15px;height:15px;"/>&nbsp;<label class="infom">信息查询操作帮助说明</label></div>