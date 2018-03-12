<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
<html:html>
<head>
	<script type="text/javascript">
	   $(document).ready(function(){
			//
			$("#btn_save").click(function(){
				var properties=new Array(); 
				properties[0]=["title","标题"];
				saveValidateRequired("#btn_save",properties,"oaInformAfficheForm");
			}); 
			//
			$("#btn_back").click(function(){ 
				document.forms[0].action='oaInformAfficheAction.do?method=list&staticOaInformCoteId=${param.staticOaInformCoteId}&ec_p=${param.ec_p}&ec_id=${oaInformAffiche.id}&ec_auditStatus=${oaInformAffiche.auditStatus}&ec_crd=${param.ec_crd}';   
	    		document.forms[0].submit(); 
			});  
			//
		});
	</script>
</head>
<content tag="heading">
内部信息
</content> 
<body>
	<html:form enctype="multipart/form-data" action="oaInformAfficheAction.do" method="POST">
		<input name="method" value="save" type="hidden" />
		<html:hidden property="id" />
		<html:hidden property="staticOaInformCoteId" value="${param.staticOaInformCoteId}"/>
		<!--查询定位 开始-->
		<html:hidden property="ec_p" />
		<html:hidden property="ec_id" value="${oaInformAffiche.id}"/>
		<html:hidden property="ec_auditStatus"  value="${oaInformAffiche.auditStatus}"/>
		<html:hidden property="qtitle" />
		<html:hidden property="qauditStatus"/>
		<html:hidden property="ec_crd" />
		<!--查询定位 结束-->
		<fieldset >
			<legend>内部信息-编辑</legend>
			<table class="formTable" >
					<COLGROUP>
						<COL class="tdLeftOneTwo" />
						<COL class="tdRightOneTwo" />
					</COLGROUP>
					<tr>
						<td >
							信息类型：<span class="noRedSpan">*</span>
						<br></td>
						<td >
							<html:text property="null"  readonly="true"  value="${oaInformCote.coteName}" styleClass="showText" maxlength="100" />
						<br></td>
					</tr>
					<tr>
						<td >
							标&nbsp;&nbsp;&nbsp;&nbsp;题：<span class="redSpan">*</span>
						<br></td>
						<td >
							<html:text property="title" styleClass="inputText" maxlength="100" size="50"/>
						<br></td>
					</tr>
					<tr>
						<td>
							内&nbsp;&nbsp;&nbsp;&nbsp;容：<span class="noRedSpan">*</span>
						<br></td>
						<td ><INPUT type="hidden" name="tempContent" value="${tempContent }" class="inputText"/>
							<IFRAME ID="eWebEditor1"  src="<%=request.getContextPath()%>/ewebeditor/ewebeditor.htm?id=tempContent&style=coolblue" 
							frameborder="0" scrolling="no" width="100%" height="350"></IFRAME>
						<br></td>
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
			<input id="btn_save" value="${texts['button.save']}" type="button" icon="icon_save"/>
			<input id="btn_back" value="${texts['button.back']}" type="button" icon="icon_back"/>
		</div>
	</html:form>
</body>
</html:html>
