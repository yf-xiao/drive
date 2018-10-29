<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
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
				当前位置:
				<a href="<%=basePath%>">首页</a>
				<code>
					&gt;
				</code>
				修改密码
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
						<div class="userCenterBox boxCenterList clearfix" style="_height: 1%;">
							<h5>
								<span>修改密码</span>
							</h5>
							<div class="blank"></div>
							<form action="index/editDpwd.action" name="myform" method="post" id="myform">
								<table width="100%" border="0" cellpadding="5" cellspacing="1" bgcolor="#dddddd">
									<tr>
										<td width="28%" align="right" bgcolor="#FFFFFF">
											用户名：
										</td>
										<td width="76%" align="left" bgcolor="#FFFFFF">
											${sessionScope.users.username }
											<input type="hidden" name="username" style="width: 160px" id="username"
												value="${sessionScope.users.username }" />
										</td>
									</tr>
									<tr>
										<td width="28%" align="right" bgcolor="#FFFFFF">
											原密码：
										</td>
										<td width="76%" align="left" bgcolor="#FFFFFF">
											<input name="password" id="password" type="password" size="25" class="inputBg" />
										</td>
									</tr>
									<tr>
										<td width="28%" align="right" bgcolor="#FFFFFF">
											新密码：
										</td>
										<td align="left" bgcolor="#FFFFFF">
											<input name="newpassword" id="newpassword" type="password" size="25" class="inputBg" />
										</td>
									</tr>
									<tr>
										<td width="28%" align="right" bgcolor="#FFFFFF">
											确认密码：
										</td>
										<td align="left" bgcolor="#FFFFFF">
											<input name="repassword" id="repassword" type="password" size="25" class="inputBg" />
										</td>
									</tr>
									<tr>
										<td colspan="2" align="center" bgcolor="#FFFFFF">
											<span id="remark" style="color:red;">${msg }</span>
										</td>
									</tr>
									<tr>
										<td colspan="2" align="center" bgcolor="#FFFFFF">
											<input type="button" class="bnt_blue_1" style="border: none;" value="确认修改" onclick="sureModify()"/>
										</td>
									</tr>
								</table>
							</form>

						</div>
					</div>
				</div>
			</div>

		</div>
		<div class="blank"></div>
		<jsp:include page="footer.jsp"></jsp:include>
	</body>
	<script type="text/javascript">
	var tt = "${tt}";
	if(tt!="a"){
		$.ajax({
			url : "index/setSessionNull1.action",
			type : "post",//提交的方式
			dataType : 'text',
			data : {
				msg : $("#remark").html()
			},
			success : function(data) {//回调函数，data是返回的数据
			},
	        error: function(err) {  
	            alert(err);  
	        }  
		});
	}
	function sureModify(){
		if(!/^[a-zA-Z]\w{5,17}$/.test($("#password").val())){
			$("#remark").html("原密码以字母开头,长度在6~18之间，只能包含字母、数字和下划线");
		}else if(!/^[a-zA-Z]\w{5,17}$/.test($("#newpassword").val())){
			$("#remark").html("新密码以字母开头,长度在6~18之间，只能包含字母、数字和下划线");
		}else if($("#repassword").val()!=$("#newpassword").val()){
			$("#remark").html("新密码与确认密码不相同");
		}else if($("#newpassword").val()==$("#password").val()){
			$("#remark").html("新密码不能与原密码相同");
		}else{
			$("#remark").html("");
			document.getElementById("myform").submit();
		}
	}
	</script>
</html>
