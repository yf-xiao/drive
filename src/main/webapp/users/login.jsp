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
<link rel="stylesheet" type="text/css" href="<%=basePath%>/css/mbox.css"/>  <!--背景样式 弹框样式--> 
<script type="text/javascript" src="<%=basePath%>/js/jm-qi.js" ></script><!--自定义弹框大小，提示信息，样式，icon。。。。--> 
</head>
<style type="text/css">
    .center{text-align: center;}
    .login-page {
      width: 100%;
    } 
    .form {
      position: relative;   
      z-index: 1;  
      background: #FFFFFF; 
      max-width: 360px;
      float:right;
      padding: 45px;  
      margin-right: 100px; 
      margin-top:-75px;
      text-align: center;
      box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
      border-radius: 10px;
    }
    .form input {
      font-family: "Roboto", sans-serif;
      outline: 0;
      background: #f2f2f2;
      width: 100%;
      border: 0;
      margin: 0 0 15px;
      padding: 15px;
      box-sizing: border-box;
      font-size: 14px;
    }
    #status1{
        height:15px;
        width:15px;
    } 
    #status2{
        height:15px;
        width:15px;
        margin-left:80px;
    }
    .form button {
      font-family: "Microsoft YaHei","Roboto", sans-serif;
      text-transform: uppercase;
      outline: 0;
      background: #4CAF50;
      width: 100%;
      border: 0;
      padding: 15px;
      color: #FFFFFF;
      font-size: 14px;
      -webkit-transition: all 0.3 ease;
      transition: all 0.3 ease;
      cursor: pointer;
    }
    #login,#login1{
     font-family: "Microsoft YaHei","Roboto", sans-serif;
      text-transform: uppercase;
      outline: 0;
      background: #4CAF50;
      width: 100%;
      border: 0;
      padding: 15px;
      color: #FFFFFF;
      font-size: 14px;
      -webkit-transition: all 0.3 ease;
      transition: all 0.3 ease;
      cursor: pointer;
    }
    .form button:hover,.form button:active,.form button:focus {
      background: #43A047;
    }
    .form .message {
      margin: 15px 0 0;
      color: #b3b3b3;
      font-size: 12px;
    }
    .form .message a {
      color: #4CAF50;
      text-decoration: none;
    }
    .form .register-form {
      display: none;
    }
    .container {
      position: relative;
      z-index: 1;
      max-width: 300px;
      margin: 0 auto;
    }
    .container:before, .container:after {
      content: "";
      display: block;
      clear: both;
    }
    .container .info {
      margin: 50px auto;
      text-align: center;
    }
    .container .info h1 {
      margin: 0 0 15px;
      padding: 0;
      font-size: 36px;
      font-weight: 300;
      color: #1a1a1a;
    }
    .container .info span {
      color: #4d4d4d;
      font-size: 12px;
    }
    .container .info span a {
      color: #000000;
      text-decoration: none;
    }
    .container .info span .fa {
      color: #EF3B3A;
    }
     body{
       background:url(./images/login.jpg)  no-repeat center center;
       background-size:cover;
       background-attachment:fixed;
       background-color:#CCCCCC;
    }
    .shake_effect{
        -webkit-animation-name: shake;
        animation-name: shake;
        -webkit-animation-duration: 1s;
        animation-duration: 1s;
    }
    @-webkit-keyframes shake {
      from, to {
        -webkit-transform: translate3d(0, 0, 0);
        transform: translate3d(0, 0, 0);
      }

      10%, 30%, 50%, 70%, 90% {
        -webkit-transform: translate3d(-10px, 0, 0);
        transform: translate3d(-10px, 0, 0);
      }

      20%, 40%, 60%, 80% {
        -webkit-transform: translate3d(10px, 0, 0);
        transform: translate3d(10px, 0, 0);
      }
    }

    @keyframes shake {
      from, to {
        -webkit-transform: translate3d(0, 0, 0);
        transform: translate3d(0, 0, 0);
      }

      10%, 30%, 50%, 70%, 90% {
        -webkit-transform: translate3d(-10px, 0, 0);
        transform: translate3d(-10px, 0, 0);
      }

      20%, 40%, 60%, 80% {
        -webkit-transform: translate3d(10px, 0, 0);
        transform: translate3d(10px, 0, 0);
      }
    }
    p.center{
        color: #fff;font-family: "Microsoft YaHei";
    } 
