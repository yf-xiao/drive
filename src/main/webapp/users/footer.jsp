<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>


<div class="footer"  style="background:#F1F1F1;">
	<div class="foot_con">
		<div class="blank"></div>

		<div class="blank"></div>
		<div id="bottomNav" class="rolling"></div>

		<div class="text" style="height: 1px; width: 1px; overflow: hidden;">
			<br />
		</div>

		<div class="record">
			&copy; 2018 ${title } 版权所有，并保留所有权利。 常年法律顾问：上海华宏律师事务所
			<p style="color: #999;">
				上海市普陀区中山北路2911号中关村科技大厦2402 Tel: 4000 021 758
			</p>
			<a href="admin/index.jsp" target="_blank">管理员入口</a>
		</div>
	</div>
	<div class="blank"></div>
</div>