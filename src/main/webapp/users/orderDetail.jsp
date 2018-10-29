<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
  <base href="<%=basePath%>">
   
   <title>订单详情</title>
   
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">    
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<link rel="stylesheet" type="text/css" href="<%=basePath%>/css/mbox.css"/>  <!--背景样式 弹框样式--> 
<script type="text/javascript"
	src="http://api.map.baidu.com/api?v=2.0&ak=FgAaSTHhcGfvIIBpFLjt7mrFgBPe0DNG"></script>
<script src="http://libs.baidu.com/jquery/1.9.0/jquery.js"></script>
<script type="text/javascript" src="<%=basePath%>/js/jquery-1.3.2.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/js/jm-qi.js" ></script><!--自定义弹框大小，提示信息，样式，icon。。。。--> 
<style type="text/css">
 
#map {
	height: 300px;
	width: 100%;
	float: left;
} 

#map1 {
	height: 300px;
	width: 100%;
	float: left;
} 
 
</style> 
</head>
  <body>
		<div class="blank"></div>
		<form action="" name="myform" id="myform" method="post" >
			<table width="100%" border="0" cellpadding="5" cellspacing="1" bgcolor="#cccccc">
				<tr>
					<td width="100%" align="left" bgcolor="#FFFFFF" colspan="4" style="text-align: center;">
						<input type="text" class="inputBg" value="订单详情" readonly="readonly" style="border: 0px"/>
					</td>
				</tr>
				<tr>
					<td width="20%" align="right" bgcolor="#FFFFFF">
						<input type="text" class="inputBg" readonly="readonly" style="border: 0px; text-align: right;"/>订单号：
					</td>
					<td width="30%" align="left" bgcolor="#FFFFFF" colspan="3">
						<input type="text" class="inputBg" name="ordercode" value="${orders.ordercode }" id="ordercode" readonly="readonly" style="border: 0px"/>
					</td>
				</tr>
				<tr>
					<td width="20%" align="right" bgcolor="#FFFFFF">
					<input class="inputBg" readonly="readonly" style="border: 0px;text-align: right;"/>客户：
					</td>
					<td width="30%" align="left" bgcolor="#FFFFFF" id="callnametd">
						<input type="text" class="inputBg" name="callname" value="${orders.callname }" id="callname" readonly="readonly" style="border: 0px"/>
					</td>
					<td width="20%" align="right" bgcolor="#FFFFFF" id="drivertd"><input class="inputBg" readonly="readonly" style="border: 0px;text-align: right;"/>司机：</td>
					<td width="30%" align="left" bgcolor="#FFFFFF" id="realnametd">
						<input type="text" class="inputBg" name="realname" value="${drivers.realname }" id="realname" readonly="readonly" style="border: 0px"/>
					</td> 
				</tr>  
				<tr>
					<td width="20%" align="right" bgcolor="#FFFFFF">手机号：</td>
					<td width="30%" align="left" bgcolor="#FFFFFF" id="telltd">
						<input type="text" class="inputBg" value="${orders.contact }" id="tell"  readonly="readonly" style="border: 0px"/>
					</td>
					<td width="20%" align="right" bgcolor="#FFFFFF" id="driverteltd">手机号：</td>
					<td width="30%" align="left" bgcolor="#FFFFFF" id="teltd">
						<input type="text" class="inputBg" value="${orders.tel }" id="tel"  readonly="readonly" style="border: 0px"/>
					</td>
				</tr>
				<tr>
					<td width="20%" align="right" bgcolor="#FFFFFF" colspan="1">出发时间：</td>
					<td width="30%" align="left" bgcolor="#FFFFFF" colspan="1" id="gotimetd">
						<input type="text" value="${orders.gotime }" class="inputBg" id="gotime" readonly="readonly" style="border: 0px"/>
					</td>  
					<td width="20%" align="right" bgcolor="#FFFFFF" id="drivernumtd">完成订单量/好评率：</td>
					<td width="30%" align="left" bgcolor="#FFFFFF" id="numtd">
						<input name="num" type="text"  class="inputBg" id="num" readonly="readonly" style="border: 0px"/>
					</td>
				</tr>
				<tr>
					<td width="20%" align="right" bgcolor="#FFFFFF">起点：</td>
					<td width="30%" align="left" bgcolor="#FFFFFF" colspan="3">
						<input name="thestart" type="text" size="80" class="inputBg" value="${orders.thestart }" id="suggestId"  readonly="readonly" style="border: 0px"/>
					</td>
				</tr>
				<tr>
					<td width="20%" align="right" bgcolor="#FFFFFF">目的地：</td>
					<td width="30%" align="left" bgcolor="#FFFFFF" colspan="3">
						<input name="theend" type="text" size="80" class="inputBg" value="${orders.theend }" id="suggestId1"  readonly="readonly" style="border: 0px"/>
					</td>
				</tr>
				<tr>
					<td width="20%" align="right" bgcolor="#FFFFFF" colspan="1">备注：</td>
					<td width="30%" align="left" bgcolor="#FFFFFF" colspan="1" id="tdd">
						<input name="theremark" type="text" value="${orders.theremark }"  readonly="readonly" style="border: 0px"/>
					</td>
					<td width="20%" align="right" bgcolor="#FFFFFF" colspan="1" id="tdd1">订单金额：</td>
					<td width="30%" align="left" bgcolor="#FFFFFF" colspan="1" id="tdd2">
						<input name="theremark" type="text" value="${orders.money }"  readonly="readonly" style="border: 0px"/>
					</td>
				</tr> 
				<tr> 
					<td width="15%" align="right" bgcolor="#FFFFFF" colspan="1">订单状态：</td>
					<td width="30%" align="left" bgcolor="#FFFFFF" colspan="1" id="td1">
						<input type="text" id="status" value="${orders.status }" class="inputBg" readonly="readonly" style="border: 0px"/>
					</td>  
					<td width="30%" align="left" bgcolor="#FFFFFF" colspan="1" id="td2">
						<a href="topic/getTopicByOrdercode.action?ordercode=${orders.ordercode }" style="text-decoration: none; color: #000000;font-size: 13px">查看评价详情</a>
					</td> 
					<td width="30%" align="left" bgcolor="#FFFFFF" colspan="1" id="td3">
						<a href="grievance/getGrievanceByOrdercode.action?ordercode=${orders.ordercode }" style="text-decoration: none; color: #000000;font-size: 13px">查看投诉详情</a>
					</td> 
				</tr> 
	 			<tr>
	 				<td width="50%" align="right" bgcolor="#FFFFFF" colspan="2"><div id="map"></div></td>
	 				<td width="50%" align="right" bgcolor="#FFFFFF" colspan="2"><div id="map1"></div></td>
	 			</tr>
	 			<tr>
	 				<td width="100%" bgcolor="#FFFFFF" colspan="4">
	 					<input type="button" style="width:100%;height:30px;cursor: pointer;" value="返回" onclick="javascript:window.history.back(-1);"/>
	 				</td>
	 			</tr>
			</table>
			<div style="clear: both;"></div>
			<div id="searchResultPanel" style="border:1px solid #C0C0C0;width:150px;height:auto; display:none;">
			</div>
			<div><img src="images/pricelsit.png" style="display: none;" id="pirceList"/></div>
		</form>
  </body>
