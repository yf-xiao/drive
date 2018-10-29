<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%><%@ taglib
	prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title></title>
<base href="<%=basePath%>" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="css/four.css" rel="stylesheet" type="text/css" />
</head>
<%
	String message = (String) request.getAttribute("message");
	if (message == null) {
		message = "";
	}
	if (!message.trim().equals("")) {
		out.println("<script language='javascript'>");
		out.println("alert('" + message + "');");
		out.println("</script>");
	}
	request.removeAttribute("message");
%><body>
	<table width="100%" border="0" cellpadding="0" cellspacing="0">
		<tr valign="top">
			<td bgcolor="#FFFFFF"><table width="96%" border="0"
					align="center" cellpadding="4" cellspacing="1" bgcolor="#aec3de">
					<tr align="left" bgcolor="#F2FDFF">
						<td colspan="20" class="optiontitle">代驾司机信息列表</td>
					</tr>
					<tr align="center">
						<td align="center" bgcolor="#ebf0f7">用户名</td>
						<td align="center" bgcolor="#ebf0f7">姓名</td>
						<td align="center" bgcolor="#ebf0f7">性别</td>
						<td align="center" bgcolor="#ebf0f7">出生日期</td>
						<td align="center" bgcolor="#ebf0f7">身份证</td>
						<td align="center" bgcolor="#ebf0f7">驾照档案编号</td>
						<td align="center" bgcolor="#ebf0f7">账户余额</td>
						<td align="center" bgcolor="#ebf0f7">积分</td>
						<td align="center" bgcolor="#ebf0f7">联系方式</td>
						<td align="center" bgcolor="#ebf0f7">状态</td>
						<td align="center" bgcolor="#ebf0f7">注册日期</td>
						<td align="center" bgcolor="#ebf0f7" width="10%">操作</td>
					</tr>
					<c:forEach items="${driversList}" var="drivers">
						<tr align="center" bgcolor="#FFFFFF">
							<td align="center">${drivers.username}</td>
							<td align="center">${drivers.realname}</td>
							<td align="center">${drivers.sex}</td>
							<td align="center">${drivers.birthday}</td>
							<td align="center">${drivers.idcard}</td>
							<td align="center">${drivers.dcard}</td>
							<td align="center">${drivers.money}</td>
							<td align="center">${drivers.num}</td>
							<td align="center">${drivers.contact}</td>
							<td align="center">${drivers.status}</td>
							<td align="center">${drivers.regdate}</td>
							<td align="center">
							<c:if test="${drivers.status eq '锁定'}">
								<a href="drivers/status.action?id=${drivers.driversid}">解锁</a>
							</c:if>
							<c:if test="${drivers.status eq '解锁'}">
								<a href="drivers/status.action?id=${drivers.driversid}">锁定</a>
							</c:if>
								&nbsp;&nbsp;
								<a
								href="drivers/deleteDrivers.action?id=${drivers.driversid}"
								onclick="{if(confirm('确定要删除吗?')){return true;}return false;}">删除</a></td>
						</tr>
					</c:forEach>
					<tr align="right" bgcolor="#ebf0f7">
						<td colspan="20"><span style="float: left; color: red">${map.msg }</span>&nbsp;<span
							style="float: right;">${html}</span></td>
					</tr>
				</table></td>
		</tr>
	</table>
</body>
</html>