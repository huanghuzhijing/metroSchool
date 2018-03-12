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
	   		 	document.forms[0].action="sysMailboxSendAction.do?method=list&flag="+${param.flag}+'&ec_crd='+${param.ec_crd};
	   		 document.forms[0].submit(); 
			}); 
	   
		});
	</script>
</head>
<content tag="heading">
发信箱
</content>
<body>
<html:form enctype="multipart/form-data" action="sysMailboxSendAction.do" method="POST">
<html:hidden property="flag" value="${flag}" />
<html:hidden property="ec_crd" />
<html:hidden property="ec_p" />

<html:hidden property="qtitle" />
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
							收信人：<span class="noRedSpan">*</span>
						</td>
						<td colspan="3">
							${receivepersonName}
						</td>
					</tr>
					<tr>
						<td>
							标题：<span class="noRedSpan">*</span>
						</td>
						<td colspan="3">
							${sysMailboxSend.title}
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
					<c:if test="${sysMailboxSend.oldOrNew!=1}">
						 <tr>
							<td>上传附件：<span class="noRedSpan">*</span></td>
							<td>
								<c:set value="1" var="index" />
								<c:forTokens items="${sysMailboxSend.attach_name}" delims="@" var="attach_name">
									 <a href="${ctx}/sysMailboxSendAction.do?method=download&send_id=${sysMailboxSend.send_id}&fileType=${index}">[${attach_name}]</a>&nbsp;&nbsp;
									<c:set value="${index+1}" var="index" />
								</c:forTokens>
							</td>
							</tr>
					</c:if>
				</table>
		</fieldset>
	<c:if test="${sysMailboxSend.oldOrNew==1}">
		<%@ include file="/commons/showFiles.jsp"%>
	</c:if>
	
	<div class="saveDiv">
		<input id="btn_back" value="${texts['button.back']}" type="button"  icon="icon_back"/>
	</div>
	</html:form>
</body>
</html:html>
