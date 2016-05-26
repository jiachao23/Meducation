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
      items: "label.infom",
      content: function() {
          return "<div>"+"<p class='header'><strong>添加对象操作说明：</strong></p>"+
          "<p class='infor'>1、页面上所列出的培训计划简要信息，仅用于信息提示功能，不能修改；</p>"
          +"<p class='infor'>2、用户可使用页面上提供的“筛选”功能，输入关键词，并查询出所需要添加的对象集合；</p>"+
          "<p class='infor'>3、用户可点击“全选”复选框，选择全部对象，或任意点选要添加的对象；</p>"+
          "<p class='infor'>4、用户需点击“添加对象”按钮，所选择的对象才能添加至相应的培训计划之中；</p>"+
          "<p class='infor'>5、用户如果添加错误，需要修改，可点击“查看结果”按钮，在结果列表中可执行删除操作；</p>"+
          "<p class='infor'>5、点击“返回上级”按钮，将返回上级界面；</p>"+
          "</div>";

      }
    });
  });
</script>


<div class="savetishi"><img src="img/function/help.png" style="width:15px;height:15px;"/>&nbsp;<label class="infom">添加对象操作说明</label></div>