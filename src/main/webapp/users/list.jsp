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
<script type="text/javascript" src="<%=basePath%>/js/jquery-1.3.2.min.js"></script>
</head>

<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div class="block box">
		<div class="blank"></div>
		<div id="ur_here">
			当前位置: <a href="index.jsp">首页</a>
			<code> &gt; </code>
			司机
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
			<div class="box">
				<div class="box_1">
					<h3>
						<span>司机列表
						</span><div style="float: right;">
							<form action="index/all.action" name="myform" method="post">
								<span>检索条件:</span>
								<select name="cond" style="width: 100px" id="cond">
									<option value="realname">按姓名查询</option>
									<option value="sex">按性别查询</option>
									<option value="contact">按联系方式查询</option>
									<option value="num">按积分查询</option>
								</select>
								<span>关键字</span>
								<input type="text" id="name" name="name"/>
								<input type="submit" value="检索" />
							</form>
						</div>
					</h3>
					<div class="clearfix goodsBox" style="border: none;">
						<c:forEach items="${driversList}" var="drivers">
							<div class="goodsItem" style="padding: 10px 3px 15px 2px;">
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
					<span style="float:right;">${html}</span>
				</div>
			</div>
			<div class="blank5"></div>
		</div>

	</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
<script type="text/javascript">
var name = "${name}";
var cond = "${cond}";
$("#name").val(name);
$("#cond").val(cond);
</script>
</html>
