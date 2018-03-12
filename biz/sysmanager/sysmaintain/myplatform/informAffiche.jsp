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
	background-color: #ffffff;
}

.titleShowDiv {
	background-color: #ffffff;
	color: #656565;
	height: 24px;
	line-height: 24px;
	font-weight: bold;
	padding-left: 10px;
	border-bottom:1px solid #c0c0c0 ;
}

.contentDiv {
	width: 100%;
	margin-left: 0px;
	margin-top: 8px;
	margin-bottom: 8px;
	padding-left: 10px;
}
</style>

<table class="messageTable" width="98%" border="0" cellpadding="0" style="background-color:red;margin-top:0px;"
	cellspacing="0">
	<tr>
		<td style="background-color: #ffffff">
				<div class="modulDiv">
					<c:forEach items="${oaInformAffiches}" var="oaInformAffiche">
						<div class="contentDiv">
							<table width="100%" style="font-size: 13px;color: #01366B;">
								<tr>
									<td>*&nbsp;&nbsp;
										<a class="aShow" href="oaInformAfficheAction.do?method=view&id=${oaInformAffiche.id }">
											<font class="font_styleoa" title="${oaInformAffiche.title }">${oaInformAffiche.title }</font>
										</a>
									</td>
									<td align="right" style="padding-right:8px;">
										${fn:substring(oaInformAffiche.issueDate , 0, 10)}
										<ex:empName id="${oaInformAffiche.updateMan}"/>
									</td>
								</tr>
							</table>
						</div>
					</c:forEach>
		</td>
	</tr>
</table>
