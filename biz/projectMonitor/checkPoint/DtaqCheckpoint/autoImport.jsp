<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle/>
<html>
<head>
<title>测点清单导入</title>
<content tag="heading">测点清单导入</content>
<script language="javascript">

function backToList() {
  location.href="${ctx}/dtaqCheckpointAction.do?method=index&qlineId=${qlineId}&qsectionId=${qsectionId}&organ_type=${organ_type}";
}
function importExcel(obj) {
	var filePath = /^[A-Z]:\\{1,2}[^/:\*\?<>\|]+\.[A-Z]{3}$/ig;
	var importFile = jQuery("[name='file']");
	if(filePath.test(importFile.val())==false){
		alert("导入文件未找到，请检查导入文件所在文件夹");
		importFile.focus();
		return false;
	}
	if(importFile.val().indexOf(".xls")==-1  && importFile.val().indexOf(".XLS")==-1){
		alert("导入文件必须为Excel，请重新选择！");
		importFile.focus();
		return false;
	}
	obj.disabled='disabled';
	obj.value = "测点清单正在导入,请稍后...";
	document.forms[0].action = '${ctx}/dtaqCheckpointAction.do?method=autoDoImport';
	document.forms[0].submit();
	buttonShow.style.display = "none";
}
</script>
</head>
<body>
<html:form action="dtaqCheckpointAction.do" enctype="multipart/form-data" method="post">
<input type="hidden" name="method" value="autoDoImport">
  <input type="hidden" name="qlineId" value="${qlineId}">
  <input type="hidden" name="qsectionId" value="${qsectionId}">
  <input type="hidden" name="station_id" value="${station_id}">
  <input type="hidden" name="station_state" value="${station_state}">
  <input type="hidden" name="type_id" value="${type_id}">
  <input type="hidden" name="part_id" value="${part_id}">
  <input type="hidden" name="forward" value="${forward}">
  <input type="hidden" name="organ_type" value="${organ_type}">
  <fieldset>
  <table class="formTable" >
		     <COLGROUP>
						<COL class="tdLeftTwo" />
						<COL class="tdRightTwo" />
						<COL class="tdLeftTwo" />
						<COL class="tdRightTwo" />
			</COLGROUP>
  	<tr>
      <td>线路:<span class="noRedSpan">*</span></td>
       <td><ex:lineId id="${qlineId}"/></td>
      <td>标段:<span class="noRedSpan">*</span></td>
      <td><ex:segmentId id="${qsectionId}"/></td>
    </tr>
    
    <tr>
      <td>测点excel文件清单<span class="redSpan">*</span></td>
      <td colspan="3">
        <html:file property="file" size="40" styleClass="text" /><font color="blue">(xls文件格式)</font>
        <a href="${ctx}/dtaqCheckpointAction.do?method=downloadTemplate&qsectionId=${qsectionId}&__skip__">测点导入事例下载</a>
      </td>
    </tr>
    
	<c:if test="${not empty errorInfos}">
    <tr>
      <td>
        <font color="red">错误消息</font>
      </td>
      <td colspan="3">
        <div><font color="red">
			<c:forEach items="${errorInfos}" var="error">
				<div>${error}</div>
			</c:forEach>
			</font>
        </div>
      </td>
    </tr>
	</c:if>
     
  </table>
  </fieldset>
   <div class="saveDiv" id="buttonShow" style="display: block">
    <input type="button" id="excelFile" class="saveButton" value="导入" onclick="importExcel(this)">
    <input type="button" class="backButton" value="${texts['button.back']}" onclick="backToList()">
   </div>  
</html:form>
</body>
</html>