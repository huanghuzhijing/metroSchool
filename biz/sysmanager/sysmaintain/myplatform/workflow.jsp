<%@ page contentType="text/html;charset=UTF-8"%>
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
</style>
<table class="messageTable" width="95%" border="0" cellpadding="0"
	cellspacing="0">
		<c:forEach items="${workFlowMessages}" var="message">
		<tr>
			<td align="center" class="messageTd">
				&nbsp;
			</td>
			<td height="30px" width="85%">
				<div class="messageContent">
					<a href="${message.url}" class="aShow">${message.title}<font
						color='red'>(${message.count})</font> </a>
				</div>
			</td>
		</tr>
	</c:forEach>
</table>

