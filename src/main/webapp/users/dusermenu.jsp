<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<div class="userMenu">
	
	<a href="index/dusercenter.action"><img src="themes/xecmoban_shunfeng/images/u2.gif" />用户信息</a>
	<a href="index/preDPwd.action"><img src="themes/xecmoban_shunfeng/images/u3.gif" />修改密码</a>
	<a href="index/showOrders.action"><img src="themes/xecmoban_shunfeng/images/u3.gif" />可接订单</a>
	<a href="index/dorders.action"><img src="themes/xecmoban_shunfeng/images/u3.gif" />我的接单</a>
	<a href="index/preapply.action"><img src="themes/xecmoban_shunfeng/images/u3.gif" />申请提现</a>
	<a href="index/myapply.action"><img src="themes/xecmoban_shunfeng/images/u3.gif" />我的申请</a>
	<a href="index/exit.action" style="background: none; text-align: right; margin-right: 10px;"> 
	<img src="themes/xecmoban_shunfeng/images/bnt_sign.gif" /> </a>
	
</div>
