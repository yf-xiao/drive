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
<link href="css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=basePath%>/js/jquery-1.3.2.min.js"></script>
</head>

<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div class="block box">
		<div class="blank"></div>
		<div id="ur_here">
			当前位置: <a href=".">首页</a>
			<code> &gt; </code>
			<a href="index/all.action">全部司机</a>
			<code> &gt; </code>
			${drivers.realname}
		</div>
	</div>
	<div class="blank"></div>
	<div class="block clearfix">
		<div class="AreaL">
			<div class="box" id='history_div'>
				<div class="box_1">
					<h3>
						<span>优秀司机</span>
					</h3>
					<div class="boxCenterList clearfix" id='history_list'>
						<c:forEach items="${recommendList}" var="drivers">
							<ul class="clearfix">
								<li class="goodsimg"><a
									href="index/detail.action?id=${drivers.driversid }"
									target="_blank"><img src="${drivers.image }"
										alt="${drivers.realname }" class="B_blue" /> </a></li>
								<li><a href="index/detail.action?id=${drivers.driversid }"
									target="_blank" title="${drivers.realname }">${drivers.realname }</a>
								</li>
							</ul>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
		<div class="AreaR">
			<div id="goodsInfo" class="clearfix">
				<div class="imgInfo" style="width:28%;">
					<img src="${drivers.image}" alt="${drivers.realname }"
						width="230px;" height="230px"/>
					<div class="blank5"></div> 
					<div class="blank"></div>
				</div>
				<div class="textInfo" style="width:68%"> 
					<h1 class="clearfix">${drivers.realname }</h1>
					<ul class="ul2 clearfix">
						<li class="clearfix" style="width: 100%">
							<dd>
								<strong>性别：</strong>${drivers.sex}
							</dd>
						</li>
						<li class="clearfix" style="width: 100%">
							<dd>
								<strong>出生日期：</strong>${drivers.birthday}
							</dd>
						</li>
						<li class="clearfix" style="width: 100%">
							<dd>
								<strong>联系方式：</strong>${drivers.contact}
							</dd>
						</li>
						<li class="clearfix" style="width: 100%">
							<dd>
								<strong>积分：</strong>${drivers.num}
							</dd>
						</li>
						<li class="clearfix" style="width: 100%">
							<dd>
								<strong>完成订单量：</strong>${count}
							</dd>
						</li>
						<li class="clearfix" style="width: 100%">
							<dd>
								<strong>好评率：</strong><strong id="num"></strong>
							</dd>
						</li>
					</ul>
				</div>
			</div>
			<div class="blank"></div>
			<div id="ECS_COMMENT">
				<div class="box">
					<div class="box_1">
						<h3>
							<span class="text">用户评论</span>
						</h3>
						<div class="boxCenterList clearfix" style="height: 1%;">
							<ul class="comments">
								<c:forEach items="${topicList }" var="topic">
									<li class="word"><font class="f2">${topic.username }</font>
										<font class="f3">(${topic.addtime }) </font> <br /> <img
										src="themes/xecmoban_shunfeng/images/stars${topic.num }.gif" />
										<p>${topic.contents }</p></li>
								</c:forEach> 
							</ul>
							<div class="blank5"></div>
						<span style="float:right;">${html}</span>
						</div>
					</div>
				</div>
				<div class="blank5"></div>
			</div>
		</div>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
<script type="text/javascript">
var num = "${drivers.num }";
var count = "${count}";
var count5 = count*5;
$("#num").html(((num/count5)*100).toFixed(2)+"%");
</script>
</html>
