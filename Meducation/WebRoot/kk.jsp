<%@ page contentType="text/html; charset=gbk"%>
<%@taglib prefix="s" uri="/struts-tags"%> 
<html> 
	<head>
		<title>�޸Ļ�Ա</title>
		<link rel="stylesheet" type="text/css" href="./css/jqueryUI/uploadify.css">
	</head>
	<body>	

<script type="text/javascript" src="js/jquery/jquery.js"></script>
<script type="text/javascript"
    src="js/jquery/jquery.uploadify.js"></script>
<script type="text/javascript"> 
 
$(function() {//��ͬ��$(document).ready(function(){});˵���˺�����ҳ�������󱻵���
        $("#personalInfoUpload").uploadify({
            buttonText: '�ϴ�ͷ��',// ��ť����ʾ�ı�
            height    : 25,//��ť�߶�30
            swf       : 'js/jquery/uploadify.swf',//���ύ�ļ����õ�flash
            uploader  : './WithView/upload',//�첽�ύ�ĺ�̨·����action��·����
            width     : 150,//��ť�Ŀ�120
            fileSizeLimit: '512KB',// �ϴ��ļ����������    
            onUploadSuccess:function(path){//�ϴ��ɹ��Ļص�����
                 
            }
        });
    }); 
</script>

<input type="file" id="personalInfoUpload">	
	</body>
</html>