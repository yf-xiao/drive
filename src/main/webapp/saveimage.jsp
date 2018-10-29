<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>图片上传</title>
		<base href="<%=basePath%>" />
		<script type="text/javascript" src="<%=basePath%>/js/jquery-1.3.2.min.js"></script>
		<style type="text/css">
<!--
a:link {
	color: #4B7013
}

a:visited {
	color: #4B7013
}

body {
	margin-left: 3px;
	margin-top: 0px;
	margin-right: 3px;
	margin-bottom: 0px;
}

.STYLE1 {
	font-size: 12px
}

.STYLE6 {
	color: #000000;
	font-size: 12;
}

.STYLE10 {
	color: #000000;
	font-size: 12px;
}

.STYLE19 {
	color: #344b50;
	font-size: 12px;
}

.STYLE21 {
	font-size: 12px;
	color: #3b6375;
}

.STYLE22 {
	font-size: 12px;
	color: #295568;
}

.right_body {
	padding-left: 5px;
	padding-right: 5px;
}

.right_font {
	font-size: 13px;
	cursor: hand;
}
-->
</style>
<script type="text/javascript" src="<%=basePath%>/js/jquery-1.3.2.min.js"></script>
		<script type="text/javascript">
			function selok(){
				var name = "${imageFileName }";
				if(name.trim()==""){
					$("#image").focus();
					return false;
				}
				opener.document.getElementById("image").value=myform.p.value;
				opener.document.getElementById("image1").src=myform.p.value;
				window.close();
			}
			window.onunload = function() {  
				opener.document.getElementById("page1").value="1";
			}  
		</script>
	</head>

	<body class="right_body">
		<form action="upload/image.action" name="myform" id="myform"
			method="post" enctype="multipart/form-data">
			<div align="center">
				<table width="100%" border="0" cellpadding="0" cellspacing="2"
					bgcolor="#E8F5FD" style="border: 1px solid #0C89A9">
					<tr>
						<td>
							<table width="100%" border="0" cellpadding="0" cellspacing="1"
								bgcolor="#a8c7ce">
								<tr>
									<td height="20" bgcolor="#FFFFFF">
										<div align="center">
											<span class="STYLE1">请选择图片</span>
										</div>
									</td>
									<td height="20" bgcolor="#FFFFFF">
										<div align="center">
											<span class="STYLE1">
											<input type="file" name="image" id="image" width="220px" onchange="imagesub()"/> </span>
										</div>
									</td>
								</tr>
								
								<tr>
									<td width="0" height="20" bgcolor="#FFFFFF" align="center"
										colspan="2">
										<span id="imgspan">${imageFileName }</span>
										<input type="hidden" name="p" value="upfiles/${imageFileName }" id="p">
										<input type="button" value=" 确定 " onclick="selok();" />
									</td>
								</tr>
								<tr>
									<td width="0" height="20" bgcolor="#FFFFFF" align="center" colspan="2" id="td">
										<div>
											<img id="mg"  style="width:165px;height:165px;border:none;">
										</div>
									</td>
								</tr>
							</table>
						</td>
					</tr>
				</table>
			</div>
		</form>
	</body>
<script type="text/javascript">
var img = "${imageFileName }";
if(img){
	$("#td").show();
	document.getElementById("mg").src="upfiles/"+img;
}else{
	$("#td").hide();
}

function imagesub(){
	var fileName = $("#image").val();
	if(/^.*[^a][^b][^c]\.(?:png|jpg|bmp|gif|jpeg|PNG|JPG|BMP|GIF|JPEG)$/.test(fileName)){
		document.getElementById("myform").submit();
	}else{
		alert("文件格式不正确");
		return false;
	}
}
</script>
</html>
