<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>
<ex:bundle/>
<html>
<head>
<content tag="heading">监测超限填报记录</content>
<script src="<c:url value="/scripts/public.js"/>" type="text/javascript"></script>
<script language="javascript">
function saveInfo() {
  submitForm("dtaqWarnInfoForm",null,true);
}

function backToList() {
  location.href='dtaqWarnInfoAction.do?method=list&ec_id=${param.info_id}&ec_p=${param.ec_p}&ec_crd=${param.ec_crd}&qlineId=${param.qlineId}&qsegmentId=${param.qsegmentId}&qstationId=${param.qstationId}&qtypeId=${param.qtypeId}&qorganType=${param.qorganType}&qstartDate=${param.qstartDate}&qendDate=${param.qendDate}';
}

function viewDetails(part_id,info_id) {
  var url = "dtaqWarnInfoAction.do?method=viewDetails&part_id="+part_id+"&info_id="+info_id;
  art.dialog({id:'viewDetail',title:'数据明细', iframe:url, width:'800', height:'400',top:'10'});
}

function viewTimes(part_id,info_id) {
  var url = "dtaqWarnInfoAction.do?method=viewTimesF&__skip__&part_id="+part_id+"&info_id="+info_id;
  art.dialog({title:'数据曲线', iframe:url, width:'700', height:'400',top:'100'});
}

function viewRealtime(part_id,info_id) {
  var url = "dtaqWarnInfoAction.do?method=viewRealtimeF&__skip__&part_id="+part_id+"&info_id="+info_id;
  art.dialog({title:'数据曲线', iframe:url, width:'700', height:'400',top:'100'});
}

function showReason(data_id,part_id,info_id) {
  var url = "dtaqWarnInfoAction.do?method=showReason&operate_mode=${operate_mode}&data_id="+data_id+"&part_id="+part_id+"&info_id="+info_id;
  art.dialog({id:'showReason',title:'原因分析', iframe:url, width:'460', height:'260',top:'10'});
}



//测点部位的时序曲线
	function showPartTimes(type_kind,part_id) {
		  var url ="${ctx}/dtaqDataInfoQuery3Action.do?method=showPartTimes&part_id="+part_id+"&type_kind="+type_kind+"&qstartDate=${startDate}&qendDate=${endDate}";
		  if(type_kind == "3"){
		  		url ="${ctx}/dtaqDataInfoQuery3Action.do?method=showPartTimes3&part_id="+part_id+"&type_kind="+type_kind+"&qstartedDate=${beginWeekDate}&qendedDate=${endDate}";
		  }
		  art.dialog({id:'commonDialog1',title:'时序曲线', iframe:url, width:'800', height:'440',top:'10'});
	}
</script>
</head>
<body>
<c:set var="tabDisabled" value="false"/>
<c:if test="${dataInfo.warnInfo==null}">
<c:set var="tabDisabled" value="true"/>
</c:if>
<html:form action="dtaqWarnInfoAction.do">
<html:hidden property="info_id"/>
 <fieldset style="margin:10">
         <legend><strong>警情基本信息</strong></legend>

	
    <table class="formTable"  >
         	<COLGROUP>
     <COL class="tdLeftTwo">
            <COL class="tdRightTwo">
            <COL class="tdLeftTwo">
            <COL class="tdRightTwo">
    </COLGROUP>
<tr>
<td>测点类型:<span class="noRedSpan">*</span></td>
<td colspan="3">${dtaqDataInfo.type_id.type_name}</td>
</tr>
<tr>
  <td>标段名称:<span class="noRedSpan">*</span></td>
  <td>${dtaqDataInfo.segment_id.segment_name}</td>
  <td>车间区段:<span class="noRedSpan">*</span></td>
  <td>${dtaqDataInfo.station_id.station_name}</td>
</tr>
<tr>
<td>施工单位:<span class="noRedSpan">*</span></td>
  <td><ex:organNameById id="${dtaqDataInfo.SG_Org}"/></td>
  <td>监测单位:<span class="noRedSpan">*</span></td>
  <td><ex:organNameById id="${dtaqDataInfo.JC_Org}"/></td>
