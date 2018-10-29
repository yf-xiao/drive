<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<base href="<%=basePath%>" />
		<title>${title }</title>
		<script language="javascript" type="text/javascript" src="<%=basePath%>laydate/laydate.js" charset="utf-8"></script>
		<script type="text/javascript" src="<%=basePath%>/js/jquery-1.3.2.min.js"></script>
	</head>
	<%
		String message = (String) session.getAttribute("msg");
		if (message == null) {
			message = "";
		}
		if (!message.trim().equals("")) {
			out.println("<script language='javascript'>");
			out.println("alert('" + message + "');");
			out.println("</script>");
		}
		session.removeAttribute("msg");
	%>
	<body >
		<jsp:include page="header.jsp"></jsp:include>
		<div class="block box">
			<div class="blank"></div>
			<div id="ur_here">
				当前位置:
				<a href="<%=basePath%>">首页</a>
				<code>
					&gt;
				</code>
				用户注册
			</div>
		</div>
		<div class="blank"></div>
		<div class="block">
			<div class="box">
				<div class="box_1">
					<h3>
						<span style="text-align: center; width: 88%">注册新账号</span>
					</h3> 
					<table width="100%" border="0" cellpadding="0" cellspacing="0">
						<tr valign="top">
							<td bgcolor="#FFFFFF" align="center">
								<form action="index/register.action" method="post" name="myform">
									<table width="80%" border="0" cellpadding="5" cellspacing="1" bgcolor="#dddddd">
										<tr>
											<td width="40%" align="right" bgcolor="#FFFFFF">
												用户名：
											</td>
											<td width="60%" align="left" bgcolor="#FFFFFF">
												<input type="text" name="username" size="25" class="inputBg" id="username" />
												<span type="text" id="remark1" style="color: red"></span>
											</td> 
										</tr> 
										<tr>
											<td width="28%" align="right" bgcolor="#FFFFFF">
												密码：
											</td>
											<td width="76%" align="left" bgcolor="#FFFFFF">
												<input name="password" type="password" size="25" class="inputBg" id="password" />
												<span type="text" id="remark2" style="color: red"></span>
											</td>
										</tr>
										<tr>
											<td width="28%" align="right" bgcolor="#FFFFFF">
												确认密码：
											</td>
											<td width="76%" align="left" bgcolor="#FFFFFF">
												<input name="password1" type="password" size="25" class="inputBg" id="password1" />
												<span type="text" id="remark7" style="color: red"></span>
											</td>
										</tr>
										<tr>
											<td width="28%" align="right" bgcolor="#FFFFFF">
												姓名：
											</td>
											<td width="76%" align="left" bgcolor="#FFFFFF">
												<input name="realname" type="text" size="25" class="inputBg" id="realname" />
												<span type="text" id="remark3" style="color: red"></span>
											</td>
										</tr>
										<tr>
											<td width="28%" align="right" bgcolor="#FFFFFF">
												称谓：
											</td>
											<td width="76%" align="left" bgcolor="#FFFFFF">
												<select name="sex" id="sex" class="inputBg">
													<option value="先生">
														先生
													</option>
													<option value="女士">
														女士
													</option>
												</select>
											</td>
										</tr>
											<tr>
											<td width="28%" align="right" bgcolor="#FFFFFF">
												手机号：
											</td>
											<td width="76%" align="left" bgcolor="#FFFFFF">
												<input name="contact" type="text" size="25" class="inputBg" id="contact" />
												<span type="text" id="remark5" style="color: red"></span>
											</td>
										</tr>
										<tr>
											<td width="28%" align="right" bgcolor="#FFFFFF">
												出生日期：
											</td>
											<td width="76%" align="left" bgcolor="#FFFFFF">
												<input name="birthday" type="text" size="25" class="inputBg" id="birthday" readonly="readonly"
													 />
													<span type="text" id="remark4" style="color: red"></span>
											</td>
										</tr>
										<tr>
											<td width="28%" align="right" bgcolor="#FFFFFF">
												身份证号：
											</td>
											<td width="76%" align="left" bgcolor="#FFFFFF">
												<input name="dcard" type="text" size="25" class="inputBg" id="dcard" />
												<span type="text" id="remark6" style="color: red"></span>
											</td>
										</tr>
										<tr>
											<td colspan="2" align="center" bgcolor="#FFFFFF">
												<input type="submit" class="bnt_blue_1" style="border: none;" value="确认注册" onclick= "return register()"/>
											</td>
										</tr>
									</table>
								</form> 
							</td>
						</tr>
					</table>
				</div>
			</div>
			<div class="blank5"></div>
		</div>


		<jsp:include page="footer.jsp"></jsp:include>
	</body>
