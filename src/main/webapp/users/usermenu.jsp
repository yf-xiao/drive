<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<div class="userMenu">
	
	<a href="index/usercenter.action"><img src="themes/xecmoban_shunfeng/images/u2.gif" />用户信息</a>
	<a href="index/prePwd.action"><img src="themes/xecmoban_shunfeng/images/u3.gif" />修改密码</a>
	<a href="index/preOrder.action"><img src="themes/xecmoban_shunfeng/images/u3.gif" />发布预定</a>
	<a href="index/myOrder.action"><img src="themes/xecmoban_shunfeng/images/u3.gif" />我的订单</a>
	<a href="index/myGrievance.action"><img src="themes/xecmoban_shunfeng/images/u3.gif" />我的投诉</a>
	<a href="index/exit.action" style="background: none; text-align: right; margin-right: 10px;"> 
	<img src="themes/xecmoban_shunfeng/images/bnt_sign.gif" /> </a>
	
</div>