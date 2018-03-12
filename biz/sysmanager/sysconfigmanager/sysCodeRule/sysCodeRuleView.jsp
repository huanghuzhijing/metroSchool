<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
<html:html>
<head>
	<script src="${ctx}/scripts/public.js" type="text/javascript"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			//
			$("#btn_back").click(function(){ 
				history.back(-1);
			}); 
			//
		});
	</script>
</head>
<content tag="heading">
	${texts['sysOperator.sysOperatorList.content']}
</content>
<body >
		<table class="titleTable" width="99%" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td align="left" class="titleShow">
					&nbsp;[${texts['sysOperator.sysOperatorList.content']}]&nbsp;
				</td>
			</tr>
			<tr>
				<td>
					<table class="formTable" align="center" cellpadding="3" cellspacing="0">
					    <COLGROUP>
							<COL class="tr03" align="right" width="25%">
							<COL class="tr02"  width="75%">
						</COLGROUP>
					  <tr>
					    <td >${texts['sysOperator.sysOperatorList.qcroptype']}：&nbsp;&nbsp;</td>
					    <td >
							${texts['sysOperator.sysOperatorForm.incrop']}
						</td>
					  </tr>
					  <tr>
					    <td >${texts['sysOperator.sysOperatorList.qempname']}：&nbsp;&nbsp;</td>
					    <td >
					    	${sysOperator.username}&nbsp;
						</td>
					  </tr>
					  <tr>
					    <td >${texts['sysOperator.sysOperatorList.qrolename']}：&nbsp;&nbsp;</td>
					    <td >
					    	${sysOperator.username}&nbsp;
						</td>
					  </tr>		
					  <tr>
					    <td >${texts['sysOperator.sysOperatorList.qusername']}：&nbsp;&nbsp;</td>
					    <td >
					    	${sysOperator.username}&nbsp;
						</td>
					  </tr>
					</table>
				</td>
			</tr>
		</table>
		<div align="center" class="inputInfoDiv">
			${texts['label.page.recorder']}：${bidBidcorpManager.recorder}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
			${texts['label.page.recorddate']}：<fmt:formatDate value="${sysOperator.recorddate}" />
		</div>
		<div align="center" class="sbDiv">
			<input id="btn_back" type="button" value="${texts['button.back']}" class="button1">
		</div>
</body>
</html:html>
