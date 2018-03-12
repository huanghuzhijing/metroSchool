<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>
<ex:bundle/>
<html:html>
<head>
<style>
    .hh{
    background-color:#E1F0F8;
    }
    .sp{
    color:blue;
    }
</style>
<script type="text/javascript">

function backToList(){
	var isHistory = "${isHistory}" ;
	if(isHistory != "Y"){
		location.href = '${ctx}/dtaqSituationAnalyseAction.do?method=list&situationAnalyseList_page=${situationAnalyseList_page}&qlineId=${param.qlineId}&qsectionId=${param.qsectionId}&qworkPointId=${param.qworkPointId}&qsafeState=${param.qsafeState}&qriskAttention=${param.qriskAttention}&qstartDate=${param.qstartDate}&qendDate=${param.qendDate}';
	}else{
		location.href = '${ctx}/dtaqSituationAnalyseSuggestAction.do?method=list&situationAnalyseList_page=${situationAnalyseList_page}&lineId=${lineId}&segmentId=${segmentId}&stationId=${stationId}&safeState=${safeState}&riskAttention=${riskAttention}&beginDate=${beginDate}&endDate=${endDate}';
	}
}

function validateSubmit(){
	var check_status = jQuery("[name='check_status']").val();
	var check_content = jQuery("[name='check_content']").val();
	
	if(check_status != 1){
		if(check_content == ""){
			alert("审批内容为必填项！");
			$("check_content").focus();
			return false;
		}
	}
	return true;
}

function changeCheckStatus(status){

	if(status == '1'){
	//	$("contentTr").style.display = "none";
		jQuery("#contentTr").hide();
	}else{
		jQuery("#contentTr").show();
	//	$("contentTr").style.display = "block";
	//	$("contentTr").value = "";
	}
}


</script>
</head>
<content tag="heading">安全形势分析室-审批</content>
<body>
	<fieldset>
	<legend><span class="sp">个人审批意见</span></legend>
<html:form enctype="multipart/form-data" action="dtaqSituationAnalyseAction.do" method="POST" >
	<html:hidden property="method" value="saveCheck"/>
	<html:hidden property="fid"/>
	<html:hidden property="check_emp" value="${check_emp}"/>
	<html:hidden property="check_date" value="${check_date}"/>
	
	
	<html:hidden property="qlineId" value="${param.qlineId}"/>
	<html:hidden property="qsectionId" value="${param.qsectionId}"/>
	<html:hidden property="qworkPointId" value="${param.qworkPointId}"/>
	<html:hidden property="qsafeState" value="${param.qsafeState}"/>
	<html:hidden property="qstartDate" value="${param.qstartDate}"/>
	<html:hidden property="qendDate" value="${param.qendDate}"/>
	<html:hidden property="qriskAttention" value="${param.qriskAttention}"/>
	
<c:if test="${checkList ne null}">
	<c:set value="0" var="index"></c:set>
	<c:set var="suggest" value="不同意" />
	<div id="tabContent">
		<table width="100%" cellpadding="0" cellspacing="0">
			<c:forEach items="${checkList}" var="situationAnalyseCheck">
				<c:if test="${situationAnalyseCheck.check_status eq 1}"><c:set var="suggest" value="同意" /></c:if>
				<c:if test="${index eq 0}">
					<tr>
						<td width="60%" class="opinion"><font color="#43484A"><span>●&nbsp; ${suggest}：${situationAnalyseCheck.check_content}</span></font></td>
						<td width="20%"><font color="#43484A"><span>审批人【<ex:userName id="${situationAnalyseCheck.check_emp}"/>】</span></font></td>
						<td width="20%"><font color="#43484A"><span><fmt:formatDate value="${situationAnalyseCheck.check_date}" pattern="yyyy-MM-dd HH:mm:ss"/></span></font></td>
					</tr>
				</c:if>
				<c:if test="${index ne 0}">
					<tr>
						<td width="60%" class="opinion"><font color="#43484A">●&nbsp; ${suggest}：${situationAnalyseCheck.check_content}</font></td>
						<td width="20%"><font color="#43484A">审批人【<ex:userName id="${situationAnalyseCheck.check_emp}"/>】</font></td>
						<td width="20%"><font color="#43484A"><fmt:formatDate value="${situationAnalyseCheck.check_date}" pattern="yyyy-MM-dd HH:mm:ss"/></font></td>
					</tr>
				</c:if>
				<c:set value="${index+1}" var="index"></c:set>
			</c:forEach>
		</table>
	</div>
</c:if>

