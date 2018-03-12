<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>
<ex:bundle/>
<html:html>
<head>
<script type="text/javascript" src="${ctx}/scripts/public.js"></script>
<script type="text/javascript">
function backToList(){
	location.href="${ctx}/dtaqSituationAnalyseAction.do?method=list&dtaqSituationAnalyseList_page=${dtaqSituationAnalyseList_page}&qlineId=${param.qlineId}&qsectionId=${param.qsectionId}&qworkPointId=${param.qworkPointId}&qsafeState=${param.qsafeState}&qriskAttention=${param.qriskAttention}&qstartDate=${param.qstartDate}&qendDate=${param.qendDate}";
}

function validateSubmit(){
	var fileContent = document.getElementById("eWebEditor1").contentWindow.getHTML();
	if(fileContent == null || fileContent==''){
		alert("安全风险评估及综合建议 为必填项!");
	}else{
		//loadMessage("${texts['situation.analyse.save_data']}");
	 	submitForm("dtaqSituationSuggestForm",false,true);
	}
}
</script>
</head>
<content tag="heading">安全形势分析室</content>
<body>
<ex:tab id="info">
<ex:tabItem name="situationAnalyseItem" label="基本信息" url="${ctx}/dtaqSituationAnalyseAction.do?method=edit&fid=${dtaqSituationAnalyse.fid}&dtaqSituationAnalyseList_page=${dtaqSituationAnalyseList_page}&qlineId=${param.qlineId}&qsectionId=${param.qsectionId}&qworkPointId=${param.qworkPointId}&qsafeState=${param.qsafeState}&qriskAttention=${param.qriskAttention}&qstartDate=${param.qstartDate}&qendDate=${param.qendDate}" />
<ex:tabItem name="situationTableItem" label="安全状态分析" url="${ctx}/dtaqSituationAnalyseAction.do?method=editFCKContent&fid=${dtaqSituationAnalyse.fid}&dtaqSituationAnalyseList_page=${dtaqSituationAnalyseList_page}&qlineId=${param.qlineId}&qsectionId=${param.qsectionId}&qworkPointId=${param.qworkPointId}&qsafeState=${param.qsafeState}&qriskAttention=${param.qriskAttention}&qstartDate=${param.qstartDate}&qendDate=${param.qendDate}"/>
<ex:tabItem name="situationSuggestItem" label="评估及综合建议" selected="true">
<html:form action="dtaqSituationSuggestAction.do">
<input type="hidden" name="method" value="save"/>
<html:hidden property="id" value="${dtaqSituationSuggest.id}"/>
<html:hidden property="fid" value="${dtaqSituationAnalyse.fid}"/>
<html:hidden property="station_id" value="${dtaqSituationAnalyse.station_id.station_id}"/>
<!--<html:hidden property="record_date" value="${dtaqSituationAnalyse.record_date}"/>-->
<html:hidden property="dtaqSituationAnalyseList_page" value="${dtaqSituationAnalyseList_page}"/>
<html:hidden property="lineId" value="${lineId}"/>
<html:hidden property="segmentId" value="${segmentId}"/>
<html:hidden property="stationId" value="${stationId}"/>
<html:hidden property="safeState" value="${safeState}"/>
<html:hidden property="riskAttention" value="${riskAttention}"/>
<html:hidden property="beginDate" value="${beginDate}"/>
<html:hidden property="endDate" value="${endDate}"/>

<html:hidden property="qlineId" value="${param.qlineId}"/>
<html:hidden property="qsectionId" value="${param.qsectionId}"/>
<html:hidden property="qworkPointId" value="${param.qworkPointId}"/>
<html:hidden property="qsafeState" value="${param.qsafeState}"/>
<html:hidden property="qstartDate" value="${param.qstartDate}"/>
<html:hidden property="qendDate" value="${param.qendDate}"/>
<html:hidden property="qriskAttention" value="${param.qriskAttention}"/>
	
<fieldset>
<legend>评估及综合建议</legend>
<table class="formTable">
       <COLGROUP>
        <COL class="tdLeftTwo" />
		<COL class="tdRightTwo" />
		<COL class="tdLeftTwo" />
		<COL class="tdRightTwo" />
   	</COLGROUP>
	<tr>
	  <td>填报日期：<span class="redSpan">*</span></td>
	  <td><fmt:formatDate value="${dtaqSituationAnalyse.record_date}" pattern="yyyy-MM-dd"/></td>
      <td>线路：<span class="redSpan">*</span></td>
      <td>${dtaqSituationAnalyse.line_id.line_name}</td>
     
    </tr>
    <tr>
     	<td>标段：<span class="redSpan">*</span></td>
     	<td>${dtaqSituationAnalyse.segment_id.segment_name}</td>
     	<td>车站/区间：<span class="redSpan">*</span></td>
     	<td>${dtaqSituationAnalyse.station_id.station_name}</td>
    </tr>
    <tr>
     	<td>工程安全风险状态：<span class="redSpan">*</span></td>
     	<td>
     		<ex:dicDisplay dictIdentify="AnalyseSafeState" dictValue="${dtaqSituationAnalyse.safe_state}"/> 
     	</td>
     	<td>是否重点关注：<span class="redSpan">*</span></td>
     	<td>
     		<ex:dicDisplay dictIdentify="RiskAttention" dictValue="${dtaqSituationAnalyse.risk_attention}"/> 
     	</td>
    </tr>
    <tr>
     	<td>编制人：<span class="noRedSpan">*</span></td>
     	<td><ex:employeeName id="${dtaqSituationAnalyse.weave_author}"/></td>
     	<td>编制日期：<span class="noRedSpan">*</span></td>
     	<td><fmt:formatDate value="${dtaqSituationAnalyse.weave_Date}" pattern="yyyy-MM-dd"/></td>
    </tr>
    </table>
    </fieldset>
    <fieldset>
<legend>安全风险评估及综合建议<span style="color:Red">（编制过程中,请注意标点符号,建议使用半角输入法.）</span></legend>
<table class="formTable">
      <tr>
	     <td colspan="4" id="fckTD">
	     	<input type="hidden" name="fileContent" value="${fileContent}">
    		<iframe ID="eWebEditor1" src="ewebeditor/ewebeditor.htm?id=fileContent&style=coolblue" frameborder="0" scrolling="no" width="100%" HEIGHT="600"></iframe>
	     </td>
	  </tr>
 </table>
</fieldset>
		<div class="saveDiv">
			<input type="submit" value="<fmt:message key="button.save"/>" class="saveButton" icon="icon_save"/>&nbsp;&nbsp;
<!--			<input type="button" value="<fmt:message key="button.save"/>" class="saveButton" onclick="validateSubmit()"/>&nbsp;&nbsp;-->
			<input type="button" value="<fmt:message key="button.back"/>" onclick="backToList()" class="backButton" icon="icon_back"/>
		</div>
</html:form>
</ex:tabItem>
</ex:tab>
</body>
</html:html>