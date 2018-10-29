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
			我的接单
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
							<span>我的接单</span>
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
									<td align="center" bgcolor="#FFFFFF" height="30px"><a href="orders/getOrdersByCode.action?code=${orders.ordercode}" title="订单详情" id="code">${orders.ordercode}</a></td>
									<td align="center" bgcolor="#FFFFFF" height="30px">${orders.thestart}</td>
									<td align="center" bgcolor="#FFFFFF" height="30px">${orders.theend}</td>
									<td align="center" bgcolor="#FFFFFF" height="30px">${orders.theremark}</td>
									<td align="center" bgcolor="#FFFFFF" height="30px">${orders.gotime}</td>
									<td align="center" bgcolor="#FFFFFF" height="30px">${orders.addtime}</td>
									<td align="center" bgcolor="#FFFFFF" height="30px">${orders.contact}</td>
									<td align="center" bgcolor="#FFFFFF" height="30px">${orders.money}</td>
									<td align="center" bgcolor="#FFFFFF" height="30px">${orders.status}</td>
									<td align="center" bgcolor="#FFFFFF" height="30px">${orders.tel}</td>
									<td align="center" bgcolor="#FFFFFF">
									<c:choose>
										<c:when test="${orders.status eq '已付款'}">
											<a href="index/drivCcancel.action?id=${orders.ordersid}" onclick="return confirm('是否删除该订单？');" style="width:25px; float:left;">删除</a>
										</c:when>
										<c:when test="${orders.status eq '已评价'}">
											<a href="index/drivCcancel.action?id=${orders.ordersid}" onclick="return confirm('是否删除该订单？');" style="width:25px; float:left;">删除</a>
										</c:when>
										<c:when test="${orders.status eq '已投诉'}">
											<a href="index/drivCcancel.action?id=${orders.ordersid}" onclick="return confirm('是否删除该订单？');" style="width:25px; float:left;">删除</a>
										</c:when>
										<c:when test="${orders.status eq '司机取消'}">
											<a href="index/drivCcancel.action?id=${orders.ordersid}" onclick="return confirm('是否删除该订单？');" style="width:25px; float:left;">删除</a>
										</c:when>
										<c:when test="${orders.status eq '已付款'}">
											<a href="index/drivCcancel.action?id=${orders.ordersid}" onclick="return confirm('是否删除该订单？');" style="width:25px; float:left;">删除</a>
										</c:when>
										<c:when test="${orders.status eq '已接单'}">
											<a href="index/startservel.action?id=${orders.ordersid}" style="width:25px; float:left;">开始服务</a>
										</c:when>
										<c:when test="${orders.money eq 0}">
											<a onclick="return settlement(this);" style="width:25px; float:left;">输入路程</a></br>/</br>
											<a href="index/dcancel.action?id=${orders.ordersid}" onclick="return confirm('是否取消该订单？');" style="width:25px; float:left;">取消</a>
										</c:when>
										<c:when test="${orders.status eq '付款中'}">
										</c:when>
										<c:otherwise>
											<a href="index/settlement.action?id=${orders.ordersid}" style="width:25px; float:left;">结算</a></br>/</br>
											<a onclick="return settlement(this);" style="width:25px; float:left;">重新输入</a>
										</c:otherwise>
									</c:choose>
									<td align="center" bgcolor="#FFFFFF" style="display: none;">${orders.ordersid}</td>
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
<script type="text/javascript">
var ordertime;
var allmoney = 0;
function settlement(e){
	var tr = e.parentNode.parentNode;
	ordertime = tr.children[4].innerHTML;
	  
	$.mbox({  
         area: [ "450px", "auto" ], //弹框大小  
         border: [ 0, .5, "#666" ],  
         dialog: {  
        	 msg:"<span style='float:left;'>请输入总行使路程:</span>"+"<input id='ordermoney' onkeyup='countmoney()' style='width:40px;float:left;'/>"+"<span style='float:left;'>公里</span>"+"</br>"+
        	 	 "<span style='float:left;'>请输入额外费用:</span>"+"<input id='ordermoney1' onkeyup='countmoney()' style='width:40px;float:left;'/>"+"<span  style='float:left;'>元<img src='images/why.png' title='路桥费,停车费等等' style='width:15px;height:15px;'></span>"+"</br>"+
        	 	 "<span>总&nbsp;&nbsp;金&nbsp;&nbsp;额&nbsp;&nbsp;:&nbsp;&nbsp;</span>"+"<input id='allmoney' style='border:0px;font-size:17px;' readonly='readonly' value='0元'>",
        	 btns: 2,   //1: 只有一个按钮   2：两个按钮  3：没有按钮 提示框  
             type: 0,   //1:对钩   2：问号  3：叹号    
             btn: [ "确定", "取消"],  //自定义按钮  
             yes: function() {  //点击左侧按钮：成功
            	 $.ajax({
         			url : "index/countOrderMoney.action",
         			type : "post",//提交的方式
         			data : {
         				ordersid : tr.children[11].innerHTML,
         				money : allmoney
         			},
         			success : function(data) {//回调函数，data是返回的数据
         				history.go(0);javascript:;
					},
	                error: function(err) { 
	                    alert("输出路程计算有误");  
	                }  
         		});
             },  
             no: function() { //点击右侧按钮：失败  
                 return false;  
             }  
         }  
	 });
	return false;
	}
	function countmoney(){
		//( "000" + month ).substr( -2 )
		var distance = $("#ordermoney").val();
		var startPrice = 0;      
		var now = new Date();
		var orderhh = ordertime.slice(11,13);
		/*var orderyear = ordertime.slice(0,4);       
		var ordermonth = ordertime.slice(5,7);
		var orderday = ordertime.slice(8,10);
		var ordermm = ordertime.slice(14,16);
		var orderss = ordertime.slice(17,19);
		var ordert = orderyear+"-"+ordermonth+"-"+orderday+" "+orderhh+":"+ordermm+":"+orderss;   //订单时间
		ordert = ordert.replace(/-/g,"/");
		var orderdate = new Date(ordert);
		var date3=now.getTime()-orderdate.getTime();  //时间差的毫秒数
		//计算出相差天数
		var days=Math.floor(date3/(24*3600*1000));
		//计算出小时数
		var leave1=date3%(24*3600*1000);    //计算天数后剩余的毫秒数
		var hours=Math.floor(leave1/(3600*1000));
		//计算相差分钟数
		var leave2=leave1%(3600*1000);        //计算小时数后剩余的毫秒数
		var minutes=Math.floor(leave2/(60*1000));
		//计算相差秒数
		var leave3=leave2%(60*1000);      //计算分钟数后剩余的毫秒数
		var seconds=Math.round(leave3/1000);
		//alert(" 相差 "+days+"天 "+hours+"小时 "+minutes+" 分钟"+seconds+" 秒")
		
		var time = days+hours+minutes+seconds;
		*/
		
		var reg = "/^([1-9][0-9]*)+(.[0-9]{1,2})?$/";
		if(distance){
			
		}
		
		if(orderhh>=6 && orderhh<22){
			if(distance<=8){
			 	startPrice = 35;
			 }else{
				 startPrice = (35 + 3.5*(parseFloat(distance)-8)).toFixed(2);
			 }
		 }else if(orderhh>=22 && orderhh<23){
			 if(distance<=8){
				 startPrice = 50;
			 }else{
				 startPrice = (50 + 3.5*(parseFloat(distance)-8)).toFixed(2);
			 }
		 }else if(orderhh==23){
			 if(distance<=8){
			 	startPrice = 65;
			 }else{
				 startPrice = (65 + 3.5*(parseFloat(distance)-8)).toFixed(2);
			 }
		 }else if(orderhh>=0 && orderhh<6){
			 if(distance<=8){
			 	startPrice = 85;
			 }else{
				startPrice = (85 + 3.5*(parseFloat(distance)-8)).toFixed(2);
			 }
		 }
		if($("#ordermoney1").val()==""){
			$("#allmoney").val(startPrice*1+"元");
			allmoney = (startPrice*1).toFixed(2);
		}else{
			$("#allmoney").val((startPrice*1+$("#ordermoney1").val()*1).toFixed(2)+"元");
			allmoney = (startPrice*1+$("#ordermoney1").val()*1).toFixed(2);
		}
	}
</script>