</style>
    <body>
        <div class="header_top logo_wrap clearfix">
            <a href="index.jsp"><img
                src="<%=basePath%>/images/logo.png" style="width:225px;margin-left:75px;margin-top:40px;border-radio:10px;"/> </a>
            <div class="ser_n">
                <div class="search_hot"></div>
                <div class="clearfix"></div>
            </div>
        </div> 
        <div class="htmleaf-container">
    <div id="wrapper" class="login-page">
      <div id="login_form" class="form">
        <form id="form1" class="register-form" action="index/register.action" method="post">
          <input type="text" placeholder="用户名" id="usernamer" name="username"/>
          <span type="text" id="remark1" style="color: red;font-size: 10px"></span>
          <input type="password" placeholder="密码" id="passwordr" name="password"/>
          <span type="text" id="remark2" style="color: red;font-size: 10px"></span>
          <input type="password" placeholder="确认密码" id="password1" name="password1"/>
          <span type="text" id="remark7" style="color: red;font-size: 10px"></span>
          <input type="text" placeholder="姓名" id="realname"  name="realname"/>
          <span type="text" id="remark3" style="color: red;font-size: 10px"></span>
          <input type="text" placeholder="手机号" id="contact"  name="contact"/>
          <span type="text" id="remark5" style="color: red;font-size: 10px"></span>
          <input id="login1" type="button" onclick="register()" value="立即注册"></button>
          <p class="message">已经有了一个账户? <a href="#" onclick=" return false;">立刻登录</a></p>
        </form>
        
        <form class="login-form" action="index/login.action" method="post">
          <input type="text" placeholder="用户名" id="username" name="username"/>
          <input type="password" placeholder="密码" id="password" name="password"/>
          <input type="radio" name="status" id="status1" value="用户" checked="checked"/>用户
          <input type="radio" name="status" id="status2" value="司机"/>司机
          <input id="login" type="submit" value="登　录"></button>
          <span id="remark" type="text" style="color:red"/></span>
          <p class="message">还没有账户? <a href="#" onclick=" return false;">立刻注册</a></p>
        </form>
      </div>
    </div>
</div>


<script type="text/javascript">
$(function (){
    var  id =GetQueryString("id");
    if(id=="reg"){
        $('form').animate({
            height: 'toggle',
            opacity: 'toggle'
        }, 'slow');
    }
});

function GetQueryString(name)
    {
         var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
         var r = window.location.search.substr(1).match(reg);
         if(r!=null)return  unescape(r[2]); return null;
    }

/* 抖动效果
      $("#login_form").removeClass('shake_effect');  
      $("#login_form").addClass('shake_effect')
}*/
var msg="<%=session.getAttribute("loginmsg")%>";
if(window.name == ""){
    $("#remark").hide();
    window.name = "First Entry";
}else{
    $("#remark").html(msg);
    $("#remark").show();
    $.ajax({
        url : "index/setSessionNull.action",
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
$('.message a').click(function () {
    $('form').animate({
        height: 'toggle',
        opacity: 'toggle'
    }, 'slow');c
}); 

$("#usernamer").blur(function() {
    $.ajax({
        url : "text/textUserName.action",
        type : "post",//提交的方式
        dataType : 'json',
        data : {
            username : $(this).val()
        },//提交到服务器的数据，多个值以逗号分割开{account:$(this).val(),...}
        success : function(data) {//回调函数，data是返回的数据
                $("#remark1").html(data.msg);
        },
        error: function(err) {  
            alert("验证用户名出错啦");  
        }  
    });
});

$("#passwordr").blur(function(){
    if($("#passwordr").val().trim()==""){
        $("#remark2").html("该项为必填项");
    }else if(!/^[a-zA-Z]\w{5,17}$/.test($("#passwordr").val())){
        $("#remark2").html("密码以字母开头,长度在6~18之间，只能包含字母、数字和下划线");
    }else{
        $("#remark2").html("");
    }
    if(!$("#password1").val().trim()==""){
        if($("#passwordr").val()!=$("#password1").val()){
            $("#remark7").html("两次密码不一致");
        }else{
            $("#remark7").html("");
        }
    }
});

$("#password1").blur(function(){
    if($("#passwordr").val()!=$("#password1").val()){
        $("#remark7").html("两次密码不一致");
    }else{
        $("#remark7").html("");
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

 

$("#contact").blur(function(){
    if($("#contact").val().trim()==""){
        $("#remark5").html("该项为必填项");
    }else if(!/^(13[0-9]|14[5|7]|15[0|1|2|3|5|6|7|8|9]|18[0|1|2|3|5|6|7|8|9])\d{8}$/.test($("#contact").val())){
        $("#remark5").html("格式不正确");
    }else{
        $("#remark5").html("");
    }
});


$("#password1").blur(function(){
    if($("#passwordr").val()!=$("#password1").val()){
        $("#remark7").html("两次密码不一致");
    }else{
        $("#remark7").html("");
    }
});

function register(){
    if($("#usernamer").val()==""){
        $("#usernamer").focus();
        $("#usernamer").select();
        $("#remark1").html("该项为必填项");
        return false;
    }else if($("#remark1").html()!=""){
        $("#usernamer").focus();
        $("#usernamer").select();
        return false;
    }else if($("#passwordr").val()==""){
        $("#passwordr").focus();
        $("#passwordr").select();
        $("#remark2").html("该项为必填项");
        return false;
    }else if($("#remark2").html()!=""){
        $("#passwordr").focus();
        $("#passwordr").select();
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
    }
    $.mbox({  
        area: [ "450px", "auto" ], //弹框大小  
        border: [ 0, .5, "#666" ],  
        dialog: {  
            msg: "注册成功,请登录",  
            btns: 1,   //1: 只有一个按钮   2：两个按钮  3：没有按钮 提示框  
            type: 1,   //1:对钩   2：问号  3：叹号    
            btn: [ "确定"],  //自定义按钮  
            yes: function() {  //点击左侧按钮：成功   
                document.getElementById("form1").submit();
            },  
            no: function() { //点击右侧按钮：失败  
                return false;  
            }  
        }  
     });
    return false;
}
</script>
</body>
</html>
