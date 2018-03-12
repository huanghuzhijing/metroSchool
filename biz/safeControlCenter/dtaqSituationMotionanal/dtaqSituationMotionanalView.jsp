<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
<html:html>
<head>
	<%@ include file="/commons/meta.jsp"%>
	<script type="text/javascript">
	$(document)
			.ready(function() {

				//返回
					$("#btn_back")
							.click(
									function() {
										location.href = "${ctx}/dtaqSituationMotionanalAction.do?method=list&qlineId=${param.qlineId}&qsegmentId=${param.qsegmentId}&qstationId=${param.qstationId}&qstartDate=${param.qstartDate}&qendDate=${param.qendDate}&qsafeState=${param.qsafeState}&qriskAttention=${param.qriskAttention}&ec_id=${param.id}&ec_p=${param.ec_p}&ec_crd=${param.ec_crd}";
									});

				});
</script>
</head>

<body>

	<html:form enctype="multipart/form-data"
		action="dtaqSituationMotionanalAction.do" method="POST">
		<input name="method" type="hidden" />
		<html:hidden property="qlineId" />
		<html:hidden property="qsegmentId" />
		<html:hidden property="qstationId" />
		<html:hidden property="qstartDate" />
		<html:hidden property="qendDate" />
		<html:hidden property="qsafeState" />
		<html:hidden property="qriskAttention" />

		<html:hidden property="ec_id" value="${dtaqSituationMotionanal.id}" />
		<html:hidden property="id" />
		<html:hidden property="ec_p" />
		<html:hidden property="ec_crd" />
		<html:hidden property="lineId"
			value="${dtaqSituationMotionanal.lineId}" />
		<html:hidden property="segmentId"
			value="${dtaqSituationMotionanal.segmentId}" />
		<html:hidden property="stationId"
			value="${dtaqSituationMotionanal.stationId}" />
		<fieldset>
			<legend>
				运营期安全分析-详细
			</legend>
			<table class="formTable">
				<COLGROUP>
					<COL class="tdLeftTwo" />
					<COL class="tdRightTwo" />
					<COL class="tdLeftTwo" />
					<COL class="tdRightTwo" />
				</COLGROUP>

				<tr>
					<td>
						填报日期：
						<span class="redSpan">*</span>
					</td>
					<td>
						<fmt:formatDate value="${dtaqSituationMotionanal.recordDate}"
							pattern="yyyy-MM-dd" />
					</td>
					<td>
						线路：
						<span class="redSpan">*</span>
					</td>
					<td>
						${line_name}
					</td>
				</tr>
				<tr>
					<td>
						标段：
						<span class="redSpan">*</span>
					</td>
					<td>
						${segment_name}
					</td>
					<td>
						车站区间：
						<span class="redSpan">*</span>
					</td>
					<td>
						${station_name}
					</td>
				</tr>
				<tr>
					<td>
						工程安全风险状态：
						<span class="redSpan">*</span>
					</td>
					<td>
						<ex:dicDisplay dictIdentify="AnalyseSafeState"
							dictValue="${dtaqSituationMotionanal.safeState}" />
					</td>
					<td>
						是否重点关注：
						<span class="redSpan">*</span>
					</td>
					<td>
						<ex:dicDisplay dictIdentify="RiskAttention"
							dictValue="${dtaqSituationMotionanal.riskAttention}" />
					</td>
				</tr>

				<tr>
					<td>
						编制人：
						<span class="noRedSpan">*</span>
					</td>
					<td>
						<ex:empName id="${dtaqSituationMotionanal.weaveAuthor}" />
					</td>
					<td>
						编制时间：
						<span class="noRedSpan">*</span>
					</td>
					<td>
						<fmt:formatDate value='${dtaqSituationMotionanal.weaveDate}'
							pattern='yyyy-MM-dd' />

					</td>
				</tr>
				<tr>
					<td>
						安全分析：
						<span class="noRedSpan">*</span>
					</td>
					<td colspan="4" id="safeAnal" align="left">
						<c:out value="${safeAnal}" escapeXml="false" />
					</td>
				</tr>



			</table>
		</fieldset>

		<div class="saveDiv">

			<input id="btn_back" value="${texts['button.back']}" type="button"
				icon="icon_back" />
		</div>
	</html:form>
</body>
</html:html>
