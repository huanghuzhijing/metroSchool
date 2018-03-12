<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
<html:html>
<head>
<script src="<c:url value="/scripts/jquery-1.2.6.js"/>" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function(){
	 //审核
       $(".leftHref").click(function(){
      	var url=$(this).attr("href")+'&ec_crd='+ $("[name='ec_crd']",parent.main.document).val();
      	$(this).attr("href",url);
       });
	});
</script>
</head>
<body style="background-color: #EDF2F8; padding: 0px; margin: 0px;">

	<table cellpadding="0" cellspacing="0" height="99%" width="100%"
		style="margin-left: 0px; margin-right: 0px">
		<tr height="5">
			<td width="5" height="5"
				style="background: url(${ctx}/styles/img/c_lefttop.jpg); background-repeat: no-repeat"></td>
			<td width="1" height="5"
				style="background: url(${ctx}/styles/img/bg_top.jpg)"></td>
			<td style="background: url(${ctx}/styles/img/bg_top.jpg)"></td>
			<td width="5" height="5"
				style="background: url(${ctx}/styles/img/c_righttop.jpg); background-repeat: no-repeat"></td>
		</tr>
		<tr>
			<td width="5"
				style="background: url(${ctx}/styles/img/bg_mleft.jpg)"></td>
			<td align="center" valign="top" colspan="2">
				<table style="margin-top: 10px;">
					<tr height="40">
						<td
							style="background-image: url(${ctx}/styles/img/wriMail.gif); background-repeat: no-repeat; background-position: left">
							<div style="font-size: 12px; margin-left: 25px;">
								<a style="color: #024280" href="personMailboxSendAction.do?method=create&flag=5"
								 class="leftHref"	target="main">写信</a>
							</div>
						</td>
					</tr>
					<tr height="40">
						<td
							style="background-image: url(${ctx}/styles/img/recMail.gif); background-repeat: no-repeat; background-position: left">
							<div style="font-size: 12px; margin-left: 25px;">
								<a style="color: #024280" href="personMailboxSendAction.do?method=receive&flag=2"
									class="leftHref" target="main">收信(<span id="noread">${noread }</span>)</a>
							</div>

						</td>
					</tr>
					<tr>
						<td>
							<hr />
						</td>
					</tr>
					<tr height="40">
						<td
							style="background-image: url(${ctx}/styles/img/testMail.gif); background-repeat: no-repeat; background-position: left">
							<div style="font-size: 12px; margin-left: 25px;">
								<a style="color: #024280" href="personMailboxSendAction.do?method=receive&flag=1"
								class="leftHref"	target="main">收件箱(<span id="allreceive">${allreceive }</span>)</a>
							</div>
						</td>
					</tr>
					<tr height="40">
						<td
							style="background-image: url(${ctx}/styles/img/sendMail.gif); background-repeat: no-repeat; background-position: left">
							<div style="font-size: 12px;; margin-left: 25px;">
								<a style="color: #024280" href="personMailboxSendAction.do?method=list&flag=4"
								class="leftHref"		target="main">发件箱(<span id="allsend">${allsend }</span>)</a>
							</div>
						</td>
					</tr>
					<tr height="40">
						<td
							style="background-image: url(${ctx}/styles/img/cgMail.gif); background-repeat: no-repeat; background-position: left">
							<div style="font-size: 12px;; margin-left: 25px;">
								<a style="color: #024280" href="personMailboxSendAction.do?method=listdraft&flag=3"
									class="leftHref"	target="main">草稿箱(<span id="Draft">${Draft }</span>)</a>
							</div>
						</td>
					</tr>
				</table>
			</td>
			<td width="5"
				style="background: url(${ctx}/styles/img/bg_midright.jpg)"></td>
		</tr>
		<tr height="5">
			<td width="5" height="5"
				style="background: url(${ctx}/styles/img/c_leftbot.jpg); background-repeat: no-repeat"></td>
			<td width="1" height="5"
				style="background: url(${ctx}/styles/img/bg_bot.jpg)"></td>
			<td style="background: url(${ctx}/styles/img/bg_bot.jpg)"></td>
			<td width="5" height="5"
				style="background: url(${ctx}/styles/img/c_rightbot.jpg); background-repeat: no-repeat"></td>
		</tr>
	</table>

</body>

</html:html>
