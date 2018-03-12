<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
<style type="text/css">
.messageTable {
	background-color: #EDF3F6;
	margin-top: 8px;
	color: #01366B;
	font-size: 13px;
}

.messageTd {
	height: 30px;
	widht: 60px;
	background-image: url(${ctx}/styles/main/images/pointPic.jpg);
	background-repeat: no-repeat;
	background-position: center center;
}

.messageContent {
	margin-left: 20px;
}

.aShow {
	font-size: 13px;
	color: #01366B;
}

a {
	text-decoration: none;
}
</style>
<table class="messageTable" width="95%" border="0" cellpadding="0"
	cellspacing="0">
	<c:if test="${person_mail>0}">
		<tr>
			<td align="center" class="messageTd">
				&nbsp;
			</td>
			<td height="30px" width="85%">
				<div class="messageContent">
					<a class="aShow" href="#"
						onclick="location.href='${ctx}/personMailboxSendAction.do?mehod=index&readflag=noread';">
						未读个人邮件<font color="red">(${person_mail })</font>条 </a>
				</div>
			</td>
		</tr>
	</c:if>
</table>
