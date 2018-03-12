<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>

<ex:bundle/>
<html:html>
<head>
<title><fmt:message key="patrol.title" /></title>
<content tag="heading">水土资料</content>
<script src="<c:url value="/scripts/public.js"/>" type="text/javascript"></script>
<script type="text/javascript">

jQuery(document).ready(function(){
})

function savePatrol(id) {
	var res = '';
	var name = jQuery("[name='name']").val();
	var file = jQuery("[name='file']").val();
	if(id==''){
		if(file==null || file ==''){
			res+='上传附件 为必填项\n';
		}else{
			var filePath = /^[A-Z]:\\{1,2}[^/:\*\?<>\|]+\.[A-Z]{3}$/ig;
			var importFile = $("file");
			if(importFile.value!=null && importFile.value!=''){
				if(filePath.test(importFile.value)==false){
					alert("附件文件未找到，请检查附件文件所在文件夹\n");
					importFile.focus();
					return false;
				}
			}
		}
	}else{
		if(file!=null && file !=''){
			var filePath = /^[A-Z]:\\{1,2}[^/:\*\?<>\|]+\.[A-Z]{3}$/ig;
			var importFile = $("file");
			if(importFile.value!=null && importFile.value!=''){
				if(filePath.test(importFile.value)==false){
					alert("附件文件未找到，请检查附件文件所在文件夹\n");
					importFile.focus();
					return false;
				}
			}
		}
	}
	
	document.forms[0].submit();
	alert("保存成功!");
	parent.parent.art.dialog({id:'layerInfo'}).close();
}

</script>
</head>
<body>
<html:form action="dtaqKimoliteAction.do" method="POST" enctype="multipart/form-data" styleClass="form">
<input type="hidden" name="method" value="save"/>
<html:hidden property="kimolite_id" value="${dtaqKimolite.kimolite_id}"/>
<html:hidden property="status"/>
<html:hidden property="ts"/>
<!--<html:hidden property="attach_name"/>-->
<!--<html:hidden property="attach_address"/>-->
<html:hidden property="station_id" value="${station.station_id}"/>
<table class="listTable" bordercolorlight="#DDDDE0" bordercolordark="#ffffff" width="100%" border="1" align="center" cellpadding="3" cellspacing="0">
	<COLGROUP>
		<COL class="tr03" align="right" width="20%">
		<COL class="tr02" width="30%">
		<COL class="tr03" align="right" width="20%">
		<COL class="tr02" width="30%">
	</COLGROUP>
	
    <tr>
      <td>上传附件&nbsp;<font color="red">*</font></td>
      <td colspan="3"><html:file property="file"  styleClass="text" size="30"/>&nbsp;&nbsp;
	      <c:if test="${dtaqKimolite.attach_address ne null}">
	      	<font color="red"><a href="${ctx}/dtaqKimoliteAction.do?method=download&id=${dtaqKimolite.kimolite_id}">${dtaqKimolite.attach_name}</a>&nbsp;&nbsp;下载</font>
	      </c:if>
      </td>
    </tr>
    <td colspan="4" id="fckConTD">
     	<input type="hidden" name="content" value='${content}'>
    	<iframe id="eWebEditor1" src="ewebeditor/ewebeditor.htm?id=content&style=coolblue" frameborder="0" scrolling="no" width="100%" HEIGHT="480"></iframe>
     </td>
</table>
<div class="saveDiv">
<input type="button" value="<fmt:message key="button.save"/>" class="saveButton" onclick="savePatrol('${dtaqKimolite.kimolite_id}')"/>
<!--&nbsp;<input type="button" value="<fmt:message key="button.back"/>" onclick="javascript:history.back()" class="backButton" />-->
</div>
</html:form>
</body>
</html:html>