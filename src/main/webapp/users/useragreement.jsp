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
		.ws-bold {
		    font-weight: bold;
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
				代驾服务协议
			</div>
		</div>
		<div style="padding: 60px;width:70%;line-height: 30px;font-size:15px;">
        <h2 style="text-align: center;">代驾服务协议</h2>
        <hr class="line">
        <p>甲方：代驾服务使用方</p>
        <p>乙方：代驾服务提供方</p>

        <p>甲、乙双方均为e代驾信息服务平台用户，通过平台使用或提供代驾服务，均应遵守本协议内容。</p>
        <p class="tit"><span class="ws-bold">一、 甲方权利义务</span></p>
        <p>1.1确定代驾车辆具备上路行驶手续齐全、车况正常（非改装车及部件）、保险有效等适宜代驾的条件，如因甲方隐瞒以上事实带来的纠纷或者损害，由甲方承担。</p>
        <p>1.2有权要求乙方按指定路线行驶，但不得要求乙方超速、逆行等违章驾驶。</p>
        <p>1.3不得利用代驾从事违法犯罪行为，不得运载违禁、易燃易爆等危险物品。</p>
        <p>1.4妥善保管车内及随身财物，如代驾过程中出现遗失，应立即报警。</p>
        <p>1.5按照平台公示标准和本协议约定支付代驾服务费及其他费用。</p>
        <p>1.6有权对乙方的代驾服务在平台上进行客观评价。</p>
        <p class="tit"><span class="ws-bold">二、 乙方权利义务</span></p>
        <p>2.1代驾时身体状况良好，不存在不宜代驾的情况（患病、疲惫、饮酒等）。</p>
        <p>2.2代驾时服饰整洁，举止文明，并穿着平台标识服装、胸牌，便于识别。</p>
        <p>2.3接单后不得擅自将甲方车辆交由他人驾驶。</p>
        <p>2.4遵守交规，爱惜车辆，避免原地打轮、换挡不畅、压线等不良驾驶行为。</p>
        <p>2.5结束代驾服务后检查并关闭所有车门、车窗及用电设备。</p>                 
        <p>2.6按照平台公示标准和本协议约定向甲方展示订单记录的里程和费用，收取代驾服务费及其他费用。</p>
        <p>2.7如遇交通事故，应当立即报警，听从交警部门处理，不得逃离现场。</p>          
        <p class="tit"><span class="ws-bold">三、代驾服务费用</span></p>
        <p>3.1 双方同意以平台订单记录的时间、里程及公示的费用标准为结算依据，并由甲方在车辆到达目的地后，直接支付给乙方，或者授权平台代为支付。</p>
        <p>3.2若甲方对代驾服务费存有异议，仍应先行付款，可在24小时内向平台提出异议并提供相关证据，经核实确定计费错误，则由乙方退还多收取的费用。</p>                 <p>3.3 在代驾服务过程中产生的高速路收费，停车费等其他临时费用均由甲方承担，如因特殊原因乙方先行垫付了上述款项，则甲方应及时返还乙方。 </p>
        <p class="tit"><span class="ws-bold">四、交通事故处理</span></p>
        <p>4.1代驾过程中发生交通事故，双方应当根据交警部门的事故认定确定责任。甲方有义务督导乙方在代驾服务订单结束之前在事故现场向乙方客服报案。因车辆本身安全性能问题或者甲方不当阻碍、扰乱车辆安全行驶等发生事故由甲方承担责任。经认定属于乙方过错的，由乙方承担相应责任；非乙方过错的乙方不承担责任；属第三方过错的，由甲方直接要求该第三方承担责任。</p>
        <p>4.2任何一方原因造成交通事故，应首先使用甲方车辆的交强险、第三者责任险或者其他保险对相关人身、财产损失进行赔偿，不足部分，由责任方根据交警部门认定的责任范围负责赔偿。若乙方负有事故责任，造成甲方人员、车辆受损的，对于超出保险赔偿部分应以人身、财产直接损失为限，对于车辆贬值及其他间接损失不负责赔偿。根据公平原则，为避免将乙方置于不可承担的风险之中，甲方不得授权保险公司向乙方进行追偿或转让追偿权利。</p>
        <p>4.3任何一方原因造成交通事故，甲方受损车辆建议选择由乙方投保的代驾责任险承保保险公司认证的维修机构维修车辆，不建议甲方自行选择维修机构。如甲方应特殊原因自行选择维修机构的，乙方默认甲方使用自身车险赔付，乙方只能按照甲方当年车险保费上浮金额进行补偿性赔偿。</p>
        <p>4.4甲、乙任何一方因违反交通法规或其他法律规定而受到国家有关部门处罚或处理的，由责任方自行承担。</p>
        <p>4.5甲方明确除外责任包括：<br>
   1）暴雨、冰雹等自然灾害至甲方车辆受损的。<br>
   2）非真实性、服务订单结束后报案的。<br>
   3）甲方车辆行驶证过期、交强险过期、机动车未进行年检的。<br>
   4）甲方车内出现的物品丢失、贵重物品的损坏。<br>
   5）路边飞石等类意外非责任事故。<br>
   6）甲方车辆的玻璃单独破碎，轮胎轮毂单独损坏。<br>
   7）乙方委托的保险公司确定的维修金额之外的费用。<br>
   8）甲方在乙方委托的保险公司确定维修项目及金额前擅自修车，致使乙方委托的保险公司无法确定损失情况，最终导致无法赔付的。<br>
   如出现以上免责情况 赔偿责任应由导致此后果的责任方自行承担。</p>
        <p>4.6对于出现争议的交通事故乙方有权保留对此事故处理的意见。</p>
        <p class="tit"><span class="ws-bold">五、违约责任</span></p>
        <p>5.1 甲方要求或迫使乙方中途停止代驾服务的（包括但不限于对代驾服务费有异议、对乙方服务不满、醉酒等原因），甲方仍须据实向乙方支付代驾服务费。乙方停止代驾后的全部后果由甲方承担。</p>
        <p>5.2乙方对行驶路线选择明显错误，或者故意绕行增加代驾服务费用的，乙方应按照合理里程计价收取代驾费用，应将多收费用退还甲方。</p>
        <p class="tit"><span class="ws-bold">六、特别约定</span></p>
        <p class="ws-bold">各方确认并知悉，平台仅为向甲乙双方提供代驾信息服务、促成双方签订本协议的中间人，并不实际提供也不代理任何一方提供本协议项下代驾服务，平台有权对代驾服务进行质量监控，但不对代驾服务过程中产生的纠纷或争议承担责任，也不对甲乙双方代驾服务过程中或准备服务过程中、结束服务后遭受的损失承担责任。</p>
        <p class="tit"><span class="ws-bold">七、协议效力</span></p>
        <p><span class="ws-bold">7.1甲方通过平台叫单，乙方接单后即视为双方自愿达成了本协议。</span>本协议附件属于协议不可分割的组成部分，与本协议具有同等法律效力。</p>
        <p>7.2本协议所涉及相关概念均适用《e代驾信息服务平台用户使用规则》作出的定义解释。</p>
        <p class="tit"><span class="ws-bold">八、争议解决</span></p>
            <p>本协议履行过程中发生的争议，各方应友好协商解决，协商未成的，各方一致同意将争议提交被告所在地人民法院诉讼解决。</p>
      </div>
		<jsp:include page="footer.jsp"></jsp:include>
	</body>
</html>