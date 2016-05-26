<%@ page contentType="text/html; charset=gbk"%>
<%@taglib prefix="s" uri="/struts-tags"%> 
<html> 
	<head>
		<title>修改会员</title>
		<link rel="stylesheet" type="text/css" href="./css/jqueryUI/uploadify.css">
	</head>
	<body>	

<script type="text/javascript" src="js/jquery/jquery.js"></script>
<script type="text/javascript"
    src="js/jquery/jquery.uploadify.js"></script>
<script type="text/javascript"> 
 
$(function() {//等同于$(document).ready(function(){});说明此函数在页面加载完后被调用
        $("#personalInfoUpload").uploadify({
            buttonText: '上传头像',// 按钮的显示文本
            height    : 25,//按钮高度30
            swf       : 'js/jquery/uploadify.swf',//起到提交文件作用的flash
            uploader  : './WithView/upload',//异步提交的后台路径（action的路径）
            width     : 150,//按钮的宽120
            fileSizeLimit: '512KB',// 上传文件的最大限制    
            onUploadSuccess:function(path){//上传成功的回调方法
                 
            }
        });
    }); 
</script>

<input type="file" id="personalInfoUpload">	
	</body>
</html>