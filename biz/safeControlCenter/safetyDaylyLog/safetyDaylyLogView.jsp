<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>
<%@ include file="/commons/meta.jsp" %>
<ex:bundle/>
<html:html>
<head>
<script src="${ctx}/scripts/public.js" type="text/javascript"></script>
<script type="text/javascript">
function backToList(){
if('${param.flag}'==''||'${param.flag}'==null){
location.href = "${ctx}/safetyDaylyLogAction.do?method=listPage&segment_id=${safetyDaylyLog.segmentId}&station_id=${safetyDaylyLog.station_id}&station_state=${station_state}&qstartDate=${startDate}&qendDate=${endDate}&log_type=${log_type}&safetyDaylyLogList_page=${safetyDaylyLogList_page}&ec_p=${param.ec_p}&ec_id=${param.ec_id}&ec_p=${param.ec_crd}";
}else{
location.href = "${ctx}/safetyDaylyLogAction.do?method=listQuery&log_type=${param.log_type}&segment_id=${safetyDaylyLog.segmentId}&station_id=${safetyDaylyLog.station_id}&station_state=${station_state}&qstartDate=${param.qstartDate}&qendDate=${param.qendDate}&safetyDaylyLogList_page=${safetyDaylyLogList_page}&ec_p=${param.ec_p}&ec_id=${param.ec_id}&ec_p=${param.ec_crd}";
}
	
}
</script>
 <body> 
    <html:form action="safetyDaylyLogAction.do">
	      <fieldset>
	   <legend align="left"><font class="t_memo_font">详细</font></legend>
	   <table class="formTable" >
					<COLGROUP>
							<COL class="tdLeftTwo" />
			                <COL class="tdRightTwo" />
			                <COL class="tdLeftTwo" />
			                <COL class="tdRightTwo" />
		</COLGROUP>
	    <tr>
	    	<td>线路:<span class="redSpan">*</span></td>
	    	<td>${line_name}</td>
	    	<td>标段:<span class="redSpan">*</span></td>
	    	<td>${segment_name}</td>
	    </tr>
	    <tr>
	    	<td>车站/区间:<span class="redSpan">*</span></td>
	    	<td>${station_name}</td>
	    	<td>报告日期:<span class="redSpan">*</span></td>
	    	<td><fmt:formatDate value="${safetyDaylyLog.f_reportdate}" pattern="yyyy-MM-dd"/></td>
	    </tr>
<%--	    <c:if test="${deptType == '3'}">--%>
<%--		    <tr>--%>
<%--		    	<td>第三方数据超限信息:<span class="redSpan">*</span><br>(动态抓取服务器当天数据)</td>--%>
<%--		    	<td colspan="3"><html:textarea property="thirdWarnInfo" rows="7" cols="75" readonly="true"/></td>--%>
<%--		    </tr>--%>
<%--	    </c:if>--%>
<%--	    <tr>--%>
<%--	    	<td>施工方数据超限信息:<span class="redSpan">*</span><br>(动态抓取服务器当天数据)</td>--%>
<%--	    	<td colspan="3"><html:textarea property="orgWarnInfo" rows="7" cols="75" readonly="true"/></td>--%>
<%--	    </tr>--%>
	    
	    <tr>
	    	<td>今日工点安全风险情况:<span class="redSpan">*</span></td>
	    	<td colspan="3">
	    		<html:textarea rows="7" cols="75" property="f_riskplan" value="${safetyDaylyLog.f_riskplan}" readonly="true" />
	    	</td>
	    </tr>
	    <tr>
	    	<td>今日工程形象进度说明:<span class="redSpan">*</span></td>
	    	<td colspan="3">
	    		<html:textarea rows="7" cols="75" property="f_schedule" value="${safetyDaylyLog.f_schedule}" readonly="true" />
	    	</td>
	    </tr>
	    <tr>
	    	<td>今日安全工作:<span class="redSpan">*</span></td>
	    	<td colspan="3">
	    		<html:textarea rows="7" cols="75" property="f_safetywork" value="${safetyDaylyLog.f_safetywork}"  readonly="true" />
	    	</td>
	    </tr>
	    <c:if test="${deptType == '3'}">
	    	<tr>
		    	<td>现场安全隐患及整改措施:<span class="redSpan">*</span></td>
		    	<td colspan="3">
		    		<html:textarea rows="7" cols="75" property="f_riskstatus" value="${safetyDaylyLog.f_riskstatus}" readonly="true" />
		    	</td>
		    </tr>
	    </c:if>
	    <tr>
	    	<td>安全副经理:<span class="redSpan">*</span></td>
	    		<td>${safetyDaylyLog.f_checkman}
	    	</td>
	    	<td>填写人:<span class="noRedSpan">*</span></td>
	    	<td>
	    		<ex:employeeName id="${safetyDaylyLog.f_userid}"/>
	    	</td>
	    </tr>
    </table>
    </fieldset>
    <div align="center">
		<input type="button" value="<fmt:message key="button.back"/>" onclick="backToList()" class="backButton">
    </div>
</html:form>
 </body>
</html:html>
