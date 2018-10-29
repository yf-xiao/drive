<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<title>${title }</title>
</head>

<body style="min-width: 1200px;">
	<jsp:include page="header.jsp"></jsp:include>
	<div class="blank" style="height: 30px;"></div>
	<div class="block clearfix Main">
		<div class="AreaL">
			<div id="mallNews" class="  box_1">
				<h3>
					<span>新闻公告</span>
				</h3>
				<div class="NewsList tc  " style="border-top: none">
					<c:forEach items="${articleList}" var="article">
						<li><a href="index/read.action?id=${article.articleid }">${article.title }</a>
						</li>
					</c:forEach>
				</div>
			</div>
		</div>
		<div class="Arear"></div>
		<div class="goodsBox_1">

			<div class="xm-box">
				<h4 class="title">
					<span>&nbsp;&nbsp;&nbsp;推荐司机</span> <a class="more"
						href="index/all.action">更多</a>
				</h4>
				<div id="show_new_area" class="clearfix">
					<c:forEach items="${recommendList}" var="drivers">
						<div class="goodsItem">
							<a href="index/detail.action?id=${drivers.driversid }"><img
								src="${drivers.image }" alt="${drivers.realname }"
								class="goodsimg" /> </a> <br />
							<p class="f1">
								<a href="index/detail.action?id=${drivers.driversid }"
									title="${drivers.realname }">${drivers.realname }</a>
							</p>
						</div>
					</c:forEach>
				</div>
			</div>
			<div class="blank"></div>
			<div class="xm-box">
				<h4 class="title">
					<span>司机列表</span> <a class="more" href="index/all.action">更多</a>
				</h4>
				<div id="show_hot_area" class="clearfix">
					<!-- 循环开始 -->
					<c:forEach items="${frontList}" var="drivers">
						<div class="goodsItem">
							<a href="index/detail.action?id=${drivers.driversid }"><img
								src="${drivers.image }" alt="${drivers.realname }"
								class="goodsimg" /> </a> <br />
							<p class="f1">
								<a href="index/detail.action?id=${drivers.driversid }"
									title="${drivers.realname }">${drivers.realname }</a>
							</p>
						</div>
					</c:forEach>
				</div>
			</div>
			<div class="blank"></div>
		</div>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
