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
<script src="http://libs.baidu.com/jquery/1.9.0/jquery.js"></script>
<script type="text/javascript" src="<%=basePath%>/js/jquery-1.3.2.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/js/jm-qi.js" ></script><!--自定义弹框大小，提示信息，样式，icon。。。。--> 
<link rel="stylesheet" type="text/css" href="<%=basePath%>/css/mbox.css"/>  <!--背景样式 弹框样式-->
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
			可接订单
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
							<span>可接预约</span>
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
									<td align="center" bgcolor="#FFFFFF" id="ordersid">
										<c:if test="${orders.status eq '未接单'}">
											<a href="index/order.action?id=${orders.ordersid}" onclick="return receivOrder(this);">接单</a>
										</c:if>
									</td>
								</tr>
							</c:forEach>
							<tr align="center" bgcolor="#FFFFFF">
								<td colspan=11"><span style="float: right;">${html}</span></td>
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
<script type="text/javascript">
var msg="<%=session.getAttribute("haveOrder")%>";
if(msg!="1"){
	$.mbox({  
	    area: [ "400px", "150px" ], //弹框大小  
	    border: [ 0, .5, "#666" ],  
	    dialog: {  
	        msg: msg,
	        btns: 1,   //1: 只有一个按钮   2：两个按钮  3：没有按钮 提示框
	        type: 0,   //1:对钩   2：问号  3：叹号
	        btn: [ "确认"],  //自定义按钮
	    }  
	});
}

	function receivOrder(e){
		var tr = e.parentNode.parentNode;
		$.mbox({  
	         area: [ "450px", "auto" ], //弹框大小  
	         border: [ 0, .5, "#666" ],  
	         dialog: {  
	        	 msg:"请核对订单信息，是否确认接单？"+"</br>"+
            	     "起点 : "+tr.children[1].innerHTML+"</br>"+
            	     "终点 : "+tr.children[2].innerHTML+"</br>"+
            	     "备注 : "+tr.children[3].innerHTML+"</br>"+
            	     "出发时间  : "+tr.children[4].innerHTML+"</br>",
            	 btns: 2,   //1: 只有一个按钮   2：两个按钮  3：没有按钮 提示框  
	             type: 2,   //1:对钩   2：问号  3：叹号    
	             btn: [ "确定", "取消"],  //自定义按钮  
	             yes: function() {  //点击左侧按钮：成功 
	            	 window.location.href = e.href;
	             },  
	             no: function() { //点击右侧按钮：失败  
	                 return false;  
	             }  
	         }  
		 });
		return false;
		}
</script>
