<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>
<ex:bundle/>
<html>
<head>
<title>${texts['dtaq.projectMaterials.title=']}</title>
<content tag="heading">水土资料导入</content>
<script type="text/javascript" src="${ctx}/scripts/commons.js"></script>
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
			$("btnSave").value = "数据导入中，请稍后....";
	  		$("btnSave").disabled = true;
	  		var importType = '${importType}';
	  		if(importType == 'localStructure'){
	  			submitForm("localStructureForm",null,false);
	  		}else if(importType == 'launchingMethod'){
	  			submitForm("dtaqLaunchingMethodForm",null,false);
	  		}else if(importType == 'constructionMethod'){
	  			submitForm("dtaqConstructionMethodForm",null,false);
	  		}else if(importType == 'building'){
	  			submitForm("dtaqBuildingForm",null,false);
	  		}else if(importType == 'pipe'){
	  			submitForm("dtaqPipeForm",null,false);
	  		}
		}
	}
}
</script>
</head>
<body>
<c:choose>
	<c:when test="${importType == 'localStructure'}">
		<c:set value="localStructureAction.do" var="forwardObj" />
	</c:when>
	<c:when test="${importType == 'launchingMethod'}">
		<c:set value="dtaqLaunchingMethodAction.do" var="forwardObj" />
	</c:when>
	<c:when test="${importType == 'constructionMethod'}">
		<c:set value="dtaqConstructionMethodAction.do" var="forwardObj" />
	</c:when>
	<c:when test="${importType == 'building'}">
		<c:set value="dtaqBuildingAction.do" var="forwardObj" />
	</c:when>
	<c:when test="${importType == 'pipe'}">
		<c:set value="dtaqPipeAction.do" var="forwardObj" />
	</c:when>
</c:choose>
<html:form action="${forwardObj}" method="post" enctype="multipart/form-data">
<input type="hidden" name="method" value="doExcelImport">
<html:hidden property="station_id" value="${station_id}"/>
<html:hidden property="segment_id" value="${segment_id}"/>
<table class="form_table" bordercolorlight="#DDDDE0" bordercolordark="#ffffff"  width="100%" border="1" align="center" cellpadding="3" cellspacing="0" >
  	<COLGROUP>
		<COL class="tr03" align="right" width="30%">
		<COL class="tr02" width="70%">
	</COLGROUP>
<tr>
<td>请选择数据文件</td>
<td>
<input type="file" name="file" size="40" class="text"> &nbsp;&nbsp;<font color="blue">(导入说明：导入的文件格式必须为xls格式)</font>
</td>
</tr>
<c:if test="${not empty errors}">
    <tr>
      <td>
        <fmt:message key="error.title"/>
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
    <td colspan="2" align="center">
	    <input type="button" id="btnSave" class="button1" value="导入" onclick="doExcelImport()">&nbsp;&nbsp;
  		<input type="button" class="button1" value="${texts['button.back']}" onclick="location.href='${forwardObj}?method=list&station_id=${station_id}&segment_id=${segment_id}'">
    </td>
   </tr>
</table>
</html:form>
</body>
</html>