</tr>
<tr>
<td>填报时间:<span class="noRedSpan">*</span></td>
  <td><fmt:formatDate value="${dtaqDataInfo.write_date}" pattern="yyyy-MM-dd"/></td>
  <td>填报人:<span class="noRedSpan">*</span></td>
  <td><ex:employeeName id="${dtaqDataInfo.write_user}"/></td>
</tr>
<tr>
<td>处理时间:<span class="noRedSpan">*</span></td>
  <td><fmt:formatDate value="${write_date}" pattern="yyyy-MM-dd"/></td>
  <td>处理人:<span class="noRedSpan">*</span></td>
  <td><ex:employeeName id="${write_user}"/></td>
</tr>
<c:if test="${dtaqDataInfo.reason != null}">
<tr>
	<td>警情下发原因:<span class="noRedSpan">*</span></td>
	<td colspan="3"><html:textarea property="reason" value="${dtaqDataInfo.reason}" rows="7" cols="80" readonly="true"/></td>
</tr>
</c:if>
           <tr>
		    	<td>待审批人:<span class="noRedSpan">*</span></td>
		    	<td colspan="3">
		    		${empwaitingdo }
		    	</td>
		    </tr>
</table>
</fieldset>
 <fieldset style="margin:10">
         <legend><strong>数据填报</strong></legend>
       
         <table   width="100%" cellpadding="0" cellspacing="0" border="0">
							<tr>
									<td width="90%" align="center">
										<font color="#50A2E6" size="2"><strong>${dtaqDataInfo.segment_id.segment_name} >> ${dtaqDataInfo.station_id.station_name} >> ${dtaqDataInfo.type_id.type_name}</strong></font>
									</td>
							</tr>
						</table>
						 <table width="100%" class="listTable" align="center" border="0" cellpadding="0" cellspacing="1">
            <thead align="center" height="25"> 
<tr>
<th width="10%">部位</th>
<th width="5%">预警点数量</th>
<th>原因分析</th>
<th width="20%">操作</th>
</tr>
</thead>
<c:forEach items="${dataList}" var="data">
<tr>
<td>${data.part_name }</td>
<td>${data.warn_count }</td>
<td>${data.reason }</td>
<td><div class="saveDiv">
<input type="button" class="button1" value="明细" onclick="viewDetails('${data.part_id}','${dataInfo.info_id}')">
<c:if test="${dataInfo.type_id.type_kind !='3'}">
	<input type="button" class="button1" value="时序曲线" onclick="showPartTimes('${data.warnInfo.dataInfo.type_id.type_kind}','${data.part_id}')">
</c:if>
<c:if test="${dataInfo.type_id.type_kind =='3'}">
	<input type="button" class="button1" value="时序曲线" onclick="showPartTimes('${data.warnInfo.dataInfo.type_id.type_kind}','${data.part_id}')">
</c:if>
<c:if test="${param.viewFlag!='t'}">
<input type="button" class="button1" value="原因分析" onclick="showReason('${data.data_id}','${data.part_id}','${dataInfo.info_id}')">
</c:if>
<%--<input type="button" class="button1" value="实时曲线" onclick="viewRealtime('${data.part_id}','${warnInfo.dataInfo.info_id}')">--%>
<%--<input type="button" class="button1" value="警情处理" onclick="showWarnDeal('${data.data_id}','${data.part_id}')">--%>
<%--<input type="button" class="button1" value="处理措施" onclick="showDealMethod('${data.data_id}','${data.part_id}')">--%>
	</div></td>
</tr>
</c:forEach>
 
        </table>
 </fieldset>
</html:form>

<div class="saveDiv">
<c:if test="${dataInfo.warnInfo==null}">
  <input type="button" class="button1" value="保 存" onclick="saveInfo()">
</c:if>
  <input type="button" class="button1" value="返 回" onclick="backToList()">
<%--  <input type="button" class="button1" value="返 回" onclick="history.back(-1)">--%>
</div>
</body>
</html>