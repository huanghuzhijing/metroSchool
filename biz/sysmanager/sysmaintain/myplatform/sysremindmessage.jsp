<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>

<style type="text/css">
.messageTable {
	margin-top: 3px;
	color: #01366B;
	font-size: 13px;
	background-color: red;
}

.messageTd {
	height: 30px;
	widht: 30px;
}

.messageContent {
	margin-left: 20px;
}

.modulDiv {
	width: 100%;
	float: left;
	margin-bottom: 5px;
	background-color: #EDF3F6;
}

.titleShowDiv {
	background-color: #84BBE7;
	color: #ffffff;
	height: 24px;
	line-height: 24px;
	font-weight: bold;
	padding-left: 10px;
}

.contentDiv {
	width: 100%;
	margin-left: 0px;
	margin-top: 8px;
	margin-bottom: 8px;
	padding-left: 10px;
}
</style>
 
<table class="messageTable" width="98%" border="0" cellpadding="0"
	cellspacing="0">
	<tr>
		<td style="background-color: #ffffff">
				<div class="modulDiv">
					<c:forEach items="${req_oaMeetingInformMessage}" var="oaMeetingInform" varStatus="index">
						<div class="contentDiv">
							<table width="100%" style="font-size: 13px;color: #01366B;">
								<tr>
									<td>
										*&nbsp;&nbsp;
										<a class="aShow"  href="#" 
											 onclick="location.href='oaMeetingInformAction.do?method=view&id=${oaMeetingInform.id}&situation=(${userinfo.empName},${now_date})';">
										<font color="red" >
											会议主题：${oaMeetingInform.meetingSubject} &nbsp;&nbsp;
											会议时间：<fmt:formatDate value="${oaMeetingInform.meetingDate}" pattern="yyyy-MM-dd HH:mm"/>&nbsp;&nbsp;
											会议地点：${oaMeetingInform.meetingPlace}
										</font>
										</a>
										&nbsp;&nbsp;
									</td>
									<td align="right" style="padding-right:8px;">
									</td>
								</tr>
							</table>
						</div>
					</c:forEach>
					<c:forEach items="${oaFileBorrowMessages}" var="oaFileBorrowMessage" varStatus="index">
						<div class="contentDiv">
							<table width="100%" style="font-size: 13px;color: #01366B;">
								<tr>
									<td>
										*&nbsp;&nbsp;
										<a class="aShow"  href="#" 
											 onclick="location.href='oaFileBorrowAction.do?method=list&ec_id=${oaFileBorrowMessage.id}';">
										<font color="red" >
											文件借阅 ： 请及时归还 ${oaFileBorrowMessage.pigeonholeId.fileName}
										</font>
										</a>
										&nbsp;&nbsp;
									</td>
									<td align="right" style="padding-right:8px;">
									</td>
								</tr>
							</table>
						</div>
					</c:forEach>
					<c:forEach items="${sysMessageRemindMessages}" var="sysMessageRemindMessage" varStatus="index">
						<div class="contentDiv">
							<table width="100%" style="font-size: 13px;color: #01366B;">
								<tr>
									<td>
										*&nbsp;&nbsp;
										<a class="aShow"  href="#" 
											 onclick="location.href='${sysMessageRemindMessage.url}';">
										<font color="red" >
											 ${sysMessageRemindMessage.memo}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <fmt:formatDate value="${sysMessageRemindMessage.recordDate}" pattern="yyyy-MM-dd"/>
										</font>
										</a>
										&nbsp;&nbsp;
									</td>
									<td align="right" style="padding-right:8px;">
									</td>
								</tr>
							</table>
						</div>
					</c:forEach>
				</div>
		</td>
	</tr>
</table>
