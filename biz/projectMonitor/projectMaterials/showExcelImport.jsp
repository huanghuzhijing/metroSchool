<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>
<ex:bundle/>
<html>
<head>

<content tag="heading">
<c:if test="${importType == 'stratumRock'}">
	地层岩性性能表
</c:if>
<c:if test="${importType == 'undergroundPipeline'}">
	周边地下管线信息
</c:if>
<c:if test="${importType == 'peripheralBuilding'}">
	周边建筑物资料信息
</c:if>

</content>
<script language="javascript">
function doExcelImport() {
     var file= $("[name='file']").val();	
	 var importType = '${importType}';
	if(file=null||file==""){
   alert("请选择xls文件再进行导入!");
		}else{
	  		if(importType == 'stratumRock'){
	  			document.forms["stratumRockForm"].submit();
	  		}else if(importType == 'undergroundPipeline'){
	  		//var url='undergroundPipelineAction.do?method=edit&materials_id=${materials_id}&materials_type=${materials_type}&flagPage=${flagPage}&file='+$("[name=file]").attr("value");
	  		document.forms["undergroundPipelineForm"].submit();
	  		//	location.href=url;
	  		}else if(importType  == 'peripheralBuilding'){
	  			document.forms["peripheralBuildingForm"].submit();
	  		}

		}
}
</script>
</head>
<body>
<c:if test="${importType == 'stratumRock'}">
	<c:set value="stratumRockAction.do" var="forwardObj" />
</c:if>
<c:if test="${importType == 'undergroundPipeline'}">
	<c:set value="undergroundPipelineAction.do" var="forwardObj" />
</c:if>
<c:if test="${importType == 'peripheralBuilding'}">
	<c:set value="peripheralBuildingAction.do" var="forwardObj" />
</c:if>
<html:form action="${forwardObj}" method="post" enctype="multipart/form-data">
<input type="hidden" name="method" value="doExcelImport">
<html:hidden property="materials_id" value="${materials_id}"/>
<html:hidden property="materials_type" value="${materials_type}"/>
<html:hidden property="flagPage" value="${flagPage}"/>
<html:hidden property="lineId" value="${lineId}"/>
<html:hidden property="segmentId" value="${segmentId}"/>
<html:hidden property="station_id" value="${station_id}"/>
<html:hidden property="station_state" value="${station_state}"/>
<html:hidden property="station_type" value="${station_type}"/>
<html:hidden property="startDate" value="${startDate}"/>
<html:hidden property="endDate" value="${endDate}"/>
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
	<tr>
    <td colspan="2" align="center">
    <div class="saveDiv">
	    <input type="button" id="btnSave" class="button1" icon="icon_add" value="导 入" onclick="doExcelImport()">&nbsp;&nbsp;
  		<input type="button" class="button1" value="返 回" icon="icon_back" onclick="location.href='projectMaterialsAction.do?method=exSuccess&flagPage=${flagPage }&materials_id=${materials_id}&materials_type=${materials_type}&lineId=${lineId}&segmentId=${segmentId}&stationId=${stationId}&station_state=${station_state}&station_type=${station_type}&startDate=${startDate}&endDate=${endDate}'">
    </div>
    </td>
   </tr>
</table>
</html:form>
</body>
</html>