</html>
<script type="text/javascript">
		laydate.render({
			  elem: '#birthday',
			  max: 0
			});
		$("#username").blur(function() {
			$.ajax({
				url : "text/textUserName.action",
				type : "post",//提交的方式
				dataType : 'json',
				data : {
					username : $(this).val()
				},//提交到服务器的数据，多个值以逗号分割开{account:$(this).val(),...}
				success : function(data) {//回调函数，data是返回的数据
						$("#remark1").html(data.msg);
				debugger;
				},
                error: function(err) {  
                    alert("验证用户名出错啦");  
                }  
			});
		});

		$("#password").blur(function(){
			if($("#password").val().trim()==""){
				$("#remark2").html("该项为必填项");
			}else if(!/^[a-zA-Z]\w{5,17}$/.test($("#password").val())){
				$("#remark2").html("密码以字母开头,长度在6~18之间，只能包含字母、数字和下划线");
			}else{
				$("#remark2").html("");
			}
			if(!$("#password1").val().trim()==""){
				if($("#password").val()!=$("#password1").val()){
					$("#remark7").html("两次密码不一致");
				}else{
					$("#remark7").html("");
				}
			}
		});
		
		$("#realname").blur(function(){
			if($("#realname").val().trim()==""){
				$("#remark3").html("该项为必填项");
			}else if(!/^([\u4e00-\u9fa5]){2,7}$/.test($("#realname").val())){
				$("#remark3").html("只能是中文，长度为2-7位");
			}else{
				$("#remark3").html("");
			}
		});
		
		$("#birthday").blur(function(){
			if($("#birthday").val().trim()==""){
				$("#remark4").html("该项为必填项");
			}else{
				$("#remark4").html("");
			}
		});
		
		$("#contact").blur(function(){
			if($("#contact").val().trim()==""){
				$("#remark5").html("该项为必填项");
			}else if(!/^(13[0-9]|14[5|7]|15[0|1|2|3|5|6|7|8|9]|18[0|1|2|3|5|6|7|8|9])\d{8}$/.test($("#contact").val())){
				$("#remark5").html("格式不正确");
			}else{
				$("#remark5").html("");
			}
		});
		
		$("#dcard").blur(function(){
			if($("#dcard").val().trim()==""){
				$("#remark6").html("该项为必填项");
				return;
			}else{
				$("#remark6").html(isCardID($("#dcard").val(),$("#birthday").val()));
			}
		});
		var aCity={11:"北京",12:"天津",13:"河北",14:"山西",15:"内蒙古",21:"辽宁",22:"吉林",23:"黑龙江",31:"上海",32:"江苏",33:"浙江",34:"安徽",35:"福建",36:"江西",37:"山东",41:"河南",42:"湖北",43:"湖南",44:"广东",45:"广西",46:"海南",50:"重庆",51:"四川",52:"贵州",53:"云南",54:"西藏",61:"陕西",62:"甘肃",63:"青海",64:"宁夏",65:"新疆",71:"台湾",81:"香港",82:"澳门",91:"国外"};
		function isCardID(sId, birthday) { //验证身份证
			var iSum = 0;
			var info = "";
			if (!/^\d{17}(\d|x)$/i.test(sId)) {
				return "你输入的身份证长度或格式错误";
			}
			var bir = birthday.substring(0, 4) + birthday.substring(5, 7)
					+ birthday.substring(8, 10);
			if (sId.substring(6, 14) != bir) {
				return "身份证与出生日期不符";
			}
			sId = sId.replace(/x$/i, "a");
			if (aCity[parseInt(sId.substr(0, 2))] == null) {
				return "你的身份证地区非法";
			}
			sBirthday = sId.substr(6, 4) + "-" + Number(sId.substr(10, 2)) + "-"
					+ Number(sId.substr(12, 2));
			var d = new Date(sBirthday.replace(/-/g, "/"));
			if (sBirthday != (d.getFullYear() + "-" + (d.getMonth() + 1) + "-" + d
					.getDate()))
				return "身份证上的出生日期非法";
			for ( var i = 17; i >= 0; i--)
				iSum += (Math.pow(2, i) % 11) * parseInt(sId.charAt(17 - i), 11);
			if (iSum % 11 != 1)
				return "你输入的身份证号非法";
			return "";
		}
		
		$("#password1").blur(function(){
			if($("#password").val()!=$("#password1").val()){
				$("#remark7").html("两次密码不一致");
			}else{
				$("#remark7").html("");
			}
		});
		
		function register(){
			if($("#username").val()==""){
				$("#username").focus();
				$("#username").select();
				$("#remark1").html("该项为必填项");
				return false;
			}else if($("#remark1").html()!=""){
				$("#username").focus();
				$("#username").select();
				return false;
			}else if($("#password").val()==""){
				$("#password").focus();
				$("#password").select();
				$("#remark2").html("该项为必填项");
				return false;
			}else if($("#remark2").html()!=""){
				$("#password").focus();
				$("#password").select();
				return false;
			}else if($("#password1").val()==""){
				$("#password1").focus();
				$("#password1").select();
				$("#remar7").html("该项为必填项");
				return false;
			}else if($("#remark7").html()!=""){
				$("#password1").focus();
				$("#password1").select();
				return false;
			}else if($("#realname").val()==""){
				$("#realname").focus();
				$("#realname").select();
				$("#remark3").html("该项为必填项");
				return false;
			}else if($("#remark3").html()!=""){
				$("#realname").focus();
				$("#realname").select();
				return false;
			}else if($("#contact").val()==""){
				$("#contact").focus();
				$("#contact").select();
				$("#remark5").html("该项为必填项");
				return false; 
			}else if($("#remark5").html()!=""){
				$("#contact").focus();
				$("#contact").select();
				return false;
			}else if($("#birthday").val()==""){
				$("#birthday").focus();
				$("#remark4").html("该项为必填项");
				return false;
			}else if($("#remark4").html()!=""){
				$("#birthday").focus();
				return false;
			}else if($("#dcard").val().trim()==""){
				$("#dcard").focus();
				$("#dcard").select();
				return false;
			}else if($("#remark6").html()!=""){
				$("#dcard").focus();
				$("#dcard").select();
				return false;
			}
			return true;
		}
</script>