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
	<c:if test="${receiveFileTransactCount>0}">
		<tr>
			<td align="center" class="messageTd">
				&nbsp;
			</td>
			<td height="30px" width="85%">
				<div class="messageContent">
					<a href="${ctx}/receiveFileTransactAction.do?method=list&receiveTransactType=1" class="aShow">待办收文信息<font
						color='red'>(${receiveFileTransactCount})</font> </a>
				</div>
			</td>
		</tr>
		</c:if>
			<c:if test="${survInspectFileTransactCount>0}">
		<tr>
			<td align="center" class="messageTd">
				&nbsp;
			</td>
			<td height="30px" width="85%">
				<div class="messageContent">
					<a href="${ctx}/survInspectFileTransactAction.do?method=list&survInspectTransactType=1" class="aShow">待办督办事项<font
						color='red'>(${survInspectFileTransactCount})</font> </a>
				</div>
			</td>
		</tr>
		</c:if>
		<c:if test="${sendFileTransactCount>0}">
		<tr>
			<td align="center" class="messageTd">
				&nbsp;
			</td>
			<td height="30px" width="85%">
				<div class="messageContent">
					<a href="${ctx}/sendFileTransactAction.do?method=list" class="aShow">待办发文信息<font
						color='red'>(${sendFileTransactCount})</font> </a>
				</div>
			</td>
		</tr>
		</c:if>
		<c:if test="${docMaterialsTransactCount>0}">
		<tr>
			<td align="center" class="messageTd">
				&nbsp;
			</td>
			<td height="30px" width="85%">
				<div class="messageContent">
					<a href="${ctx}/docMaterialsTransactAction.do?method=list" class="aShow">待办汇报材料<font
						color='red'>(${docMaterialsTransactCount})</font> </a>
				</div>
			</td>
		</tr>
		</c:if>
</table>

