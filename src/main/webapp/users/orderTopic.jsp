<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<script type="text/javascript" src="<%=basePath%>/js/jquery-1.3.2.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/ckeditor/ckeditor.js"></script>
  </head>
  
  <body>	<div class="AreaR">
			<div class="box">
				<div class="box_1">
					<div class="userCenterBox boxCenterList clearfix"
						style="_height: 1%;">
						<div class="blank"></div>
						<form action="" name="myform"
							method="post">
							<table width="100%" border="0" cellpadding="5" cellspacing="1"
								bgcolor="#dddddd">
								<tr> 
									<td width="28%" align="right" bgcolor="#FFFFFF">订单号:</td>
									<td width="76%" align="left" bgcolor="#FFFFFF">
										<input name="theremark" type="text" value="${topic.ordercode }"  readonly="readonly" style="border: 0px"/>
									</td>
							    </tr>
								<tr> 
									<td width="28%" align="right" bgcolor="#FFFFFF">评价内容：</td>
									<td width="76%" align="left" bgcolor="#FFFFFF">
									<textarea id="contents" style="width: 99%; height: 120px" class="ckeditor" disabled="disabled">${topic.contents }</textarea>
							    </tr>
								<tr>
									<td colspan="2" align="center" bgcolor="#FFFFFF"><input
										type="button" style="width:100%;height:30px;" onclick="javascript:window.history.back(-1);"
										value="返回" /></td>
								</tr>
							</table>
						</form>
					</div>
				</div>
			</div>
		</div>

	</div>
  </body>
</html>