</html>
<script type="text/javascript">
	function G(id) {
		return document.getElementById(id);
	}
	var myIcon_start = new BMap.Icon("images/Icon_start.png", new BMap.Size(38,104));
	var myIcon_end = new BMap.Icon("images/Icon_end.png", new BMap.Size(38,104));
	var top_left_navigation =  new BMap.NavigationControl({anchor: BMAP_ANCHOR_TOP_LEFT, type: BMAP_NAVIGATION_CONTROL_SMALL});
	var top_left_control = new BMap.ScaleControl({anchor: BMAP_ANCHOR_TOP_LEFT});// 左上角，添加比例尺
	var top_left_navigation1 =  new BMap.NavigationControl({anchor: BMAP_ANCHOR_TOP_LEFT, type: BMAP_NAVIGATION_CONTROL_SMALL});
	var top_left_control1 = new BMap.ScaleControl({anchor: BMAP_ANCHOR_TOP_LEFT});// 左上角，添加比例尺
	
	var map = new BMap.Map("map");
	var point = new BMap.Point("${orders.thestartlng }", "${orders.thestartlat }"); 
	map.centerAndZoom(point, 18); // 初始化地图,设置城市和地图级别。  北京
	map.enableContinuousZoom();    //启用地图惯性拖拽，默认禁用
	map.setMapStyle({style:"light"});
	var marker = new BMap.Marker(point,{icon:myIcon_start});// 创建标注
	map.addOverlay(marker); //添加标注
	map.addControl(top_left_control);        
	map.addControl(top_left_navigation);   
	map.enableScrollWheelZoom();   //启用滚轮放大缩小，默认禁用
	// 定义一个控件类,即function
	function ZoomControl(){
	  // 默认停靠位置和偏移量
	  this.defaultAnchor = BMAP_ANCHOR_TOP_RIGHT;
	  this.defaultOffset = new BMap.Size(10, 10);
	}

	// 通过JavaScript的prototype属性继承于BMap.Control
	ZoomControl.prototype = new BMap.Control();
	ZoomControl.prototype.initialize = function(map){
	  // 创建一个DOM元素
	  var div = document.createElement("text");
	  // 添加文字说明
	  div.appendChild(document.createTextNode("返回起点"));
	  // 设置样式
	  div.style.cursor = "pointer";
	  div.style.border = "1px solid gray";
	  div.style.backgroundColor = "#E8E8E8";
	  div.style.borderRadius = "8px";
	  
	  div.onmouseover = function(){this.style.background="#B1D3DF";}
	  div.onmouseout = function(){this.style.background="#E8E8E8";}
	  
	  div.onclick = function(e){
		  var point = new BMap.Point("${orders.thestartlng }", "${orders.thestartlat }"); 
		  map.centerAndZoom(point, 18);
	  }
	  // 添加DOM元素到地图中
	  map.getContainer().appendChild(div);
	  // 将DOM元素返回
	  return div;
	}
	// 创建控件
	var myZoomCtrl = new ZoomControl();
	// 添加到地图当中
	map.addControl(myZoomCtrl);
	
	
	var point1 = new BMap.Point("${orders.theendlng }", "${orders.theendlat }");
	var map1 = new BMap.Map("map1");
	map1.centerAndZoom(point1, 18); // 初始化地图,设置城市和地图级别。  广州
	map1.enableContinuousZoom();    //启用地图惯性拖拽，默认禁用	
	map1.setMapStyle({style:"light"});
	var marker1 = new BMap.Marker(point1,{icon:myIcon_end});// 创建标注
	map1.addOverlay(marker1); //添加标注
	map1.addControl(top_left_control1);        
	map1.addControl(top_left_navigation1);   
	map1.enableScrollWheelZoom();   //启用滚轮放大缩小，默认禁用
	
	// 定义一个控件类,即function
	function ZoomControl1(){
	  // 默认停靠位置和偏移量
	  this.defaultAnchor = BMAP_ANCHOR_TOP_RIGHT;
	  this.defaultOffset = new BMap.Size(10, 10);
	}

	// 通过JavaScript的prototype属性继承于BMap.Control
	ZoomControl1.prototype = new BMap.Control();
	ZoomControl1.prototype.initialize = function(map){
	  // 创建一个DOM元素
	  var div = document.createElement("text");
	  // 添加文字说明
	  div.appendChild(document.createTextNode("返回终点"));
	  // 设置样式
	  div.style.cursor = "pointer";
	  div.style.border = "1px solid gray";
	  div.style.backgroundColor = "#E8E8E8";
	  div.style.borderRadius = "8px";
	  
	  div.onmouseover = function(){this.style.background="#B1D3DF";}
	  div.onmouseout = function(){this.style.background="#E8E8E8";}
	  
	  div.onclick = function(e){
		  var point = new BMap.Point("${orders.theendlng }", "${orders.theendlat }"); 
		  map1.centerAndZoom(point, 18);
	  }
	  // 添加DOM元素到地图中
	  map1.getContainer().appendChild(div);
	  // 将DOM元素返回
	  return div;
	}
	// 创建控件
	var myZoomCtrl1 = new ZoomControl1();
	// 添加到地图当中
	map1.addControl(myZoomCtrl1);
	
	var num = "${drivers.num }";
	var good = "${orders.driversid}";
	var count = "${count}";
	var count5 = count*5;
	$("#num").val(count+"  /  "+((num/count5)*100).toFixed(2)+"%");
	
	var status = "${orders.status }";
	if(status == "已评价"){
		$("#td2").attr("colSpan",2); 
		$("#td2").show();
		$("#td3").hide();
	}else if(status == "已投诉"){
		$("#td2").show();
		$("#td3").show();
	}else{
		$("#td1").attr("colSpan",3); 
		$("#td2").hide();
		$("#td3").hide();
	}
	var drive = "${drivers.realname }";
	if(drive == ""){
		 $("#callnametd").attr("colSpan",3); 
		 $("#telltd").attr("colSpan",3); 
		 $("#gotimetd").attr("colSpan",3); 
		 $("#realnametd").hide();
		 $("#drivertd").hide();
		 $("#driverteltd").hide();
		 $("#teltd").hide();
		 $("#drivernumtd").hide();
		 $("#numtd").hide();
	}
</script>
