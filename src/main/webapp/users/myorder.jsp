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
			我的订单
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
					<div class="userCenterBox boxCenterList clearfix" style="_height: 1%;">
						<h5>
							<span>我的订单</span>
						</h5>
						<div class="blank"></div>
						<table width="100%" border="0" cellpadding="5" cellspacing="1"
							bgcolor="#dddddd">
							<tr align="center"> 
								<td align="center" bgcolor="#FFFFFF" width="10%">订单号</td>
								<td align="center" bgcolor="#FFFFFF" width="20%">开始地点</td>
								<td align="center" bgcolor="#FFFFFF" width="20%">目的地点</td>
								<td align="center" bgcolor="#FFFFFF" width="20%">备注</td>
								<td align="center" bgcolor="#FFFFFF" width="8%">出发时间</td>
								<td align="center" bgcolor="#FFFFFF" width="8%">下单时间</td>
								<td align="center" bgcolor="#FFFFFF" width="10%">联系电话</td>
								<td align="center" bgcolor="#FFFFFF" width="5%">金额</td>
								<td align="center" bgcolor="#FFFFFF" width="8%">状态</td>
								<td align="center" bgcolor="#FFFFFF" width="10%">司机电话</td>
								<td align="center" bgcolor="#FFFFFF" width="5%">操作</td>
							</tr>
							<c:forEach items="${ordersList}" var="orders">
								<tr align="center" bgcolor="#FFFFFF">
									<td align="center" bgcolor="#FFFFFF" height="30px"><a href="orders/getOrdersByCode.action?code=${orders.ordercode}" id="code">${orders.ordercode}</a></td>
									<td align="center" bgcolor="#FFFFFF" height="30px">${orders.thestart}</td>
									<td align="center" bgcolor="#FFFFFF" height="30px">${orders.theend}</td>
									<td align="center" bgcolor="#FFFFFF" height="30px">${orders.theremark}</td>
									<td align="center" bgcolor="#FFFFFF" height="30px">${orders.gotime}</td>
									<td align="center" bgcolor="#FFFFFF" height="30px">${orders.addtime}</td>
									<td align="center" bgcolor="#FFFFFF" height="30px">${orders.contact}</td>
									<td align="center" bgcolor="#FFFFFF" height="30px">${orders.money}</td>
									<td align="center" bgcolor="#FFFFFF" height="30px">${orders.status}</td>
									<td align="center" bgcolor="#FFFFFF" height="30px">${orders.tel}</td>
									<td align="center" bgcolor="#FFFFFF" height="30px">
										<c:if test="${orders.status eq '未接单'}">
											<a href="index/cancel.action?id=${orders.ordersid}" onclick="return confirm('是否取消此订单？')" style="width:25px; float:left;">取消</a>
										</c:if> <c:if test="${orders.status eq '已接单'}">
											<a href="index/cancel.action?id=${orders.ordersid}" onclick="return confirm('是否取消此订单？')" style="width:25px; float:left;">取消</a>
										</c:if> <c:if test="${orders.status eq '服务中'}">
										</c:if> <c:if test="${orders.status eq '付款中'}">
											<a href="index/prePay.action?id=${orders.ordersid}" style="width:25px; float:left;">在线支付</a></br>/</br>
											<a href="index/pays.action?id=${orders.ordersid}" style="width:25px; float:left;">现金支付</a>
										</c:if> <c:if test="${orders.status eq '已付款'}">
											<a href="index/preTopic.action?id=${orders.ordersid}" style="width:25px; float:left;">评价</a></br>/</br>
											<a href="index/cancel.action?id=${orders.ordersid}" onclick="return confirm('是否删除此订单？')" style="width:25px; float:left;">删除</a>
										</c:if> <c:if test="${orders.status eq '已评价'}">
											<a href="index/preGrievance.action?id=${orders.ordersid}" style="width:25px; float:left;">投诉</a></br>/</br>
											<a href="index/cancel.action?id=${orders.ordersid}" onclick="return confirm('是否删除此订单？')" style="width:25px; float:left;">删除</a>
										</c:if><c:if test="${orders.status eq '已投诉'}">
											<a href="index/cancel.action?id=${orders.ordersid}" onclick="return confirm('是否删除此订单？')" style="width:25px; float:left;">删除</a>
										</c:if><c:if test="${orders.status eq '司机取消'}">
											<a href="index/cancel.action?id=${orders.ordersid}" onclick="return confirm('是否删除此订单？')" style="width:25px; float:left;">删除</a>
										</c:if>
									</td>
								</tr>
							</c:forEach>
							<tr align="center" bgcolor="#FFFFFF">
								<td colspan="11"><span style="float: right;">${html}</span></td>
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
