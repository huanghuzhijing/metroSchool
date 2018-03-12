<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>
<ex:bundle/>
<html>
<head>
<title>工程监测数据导入</title>
<content tag="heading">工程监测数据导入</content>
<link rel="StyleSheet" href="${ctx}/scripts/warnColor.css" type="text/css" />
<script src="${ctx}/scripts/commons.js" type="text/javascript"></script>
<script src="${ctx}/scripts/public.js" type="text/javascript"></script>

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
			loadMessage("数据导入中，请稍后");
			submitForm("dtaqDataForm",null,false);
		}
	}
}

function backToList() {
  location.href="${ctx}/dtaqDataAction.do?method=list&info_id=${info_id}&part_id=${part_id}";
}
</script>
</head>
<body>
<html:form action="dtaqDataAction.do" method="post" enctype="multipart/form-data">
<input type="hidden" name="method" value="doExcelImport">
<html:hidden property="info_id" value="${info_id}"/>
<html:hidden property="part_id" value="${part_id}"/>
<html:hidden property="noPart" value="${noPart}"/>
<html:hidden property="type_kind" value="${type_kind}"/>
 <fieldset>
  <legend>工程监测数据导入</legend>
  <table class="formTable" >
		     <COLGROUP>
						<COL class="tdLeftTwo" />
						<COL class="tdRightTwo" />
						<COL class="tdLeftTwo" />
						<COL class="tdRightTwo" />
			</COLGROUP>
<tr>
<td>请选择数据文件</td>
<td>
<input type="file" name="file" size="40" class="text"> &nbsp;&nbsp;<font class="memo_font">(导入说明：导入的文件格式必须为xls格式)</font>
</td>
</tr>
<c:if test="${not empty errorInfos}">
    <tr>
      <td>
        错误信息
      </td>
      <td>
        <div style="width:100%;overflow:auto">
			<c:forEach items="${errorInfos}" var="error">
			<div>
			${error}
			</div>
			</c:forEach>
        </div>
      </td>
    </tr>
	</c:if>
</table>
</fieldset>
	 <div class="saveDiv">
	    <input type="button" id="btnSave" class="button1" value="导 入" onclick="doExcelImport()">
  		<input type="button" class="button1" value="返 回" onclick="backToList()">
   </div>
</html:form>
<div id="massage_box"><div class="header" id="messageDiv" align="left"></div></div>  
<div id="mask"></div>
</body>
</html>