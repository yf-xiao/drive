<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<base href="<%=basePath%>" />
<title>${title }</title>
<script type="text/javascript" src="<%=basePath%>/ckeditor/ckeditor.js"></script>
</head>

<body>
		<jsp:include page="header.jsp"></jsp:include>
		<div class="block box">
			<div class="blank"></div>
			<div id="ur_here">
				当前位置: <a href="<%=basePath%>">首页</a>
				<code> &gt; </code>
				用户投诉
			</div>
		</div>
		<div class="blank"></div>
	
		<div class="blank"></div>
		<div class="block clearfix">
	
			<div class="AreaL">
				<div class="box">
					<div class="box_1">
						<div class="userCenterBox">
							<jsp:include page="usermenu.jsp"></jsp:include>
						</div>
					</div>
				</div>
			</div>
	
	
			<div class="AreaR">
				<div class="box">
					<div class="box_1">
						<div class="userCenterBox boxCenterList clearfix"
							style="_height: 1%;">
	
							<h5>
								<span>用户投诉</span>
							</h5>
							<div class="blank"></div>
							<form action="index/addGrievance.action" name="myform"
								method="post">
								<table width="100%" border="0" cellpadding="5" cellspacing="1"
									bgcolor="#dddddd">
									<tr>
										<td width="28%" align="right" bgcolor="#FFFFFF">投诉内容：</td>
										<td width="76%" align="left" bgcolor="#FFFFFF"><textarea
												name="contents" style="width: 99%; height: 120px" class="ckeditor"></textarea>
											<input name="id" value="${id }" type="hidden" size="25"
											class="inputBg" /></td>
									</tr>
									<tr>
										<td colspan="2" align="center" bgcolor="#FFFFFF"><input
											type="submit" class="bnt_blue_1" style="border: none;"
											value="确认发布" /></td>
									</tr>
								</table>
							</form>
	
						</div>
					</div>
				</div>
			</div>
	
		</div>
		<div class="blank"></div>
		<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
