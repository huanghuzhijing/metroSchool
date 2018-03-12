<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>
<%@ include file="/commons/meta.jsp" %>

<ex:bundle/>

<html:html>
<head>
<script type="text/javascript">
function backToList(){
	location.href="${ctx}/riskLibAction.do?method=list&line_id=${line_id}&segment_id=${segment_id}&station_id=${riskLib.stationId.station_id}&risk_name=${risk_name}&risk_type=${risk_type}&riskLibList_page=${riskLibList_page}";
}
</script>
</head>
<body>
<html:form action="riskLibAction.do" method="POST" styleClass="form">
<ex:formProperty name="riskType" var="riskType"/>
<ex:formProperty name="riskSubType" var="riskSubType"/>
<ex:formProperty name="controlTimeStart" var="controlTimeStart"/>
<ex:formProperty name="controlTimeEnd" var="controlTimeEnd"/>
<ex:formProperty name="riskId" var="risk_id"/>
<ex:formProperty name="spacePosition" var="spacePosition"/>
<ex:formProperty name="spacePositionName" var="spacePositionName"/>
<html:hidden property="riskId"/>
<fieldset>
<legend>详细</legend>
<table class="formTable"  >
    <COLGROUP>
		<COL class="TdLeftTwo">
		<COL class="TdRightTwo">
		<COL class="TdLeftTwo">
		<COL class="TdRightTwo">
	</COLGROUP>
	<tr>
      <td>线路:&nbsp;<font color="red">*</font></td>
      <td colspan="3">${riskLib.lineId.line_name}</td>
    </tr>
	<tr>
      <td>标段:&nbsp;<font color="red">*</font></td>
      <td>${riskLib.segmentId.segment_name}</td>
      <td>车站/区间:&nbsp;<font color="red">*</font></td>
      <td>${riskLib.stationId.station_name}</td>
    </tr>
	<tr>
      <td>危险源名称:&nbsp;<font color="red">*</font></td>
      <td colspan="3">${riskLib.riskName}</td>
      
    </tr>
    <tr>
      <td>危险源类型:&nbsp;<font color="red">*</font></td>
      <td><ex:dicDisplay  dictIdentify="RiskLibType" dictValue="${riskLib.riskType}"/></td>
      <td>危险源子类型:&nbsp;&nbsp;&nbsp;</td>
      <td><ex:dicDisplay  dictIdentify="RiskSubLibType" dictValue="${riskLib.riskSubType}"/></td>
    </tr>
    <tr>
      <td>L:&nbsp;</td>
      <td>${riskLib.l}&nbsp;<font color="blue">(发生事故的可能性大小)</font></td>
      <td>E:&nbsp;&nbsp;&nbsp;</td>
      <td>${riskLib.e}&nbsp;<font color="blue">(人体暴露于危险环境的频繁程度)</font></td>
    </tr>
    <tr>
      <td>C:&nbsp;</td>
      <td>${riskLib.c}&nbsp;<font color="blue">(发生事故可能造成的后果)</font></td>
      <td>D:&nbsp;&nbsp;&nbsp;</td>
      <td>${riskLib.d}&nbsp;<font color="blue">(危险性分值)</font></td>
    </tr>
    <tr>
      <td>危险级别:&nbsp;&nbsp;&nbsp;</td>
      <td colspan="3">${riskLib.levels}
      <br>
      <font color="blue">级别说明：AAAAA——极其危险，不可能继续作业；AAAA——高度危险，要立即整改；AAA——显著危险，需要整改；AA——一般危险，需要注意；A——稍有危险，可以接受</font>
      </td>
    </tr>
    <tr>
      <td>控制时间:&nbsp;&nbsp;&nbsp;</td>
      <td  colspan="3">
      	<fmt:formatDate value="${riskLib.controlTimeStart}" pattern="yyyy-MM-dd"/>--<fmt:formatDate value="${riskLib.controlTimeEnd}" pattern="yyyy-MM-dd"/>
      </td>
    </tr>
    <tr>
      <td>空间位置关系:&nbsp;&nbsp;&nbsp;</td>
      <td  colspan="3">
      	${riskLib.spaceRelation }<br>
      	<c:if test="${riskLib.riskId ne null and riskLib.spacePosition ne null}">
	      <font color="red"><a href="${ctx}/riskLibAction.do?method=download&risk_id=${riskLib.riskId}">${riskLib.spacePosition}</a>&nbsp;&nbsp;下载</font>
	      <div>
				<img width="600" height="500" alt="空间位置关系地理底图" src="${ctx}/riskLibAction.do?method=viewImage&risk_id=${riskLib.riskId}&__skip__" border="0"/>
		 </div>
	    </c:if>
      </td>
    </tr>
    <tr>
      <td>危险源原因:&nbsp;<font color="red">*</font></td>
      <td colspan="3">${riskLib.riskReason }</td>
    </tr>
    <tr>
      <td>可能导致事故:&nbsp;<font color="red">*</font></td>
      <td colspan="3">${riskLib.riskResult }</td>
    </tr>
    <tr>
      <td>存在条件/风险描述:&nbsp;&nbsp;&nbsp;</td>
      <td colspan="3">${riskLib.descrble }</td>
    </tr>
</table>
</fieldset>
<div class="saveDiv">
<input type="button" value="<fmt:message key="button.back"/>" onclick="backToList()" class="backButton" />
</div>
</html:form>
</body>
</html:html>