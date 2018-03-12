<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>
<ex:bundle/>
<html:html>
<head>
<title><fmt:message key="dtaq.pointType.title"/></title>
<content tag="heading"><fmt:message key="dtaq.pointType.title"/></content>
<script type="text/javascript">
function validateName(){
	var oldName = jQuery("[name='oldName']").val();
	var type_name = jQuery("[name='type_name']").val();
	var type_id = jQuery("[name='type_id']").val();
	if(type_id =="" || oldName != type_name){
		var url = "dtaqCheckpointTypeAction.do?method=validateEdit";
		var checkAjax = new Ajax.Request(url, {method:"post", parameters:"type_kind=${mianType.id}&type_name="+jQuery("[name='type_name']").val()+"&type_id="+jQuery("[name='type_id']").val(), onComplete:checkResponse});
	}
}

function saveInfo() {
	var type_name = jQuery("[name='type_name']").val();
	var abs_warning_value = jQuery("[name='abs_warning_value']").val();
	var errors = "";
	if(type_name == ""){
		errors += "监测类型名称为 必填项!";
	}
	if(abs_warning_value == ""){
		errors += "最大振速峰值 必填项!";
	}
	if(errors != ""){
		alert(errors);
	}else{
		submitForm("dtaqCheckpointTypeForm",null,true);
	}
}

function checkResponse(checkResponse){
	var resText = checkResponse.responseText;
	if(resText == "no"){
		alert("${texts['dtaq.pointType.exist_type']}");
		$("type_name").value = "";
		$("type_name").focus();
	}
}

function backToList() {
  var url="dtaqCheckpointTypeAction.do?type_kind=${mianType.id}&typeName="+jQuery("[name='typeName']").val()+"&dtaqCheckpointTypeList_page=${dtaqCheckpointTypeList_page}";
    document.forms[0].action=url;
	    document.forms[0].submit();
}
</script>
</head>
<body>
   <html:form action="dtaqCheckpointTypeAction.do？method=list">
  	    <input type="hidden" name="method" value="save">
	    <html:hidden property="type_id"/>
	    <html:hidden property="type_kind"/>
	    <html:hidden property="dtaqCheckpointTypeList_page" value="${dtaqCheckpointTypeList_page}"/>
	    <html:hidden property="typeName"/>
	    <html:hidden property="oldName" value="${dtaqCheckpointType.type_name}"/>
	    <html:hidden property="status"/>
		<html:hidden property="ts"/>
		<ex:formProperty name="type_kind" formName="dtaqCheckpointTypeForm" var="type_kind"/>
    <table width="100%" border="1" align="center" cellpadding="3" cellspacing="0" bordercolor="#808080" style="border-collapse: collapse">
	    <COLGROUP>
			<COL class="tr03" align="right" width="30%">
			<COL class="tr02" width="70%">
		</COLGROUP>
    		<tr>
             <td><fmt:message key="dtaq.pointType.bigtype_name"/></td>
             <td>${mianType.name}</td>
            </tr>
            <tr>
             <td><fmt:message key="dtaq.pointType.type_name"/><font color="red">*</font></td>
             <td><html:text property="type_name" styleClass="text" maxlength="50" onchange="validateName()"/></td>
            </tr>
           <tr>
           	 <td nowrap><fmt:message key="dtaq.pointType.type_value_5"/><font color="red">*</font></td>
             <td colspan="3"><ex:numberInput property="abs_warning_value" type="float" maxlength="10"/>
             <font color="blue">(单位：cm/s)</font></td>
           </tr>
         </table>
</html:form>
<div align="center">
	<html:button property="save" styleClass="saveButton" value="${texts['button.save']}" onclick="saveInfo()" />&nbsp;&nbsp;
  	<html:button property="back"  styleClass="backButton" value="${texts['button.back']}" onclick="backToList()" />
</div>
  </body>
</html:html>
