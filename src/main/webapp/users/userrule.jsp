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
				用户使用规则  
			</div>
		</div>
		<div style="padding: 60px;width:70%;line-height: 30px;font-size:15px;">
        <h2 style="text-align: center;">酒后代驾预约平台用户使用规则</h2>
        <hr class="line">
        <p class="ws-bold">重要提示：在使用酒后代驾预约服务平台服务之前，请您务必认真阅读本使用规则及附件（简称“本规则”），须充分理解各条款内容，特别是涉及免除或限制责任条款。当您进入酒后代驾预约服务平台，接受或使用平台各项服务时，即表示您已知悉并同意本规则及附件的全部内容，如您不同意本规则中任何条款，应当立即停止使用。</p>
        <p class="ws-bold">您必须具备完全行为能力才能使用平台服务。若您不具备前述行为能力，则您本人及您的监护人、代理人应依法承担因此导致的全部法律责任。</p>
        <p>我们的服务：在我们的平台，用户可以实现发布和（或）获取汽车代驾需求信息,以及与代驾相关的订单记录、费用结算、体验评价等活动。但平台不实际提供代驾服务，不代理任何用户一方提供代驾服务，仅充当用户之间的中间人，用户之间使用或提供代驾服务受其签订（将要）的协议约束，平台不是此类协议中的一方主体。</p>
        <p>我们的用户：依法具有完全行为能力的自然人或法人使用或接受平台服务即为平台用户，包括代驾服务使用方和代驾服务提供方。</p>
        <p class="tit">一、用户注册</p> 
            <p>1.1自行注册：代驾服务使用方在首次使用或接受平台服务前，按照平台提示信息独立完成注册。</p>
            <p>1.2 协助注册：代驾服务使用方在首次进入平台后或者使用平台服务前，由平台根据用户提供的信息协助其自动完成注册。 </p> 
            <p>1.3审核注册：代驾服务提供方应当按照要求完成培训、驾驶技术审核等流程，并生成专用账号后，方能完成注册。</p>
            <p>1.4用户完成注册后，即可享受平台提供的各项服务，同时应当遵守并履行本规则各项义务。用户以平台认可的其他方式接受或使用代驾服务视为已完成注册。</p>
        <p class="tit">二、服务项目</p> 
            <p>2.1信息服务</p> 
            <p>2.1.1平台为用户提供发送代驾请求（叫单）和接受该请求（接单）的信息推送服务，以及用户达成和履行代驾服务协议的信息记录服务。</p> 
            <p>2.1.2代驾服务提供方通过平台获取信息后，应当向平台支付信息服务费。</p> 
            <p>2.2结算服务</p> 
            <p>2.2.1平台为用户之间的代驾服务费用结算提供服务。代驾服务结束后，代驾服务使用方应当按照平台订单记录的时间、里程数据和平台公布的收费标准向代驾服务提供方支付代驾服务费。<span class="ws-bold">平台会根据市场需求或用户反馈更新费用标准，用户应当注意查看平台最新公布收费标准。</span></p> 
            <p>2.2.2平台可以为用户设立预存账户，并根据用户授权代为支付或划取相关费用<span class="ws-bold">（包括代驾信息服务费，代驾服务费及其他费用或违约金）。</span></p> 
            <p>2.3评价服务</p> 
            <p>2.3.1 用户可以通过平台对代驾服务行为作出评价或提出意见，评价内容应当客观真实，不得包含辱骂、诋毁以及法律禁止性信息，不得违反平台规则。否则，平台有权采取相关措施，包括但不限于删除评价、限制或禁止使用、要求赔偿损失以及追究其他责任。</p> 
            <p>2.3.2用户不得以不当方式帮助他人提高评价，不得对其他用户实施威胁、敲诈。</p> 
            <p>2.3.3平台可以根据评价统计，对用户进行综合评定，具体评定办法由平台另行制定。</p> 
            <p>2.4调处服务</p> 
            <p>2.4.1&nbsp;用户如在使用平台过程中以及代驾服务过程中发生争议，并选择使用平台争议调处服务，则表示认可平台作为独立第三方根据所了解的事实及平台规则作出的调处决定。</p> 
            <p>2.4.2&nbsp;<span class="ws-bold">用户应当理解并同意，在争议调处服务中，平台人员并非专业裁判人士，仅能以普通人的认知对用户提交的凭证进行判断，平台对调处结果免责。</span></p>

        <p class="tit">三、用户义务</p> 
            <p>3.1用户使用或接受平台服务时，应当遵守平台秩序，承担以下义务：</p> 
            <p>3.1.1用户须向平台提供真实合法的有效信息，<span class="ws-bold">如因提供的信息虚假、错误、不准确、不完整，所导致的服务及信息偏差、失误，平台不承担任何责任；由此引起的任何损失由用户自行承担。</span></p> 
            <p>3.1.2用户应当妥善保管自己的账号，且不应在没有授权的情况下使用他人账号。</p> 
            <p>3.1.3用户不得利用平台骚扰、妨碍他人或从事任何违法或侵权行为（包括但不限于恶意叫单、接单、多次销单等影响平台或其他用户的行为）。</p> 
            <p>3.1.4 用户不得影响平台的正常运行，不得进行危害平台服务或影响平台数据的行为。</p> 
            <p>3.1.5 当平台提出合理请求时，用户应提供任何身份或车辆、事件证明材料。</p> 
            <p>3.1.6 用户在使用平台服务过程中，所产生的应纳税费，以及一切硬件、其他应用软件、网络通讯服务及其它方面的费用，均由其独自承担。</p> 
            <p>3.2用户违反平台管理或平台规则，平台有权采取相关处理措施，包括但不限于：信息删除、屏蔽处理、限制使用、终止服务、查封或注销账号等。如造成平台损失，用户还应赔偿平台包括但不限于直接经济损失、商誉损失、对外垫付或赔偿款项、和解或调解款项、律师费、差旅费、诉讼费用、行政罚款等间接经济损失。</p> 
            <p class="ws-bold">3.3 用户同意平台向其发送商业性短信息，用以通知、提醒、确认平台使用的相关内容及优惠信息等。</p>
        <p class="tit ws-bold">四、各方责任</p> 
            <p class="ws-bold">4.1  除本规则载明责任外，平台不对代驾服务中产生的争议及遭受的损失承担责任。</p>   
            <p class="ws-bold">4.2 代驾服务提供方为代驾服务使用方同意的车辆驾驶员，如在代驾过程中发生交通事故，应首先使用代驾服务使用方车辆的第三者责任险或者其他保险对相关人身、财产损失进行赔偿。不足部分，根据交警部门的交通事故责任认定，代驾服务提供方存在过错的，由其在交警部门认定的责任范围内承担补充责任；非代驾服务提供方过错的，由代驾服务使用方直接向相应责任方进行追偿。</p> 
            <p class="ws-bold">4.3鉴于互联网服务特殊性，以及平台信息来源于用户提供，故平台无法逐一审查信息的真实性、准确性，对此用户自己应审慎判决并独立做出决定。对因此导致的损害，除非平台故意造成外，平台不承担任何责任。</p> 
            <p class="ws-bold">4.4平台提供的代驾信息服务受制于用户使用情况，平台有权不经事先通知，随时变更、中断或终止部分或全部的服务，并且不保证服务一定能满足用户要求。</p> 
            <p class="ws-bold">4.5用户未通过平台认可的途径、方式叫单、接单，则不能享受本规则中任何权利，因此发生的争议以及造成的损失，平台不承担任何责任。</p>

        <p class="tit">五、知识产权</p> 
            <p>5.1 平台包含的所有内容，包括但不限于文本、图形、标志及软件的所有权均属北京亿心宜行汽车技术开发服务有限公司所有，受知识产权等法律法规的保护，您在使用服务过程中不得以任何形式侵害所有人前述权利。</p> 
            <p>5.2  未经平台允许，您不得复制或发送任何平台内容，不得修改平台相关程序或据此创建衍生产品或竞争产品。</p>

        <p class="tit">六、规则文本、通知、变更和终止</p> 
            <p>6.1平台所有通过官网、手机app、微信公众号发布的实施细则、公告、通知、产品或流程说明等均视为本规则的不可分割的组成部分，与本规则具有同等法律效力。</p> 
            <p class="ws-bold">6.2本规则一经发布即生效。平台可以通过官网、手机app、微信、短信息等方式对本规则内容的发布、修改、增加、废止等作出公布或通知，也可以某些功能进行限制或终止使用，用户应当随时关注平台公示信息。规则内容一经公布或通知即替代原规则内容发生效力，如用户不同意发布或变更的内容，应立即停止使用本平台的相关服务；若用户继续使用平台服务，则视为同意发布或变更事项。</p> 
            <p>6.3 出现以下情况时，平台有权限制或终止向用户提供服务:</p> 
            <p>6.3.1提供的手机号码不存在或无法接收信息，且没有其他方式可以进行联系。</p> 
            <p>6.3.2本规则变更时，明示并通知平台不愿接受新的变更内容的。</p> 
            <p>6.3.3 连续180天没有使用平台服务的。</p> 
            <p>6.3.4 存在违法或违约行为的。</p> 
            <p>6.3.5 其他为维护平台运营秩序采取的限制或终止服务措施。</p> 
            <p>6.4 平台在限制或终止提供服务后，仍享有下列权利：</p> 
            <p>6.4.1继续保存用户的注册信息及使用平台服务信息。</p> 
            <p>6.4.2就用户的违法或违约行为主张法律责任。</p>

        <p class="tit">七、法律适用与管辖</p> 
            <p>7.1本规则之效力、解释、变更、执行与争议解决均适用中华人民共和国大陆地区法律，如无相关法律规定的，则应参照通用商业惯例和（或）行业惯例。</p> 
            <p class="ws-bold">7.2因使用平台服务产生争议，应充分友好协商处理；若协商不成，应以平台运营商即北京亿心宜行汽车技术开发服务有限公司住所地人民法院为管辖法院。</p> 
            <p>7.3本规则任一条款被废止或被视为无效的，不影响本规则其余条款的有效性。本规则的最终解释权归平台运营方北京亿心宜行汽车技术开发服务有限公司所有。</p>

        <p class="tit">相关释义：</p> 
            <p>平台服务：指基于互联网、通讯技术，包含官网、手机APP、官方客服电话、第三方网页链接、微信以及其他平台认可的服务方式在内的汽车代驾信息服务。</p> 
            <p>手机app：指包含代驾服务使用方客户端、代驾服务提供方专用客户端等在内的由北京亿心宜行汽车技术开发服务有限公司研发的客户端。</p> 
            <p>代驾服务：指代驾服务提供方直接向代驾服务使用方提供的有偿代驾服务。</p> 
            <p>帐号：指用户进入和使用平台，以及接受平台服务的账号。</p> 
            <p>注册号：指用户用以登录账号的号码。</p> 
            <p>预存账户：指用户设立账户预存一定费用，并授权平台代为结算并划扣代驾信息服务费或代驾服务费等费用。代驾服务使用方用户可以设立预存账户，代驾服务提供方用户应当设立预存账户。</p> 
            <p>订单：指通过平台记录代驾服务使用方和提供方具体信息的电子订单。</p> 
            <p>叫单：指代驾服务使用方通过平台认可的方式向代驾服务提供方发出需要代驾服务的要约。</p> 
            <p>接单：指代驾服务提供方通过平台认可的方式作出提供代驾服务的承诺，即接受代驾服务使用方的叫单。</p>
      </div>
		<jsp:include page="footer.jsp"></jsp:include>
	</body>
</html>