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
<style type="text/css">
#map {
	height: 288px;
	width: 400px;
	float: left;
}

#map1 {
	height: 288px;
	width: 400px;
	margin-left: 50px;
	float: left;
}
#title{
	font-size:20px;
	float:left;
	text-align:center;
	width:400px;
}

#title1{
	font-size:20px;
	text-align:center; 
	width:500px;
	float:left;
}
.lnglat{
	display: none;
}
</style>
<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script type="text/javascript"
	src="http://api.map.baidu.com/api?v=2.0&ak=FgAaSTHhcGfvIIBpFLjt7mrFgBPe0DNG"></script>
<script src="http://libs.baidu.com/jquery/1.9.0/jquery.js"></script>
<script type="text/javascript" src="<%=basePath%>/js/jquery-1.3.2.min.js"></script>
<link rel="stylesheet" type="text/css" href="<%=basePath%>/css/mbox.css"/>  <!--背景样式 弹框样式--> 
<script type="text/javascript" src="<%=basePath%>/js/jm-qi.js" ></script><!--自定义弹框大小，提示信息，样式，icon。。。。--> 
</head>

<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div class="block box">
		<div class="blank"></div>
		<div id="ur_here">
			当前位置: <a href="<%=basePath%>">首页</a>
			<code> &gt; </code>
			发布预约
		</div>
	</div>
	<div class="blank"></div>

	<div class="blank"></div>
	<div class="block clearfix">

		<div class="AreaL">
			<div class="box">
				<div class="box_1">
					<div class="userCenterBox">
						<jsp:include page="usermenu.jsp"></jsp:include>
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
							<span>发布预约</span>
						</h5>
						<div class="blank"></div>
						<form action="index/addOrder.action" name="myform" id="myform" method="post" >
							<table width="100%" border="0" cellpadding="5" cellspacing="1">
								<tr>
									<td width="15%" align="right" bgcolor="#FFFFFF">联系人：</td>
									<td width="25%" align="left" bgcolor="#FFFFFF">
										<input size="25" type="text" class="inputBg" name="callname" id="callname" readonly="readonly" style="border: 0px"/>
									</td>
									<td width="15%" align="right" bgcolor="#FFFFFF">联系电话：</td>
									<td width="50%" align="left" bgcolor="#FFFFFF">
										<input size="35" type="text" name="contact" value="${sessionScope.users.contact }" class="inputBg" id="contact"/>
									</td>
								</tr>
								<tr>
									<td width="15%" align="right" bgcolor="#FFFFFF">起点：</td>
									<td width="25%" align="left" bgcolor="#FFFFFF">
										<input name="thestart" type="text" size="25" class="inputBg" id="suggestId" placeholder="请输入起点地址"/>
									</td>
									<td width="15%" align="right" bgcolor="#FFFFFF">详细地址：</td>
									<td width="50%" align="left" bgcolor="#FFFFFF">
										<input name="thestart" type="text" size="35" class="inputBg" id="add1" placeholder="可点击地图确定具体定位"/>
									</td>
								</tr>
								<tr>
									<td width="15%" align="right" bgcolor="#FFFFFF">目的地：</td>
									<td width="25%" align="left" bgcolor="#FFFFFF">
										<input name="theend" type="text" size="25" class="inputBg" id="suggestId1" placeholder="请输入目的地地址"/>
									</td>
									<td width="15%" align="right" bgcolor="#FFFFFF">详细地址：</td>
									<td width="50%" align="left" bgcolor="#FFFFFF">
										<input name="theend" type="text" size="35" class="inputBg" id="add2"  placeholder="可点击地图确定具体定位"/>
									</td>
								</tr>
								<tr>
									<td width="15%" align="right" bgcolor="#FFFFFF" colspan="1">出发时间：</td>
									<td width="100%" align="left" bgcolor="#FFFFFF" colspan="3">
										<select name="ordertime" class="inputBg" id="t1" style="width:95px">
										</select>
										<select name="ordertime" class="inputBg" id="t2" style="width:95px">
										</select>
										<select name="ordertime" class="inputBg" id="t3" style="width:95px">
										</select>
									</td>	
								</tr>
								<tr>
									<td width="15%" align="right" bgcolor="#FFFFFF" colspan="1">备注：</td>
									<td width="90%" align="left" bgcolor="#FFFFFF" colspan="3">
										<input name="theremark" type="text"  size="88%" class="inputBg" id="theremark"  placeholder="给司机留言"/>
									</td>  
								</tr>
								<tr>
									<td colspan="2" align="center" bgcolor="#FFFFFF">
										<input type="button" id="sub" class="bnt_blue_1" style="border: none;" value="发布预定" />
									</td>
									<td colspan="2" align="center" bgcolor="#FFFFFF">
										<input type="button"  id="clear" class="bnt_blue_1" style="border: none;" value="清空" onclick="clearMsg()"/>
									</td>
								</tr>
								<div><input type="text" name="thestartlng" id="thestartlng" class="lnglat"/></div>
								<div><input type="text" name="thestartlat" id="thestartlat" class="lnglat"/></div>
								<div><input type="text" name="theendlng" id="theendlng" class="lnglat"/></div>
								<div><input type="text" name="theendlat" id="theendlat" class="lnglat"/></div>
								<div><input type="text" name="gotime" id="gotime" class="lnglat"/></div>
							</table>
							<div id="map"></div>
							<div id="map1"></div>
							<div style="clear: both;"></div>
							<div id="title">起点</div>
							<div id="title1">目的地</div>
							<div id="searchResultPanel" style="border:1px solid #C0C0C0;width:150px;height:auto; display:none;">
							</div>
							<div><img src="images/pricelsit.png" style="display: none;" id="pirceList"/></div>
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
	var name = "${sessionScope.users.realname }";
	$("#callname").val(name.slice(0,1)+"${sessionScope.users.sex }")
	// 百度地图API功能
	function G(id) {
		return document.getElementById(id);
	}
	var myIcon_start = new BMap.Icon("images/Icon_start.png", new BMap.Size(38,104));
	var myIcon_end = new BMap.Icon("images/Icon_end.png", new BMap.Size(38,104));
	
	var map = new BMap.Map("map");
	var point = new BMap.Point(116.404, 39.915);//北京经纬度
	map.centerAndZoom(point, 12); // 初始化地图,设置城市和地图级别。  北京
	map.enableScrollWheelZoom();   //启用滚轮放大缩小，默认禁用
	map.enableContinuousZoom();    //启用地图惯性拖拽，默认禁用
	map.setMapStyle({style:"light"});
	var marker = new BMap.Marker(point,{icon:myIcon_start});// 创建标注
	map.addOverlay(marker); //添加标注
	marker.enableDragging();
    var geolocationControl = new BMap.GeolocationControl();
    geolocationControl.addEventListener("locationSuccess", function(e){
    	map.clearOverlays(); //清除地图上所有覆盖物
		marker.point = e.point;
		map.addOverlay(marker); //添加标注
		marker.enableDragging();
		geoc.getLocation(e.point, function(rs){
			var addComp = rs.addressComponents;
			$("#add1").val(addComp.street + addComp.streetNumber);
			$("#suggestId").val(addComp.province + addComp.city + addComp.district);
		});
    });
    geolocationControl.addEventListener("locationError",function(e){
      // 定位失败事件
      alert(e.message);
    });
    map.addControl(geolocationControl);
    
	var map1 = new BMap.Map("map1");
	map1.centerAndZoom(point, 12); // 初始化地图,设置城市和地图级别。  广州
	map1.enableScrollWheelZoom();   //启用滚轮放大缩小，默认禁用
	map1.enableContinuousZoom();    //启用地图惯性拖拽，默认禁用	
	map1.setMapStyle({style:"light"});
	var marker1 = new BMap.Marker(point,{icon:myIcon_end});// 创建标注
	map1.addOverlay(marker1); //添加标注
	marker1.enableDragging();
	var geolocationControl1 = new BMap.GeolocationControl();
	  geolocationControl1.addEventListener("locationSuccess", function(e){
			map1.clearOverlays(); //清除地图上所有覆盖物
			marker1.point = e.point;
			map1.addOverlay(marker1); //添加标注
			marker1.enableDragging();
			geoc.getLocation(e.point, function(rs){
				var addComp = rs.addressComponents;
				$("#add2").val(addComp.street + addComp.streetNumber);
				$("#suggestId1").val(addComp.province + addComp.city + addComp.district);
			});
	  });
	  geolocationControl1.addEventListener("locationError",function(e){
	    // 定位失败事件
	    alert(e.message);
	  });
	  map1.addControl(geolocationControl1);
	
	    
	$("#thestartlng").val(marker.point.lng);
	$("#thestartlat").val(marker.point.lat);
	$("#theendlng").val(marker1.point.lng);
	$("#theendlat").val(marker1.point.lat);
	 
	var geolocation = new BMap.Geolocation();
	
	/*geolocation.getCurrentPosition(function(r){                  //获取当前地理位置(根据浏览器来定位)
		if(this.getStatus() == BMAP_STATUS_SUCCESS){
			map.centerAndZoom(r.point, 20); // 初始化地图,设置城市和地图级别。  
			map1.centerAndZoom(r.point, 20); // 初始化地图,设置城市和地图级别。 	
		} 
	},{enableHighAccuracy: true});*/
	
	var ac = new BMap.Autocomplete( //建立一个自动完成的对象
	{
		"input" : "suggestId",
		"location" : map
	});	
	var ac1 = new BMap.Autocomplete( //建立一个自动完成的对象
	{
		"input" : "suggestId1",
		"location" : map1
	});

	ac.addEventListener("onhighlight", function(e) { //鼠标放在下拉列表上的事件
		var str = "";
		var _value = e.fromitem.value;
		var value = "";
		if (e.fromitem.index > -1) {
			value = _value.province + _value.city + _value.district
					+ _value.street + _value.business;
		}
		str = "FromItem<br />index = " + e.fromitem.index + "<br />value = "
				+ value;

		value = "";
		if (e.toitem.index > -1) {
			_value = e.toitem.value;
			value = _value.province + _value.city + _value.district
					+ _value.street + _value.business;
		}
		str += "<br />ToItem<br />index = " + e.toitem.index + "<br />value = "
				+ value;
		G("searchResultPanel").innerHTML = str;
	});
	ac1.addEventListener("onhighlight", function(e) { //鼠标放在下拉列表上的事件
		var str = "";
		var _value = e.fromitem.value;
		var value = "";
		if (e.fromitem.index > -1) {
			value = _value.province + _value.city + _value.district
					+ _value.street + _value.business;
		}
		str = "FromItem<br />index = " + e.fromitem.index + "<br />value = "
				+ value;

		value = "";
		if (e.toitem.index > -1) {
			_value = e.toitem.value;
			value = _value.province + _value.city + _value.district
					+ _value.street + _value.business;
		}
		str += "<br />ToItem<br />index = " + e.toitem.index + "<br />value = "
				+ value;
		G("searchResultPanel").innerHTML = str;
	});
	var myValue,myValue1;
	ac.addEventListener("onconfirm", function(e) { //鼠标点击下拉列表后的事件
		var _value = e.item.value;
		myValue = _value.province + _value.city + _value.district
				+ _value.street + _value.business;
		G("searchResultPanel").innerHTML = "onconfirm<br />index = "
				+ e.item.index + "<br />myValue = " + myValue;

		setPlace();
	});
	ac1.addEventListener("onconfirm", function(e) { //鼠标点击下拉列表后的事件
		var _value = e.item.value;
		myValue1 = _value.province + _value.city + _value.district
				+ _value.street + _value.business;
		G("searchResultPanel").innerHTML = "onconfirm<br />index = "
				+ e.item.index + "<br />myValue = " + myValue1;

		setPlace1();
	});
	function setPlace() {
		map.clearOverlays(); //清除地图上所有覆盖物
		function myFun() {
			var pp = local.getResults().getPoi(0).point; //获取第一个智能搜索的结果
			map.centerAndZoom(pp, 18);
			marker.point = pp;
			map.addOverlay(marker); //添加标注
			marker.enableDragging();
			geoc.getLocation(pp, function(rs){
				var addComp = rs.addressComponents;
				$("#add1").val(addComp.street + addComp.streetNumber);
			});
		}
		var local = new BMap.LocalSearch(map, { //智能搜索
			onSearchComplete : myFun
		});
		local.search(myValue);
	}
	
	function setPlace1() {
		map1.clearOverlays(); //清除地图上所有覆盖物
		function myFun() {
			var pp = local1.getResults().getPoi(0).point; //获取第一个智能搜索的结果
			map1.centerAndZoom(pp, 18);
			marker1.point = pp;
			map1.addOverlay(marker1); //添加标注
			marker1.enableDragging();
			geoc.getLocation(pp, function(rs){
				var addComp = rs.addressComponents;
				$("#add2").val(addComp.street + addComp.streetNumber);
			});
		}
		var local1 = new BMap.LocalSearch(map1, { //智能搜索
			onSearchComplete : myFun
		});
		local1.search(myValue1);
	}
	 
	 var geoc = new BMap.Geocoder();  
	 map.addEventListener("click",function(e){
		map.clearOverlays(); //清除地图上所有覆盖物
        var jing_du_value = e.point.lng.toFixed(2);
        var wei_du_value =  e.point.lat.toFixed(2);
        
        marker.point = e.point;
    	map.addOverlay(marker); 
    	marker.enableDragging();
    	
        var pt = e.point;
		geoc.getLocation(pt, function(rs){
			var addComp = rs.addressComponents;
			$("#add1").val(addComp.street + addComp.streetNumber);
		});   
     });
	 marker.addEventListener("dragend",function(e){
		 geoc.getLocation(marker.point, function(rs){
			 var addComp = rs.addressComponents;
	         $("#add1").val(addComp.street + addComp.streetNumber);
		 }); 
	 });
	 
	 var geoc1 = new BMap.Geocoder();  
	 map1.addEventListener("click",function(e){
		map1.clearOverlays(); //清除地图上所有覆盖物
        var jing_du_value = e.point.lng.toFixed(2);
        var wei_du_value =  e.point.lat.toFixed(2);
        
        marker1.point = e.point;// 创建标注
        map1.addOverlay(marker1); 
    	marker1.enableDragging();
    	
        var pt = e.point;
		geoc1.getLocation(pt, function(rs){
			var addComp = rs.addressComponents;
	        $("#add2").val(addComp.street + addComp.streetNumber);
		});   
     });
	 
	 marker1.addEventListener("dragend",function(e){
		 geoc1.getLocation(marker1.point, function(rs){
			 var addComp = rs.addressComponents;
	         $("#add2").val(addComp.street + addComp.streetNumber);
		 }); 
	 });
	 
	 function clearMsg(){
		 $("#add1").val("");
		 $("#add2").val("");
		 $("#suggestId").val("");
		 $("#suggestId1").val("");
		 $("#theremark").val("");
		 $("#contact").val("${sessionScope.users.contact}");
		 /*geolocation.getCurrentPosition(function(r){   //通过浏览器获取目标所在地
				if(this.getStatus() == BMAP_STATUS_SUCCESS){
					map.centerAndZoom(r.point, 15); // 初始化地图,设置城市和地图级别。  北京
					map1.centerAndZoom(r.point, 15); // 初始化地图,设置城市和地图级别。  北京
				} 
			},{enableHighAccuracy: true});*/
		 map.clearOverlays(); //清除地图上所有覆盖物
		 map1.clearOverlays(); //清除地图上所有覆盖物
		 map.centerAndZoom(new BMap.Point(116.404, 39.915), 12); // 初始化地图,设置城市和地图级别。  北京
		 map1.centerAndZoom(new BMap.Point(116.404, 39.915), 12); // 初始化地图,设置城市和地图级别。  北京
		 marker.point = new BMap.Point(116.404, 39.915);
	     map.addOverlay(marker); //添加标注
	     marker.enableDragging();
	     
	     marker1.point = new BMap.Point(116.404, 39.915);
		 map1.addOverlay(marker1); //添加标注
		 marker1.enableDragging();
	 }
	 function testMsg(){
		 var tel = /^(13[0-9]|14[5|7]|15[0|1|2|3|5|6|7|8|9]|18[0|1|2|3|5|6|7|8|9])\d{8}$/;
		 var remark = /^.{0,33}$/;
		 var start = $("#suggestId").val();
		 var end = $("#suggestId1").val();
		 var startDetail = $("#add1").val();
		 var endDetail  = $("#add2").val();
		 $("#thestartlng").val(marker.point.lng);
		 $("#thestartlat").val(marker.point.lat);
		 $("#theendlng").val(marker1.point.lng);
		 $("#theendlat").val(marker1.point.lat);
		 var thestartlng = $("#thestartlng").val();
		 var thestartlat = $("#thestartlat").val();
		 var theendlng = $("#theendlng").val();
		 var theendlat = $("#theendlat").val();
		 if(!tel.test($("#contact").val())){
			 alert("电话格式不对！");
			 return false;
		 }else if(!remark.test($("#theremark").val())){
			 alert("备注不能超过33个字符");
			 return false;
		 }else if(thestartlng.trim()=="" || thestartlat.trim()==""){
			 alert("起点地址有误，请重新输入或在地图上重新选择");
			 return false;
		 }else if(theendlng.trim()=="" ||theendlat.trim()==""){
			 alert("目的地地址有误，请重新输入或在地图上重新选择");
			 return false;
		 }else if(!remark.test(start)){
			 alert("起点地址过长，请检查后重新输入");
			 return false;
		 }else if(!remark.test(end)){
			 alert("目的地地址过长，请检查后重新输入");
			 return false;
		 }else if(!remark.test(startDetail)){
			 alert("起点详细地址过长，请检查后重新输入或在地图上重新选择");
			 return false;
		 }else if(!remark.test(endDetail)){
			 alert("目的地详细地址过长，请检查后重新输入或在地图上重新选择");
			 return false;
		 }
		 if($("#suggestId").val().trim() == "" && $("#add1").val().trim() == ""){
			 $("#suggestId").val("北京市东城区天安门");
			 $("#add1").val("中华路甲10号");
		 }
		 if($("#suggestId1").val().trim() == "" && $("#add2").val().trim() == ""){
			 $("#suggestId1").val("北京市东城区天安门"); 
			 $("#add2").val("中华路甲10号");
		 }
		 return true;
	 }
	 
	 $("#sub").click(function(){
		 if(testMsg()){
			 if((map.getDistance(marker.point,marker1.point)/1000)<0.5){
				 $.mbox({  
			         area: [ "450px", "auto" ], //弹框大小  
			         border: [ 0, .5, "#666" ],  
			         dialog: {  
			             msg: "起点与目的地过于接近，请检查后重新输入！",  
			             btns: 1,   //1: 只有一个按钮   2：两个按钮  3：没有按钮 提示框  
			             type: 3,   //1:对钩   2：问号  3：叹号    
			             btn: [ "确定"],  //自定义按钮  
			         }  
				 });
				 return false;
			 }
			 $("#gotime").val($("#t1").val()+$("#t2").val()+$("#t3").val());
			 var startPrice = 0;
			 var distance  = Math.ceil((map.getDistance(marker.point,marker1.point)/1000));
			 var time = $("#t2").val().slice(0,2);
			 if(time>=6 && time<22){
				 if(distance<=8){
				 	startPrice = 35;
				 }else{
					 startPrice = 35 + 3.5*(distance-8);
				 }
			 }else if(time>=22 && time<23){
				 if(distance<=8){
					 startPrice = 50;
				 }else{
					 startPrice = 50 + 3.5*(distance-8);
				 }
			 }else if(time==23){
				 if(distance<=8){
				 	startPrice = 65;
				 }else{
					 startPrice = 65 + 3.5*(distance-8);
				 }
			 }else if(time>=0 && time<6){
				 if(distance<=8){
				 	startPrice = 85;
				 }else{
					 startPrice = 85 + 3.5*(distance-8);
				 }
			 }
			 $.mbox({  
		         area: [ "450px", "auto" ], //弹框大小  
		         border: [ 0, .5, "#666" ],  
		         dialog: {  
		             msg: "请核对订单信息，是否确认下单？"+"</br>"+
		             	  "起点 : "+$("#suggestId").val().substring(0,33)+";</br>"+$("#add1").val().substring(0,33)+"</br>"+
		             	  "终点 : "+$("#suggestId1").val().substring(0,33)+";</br>"+$("#add2").val().substring(0,33)+"</br>"+
		             	  "备注  : "+$("#theremark").val()+"</br>"+
		             	  "出发时间  : "+$("#gotime").val()+"</br>"+
		             	  "大概距离约为 : "+ distance + "公里"+"</br>"+
		             	  "大概价格约为: "+startPrice+"&nbsp;元&nbsp;&nbsp;&nbsp;"+"<img src='images/why.png' style='width:20px;cursor:pointer;'  title='对价格有疑问？'  onclick=\"whyprice()\"/>",  
		             btns: 2,   //1: 只有一个按钮   2：两个按钮  3：没有按钮 提示框  
		             type: 2,   //1:对钩   2：问号  3：叹号    
		             btn: [ "确定", "取消"],  //自定义按钮  
		             yes: function() {  //点击左侧按钮：成功   
		        		 document.getElementById("myform").submit();
		             },  
		             no: function() { //点击右侧按钮：失败  
		                 return false;  
		             }  
		         }  
			 });
		 }
		 });
	 
	 function whyprice(){
		 $.mbox({  
	         area: [ "850px", "auto" ], //弹框大小  
	         border: [ 0, .5, "#666" ],  
	         dialog: {  
	             msg: "<img src='images/pricelsit.png'/>",  
	             btns: 1,   //1: 只有一个按钮   2：两个按钮  3：没有按钮 提示框  
	             type: 0,   //1:对钩   2：问号  3：叹号    
	             btn: [ "确定"],  //自定义按钮  
	         }  
		 });
	 } 
	 $("#suggestId").blur(function(){
  		if($("#suggestId").val().trim()!=""){
		    map.clearOverlays(); //清除地图上所有覆盖物
		    var pp = $("#suggestId").val(); 
		    map.centerAndZoom(pp, 18);
		    setTimeout(function(){
		    	var pt = map.getBounds().getCenter();
		    	marker.point = new BMap.Point(pt.lng,pt.lat);
		    	map.addOverlay(marker); //添加标注
		    	marker.enableDragging();
		    	geoc.getLocation(marker.point, function(rs){
					var addComp = rs.addressComponents;
					$("#add1").val(addComp.street + addComp.streetNumber);
				});
		    }, 300);
	    }
	 })
	
	$("#suggestId1").blur(function() {
		if ($("#suggestId1").val().trim() != "") {
			map1.clearOverlays(); //清除地图上所有覆盖物
			var pp = $("#suggestId1").val();
			map1.centerAndZoom(pp, 18);
			setTimeout(function() {
				var pt = map1.getBounds().getCenter();
				marker1.point = new BMap.Point(pt.lng, pt.lat);
				map1.addOverlay(marker1); //添加标注
				marker1.enableDragging();
				geoc.getLocation(marker1.point, function(rs) {
					var addComp = rs.addressComponents;
					$("#add2").val(addComp.street + addComp.streetNumber);
				});
			}, 300);
		}
	})
	
	var now = new Date();
	var year = now.getFullYear();       
	var month = now.getMonth() + 1; 
	var hh = now.getHours();
	var day = now.getDate(); 
	var a = new Array();
	var count = 0;
	for(var i=0;i<4;i++){
		var oOption = document.createElement("OPTION");
		$("#t1").append(oOption);
		oOption.value = year+"/"+( "000" + month ).substr( -2 )+"/"+( "000" + day ).substr( -2 )+" ";
		oOption.innerHTML =  ( "000" + month ).substr( -2 ) + "月" +  ( "000" + day ).substr( -2 )+ "号";
		day += 1; 
	}
	for(var j=0;j<24;j++){
		a[j] = count;
		if(a[j]>hh){
			var oOption = document.createElement("OPTION");
			$("#t2").append(oOption);
			oOption.value = a[j] + ":";
			oOption.innerHTML = a[j] + "时";
		}
		count+=1;
	}
	$("#t1").change(function(){
		var oSel = document.getElementById('t2');
	    var oOp = oSel.children;        //获取select列表的所有子元素。
	    for(var i=0,len = oOp.length;i<len;i++)   
	    {
	    	oSel.removeChild(oOp[0]);  //循环删除所有子元素
	    }
		if($("#t1 option:selected").val().trim() == (year+"/"+( "000" + month ).substr( -2 )+"/"+( "000" + now.getDate() ).substr( -2 )).trim()){
			count = 0;
			for(var j=0;j<24;j++){
				a[j] = count;
				if(a[j]>hh){
					var oOption = document.createElement("OPTION");
					$("#t2").append(oOption);
					oOption.value = a[j] + ":";
					oOption.innerHTML = a[j] + "时";
				}
				count+=1;
			}
		}else{
			count=0;
			for(var j=0;j<24;j++){
				a[j] = count;
				var oOption = document.createElement("OPTION");
				$("#t2").append(oOption);
				oOption.value = a[j] + ":";
				oOption.innerHTML = a[j] + "时";
				count+=1;
			}
		}
	});
	$("#t3").append("<option value='00'>"+ "00" + "分" +"</option>");
	$("#t3").append("<option value='15'>"+ 15 + "分" +"</option>");
	$("#t3").append("<option value='30'>"+ 30 + "分" +"</option>");
	$("#t3").append("<option value='45'>"+ 45 + "分" +"</option>");
	$("#gotime").val($("#t1").val()+$("#t2").val()+$("#t3").val());
	 
</script>
