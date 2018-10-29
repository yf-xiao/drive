<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<link href="themes/xecmoban_shunfeng/style.css" rel="stylesheet"
	type="text/css" />

<div id="Top">
	<div class=" block header_bg">

		<div class="top_nav">
			<div class="block">
				<div class="header_r">
					<c:if test="${sessionScope.userid == null }">
						<font id="ECS_MEMBERZONE"> 欢迎光临本站，
						<a href="index/preLogin.action">[用户登录]</a> &nbsp;
						<a href="index/preLogin.action?id=reg">[用户注册]</a> &nbsp;
						<a href="index/preDReg.action">[司机加盟]</a>
						</font>
					</c:if>

					<c:if test="${sessionScope.userid != null }">
						<c:if test="${sessionScope.driversid != null }">
							<font id="ECS_MEMBERZONE"> ${sessionScope.username },欢迎光临本站
								<a href="index/dusercenter.action">[司机中心]</a>&nbsp;<a
								href="index/exit.action">[退出系统]</a>
							</font>
						</c:if>
						<c:if test="${sessionScope.driversid == null }">
							<font id="ECS_MEMBERZONE"> ${sessionScope.username },欢迎光临本站
								<a href="index/usercenter.action">[用户中心]</a>&nbsp;<a
								href="index/exit.action">[退出系统]</a>
							</font>
						</c:if>
					</c:if>
				</div>
			</div>
		</div>

		<div class="clearfix"></div>
		<div class="header_top logo_wrap clearfix">
			<a class="logo_new" href="index.jsp"><img
				src="<%=basePath%>/images/logo.png" style="width:200px;border-radio:10px;margin-top: 10px"/> </a>
			<div class="ser_n"> 
				<div class="search_hot"></div>
				<div class="clearfix"></div>
			</div>
		</div> 
	</div>
</div>
<div style="clear: both"></div>

<div class="menu_box clearfix">
	<div class="block">
		<div class="menu">
			<a href="index.jsp" class="cur">首页</a> <a href="index/article.action?number=0"
				class="cur">新闻公告</a> <a href="index/all.action?number=0" class="cur">全部司机</a>
		</div>
	</div>
</div>