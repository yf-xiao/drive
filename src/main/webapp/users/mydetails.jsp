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

<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div class="block box">
		<div class="blank"></div>
		<div id="ur_here">
			当前位置: <a href=".">首页</a>
			<code> &gt; </code>
			用户中心
			<code> &gt; </code>
			我的预约
		</div>
	</div>
	<div class="blank"></div>

	<div class="blank"></div>
	<div class="block clearfix">

		<div class="AreaL">
			<div class="box">
				<div class="box_1">
					<div class="userCenterBox">
						<jsp:include page="dusermenu.jsp"></jsp:include>
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
							<span>我的预约</span>
						</h5>
						<div class="blank"></div>
						<table width="100%" border="0" cellpadding="5" cellspacing="1"
							bgcolor="#dddddd">
							<tr align="center">
								<td align="center" bgcolor="#FFFFFF">订单号</td>
								<td align="center" bgcolor="#FFFFFF">开始地点</td>
								<td align="center" bgcolor="#FFFFFF">目的地点</td>
								<td align="center" bgcolor="#FFFFFF">下单日期</td>
								<td align="center" bgcolor="#FFFFFF">金额</td>
								<td align="center" bgcolor="#FFFFFF">状态</td>
							</tr>
							<c:forEach items="${ordersList}" var="orders">
								<tr align="center" bgcolor="#FFFFFF">
									<td align="center" bgcolor="#FFFFFF">${orders.ordercode}</td>
									<td align="center" bgcolor="#FFFFFF">${orders.thestart}</td>
									<td align="center" bgcolor="#FFFFFF">${orders.theend}</td>
									<td align="center" bgcolor="#FFFFFF">${orders.addtime}</td>
									<td align="center" bgcolor="#FFFFFF">${orders.money}</td>
									<td align="center" bgcolor="#FFFFFF">${orders.status}</td>
									<td align="center" bgcolor="#FFFFFF">
									</td>
								</tr>
							</c:forEach>
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
