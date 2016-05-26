<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@ taglib uri="http://displaytag.sf.net" prefix="display" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
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
<link href="./css/windows/table.css" rel="stylesheet" type="text/css" />
<link href="./css/windows/button.css" rel="stylesheet" type="text/css" />
<link href="./css/windows/displaytag.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="./css/jqueryUI/jquery-ui.css" type="text/css">
<link rel="stylesheet" type="text/css" href="./css/jqueryUI/combobox.css">
<script type="text/javascript" src="js/jquery/jquery.js"></script>
<script type="text/javascript" src="js/jquery/jquery-ui.js"></script>
<script type="text/javascript" src="js/jquery/jquery.easyui.min.js"></script>
<script src="dwr/engine.js" type="text/javascript"></script>
<script src="dwr/util.js" type="text/javascript"></script>
<script src="dwr/interface/districtservice.js" type="text/javascript"></script>
<script type="text/javascript">

$(document).ready(
		function() {
		
		$('#query').click(
		function() {
         $('#form').submit();
		});	
	
});

function sb(idnum,pagenum) {
if(window.confirm("您真的想删除本条记录吗？删除后将不可恢复!"))
{
document.getElementById('form').action="DistrictInfo_querydel.action?id="+idnum+"&page="+pagenum;
return true;
}
else
return false;

}

var myloader = function(success,error){
			$.ajax({
				url: "DistrictInfo_city.action",  
                dataType: "json",  
				success: function(data){                       
						var dd = $.parseJSON(data);
						$('#CityName').combobox('loadData', dd); 
						$('#CityName').combobox('setText',$('#belongCityName').val());
                    }, 
                error: function(){
					alert("远程数据无法加载！");
				}
			});
		}
	
</script>

</head>
  
  <body>
<jsp:include page="/WEB-INF/component/head.jsp" flush="true" /> 
    <jsp:include page="/WEB-INF/component/left.jsp" flush="true" /> 

<div id="bodyColumn">
<div id="navigation">
<label class="first">您当前所在的位置：</label> 
<label>基础信息管理</label> 
<img alt="" src="img/TableIcon/Cristal_Intense_069.png"/>
<label>区县信息查询</label>	
</div>		
       <fieldset id="fieldset-box">
			<legend>信息查询:</legend>
         <s:form name="form" id="form" action="DistrictInfo_query.action" method="post">
				<table id="newspaper-b">
					<tr>
					<td>所属城市:</td>
						<td style="border-style:none solid none none;border-width:1.5px;border-color:#69c;">
                        <input class="easyui-combobox" style="width:200px;height:30px;" id="CityName" name="CityName" data-options="
				loader: myloader,
				valueField: 'code',
				textField: 'city',
				onSelect: function(rec){
				$('#belongCityName').attr('value',rec.city);},
				onChange: function(){
				if($('#CityName').combobox('getText')=='')
				$('#belongCityName').attr('value','');
				}">
                        </td>
						<td>区（县）名称:</td>
						<td style="border-style:none solid none none;border-width:1.5px;border-color:#69c;"><s:textfield id="districtName" name="districtName"
								cssClass="mytxt" placeholder="请输入区（县）名称" style="width:200px;" /></td>
						<td>区（县）代码:</td>
						<td style="border-style:none solid none none;border-width:1.5px;border-color:#69c;"><s:textfield id="districtCode" name="districtCode"
								cssClass="mytxt" placeholder="请输入区（县）代码" style="width:200px;" /></td>
						<td><button type="button" class="button blue"
								style="font-size:16px;margin:auto;" id="query">查&nbsp;&nbsp;&nbsp;询</button></td>
					</tr>
				</table>
				<s:hidden id="belongCityName" name="belongCityName"></s:hidden>
			 </s:form>
			</fieldset>
			<div id="displayTable">
					<display:table name="pageList" id="table" export="true" requestURI="DistrictInfo_query.action"
						defaultsort="1" defaultorder="descending">
						<display:column title="序号" sortable="true" headerClass="sortable"
							style="text-align:center;"> 
				${(pageList.pageNumber-1)*pageList.objectsPerPage+table_rowNum} 
			</display:column>
						<display:column property="belongCityName" title="城市名称" sortable="true"
							headerClass="sortable" style="text-align:center;" />
						<display:column property="districtName" title="区（县）名称" sortable="true"
							headerClass="sortable" style="text-align:center;" />
						<display:column property="districtCode" title="区（县）代码" sortable="true"
							headerClass="sortable" style="text-align:center;" />
			<%-- 			<display:column title="编辑" media="html" style="text-align:center;">
							<img src="./img/MenuIcon/FUNC20029.gif" id="space"/><a href="javascript:document.getElementById('form').submit();" onclick="return sb('${table.id}','${pageList.pageNumber}');">删除</a>&nbsp;
							<s:url action="DistrictInfo_edit" id="editcity">
								<s:param name="id" value="%{#attr.table.id}" />
								<s:param name="page">${pageList.pageNumber}</s:param>
							</s:url>							
							<img src="./img/MenuIcon/FUNC20071.gif" id="space"/><a href="${editcity}">修改</a>	
			           </display:column>
			 --%>          
			           
						<display:setProperty name="export.pdf" value="false" />
						<display:setProperty name="export.csv" value="false" />
						<display:setProperty name="export.xml" value="false" />
						<display:setProperty name="export.excel.filename" value="district.xls" />
						<display:setProperty name="export.excel.include_header"
							value="true" />
					</display:table>		
			</div>
<jsp:include page="/WEB-INF/component/queryInformation.jsp" flush="true" />
</div>
  </body>
</html>
