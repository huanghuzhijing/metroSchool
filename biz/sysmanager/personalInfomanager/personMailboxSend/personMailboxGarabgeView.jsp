<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
<html:html>

<head>
</head>
	<content tag="heading">
	信件信息
	</content>
<body>
	<fieldset >
		<legend>[信件信息]</legend>
	<html:hidden property="flag" value="${flag}" />
					<table class="titleTable">
						<COLGROUP>
					         <COL class="tdLeftOneTwo" />
						     <COL class="tdRightOneTwo" />
					    </COLGROUP>
					<tr>
						<td>
							发&nbsp;&nbsp;件&nbsp;&nbsp;人：<span class="noRedSpan">*</span>
						</td>
						<td colspan="3">
							<ex:userName id="${personMailboxReceive.recorder}" />
						</td>
					</tr>
					<tr>
						<td>
							标&nbsp;&nbsp;&nbsp;&nbsp;题：<span class="noRedSpan">*</span>
						</td>
						<td colspan="3">
							${personMailboxReceive.title}
						</td>
					</tr>
					<tr>
						<td>
							内&nbsp;&nbsp;&nbsp;&nbsp;容：<span class="noRedSpan">*</span>
						</td>
						<td colspan="3">
							${personMailboxReceive.content }
						</td>
					</tr>
				</table>
				</fieldset>
	<%@ include file="/commons/showFiles.jsp"%>
	<div class="saveDiv">
		<input type="button" icon="icon_back" value="${texts['button.back']}"
			onclick="history.back(-1);"/>
	</div>
</body>
</html:html>
