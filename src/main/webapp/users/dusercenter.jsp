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
		<script type="text/javascript">
		function selimage(){
		window.open("<%=basePath%>saveimage.jsp","","toolbar=no,location=no,directories=no,status=no,menubar=no,resizable=yes,copyhistory=no,scrollbars=yes,width=400,height=240,top="+(screen.availHeight-240)/2+",left="+(screen.availWidth-400)/2+"");}
		</script>
	</head>

	<body>
		<jsp:include page="header.jsp"></jsp:include>
		<div class="block box">
			<div class="blank"></div>
			<div id="ur_here">
				当前位置:
				<a href=".">首页</a>
				<code>
					&gt;
				</code>
				用户中心
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
								<span>个人资料</span>
							</h5>
							<div class="blank"></div>
							<form name="formEdit" action="index/dpersonal.action" method="post" onsubmit="return userEdit()"  onkeydown="if(event.keyCode==13)return false;">
								<table width="100%" border="0" cellpadding="1" cellspacing="1" bgcolor="#dddddd">
									<tr style="height:40px;">
										<td width="28%" align="right" bgcolor="#FFFFFF"> 
											用户名：
										</td>
										<td width="76%" align="left" bgcolor="#FFFFFF">
											${sessionScope.users.username }
											<input type="hidden" name="username" style="width: 160px" id="username"
												value="${sessionScope.users.username }" />
											<input type="hidden" name="password" style="width: 160px" id="password"
												value="${sessionScope.users.password }" />
											<input type="hidden" name="status" style="width: 160px" id="status"
												value="${sessionScope.users.status }" />
											<input type="hidden" name="num" style="width: 160px" id="num"
												value="${sessionScope.users.num }" />
											<input type="hidden" name="regdate" style="width: 160px" id="regdate"
												value="${sessionScope.users.regdate }" />
											<input type="hidden" name="driversid" style="width: 160px" id="driversid"
												value="${sessionScope.users.driversid }" />
											<input type="hidden" name="money" style="width: 160px" id="money"
												value="${sessionScope.users.money }" />
											<input type="hidden" name="dcard" style="width: 160px" id="dcard"
												value="${sessionScope.users.dcard }" />
										</td>
										<td bgcolor="#FFFFFF" align="center">
											 	头像:
										</td>
									</tr>  
									<tr style="height:40px;"> 
										<td width="28%" align="right" bgcolor="#FFFFFF">
											姓名：  
										</td> 
										<td width="76%" align="left" bgcolor="#FFFFFF">
											<input name="realname" type="text" size="25" class="inputBg" id="realname"
												value="${sessionScope.users.realname }" />
												<span type="text" id="remark3" style="color: red"></span>
										</td>
										<td rowspan="5" bgcolor="white">
										<!-- ${sessionScope.users.image } images/driver.png -->
											<img border="0" id="image1" src="${sessionScope.users.image }" style="width:200px;height:200px;" onclick="selimage();"/>
										</td>
										<input type="hidden" id="image" name="image" value="${sessionScope.users.image }"/>     
									</tr>
									<tr style="height:40px;">
										<td width="28%" align="right" bgcolor="#FFFFFF">
											性别：
										</td>
										<td width="76%" align="left" bgcolor="#FFFFFF">
											<select name="sex" id="sex">
												<option value="男">
													男
												</option>
												<option value="女">
													女
												</option>
											</select>
										</td>
									</tr>
									<tr style="height:40px;">
										<td width="28%" align="right" bgcolor="#FFFFFF">
											手机号：
										</td>
										<td width="76%" align="left" bgcolor="#FFFFFF">
											<input name="contact" type="text" size="25" class="inputBg" id="contact"
												value="${sessionScope.users.contact }" />
												<span type="text" id="remark5" style="color: red"></span>
										</td>
									</tr>
									<tr style="height:40px;">
										<td width="28%" align="right" bgcolor="#FFFFFF">
											出生日期：
										</td>
										<td width="76%" align="left" bgcolor="#FFFFFF">
											<input name="birthday" type="text" size="25" class="inputBg" id="birthday" readonly="readonly"
												value="${sessionScope.users.birthday }" />
												<span type="text" id="remark4" style="color: red"></span>
										</td>
									</tr>
									<tr style="height:40px;">
										<td width="28%" align="right" bgcolor="#FFFFFF">
											身份证：
										</td>
										<td width="76%" align="left" bgcolor="#FFFFFF">
											<input name="idcard" type="text" size="25" class="inputBg" id="idcard"
												value="${sessionScope.users.idcard }" />
												<span type="text" id="remark6" style="color: red"></span>
										</td>
									</tr>
									<tr style="height:40px;">
										<td width="28%" align="right" bgcolor="#FFFFFF">
											驾照档案编号：
										</td>
										<td width="76%" align="left" bgcolor="#FFFFFF"  colspan="2">
											${sessionScope.users.dcard }
										</td>
									</tr>
									<tr style="height:40px;">
										<td width="28%" align="right" bgcolor="#FFFFFF">
											账户余额：
										</td>
										<td width="76%" align="left" bgcolor="#FFFFFF" colspan="2">
											${sessionScope.users.money }
										</td>
									</tr>
									<tr style="height:40px;">
										<td colspan="3" align="center" bgcolor="#FFFFFF"> 
											<input type="submit" class="bnt_blue_1" style="border: none;" value="保存"  onclick="return saveInfo()"/>
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
</html>
<script type="text/javascript">
laydate.render({
	  elem: '#birthday',
	  max: 0
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

$("#idcard").blur(function(){
	if($("#idcard").val().trim()==""){
		$("#remark6").html("该项为必填项");
		return;
	}else{
		$("#remark6").html(isCardID($("#idcard").val(),$("#birthday").val()));
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
		return "请输入合法的身份证";
	return "";
}

function saveInfo(){
	debugger;
	if($("#realname").val()==""){
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
		$("#remark4").html("该项为必填项");
		return false;
	}else if($("#remark4").html()!=""){
		return false;
	}else if($("#idcard").val().trim()==""){
		$("#idcard").focus();
		$("#idcard").select();
		$("#idcard").html("该项为必填项");
		return false;
	}else if($("#remark6").html()!=""){
		$("#idcard").focus();
		$("#idcard").select();
		return false;
	}
	return true;
}

</script>
