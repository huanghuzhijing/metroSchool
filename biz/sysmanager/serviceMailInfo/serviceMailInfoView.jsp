<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
<html:html>
<head>
<script type="text/javascript">
	$(document).ready(function(){
	  $("#btn_back").click(function(){ 
				var url='serviceMailInfoAction.do?method=list&q_startdate=${param.q_startdate}&q_enddate=${param.q_enddate}&ec_p=${param.ec_p}&ec_id=${serviceMailInfo.id}&ec_crd=${param.ec_crd}';   
	    	document.forms[0].action=url;
			document.forms[0].submit();
			}); 
	});
		
</script>
</head>
<content tag="heading">
	邮件发送平台
</content>
<body>
	<html:form enctype="multipart/form-data" action="serviceMailInfoAction.do" method="POST">
		<input name="method"  type="hidden" />
		<html:hidden property="id" />
		
		<!--查询定位 开始-->
		<html:hidden property="ec_id" value="${serviceMailInfo.id}"/>
		<html:hidden property="ec_p" />
		<html:hidden property="q_sender" />
		<html:hidden property="q_incepter" />
		<html:hidden property="q_subject" />
		<html:hidden property="ec_crd" />
		<!--查询定位 结束-->
	<fieldset>
			<legend>邮件详细信息</legend>
			<table class="titleTable" >
		         <COLGROUP>
						<COL class="tdLeftTwo" />
						<COL class="tdRightTwo" />
						<COL class="tdLeftTwo" />
						<COL class="tdRightTwo" />
					</COLGROUP>
					<tr>
						<td>
						 发送者：<span class="noRedSpan">*</span>
						</td>
						<td >
							<ex:employeeName id="${serviceMailInfo.sender}"/>&lt${serviceMailInfo.fromAddress}&gt
						</td>
					</tr>
					<tr>
						<td>
						  发送邮件的服务器：<span class="noRedSpan">*</span>
						</td>
						<td >
							${serviceMailInfo.mailServerHost}
						</td>
					</tr>
					<tr>
						<td>
						  接收者：<span class="noRedSpan">*</span>
						</td>
						<td >
							${serviceMailInfo.incepter}
						</td>
					</tr>
					<tr>
						<td>
						  标题：<span class="noRedSpan">*</span>
						</td>
						<td >
							${serviceMailInfo.subject}
						</td>
					</tr>
					<tr>
						<td>
						  内容：<span class="noRedSpan">*</span>
						</td>
						<td colspan="4" id="fckTD" align="left">
			     	<c:out value="${fckcontent}" escapeXml="false" />
			     </td>
					</tr>
					
			<tr>
			<td>
			附件信息：<span class="noRedSpan">*</span>
			</td>
			<td>
				<c:set value="1" var="index" />
				<c:forTokens items="${serviceMailInfo.attach_name}" delims="@" var="attach_name">
					 <a href="${ctx}/serviceMailInfoAction.do?method=download&id=${serviceMailInfo.id}&fileType=${index}">[${attach_name}]</a>&nbsp;&nbsp;
					<c:set value="${index+1}" var="index" />
				</c:forTokens>
				&nbsp
			</td>
		</tr>
					
		          
			</table>
	</fieldset>
	<!-- 附件列表 -->
<%--	<%@ include file="/commons/showFiles.jsp"%>--%>
	<div class="saveDiv">
		<input type="button" id="btn_back" value="<fmt:message key="button.back"/>" icon="icon_back" />
    </div>
    </html:form>
</body>
</html:html>
