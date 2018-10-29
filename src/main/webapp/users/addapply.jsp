<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<base href="<%=basePath%>" />
		<title>${title }</title>
		<script type="text/javascript" src="<%=basePath%>/js/jquery-1.3.2.min.js"></script>
		<link rel="stylesheet" type="text/css" href="<%=basePath%>/css/mbox.css"/>  <!--背景样式 弹框样式--> 
<script type="text/javascript" src="<%=basePath%>/js/jm-qi.js" ></script><!--自定义弹框大小，提示信息，样式，icon。。。。-->
	</head>

	<body>
		<jsp:include page="header.jsp"></jsp:include>
		<div class="block box">
			<div class="blank"></div>
			<div id="ur_here">
				当前位置:
				<a href="<%=basePath%>">首页</a>
				<code>
					&gt;
				</code>
				申请提现
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
						<div class="userCenterBox boxCenterList clearfix" style="_height: 1%;">

							<h5>
								<span>申请提现</span>
							</h5>
							<div class="blank"></div>
							<form action="index/addapply.action" name="myform" method="post" id="myform" onkeydown="if(event.keyCode==13)return false;">
								<table width="100%" border="0" cellpadding="5" cellspacing="1" bgcolor="#dddddd">
									<tr>
										<td width="14%" align="right" bgcolor="#FFFFFF">
											余额：
										</td>
										<td width="38%" align="left" bgcolor="#FFFFFF">
											<span id="selfmoney" style="border: 0px;" class="inputBg">${money }</span>
										</td>
									</tr>
									<tr>
										<td width="14%" align="right" bgcolor="#FFFFFF">
											提现方式：
										</td>
										<td width="38%" align="left" bgcolor="#FFFFFF">
											<select id="withdrawtoWays" name="withdrawtoWays">
												<option value="支付宝">支付宝</option>
												<option value="微信">微信</option>
											</select>
										</td>
									</tr>
									<tr>
										<td width="14%" align="right" bgcolor="#FFFFFF">
											提现账号：
										</td>
										<td width="38%" align="left" bgcolor="#FFFFFF">
											<input id="withdrawtoNum" name="withdrawtoNum" type="text" size="25" class="inputBg" placeholder="请输入提现账号"/>
											<span style="color:red;" id="remarknum"></span>
										</td>
									</tr>
									<tr>
										<td width="14%" align="right" bgcolor="#FFFFFF">
											申请提现金额：
										</td>
										<td width="38%" align="left" bgcolor="#FFFFFF">
											<input name="money" id="money" type="text" size="25" class="inputBg" placeholder="提现金额只能是50的整数倍" />
											<span style="color:red;" id="remark"></span>
										</td>
									</tr>
									<tr>
										<td colspan="4" align="center" bgcolor="#FFFFFF">
											<input type="button" id="" class="bnt_blue_1" style="border: none;" onclick="subapp()" value="申请" />
										</td>
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
	<script type="text/javascript">
	function subapp(){
		var money = $("#money").val();
		if(!/^([1-9][0-9]*)$/.test(money)){
			$("#remark").html("金额只能为50的整数倍");
		}else{
			if(money%50!=0){
				$("#remark").html("金额只能为50的整数倍");
				$("#money").focus();
			}else{
				if(parseFloat($("#selfmoney").html())>parseFloat(money)){
					if($("#withdrawtoWays").val()=="支付宝"){
						if(/^(13[0-9]|14[5|7]|15[0|1|2|3|5|6|7|8|9]|18[0|1|2|3|5|6|7|8|9])\d{8}$/.test($("#withdrawtoNum").val())){
							$("#remark").html("");
							$("#remarknum").html("");
							$.mbox({  
						        area: [ "450px", "auto" ], //弹框大小  
						        border: [ 0, .5, "#666" ],  
						        dialog: {  
						            msg: "请确认提现信息<br/>"+
						            	 "提现方式:支付宝<br/>"+
						            	 "支付宝账号:"+$("#withdrawtoNum").val()+"<br/>"+
						            	 "提现金额:"+money+"元",  
						            btns: 2,   //1: 只有一个按钮   2：两个按钮  3：没有按钮 提示框  
						            type: 2,   //1:对钩   2：问号  3：叹号    
						            btn: [ "提现","取消"],  //自定义按钮  
						            yes: function() {  //点击左侧按钮：成功   
						            	alert("申请成功，请等待管理员审核");
						            	document.getElementById("myform").submit();
						            },  
						            no: function() { //点击右侧按钮：失败  
						                return false;  
						            }  
						        }  
							 });
						}else{
							if(/^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/.test($("#withdrawtoNum").val())){
								$("#remark").html("");
								$("#remarknum").html("");
								$.mbox({  
							        area: [ "450px", "auto" ], //弹框大小  
							        border: [ 0, .5, "#666" ],  
							        dialog: {  
							            msg: "请确认提现信息<br/>"+
							            	 "提现方式:支付宝<br/>"+
							            	 "支付宝账号:"+$("#withdrawtoNum").val()+"<br/>"+
							            	 "提现金额:"+money+"元",  
							            btns: 2,   //1: 只有一个按钮   2：两个按钮  3：没有按钮 提示框  
							            type: 2,   //1:对钩   2：问号  3：叹号    
							            btn: [ "确定","取消"],  //自定义按钮  
							            yes: function() {  //点击左侧按钮：成功   
							            	alert("申请成功，请等待管理员审核");
							            	document.getElementById("myform").submit();
							            },  
							            no: function() { //点击右侧按钮：失败  
							                return false;  
							            }  
							        }  
								 });
							}else{
								$("#remarknum").html("账号非法,请检查后重新输入");
								$("#remark").html("");
							}
						}
					}else{
						if(/^[a-zA-Z]{1}[-_a-zA-Z0-9]{5,19}$/.test($("#withdrawtoNum").val())){
							$("#remark").html("");
							$("#remarknum").html("");
							$.mbox({  
						        area: [ "450px", "auto" ], //弹框大小  
						        border: [ 0, .5, "#666" ],  
						        dialog: {  
						            msg: "请确认提现信息<br/>"+
						            	 "提现方式:微信<br/>"+
						            	 "微信账号:"+$("#withdrawtoNum").val()+"<br/>"+
						            	 "提现金额:"+money+"元",  
						            btns: 2,   //1: 只有一个按钮   2：两个按钮  3：没有按钮 提示框  
						            type: 2,   //1:对钩   2：问号  3：叹号    
						            btn: [ "确定","取消"],  //自定义按钮  
						            yes: function() {  //点击左侧按钮：成功   
						            	alert("申请成功，请等待管理员审核");
						            	document.getElementById("myform").submit();
						            },  
						            no: function() { //点击右侧按钮：失败  
						                return false;  
						            }  
						        }  
							 });
						}else{
							$("#remarknum").html("账号非法,请检查后重新输入");
							$("#remark").html("");
						}
					}
				}else{
					$("#remark").html("余额不足");
					$("#money").focus();
				}
			}
		}
	}
	$("#withdrawtoNum").blur(function(){
		if($("#withdrawtoWays").val()=="支付宝"){
			if(/^(13[0-9]|14[5|7]|15[0|1|2|3|5|6|7|8|9]|18[0|1|2|3|5|6|7|8|9])\d{8}$/.test($("#withdrawtoNum").val())){
				$("#remark").html("");
				$("#remarknum").html("");
			}else{
				if(/^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/.test($("#withdrawtoNum").val())){
					$("#remark").html("");
					$("#remarknum").html("");
				}else{
					$("#remarknum").html("账号非法,请检查后重新输入");
					$("#remark").html("");
				}
			}
		}else{
			if(/^[a-zA-Z]{1}[-_a-zA-Z0-9]{5,19}$/.test($("#withdrawtoNum").val())){
				$("#remark").html("");
				$("#remarknum").html("");
			}else{
				$("#remarknum").html("账号非法,请检查后重新输入");
				$("#remark").html("");
			}
		}
	});
	</script>
</html>