<table  class="titleTable">
 	<COLGROUP>
        <COL class="tdLeftTwo" />
		<COL class="tdRightTwo" />
		<COL class="tdLeftTwo" />
		<COL class="tdRightTwo" />
   	</COLGROUP>
	<tr>
   		<td>审批意见：<span class="redSpan">*</span></td>
   		<td colspan="3">
   			<input type="radio" name="check_status" value="1" onclick="changeCheckStatus('1')"/>同意
			<input type="radio" name="check_status" value="2" onclick="changeCheckStatus('2')"/>不同意
   		</td>
   	</tr>
   	<tr id="contentTr" style="display:none">
   		<td>审批意见：<span class="redSpan">*</span></td>
   		<td colspan="3">
   			<html:textarea property="check_content" cols="80" rows="6" onblur="checkTextarea('check_content',4000)" onkeydown="textCounter('check_content','spanSummary',4000)" onkeyup="textCounter('check_content','spanSummary',4000)"/>
			<br><span class="req" id="spanSummary">4000字符以内! </span>
   		</td>
   	</tr>
   	<tr>
   		<td>审批人：<span class="noRedSpan">*</span></td>
   		<td><ex:employeeName id="${check_emp}"/></td>
   		<td>审批时间：<span class="noRedSpan">*</span></td>
   		<td><fmt:formatDate value="${check_date}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
   	</tr>
  </table>
  <div class="saveDiv">
	<input type="submit" value="${texts['button.save']}" class="saveButton" onclick="return validateSubmit()" icon="icon_save"/>&nbsp;&nbsp;
	<input type="button" value="${texts['button.back']}" class="backButton" onclick="backToList()" icon="icon_back"/><br>
 </div>
	
	
</html:form>
	</fieldset>
<fieldset>
	<legend><span class="sp">基本信息</span></legend>
	<table class="titleTable">
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
     	<td>编制日期 ：<span class="noRedSpan">*</span></td>
     	<td><fmt:formatDate value="${dtaqSituationAnalyse.weave_Date}" pattern="yyyy-MM-dd"/></td>
    </tr>
    <tr>
    	<td>施工方监测状态(动态抓取)：<span class="noRedSpan">*</span></td>
  		<td><html:text property="point_warn_count" value="${dtaqSituationAnalyse.point_warn_count}" readonly="true" styleClass="text" size="15" />(红:橙:黄:绿测点数)</td>
    	<td>第三方监测状态(动态抓取)：<span class="noRedSpan">*</span></td>
    	<td><html:text property="third_warn_count" value="${dtaqSituationAnalyse.third_warn_count}" readonly="true" styleClass="text" size="15" />(红:橙:黄:绿测点数)</td>
    </tr>
     <tr>
	      <td>施工进度：<span class="noRedSpan">*</span></td>
	      <td colspan="3">
				<html:textarea property="constprogress" value="${dtaqSituationAnalyse.constprogress}" readonly="true" rows="6" cols="80"/>
	      </td>
	</tr>
 	<tr>
	      <td>施工进度图片：<span class="noRedSpan">*</span></td>
	      <td colspan="3">
		      <c:if test="${dtaqSituationAnalyse.constprogressimageurl ne null}">
		      	<a href="${ctx}/dtaqSituationAnalyseAction.do?method=download&fid=${dtaqSituationAnalyse.fid}">[${dtaqSituationAnalyse.constprogressimageName}]</a>
		      </c:if>
	      </td>
	    </tr>
    <tr>
      <td>危险源预警信息：<span class="noRedSpan">*</span></td>
      <td colspan="3">
      	<html:textarea property="danger_warn" value="${dtaqSituationAnalyse.danger_warn}" readonly="true" rows="6" cols="80"/>
      </td>
    </tr>
    <tr>
      <td>安全隐患及整改措施(动态抓取)：<span class="noRedSpan">*</span></td>
      <td colspan="3">
      	<html:textarea property="safe_step" value="${dtaqSituationAnalyse.safe_step}" rows="6" cols="80" readonly="true"/>
      </td>
    </tr>
     <tr>
      <td>工点情况描述：<span class="noRedSpan">*</span></td>
      <td colspan="3">
      	<html:textarea property="situation_discription" value="${dtaqSituationAnalyse.situation_discription}" rows="6" cols="80" readonly="true"/>
      </td>
    </tr>
     <tr>
      <td>建议：<span class="noRedSpan">*</span></td>
      <td colspan="3">
      	<html:textarea property="suggestion" value="${dtaqSituationAnalyse.suggestion}" rows="6" cols="80" readonly="true"/>
      </td>
    </tr>
</table>
</fieldset>
<div class="hh">
<fieldset>
	<legend><span class="sp">工点监测安全状态分析(工点确定后,系统自动加载)</span></legend>
      <tr>
	     <td colspan="4" id="fckConTD">
	     	<c:out value='${dtaqSituationAnalyse.fckContent}' escapeXml="false"></c:out>
	     </td>
	    </tr>
<fieldset>	    
	<legend><span class="sp">安全风险评估及综合建议</span></legend>
      <tr>
	     <td colspan="4" id="fckTD" align="left">
	     	<c:out value='${fileContent}' escapeXml="false"></c:out>
	     </td>
	  </tr>
</fieldset>
</div>


<div class="saveDiv">
	<input type="button" value="<fmt:message key="button.back"/>" onclick="backToList()" class="backButton" icon="icon_back"/>
</div>

</body>
</html:html>