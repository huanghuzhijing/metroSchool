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
		location.href = '${ctx}/dtaqSituationSuggestAction.do?method=list&situationAnalyseList_page=${situationAnalyseList_page}&lineId=${lineId}&segmentId=${segmentId}&stationId=${stationId}&safeState=${safeState}&riskAttention=${riskAttention}&beginDate=${beginDate}&endDate=${endDate}';
	}
}
</script>
</head>
<content tag="heading">安全形势分析室-详细</content>
<body>
<html:form enctype="multipart/form-data" action="dtaqSituationAnalyseAction.do" method="POST" >
	<html:hidden property="fid"/>
	<html:hidden property="qlineId" value="${param.qlineId}"/>
	<html:hidden property="qsectionId" value="${param.qsectionId}"/>
	<html:hidden property="qworkPointId" value="${param.qworkPointId}"/>
	<html:hidden property="qsafeState" value="${param.qsafeState}"/>
	<html:hidden property="qstartDate" value="${param.qstartDate}"/>
	<html:hidden property="qendDate" value="${param.qendDate}"/>
	<html:hidden property="qriskAttention" value="${param.qriskAttention}"/>
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
     	<td>编制日期：<span class="noRedSpan">*</span></td>
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
<c:if test="${dtaqSituationCheck != null}">
	<div align="right">
		<font color="#30495C" size="2"><strong>【<fmt:message key="situation.analyse.check_emp" />：<ex:userName id="${dtaqSituationCheck.check_emp}"/>&nbsp;&nbsp;<fmt:message key="situation.analyse.check_date" />：<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${dtaqSituationCheck.check_date}"/>】&nbsp;&nbsp;</strong></font>
	</div>
</c:if>
</html:form>
<c:if test="${historys ne null}">
	<table class="def_table" id="fileTable" width="100%" border="0" cellpadding="0" cellspacing="1" align="center">
	<thead>
	<tr>
		<th colspan="6" height="25"><span class="formTitle">批阅历史记录</span></th>
	</tr>
	<tr align="center"  height="25" id="trSite">
		<th width="10%">序号</th>
		<th width="15%">车站/区间</th>
		<th width="12%">批阅人</th>
		<th width="15%">批阅部门</th>
		<th width="18%">批阅时间</th>
		<th width="30%">批阅意见</th>
	</tr>
	</thead>
	<logic:iterate id="history" name="historys" indexId="count">
		<tr align="center" height="20" bgcolor="#C6DFF7">
			<td>${count+1}</td>
			<td>
				${history.station_id.station_name}
			</td>
			<td><ex:userName id='${history.signer}'/></td>
			<td><ex:orgDisplay id="${history.deptid}"/></td>
			<td>r<fmt:formatDate value="${history.signdate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
			<td class="opinion">${history.opinion}</td>
		</tr>
	</logic:iterate>
	</table>
</c:if>



<div class="saveDiv">
	<input type="button" value="<fmt:message key="button.back"/>" onclick="backToList()" class="backButton" icon="icon_back"/>
</div>

</body>
</html:html>