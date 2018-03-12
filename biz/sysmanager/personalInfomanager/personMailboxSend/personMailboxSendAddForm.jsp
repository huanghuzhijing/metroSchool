<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
<html:html>
<head>
	<script type="text/javascript">
	//加载
	$(document).ready(function(){
		if('${flag}'==5){
			$(".btn_submit").show();
		}else{
			$(".btn_submit").hide();
		}
		//
		$("#btnSel").click(function(){ 
			var url = "employeeAction.do?method=selectListForPersonMailboxSend";
			art.dialog({id:'commonDialog1',title:'个人邮箱选择收件人', iframe:url, width:'600', height:'410',top:'110'});			
		});
		//
		$(".btn_save").click(function(){
			document.forms[0].action='personMailboxSendAction.do?method=savaorsend';
			$("[name='sendflag']").val(1);
			var properties=new Array(); 
			properties[0]=["receiveperson","收件人"];
			properties[1]=["title","标题"];
			properties[2]=["isornoimport","是否为重要邮件"];
			saveValidateRequired(".btn_save",properties,"personMailboxSendForm");
		});
		//
		$(".btn_submit").click(function(){
			document.forms[0].action='personMailboxSendAction.do?method=saveDraft';
			var properties=new Array(); 
			properties[0]=["receiveperson","收件人"];
			properties[1]=["title","标题"];
			properties[2]=["isornoimport","是否为重要邮件"];
			saveValidateRequired(".btn_submit",properties,"personMailboxSendForm");
		});
		//
		$(".btn_back").click(function(){
			history.back(-1);
		});
		//
	});
	//
	function savecheck(flag){
	 	document.getElementById("sendflag").value="0";
		submitForm("personMailboxSendForm",false,true);
	}
	//
 	function tore(){
    	parent.Links.location.reload();   
  	}
	//
	function setParamValue(empIds,empNames){
		$("[name='receiveperson']").val(empIds);
		$("[name='receiveperson_name']").val(formatStringComma(empNames));
	}	
</script>
</head>
	<content tag="heading">信件信息</content>
<body>
	<!-- 注意验证的大写和小写是两种不同的表现形式 -->
	<html:form enctype="multipart/form-data" action="personMailboxSendAction.do?method=savaorsend" method="POST" >
		<div>
			<html:hidden property="id" />
			<html:hidden property="flag" value="${flag}" />
			<html:hidden property="sendflag" />
			<html:hidden property="receive_ids" />
			<html:hidden property="receive_names" />
			<html:hidden property="receiveid" value="${receiveid}"/>
			<html:hidden property="ec_crd" />
		</div>
 <fieldset >
			<legend>写信</legend>
			<div class="saveDiv">
			         <input value="发  送" type="button" class="btn_save" icon="icon_save"/>
			         <input value="保存到草稿箱" type="button" class="btn_submit" icon="icon_submit"/>
			         <input value="${texts['button.back']}" type="button" class="btn_back" icon="icon_back"/>
			</div>
					<table class="formTable">
						<COLGROUP>
							<COL class="tdLeftOneTwo" />
							<COL class="tdRightOneTwo" />
						</COLGROUP>
						<tr>
							<td>
								收&nbsp;&nbsp;件&nbsp;&nbsp;人：<span class="redSpan">*</span>
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
								标&nbsp;&nbsp;&nbsp;&nbsp;题：<span class="redSpan">*</span>
							</td>
							<td colspan="3">
								<html:text property="title" value="${title}" size="80" styleClass="inputText" maxlength="50" />
							</td>
						</tr>
						<tr>
						<td>
								内&nbsp;&nbsp;&nbsp;&nbsp;容：<span class="noRedSpan">*</span>
							</td>
							<td colspan="3">
								<INPUT type="hidden" name="content" value="${content}" class="inputText"/>
								<IFRAME ID="eWebEditor1"  src="<%=request.getContextPath()%>/ewebeditor/ewebeditor.htm?id=content&style=coolblue" frameborder="0" scrolling="no" width="100%" height="350"></IFRAME>
							</td>
						</tr>
						<tr>
							<td>
								重要邮件：<span class="redSpan">*</span>
							</td>
							<td colspan="3">
								<ex:dictSelect property="isornoimport" type="IsOrNoImportMail" showSelect="false"/>
							</td>
						</tr>
						<tr>
							<td>
								短信提醒：<span class="noRedSpan">*</span>
							</td>
							<td colspan="3">
								<ex:dictSelect property="ifSms" type="YesOrNo" showSelect="false"/>
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
			<input value="发  送" type="button" class="btn_save" icon="icon_save"/>
			<input value="保存到草稿箱" type="button" class="btn_submit" icon="icon_submit"/>
			<input value="${texts['button.back']}" type="button" class="btn_back" icon="icon_back"/>
		</div>
	</html:form>
</body>
</html:html>
