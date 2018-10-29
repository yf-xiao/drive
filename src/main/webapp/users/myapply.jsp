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
			当前位置: <a href=".">首页</a>
			<code> &gt; </code>
			用户中心
			<code> &gt; </code>
			我的申请
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
							<span>我的申请</span><div style="float: right;">
							<form action="index/myapply.action" name="myform" method="post">
								<span>检索条件:</span>  
								<select name="cond" style="width: 120px;height:21px;" id="cond">
									<option value="withdrawtoWays">按提现方式查询</option>
									<option value="withdrawtoNum">按提现账号查询</option>
									<option value="money">按金额查询</option>
									<option value="addtime">按日期查询</option>
									<option value="status">按状态查询</option>
								</select>
								<input type="text" id="name" name="name"/>
								<input type="submit" value="检索" />
							</form>
							</div>
						</h5>
						<div class="blank"></div>
						<table width="100%" border="0" cellpadding="5" cellspacing="1"
							bgcolor="#dddddd">
							<tr align="center">
								<td align="center" bgcolor="#FFFFFF">司机</td>
								<td align="center" bgcolor="#FFFFFF">提现方式</td>
								<td align="center" bgcolor="#FFFFFF">体现账号</td>
								<td align="center" bgcolor="#FFFFFF">金额</td>
								<td align="center" bgcolor="#FFFFFF">日期</td>
								<td align="center" bgcolor="#FFFFFF">状态</td>
							</tr>
							<c:forEach items="${applysList}" var="applys">
								<tr align="center" bgcolor="#FFFFFF">
									<td align="center" bgcolor="#FFFFFF">${applys.realname}</td>
									<td align="center" bgcolor="#FFFFFF">${applys.withdrawtoWays}</td>
									<td align="center" bgcolor="#FFFFFF">${applys.withdrawtoNum}</td>
									<td align="center" bgcolor="#FFFFFF">${applys.money}</td>
									<td align="center" bgcolor="#FFFFFF">${applys.addtime}</td>
									<td align="center" bgcolor="#FFFFFF">${applys.status}</td>
								</tr>
							</c:forEach>
							<tr align="center" bgcolor="#FFFFFF">
								<td colspan="9"><span style="float: right;">${html}</span></td>
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
<script type="text/javascript">
var name = "${name}";
var cond = "${cond}";
$("#name").val(name);
$("#cond").val(cond);
</script>
</html>
