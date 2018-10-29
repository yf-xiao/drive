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
		<div id="ur_here" style="float: left;">
			当前位置: <a href="<%=basePath%>">首页</a>
			<code> &gt; </code>
			新闻公告
		</div>
		<div style="float: right;">
		<form action="index/article.action" name="myform" method="post">
			<span>检索条件:</span>
			<select name="cond" style="width: 100px" id="cond"><option
										value="title">按标题查询</option>
									<option value="addtime">按发布日期查询</option>
									</select>
			<span>关键字</span>
			<input type="text" id="name" name="name"/>
			<input type="submit" value="检索" />
		</form>
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
			<div>
				<div class="art_cat_box">
					<table width="100%" border="0" cellpadding="5" cellspacing="0">
						<tr>
							<th style="background: #e5e5e5">文章标题</th>
							<th style="background: #e5e5e5">作者</th>
							<th style="background: #e5e5e5">添加日期</th>
						</tr>
						<c:forEach items="${articleList}" var="article">
							<tr>
								<td><a title="${article.title }"
									href="index/read.action?id=${article.articleid }"
									style="text-decoration: none" class="f6">${article.title }</a>
								</td>
								<td align="center">管理员</td>
								<td align="center">${article.addtime }</td>
							</tr>
						</c:forEach>
					</table>
				</div>
				<span style="float:right;">${html}</span>
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
