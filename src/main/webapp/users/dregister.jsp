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
		<link rel="stylesheet" type="text/css" href="<%=basePath%>/css/mbox.css"/>  <!--背景样式 弹框样式--> 
<script type="text/javascript" src="<%=basePath%>/js/jm-qi.js" ></script><!--自定义弹框大小，提示信息，样式，icon。。。。--> 
		<script type="text/javascript">
function selimage(){
window.open("<%=basePath%>saveimage.jsp","","toolbar=no,location=no,directories=no,status=no,menubar=no,resizable=yes,copyhistory=no,scrollbars=yes,width=400,height=240,top="+(screen.availHeight-240)/2+",left="+(screen.availWidth-400)/2+"");}
</script>
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
	<style>
		.apply-warn {
		  height:40px;
		  padding-left: 50px;
		  margin-left:30px;
	  	  background: url(<%=basePath%>/images/apply-notice.png) no-repeat left top;
	  	  font-size: 22px; 
		} 
		.apply-info {
		  height:30px;
		  padding-left: 50px;
		  margin-left:30px;
	  	  background: url(<%=basePath%>/images/apply-info.png) no-repeat left top;
	  	  font-size: 22px;
		} 
		#d1 p{
			margin-left: 50px;
			font-size: 15px;
			height: 30px;
			line-height: 30px;
		}
		.inputB{
			margin-left: 50px;
			margin-top:5px;
			width:450px;
			height: 30px;
			outline: none;
			border-radius:10px;
			border: 1px solid #DBDBDB;	
		} 
		.spann{
			font-size: 15px;
			margin-left: 50px;
		}
		#remark1,#remark2,#remark3,#remark5,#remark4,#remark6,#remark7{
			margin-left: 50px;
			font-size: 8px;
		}
		#sex{
			border-radius: 10px;
			height: 30px;
    		line-height: 30px;
    		background-color: #ffffff;
  			border: 1px solid #cccccc;
  			
		}
		.opt{
			width:220px;
		}
		#subb{ 
			    display: block;
			    width: 438px;
			    margin: 0 auto;
			    border-radius: 3px;
			    font-size: 20px;
			    background: #5CB85C;
			    cursor: pointer;
			    text-align: center;
			    color: #FFF;
			    height:50px;
			    line-height: 50px;
		}
	</style>	
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
				司机加盟
			</div>
		</div>
			<div class="box">
				<div class="box_1">
					<h3>
						<span style="text-align: center; width: 88%">在线报名</span>
					</h3>
					<table width="100%" border="0" cellpadding="0" cellspacing="0">
						<tr valign="top">
							<td bgcolor="#FFFFFF" align="center">
								<form action="index/dregister.action" method="post" name="myform" id="myform">
									<table width="80%" border="0" cellpadding="10" cellspacing="0" bgcolor="#dddddd" id="tab">
										<tr>
											<td bgcolor="#FFFFFF" colspan="2">
												<div id="d1">
						                            <h2 class="apply-warn">报名须知：</h2>
						                            <p>1.报名信息必须真实有效，且您的驾龄必须已满5年；</p>
						                            <p>2.确认自愿使用平台信息服务；</p>
						                            <p>3.确认有以下证件：身份证、驾驶证，非本地户口需提供暂住证或居住证；</p>
						                            <p><b>4.当终止提供信息服务时，处理周期为 90 天；</b></p>
						                        </div> 
											</td>
										</tr>
										<tr>
											<td bgcolor="#FFFFFF" colspan="2">
												<h2 class="apply-info">报名信息：</h2>
											</td>
										</tr>
										<tr>
											<td width="50%"  bgcolor="#FFFFFF">
												<span class="spann">用户名：</span>
												<br/>
												<input type="text" name="username" size="25" class="inputB" id="username" />
												<div type="text" id="remark1" style="color: red"></div>
											</td>
											<td width="50%"  bgcolor="#FFFFFF">
												<span class="spann">身份证：</span> 
												<br/>
												<input name="idcard" type="text" size="25" class="inputB" id="idcard" />
												<div type="text" id="remark6" style="color: red"></div>
											</td>
										</tr>
										<tr>
											<td width="50%"  bgcolor="#FFFFFF">
											<span class="spann">密码：</span> 
												<br/>
												<input name="password" type="password" size="25" class="inputB" id="password" />
												<div type="text" id="remark2" style="color: red"></div>
											</td>
											<td width="50%"  bgcolor="#FFFFFF">
											<span class="spann">确认密码：</span> 
												<br/>
												<input name="password1" type="password" size="25" class="inputB" id="password1" />
												<div type="text" id="remark7" style="color: red"></div>
											</td>
										</tr>
										<tr>
											<td width="50%"  bgcolor="#FFFFFF">
											<span class="spann">姓名：</span> 
												<br/>
												<input name="realname" type="text" size="25" class="inputB" id="realname" />
												<div type="text" id="remark3" style="color: red"></div>
											</td>
											<td width="50%"  bgcolor="#FFFFFF">
											<span class="spann">性别：</span> 
												<br/>
												<select name="sex" id="sex" style="margin-left: 50px;width:225px;">
													<option value="男" class="opt">
														男
													</option>
													<option value="女" class="opt">
														女
													</option>
												</select>
											</td>
										</tr>
										<tr>
											<td width="50%"  bgcolor="#FFFFFF">
											<span class="spann">驾照档案编号：</span> 
												<br/>
												<input name="dcard" type="text" size="25" class="inputB" id="dcard" />
												<div type="text" id="remark4" style="color: red"></div>
											</td>
											<td width="50%"  bgcolor="#FFFFFF">
											<span class="spann">手机号：</span> 
												<br/>
												<input name="contact" type="text" size="25" class="inputB" id="contact" />
												<div type="text" id="remark5" style="color: red"></div>
											</td>
										</tr>
										<tr>
											<td colspan="2" align="center" bgcolor="#FFFFFF">
												<input type="button" id="subb" onclick="reg()" style="border: none;" value="申请加盟" />
											</td>
										</tr>
									</table>
								</form>
							</td>
						</tr>
					</table>
				</div>
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
			url : "text/textDriversName.action",
			type : "post",//提交的方式
			dataType : 'json',
			data : {
				username : $("#username").val()
			},//提交到服务器的数据，多个值以逗号分割开{account:$(this).val(),...}
			success : function(data) {//回调函数，data是返回的数据
				$("#remark1").html(data.msg);
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
	
	$("#password1").blur(function(){
		if($("#password").val()!=$("#password1").val()){
			$("#remark7").html("两次密码不一致");
		}else{
			$("#remark7").html("");
		}
	});
	$("#realname").blur(function(){
		if($("#realname").val().trim()==""){
			$("#remark3").html("请输入正确的姓名");
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
			$("#remark5").html("请输入正确的手机号");
		}else if(!/^(13[0-9]|14[5|7]|15[0|1|2|3|5|6|7|8|9]|18[0|1|2|3|5|6|7|8|9])\d{8}$/.test($("#contact").val())){
			$("#remark5").html("格式不正确");
		}else{
			$("#remark5").html("");
		}
	});
	
	$("#idcard").blur(function(){
		if($("#idcard").val().trim()==""){
			$("#remark6").html("请输入正确的身份证号");
			return;
		}else{
			$("#remark6").html(isCardID($("#idcard").val()));
		}
	});
	
	$("#dcard").blur(function(){
		if($("#dcard").val().trim()==""){
			$("#remark4").html("请输入正确的驾驶档案编号");
			return;
		}else if(!/^[0-9]*$/.test($("#dcard").val())){
			$("#remark4").html("请输入正确的驾驶档案编号");
		}else{
			$("#remark4").html("");
		}
	});
	var aCity={11:"北京",12:"天津",13:"河北",14:"山西",15:"内蒙古",21:"辽宁",22:"吉林",23:"黑龙江",31:"上海",32:"江苏",33:"浙江",34:"安徽",35:"福建",36:"江西",37:"山东",41:"河南",42:"湖北",43:"湖南",44:"广东",45:"广西",46:"海南",50:"重庆",51:"四川",52:"贵州",53:"云南",54:"西藏",61:"陕西",62:"甘肃",63:"青海",64:"宁夏",65:"新疆",71:"台湾",81:"香港",82:"澳门",91:"国外"};
	function isCardID(sId, birthday) { //验证身份证
		var iSum = 0;
		var info = "";
		if (!/^\d{17}(\d|x)$/i.test(sId)) {
			return "你输入的身份证长度或格式错误";
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
	
	function reg(){
		$.ajax({
			url : "text/textDriversName.action",
			type : "post",//提交的方式
			dataType : 'json',
			data : {
				username : $("#username").val()
			},//提交到服务器的数据，多个值以逗号分割开{account:$(this).val(),...}
			success : function(data) {//回调函数，data是返回的数据
				$("#remark1").html(data.msg);
			},
	        error: function(err) {  
	            alert("验证用户名出错啦");  
	        }  
		});
		if($("#username").val()==""){
			$("#username").focus();
			$("#username").select();
			$("#remark1").html("该项为必填项");
			return false;
		}else if($("#remark1").html()!=""){
			$("#username").focus();
			$("#username").select();
			return false;
		}else if($("#idcard").val().trim()==""){
			$("#idcard").focus();
			$("#idcard").select();
			$("#remark6").html("该项为必填项")
			return false;
		}else if($("#remark6").html()!=""){
			$("#idcard").focus();
			$("#idcard").select();
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
		}else if($("#dcard").val().trim()==""){
			$("#dcard").focus();
			$("#dcard").select();
			$("#remark4").html("该项为必填项")
			return false;
		}else if($("#remark4").html()!=""){
			$("#dcard").focus();
			$("#dcard").select();
			return false;
		}
		$.mbox({  
	         area: [ "1200px", "550px" ], //弹框大小  
	         border: [ 0, .5, "#666" ],  
	         dialog: {  
	             msg: "<div style='width:1100px;margin-top:-30px;'><p style='text-align:left;font-size:15px;'>【特别提示】</p>"+
	             "<div style='font-size:14px;text-align:left;'>您在点击同意协议前，应当认真阅读以下协议。当您点击同意后，即表示您已充分阅读、理解并接受协议的全部内容。如您因平台信息服务与平台发生争议的，适用《用户使用规则》、《信息服务协议》处理。如您在使用平台服务过程中与代驾服务使用方用户发生争议的，依您与其达成的《代驾服务协议》以及《用户使用规则》处理。"+
	             "</div><br/>"+
	             "<div style='font-size:14px;text-align:left;'>阅读协议的过程中，请您务必充分理解协议中相关条款内容，其中包括：</div>"+
	             "<div style='font-size:14px;text-align:left;'>1、与您约定免除或限制责任的条款;</div><div style='font-size:14px;text-align:left;'>2、与您约定法律适用和管辖的条款;</div><div style='font-size:14px;text-align:left;'>3、其他有关权利义务的重要条款。;</div><br/>"+
	             "<div style='font-size:14px;text-align:left;'>如果您不同意相关协议或其中任何条款约定，您应立即停止报名及使用。</div>"+
	             "<a href='users/userrule.jsp' target='blank' style='font-size:14px;text-align:left;color:#0088CF;'>《酒后代驾预约平台用户使用规则》</a><br/>"+
	             "<a href='users/useragreement.jsp' target='blank' style='font-size:14px;text-align:left;color:#0088CF;'>《代驾服务协议》</a><br/>"+
	             "<a href='users/agreement.jsp' target='blank' style='font-size:14px;text-align:left;color:#0088CF;'>《信息服务协议》</a><br/>"+
	             "</div>",  
	             btns: 2,   //1: 只有一个按钮   2：两个按钮  3：没有按钮 提示框  
	             type: 0,   //1:对钩   2：问号  3：叹号    
	             btn: [ "确认报名", "取消"],  //自定义按钮  
	             yes: function() {  //点击左侧按钮：成功   
	        		  document.getElementById("myform").submit();
	             },  
	             no: function() { //点击右侧按钮：失败  
	                 return false;  
	             }  
	         }  
		 });
		return false;
	}
</script>