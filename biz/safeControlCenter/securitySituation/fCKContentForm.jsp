<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>
<ex:bundle/>
<html:html>
<head>
<script type="text/javascript" src="${ctx}/scripts/public.js"></script>
<script type="text/javascript">
//根据返回值在页面提示
var returnVal1 = "";
returnVal1='${returnVal1}';
if(returnVal1=='0'){
	alert('保存成功，接口数据上传成功');
}else if(returnVal1=='1'){
    alert('保存成功，接口数据上传失败，用户名密码错误');
}else if(returnVal1=='2'){
    alert('保存成功，接口数据上传失败，指定的工点和日期已上报');
}else if(returnVal1=='3'){
    alert('保存成功，接口数据上传失败，格式错误或服务端异常');
}else if(returnVal1=='4'){
    alert('保存成功，接口数据上传失败，工点编码不存在或不匹配');
}else if(returnVal1=='5'){
    alert('保存成功，接口数据上传失败，未能找到安全形势报告，请先确认页面一上传成功');
}else if(returnVal1=='6'){
    alert('保存成功，接口数据上传失败，施工进度图，施工进度模型上传异常');
}else if(returnVal1=='7'){
    alert('保存成功，接口数据上传失败，用户验证异常');
}

function backToList(){
	location.href="${ctx}/dtaqSituationAnalyseAction.do?method=list&situationAnalyseList_page=${situationAnalyseList_page}&qlineId=${param.qlineId}&qsectionId=${param.qsectionId}&qworkPointId=${param.qworkPointId}&qsafeState=${param.qsafeState}&qriskAttention=${param.qriskAttention}&qstartDate=${param.qstartDate}&qendDate=${param.qendDate}";
}

function validateSubmit(){
	//loadMessage("${texts['situation.analyse.save_data']}");
	submitForm("dtaqSituationAnalyseForm",false,true);
}

//如果数据库fckContent没数据
function init(){
	var fckContent =jQuery("[name='hasContent']").val();
	if(fckContent == null || fckContent==''){
		//loadMessage("${texts['situation.analyse.load_data']}");
		$.ajax({
			type: "POST",
			url: "${ctx}/dtaqSituationAnalyseAction.do?method=queryFCKTableContent",
			data: "station_id="+jQuery("[name='station_id']").val()+"&recordDate="+jQuery("[name='record_date']").val()+"&safeAnId=${situationAnalyse.safeAnId}",
			success: function(msg){
				responseFCKTableContent(msg);
			}
		});
		
		
	    //var url = "${ctx}/dtaqSituationAnalyseAction.do?method=queryFCKTableContent";
		//var myajax = new Ajax.Request(url, {method:"post", parameters:"station_id="+jQuery("[name='station_id']").val()+"&recordDate="+jQuery("[name='record_date']").val()+"&safeAnId=${situationAnalyse.safeAnId}", onComplete:responseFCKTableContent});
	}
}

function responseFCKTableContent(selRequest){
	var ajaxResponse = selRequest;
	document.getElementById("eWebEditor1").contentWindow.setHTML(ajaxResponse);
	closeLayer();
}
</script>
</head>
<content tag="heading">安全形势分析室</content>
<body onload="init()">
<ex:tab id="info">
<ex:tabItem name="situationAnalyseItem" label="基本信息" url="${ctx}/dtaqSituationAnalyseAction.do?method=edit&fid=${dtaqSituationAnalyse.fid}&situationAnalyseList_page=${situationAnalyseList_page}&qlineId=${param.qlineId}&qsectionId=${param.qsectionId}&qworkPointId=${param.qworkPointId}&qsafeState=${param.qsafeState}&qriskAttention=${param.qriskAttention}&qstartDate=${param.qstartDate}&qendDate=${param.qendDate}" />
<ex:tabItem name="situationTableItem" label="安全状态分析" selected="true">
<html:form action="dtaqSituationAnalyseAction.do">
<html:hidden property="method" value="saveFCKContent"/>
<html:hidden property="fid" value="${dtaqSituationAnalyse.fid}"/>

<html:hidden property="qlineId" value="${param.qlineId}"/>
<html:hidden property="qsectionId" value="${param.qsectionId}"/>
<html:hidden property="qworkPointId" value="${param.qworkPointId}"/>
<html:hidden property="qsafeState" value="${param.qsafeState}"/>
<html:hidden property="qstartDate" value="${param.qstartDate}"/>
<html:hidden property="qendDate" value="${param.qendDate}"/>
<html:hidden property="qriskAttention" value="${param.qriskAttention}"/>

<input type="hidden" name=hasContent value="${hasContent}">
<input type="hidden" name="station_id" value="${dtaqSituationAnalyse.station_id.station_id}">
<input type="hidden" name="record_date" value="<fmt:formatDate value='${dtaqSituationAnalyse.record_date}' pattern='yyyy-MM-dd'/>">

<fieldset>
<legend>安全状态分析</legend>
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
    <legend>工点监测安全状态分析(工点确定后,系统自动加载)</legend>
   <table class="formTable">
  
      <tr>
     <td colspan="2" id="fckConTD">
     	<input type="hidden" name="fckContent" value="${fckContent}">
    	<iframe id="eWebEditor1" src="ewebeditor/ewebeditor.htm?id=fckContent&style=coolblue" frameborder="0" scrolling="no" width="100%" HEIGHT="600"></iframe>
<%--      	<FCK:editor id="fckContent" width="100%" height="500" toolbarSet = "text">${situationAnalyse.fckContent}</FCK:editor>--%>
     </td>
    </tr>
</table>
</fieldset>
	<div  class="saveDiv">
		<input type="submit" value="<fmt:message key="button.save"/>" class="saveButton" icon="icon_save"/>&nbsp;&nbsp;
		<input type="button" value="<fmt:message key="button.back"/>" onclick="backToList()" class="backButton" icon="icon_back"/>
	</div>
</html:form>
</ex:tabItem>
<ex:tabItem name="situationSuggestItem" label="评估及综合建议" url="${ctx}/dtaqSituationSuggestAction.do?method=edit&fid=${dtaqSituationAnalyse.fid}&situationAnalyseList_page=${situationAnalyseList_page}&qlineId=${param.qlineId}&qsectionId=${param.qsectionId}&qworkPointId=${param.qworkPointId}&qsafeState=${param.qsafeState}&qriskAttention=${param.qriskAttention}&qstartDate=${param.qstartDate}&qendDate=${param.qendDate}"/>
</ex:tab>
</body>
</html:html>