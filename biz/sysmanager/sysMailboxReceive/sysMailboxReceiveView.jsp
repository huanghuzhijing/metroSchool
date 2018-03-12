<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
<html:html>
<head>
	<script type="text/javascript">
		//加载
	   $(document).ready(function(){
	   		$("#btn_back").click(function(){ 
				//history.back(-1);
	   		 	document.forms[0].action="sysMailboxReceiveAction.do?method=list&flag="+${param.flag}+'&ec_crd='+${param.ec_crd}; 
	   		 document.forms[0].submit();
			}); 
	   		$("#btn_reply").click(function(){ 
	   		 	location.href="sysMailboxSendAction.do?method=create&createType=1&sid="+${sysMailboxReceive.mailboxSend.send_id}+"&flag="+${param.flag}+'&ec_crd='+${param.ec_crd}; 
			}); 
	   		$("#btn_reload").click(function(){ 
	   		 	location.href="sysMailboxSendAction.do?method=create&createType=2&sid="+${sysMailboxReceive.mailboxSend.send_id}+"&flag="+${param.flag}+'&ec_crd='+${param.ec_crd}; 
			}); 
		});
	</script>
</head>
<content tag="heading">
收信箱
</content>
<body>
<html:form enctype="multipart/form-data" action="sysMailboxReceiveAction.do" method="POST">
<html:hidden property="flag" value="${flag}" />
<html:hidden property="ec_crd" />
<html:hidden property="ec_p" />
<html:hidden property="qsendperson"/>
<html:hidden property="qreceivestatus" />
<html:hidden property="qstartDate" />
<html:hidden property="qendDate" />
<fieldset >
		<legend>信件信息</legend>
					<table class="titleTable">
						<COLGROUP>
					         <COL class="tdLeftOneTwo" />
						     <COL class="tdRightOneTwo" />
					    </COLGROUP>
					<tr>
						<td>
							发信人：<span class="noRedSpan">*</span>
						</td>
						<td colspan="3">
							<ex:empName id="${sysMailboxReceive.sendperson}"/>
						</td>
					</tr>
					<tr>
						<td>
							标题：<span class="noRedSpan">*</span>
						</td>
						<td colspan="3">
							${sysMailboxReceive.mailboxSend.title}
						</td>
					</tr>
					<tr>
						<td>
							内容：<span class="noRedSpan">*</span>
						</td>
						<td colspan="3">
							${tempContent}
						</td>
					</tr>
					<c:if test="${sysMailboxReceive.mailboxSend.oldOrNew!=1}">
						 <tr>
							<td>上传附件：<span class="noRedSpan">*</span></td>
							<td>
								<c:set value="1" var="index" />
								<c:forTokens items="${sysMailboxReceive.mailboxSend.attach_name}" delims="@" var="attach_name">
									 <a href="${ctx}/sysMailboxSendAction.do?method=download&send_id=${sysMailboxReceive.mailboxSend.send_id}&fileType=${index}">[${attach_name}]</a>&nbsp;&nbsp;
									<c:set value="${index+1}" var="index" />
								</c:forTokens>
							</td>
							</tr>
					</c:if>
				</table>
		</fieldset>
		<c:if test="${sysMailboxReceive.mailboxSend.oldOrNew==1}">
			<%@ include file="/commons/showFiles.jsp"%>
		</c:if>
	<div class="saveDiv">
		<input id="btn_back" value="${texts['button.back']}" type="button"  icon="icon_back"/>
		<input id="btn_reply" value="回复" 					 type="button"  icon="icon-back"/>
		<input id="btn_reload" value="转发" 					 type="button"  icon="icon-reload"/>
	</div>
	</html:form>
</body>
</html:html>
