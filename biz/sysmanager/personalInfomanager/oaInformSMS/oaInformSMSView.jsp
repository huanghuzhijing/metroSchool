<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>
<ex:bundle/>
<html>
<head>
<script type="text/javascript">
	$(document).ready(function(){
		//返回
       $("#btn_back").click(function(){
       		var viewFlag='${param.viewFlag}';
       		if(viewFlag==""){
       			history.back(-1);
       		}else{
       			document.forms[0].submit();
       		}
       });
       //
	 });
</script>
</head>
<content tag="heading">
短信信息
</content>
<body>
	<html:form enctype="multipart/form-data" action="oaInformSMSAction.do?method=list&ec_p=${param.ec_p}&ec_id=${oaInformSMS.id}&ec_auditStatus=${oaInformSMS.auditStatus}&ec_crd=${param.ec_crd}" method="POST">
		<!--查询定位 开始-->
		<html:hidden property="qname" />
		<html:hidden property="qbeginDate"/>
		<html:hidden property="qendDate" />
		<html:hidden property="qcontent"/>
		<html:hidden property="qsource"/>
		<html:hidden property="qreceives" />
		<html:hidden property="qauditStatus"/>
		<html:hidden property="ec_crd" />
		<!--查询定位 结束-->
	</html:form>
	<fieldset>
			<legend>短信信息详细信息</legend>
			<table class="titleTable" >
		         <COLGROUP>
		           	<COL class="tdLeftTwo" />
					<COL class="tdRightTwo" />
					<COL class="tdLeftTwo" />
					<COL class="tdRightTwo" />
		          </COLGROUP>
		  
		            <tr>
			             <td>
			             	发&nbsp;&nbsp;送&nbsp;&nbsp;人：<span class="noRedSpan">*</span>
			             </td>
			             <td>
			             	${oaInformSMS.recorder.employeeid.empname}&nbsp;
			             </td>
			             <td>
			             	发送日期：<span class="noRedSpan">*</span>
			             </td>
			             <td>
			             	<fmt:formatDate value="${oaInformSMS.recordDate}" pattern="yyyy-MM-dd HH:mm"/>&nbsp;
			             </td>
		           </tr>
		            <tr>
			             <td>
			             	来&nbsp;&nbsp;&nbsp;&nbsp;源：<span class="noRedSpan">*</span>
			             </td>
			             <td>
			             	${oaInformSMS.source}&nbsp;
			             </td>
			             <td>
			             	短信平台发送状态：<span class="noRedSpan">*</span>
			             </td>
			             <td>
			             <ex:dicDisplay dictIdentify="SMS_STATE" dictValue="${oaInformSMS.auditStatus}"/>
			             </td>
		           </tr>
		            <tr>
						<td >
							接&nbsp;&nbsp;收&nbsp;&nbsp;人：<span class="noRedSpan">*</span>
						</td>
						<td colspan="3">
							${oaInformSMS.receives}&nbsp;
						</td>
				  </tr>
				      <tr>
						<td >
							发送内容：<span class="noRedSpan">*</span>
						</td>
						<td colspan="3">
							${oaInformSMS.content}&nbsp;
						</td>
				  </tr>
			</table>
	</fieldset>
	<div class="saveDiv">
		<input id="btn_back" value="${texts['button.back']}" type="button" icon="icon_back"/>
	</div>
  </body>
</html>


