<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
<html:html>
<head>
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
		<div class="inputInfoDiv">
			<span class="inputShowLeft">填&nbsp;&nbsp;报&nbsp;&nbsp;人：${userinfo.empName} </span>
			<span class="inputShowRight"> 填报日期：${now_date}</span>
		</div>
		<div class="saveDiv">
			<input id="btn_back" type="button" value="${texts['button.back']}" icon="icon_back" >
		</div>
</body>
</html:html>
