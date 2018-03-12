<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
<html:html>
<head>
	<script type="text/javascript">
	//加载
	$(document).ready(function(){
		$(".btn_save").click(function(){
			var properties=new Array(); 
			properties[0]=["receiveperson","收件人"];
			properties[1]=["title","标题"];
			properties[2]=["isimport","是否为重要邮件"];
			
			var localTime = jQuery("#localTimeTR");
			if(!localTime.is(":hidden")){
				properties[3]=["localTime","定时发送时间"];
			}
			
			
			saveValidateRequired(".btn_save",properties,"sysMailboxSendForm");
		
		
		});
		
	});
	
	function setParamValue(empIds,empNames){
		$("[name='receiveperson']").val(empIds);
		$("[name='receiveperson_name']").val(formatStringComma(empNames));
	}	
	
	function displayTimeTr(value){
		if(value == "0"){
			jQuery("#localTimeTR").show();
		}else{
			jQuery("#localTimeTR").hide() ;
		}
	}
	
	function saveType(type){
		$("[name='sendstatus']").val(type);
	}
</script>
</head>
	<content tag="heading">信件信息</content>
<body>
<html:form action="sysMailboxSendAction.do" styleClass="form" method="POST" styleId="sysMailboxSendForm" enctype="multipart/form-data">
<input type="hidden" name="method" value="save">
		<div>
			<html:hidden property="send_id" />
			<html:hidden property="flag" value="${param.flag}"/>
			<html:hidden property="ec_crd" />
			<html:hidden property="sendstatus" />
		</div>
 <fieldset >
			<legend>写信息</legend>
					<table class="formTable">
						<COLGROUP>
							<COL class="tdLeftOneTwo" />
							<COL class="tdRightOneTwo" />
						</COLGROUP>
						<tr>
							<td>
								收件人：<span class="redSpan">*</span>
							</td>
							<td colspan="3">
								<html:hidden property="receiveperson" value="${temppersonId}"/>
								<html:text property="receiveperson_name" size="80" value="${tempEmpname}"
									styleClass="showText" maxlength="50" readonly="true" />
								<%@ include file="/biz/sysmanager/sysmaintain/sysPlug/selectEmpNoteOrganGroupCorp/selectEmpNoteOrganGroupCorp.jsp" %>
							</td>
						</tr>
						<tr>
							<td>
								标题：<span class="redSpan">*</span>
							</td>
							<td colspan="3">
								<html:text property="title" value="${sysMailboxSend.title}" size="80" styleClass="inputText" maxlength="50" />
							</td>
						</tr>
						<tr>
							<td>
								是否为重要邮件：<span class="noRedSpan">*</span>
							</td>
							<td colspan="3">
								<ex:dictRadio property="isimport" type="Isornoimport" defaultValue="${sysMailboxSend.isimport}"/>
							</td>
						</tr>
						<tr>
							<td>
								发送类型：<span class="redSpan">*</span>
							</td>
							<td colspan="3">
								<ex:dictRadio property="sendType" type="SendType" defaultValue="${sysMailboxSend.sendType}" onclick="displayTimeTr(this.value)"/><font color="blue">（备注：发送类型只适用于 [发送] 按钮，对 [保存] 按钮无效！） </font>
							</td>
						</tr>
						<tr id="localTimeTR" style="display:none">
							<td>
								定时时间：<span class="redSpan">*</span>
							</td>
							<td>
								<html:text property="localTimeTemp" styleClass="inputText" readonly="true" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" />
							</td>
						</tr>
						<tr>
						<td>
								内容：<span class="noRedSpan">*</span>
							</td>
							<td colspan="3">
								<INPUT type="hidden" name="content" value="${tempContent}" class="inputText"/>
								<IFRAME ID="eWebEditor1"  src="<%=request.getContextPath()%>/ewebeditor/ewebeditor.htm?id=content&style=coolblue" frameborder="0" scrolling="no" width="100%" height="350"></IFRAME>
							</td>
						</tr>
					</table>
		</fieldset>
		<!-- 附件增加 -->
		<%@ include file="/commons/uploadFiles.jsp"%>
		<div class="inputInfoDiv">
			<span class="inputShowLeft">填&nbsp;&nbsp;报&nbsp;&nbsp;人：${userinfo.empName} </span>
			<span class="inputShowRight"> 填报日期：${now_date}</span>
		</div>
		<div class="saveDiv">
			<input value="发  送" type="button" class="btn_save" icon="icon_save" onclick="saveType(1)"/>
			<input value="保 存" type="button" class="btn_save" icon="icon_submit" onclick="saveType(0)"/>
		</div>
	</html:form>
</body>
</html:html>
