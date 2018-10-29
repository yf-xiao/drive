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

</head>
<style>
#code{
	color:black;
	text-decoration: underline;
}
</style>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div class="block box">
		<div class="blank"></div>
		<div id="ur_here">
			当前位置: <a href=".">首页</a>
			<code> &gt; </code>
			用户中心
			<code> &gt; </code>
			我的投诉
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
							<span>我的投诉</span>
						</h5>
						<div class="blank"></div>
						<table width="100%" border="0" cellpadding="5" cellspacing="1"
							bgcolor="#dddddd">
							<tr align="center">
								<td align="center" bgcolor="#FFFFFF">订单号</td>
								<td align="center" bgcolor="#FFFFFF">内容</td>
								<td align="center" bgcolor="#FFFFFF">日期</td>
								<td align="center" bgcolor="#FFFFFF">处理意见</td>
								<td align="center" bgcolor="#FFFFFF">操作</td>
							</tr>
							<c:forEach items="${grievanceList}" var="grievance">
								<tr align="center" bgcolor="#FFFFFF">
									<td align="center" bgcolor="#FFFFFF"><a href="orders/getOrdersByCode.action?code=${grievance.ordercode} id="code"">${grievance.ordercode}</a></td>
									<td align="center" bgcolor="#FFFFFF">${grievance.contents}</td>
									<td align="center" bgcolor="#FFFFFF">${grievance.addtime}</td>
									<td align="center" bgcolor="#FFFFFF">${grievance.rep}</td>
									<td align="center" bgcolor="#FFFFFF">
										<a href="grievance/deleteGrievanceForUser.action?id=${grievance.grievanceid}" onclick="return confirm('是否删除此订单？')" style="width:25px;">删除</a>
									</td>
								</tr>
							</c:forEach>
							<tr align="center" bgcolor="#FFFFFF">
								<td colspan="9"><span style="float: right;">${html}</span></td>
							</tr>
						</table>
						<div class="blank5"></div>
					</div>
				</div>
			</div>
		</div>

	</div>
	<div class="blank"></div>



	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
