<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>
<ex:bundle/>
<html>
<head>
<title>${texts['dtaq.projectMaterials.title=']}</title>
<content tag="heading">工点进度管理</content>
<script language="javascript">
function doExcelImport() {
	var filename = jQuery("[name='file']").val();
	var filePath = /^[A-Z]:\\{1,2}[^/:\*\?<>\|]+\.[A-Z]{3}$/ig;
	if(filename == null || filename == ""){
		alert("请选择xls文件再进行上传");
	}
	else if(filePath.test(filename)==false){
		alert("该文件未找到，请检查导入文件所在文件夹");
	}
	else{
		var fileType = filename.substring(filename.lastIndexOf(".")+1).toLowerCase();
		if(fileType != "xls"){
			alert("请选择xls文件进行上传");
		}else{
			$("#btnSave").val("数据导入中，请稍后....");
	  		$("#btnSave").attr("disabled",true);
	  		var importType = '${importType}';
	  		var properties=new Array(); 
			
			saveValidateRequired("#btnSave",properties,"dtaqScheduleForm");
		}
	}
}
</script>
</head>
<body>
<html:form action="dtaqScheduleAction.do" method="post" enctype="multipart/form-data">
<input type="hidden" name="method" value="doExcelImport">
<html:hidden property="station_id" value="${param.stationId}"/>
  <html:text property="stationId"/>
	      <html:hidden property="qstartDate"/>
	      <html:hidden property="qendDate"/>
<html:hidden property="segment_id" value="${segment_id}"/>
<fieldset>
<legend>文件上传</legend>
<table class="formTable" >
  	<COLGROUP>
		<COL class="tr03" align="right" width="30%">
		<COL class="tr02" width="70%">
	</COLGROUP>
<tr>
<td>选择文件：</td>
<td>
<input type="file" name="file" size="40" class="text"> &nbsp;&nbsp;<font color="blue">(导入说明：导入的文件格式必须为xls格式)</font>
</td>
</tr>
<c:if test="${not empty errors}">
    <tr>
      <td>
        错误信息:
      </td>
      <td>
        <div style="width:100%;overflow:auto">
			<c:forEach items="${errors}" var="error">
			<div>
			${error}
			</div>
			</c:forEach>
        </div>
      </td>
    </tr>
	</c:if>
	<tr>
   
   </tr>
  
</table>
</fieldset>
 <div class="saveDiv">
   <input type="button" id="btnSave" class="button1" value="导入文件" onclick="doExcelImport()">&nbsp;&nbsp;
  		<input type="button" class="button1" value="${texts['button.back']}" onclick="location.href='${ctx}/dtaqScheduleAction.do?method=list&station_id=${station_id}&segment_id=${segment_id}'">
   </div>
</html:form>
</body>
</html>