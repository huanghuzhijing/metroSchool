<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
<html:html>
<head>
	<%@ include file="/commons/meta.jsp"%>
	<script type="text/javascript">
	$(document)
			.ready(function() {
				//确定
				$("#btn_save").click(function() {
					$("[name='kind']").val("save");
					var properties = new Array();
		properties[0]=["recordDate","填报日期"];			
		properties[1]=["safeState","工程安全风险状态"];
		properties[2]=["riskAttention","是否重点关注"];

						saveValidateRequired("#btn_save", properties,
								"dtaqSituationMotionanalForm");
					});
				//next
				$("#nextsave").click(function() {
					$("[name='kind']").val("next");
					var properties = new Array();
		properties[0]=["recordDate","填报日期"];			
		properties[1]=["safeState","工程安全风险状态"];
		properties[2]=["riskAttention","是否重点关注"];

						saveValidateRequired("#btn_save", properties,
								"dtaqSituationMotionanalForm");
					});
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
		<input name="method" value="save" type="hidden" />
		<html:hidden property="kind"/>
		<html:hidden property="qlineId" />
		<html:hidden property="qsegmentId" />
		<html:hidden property="qstationId" />
		<html:hidden property="qstartDate" />
		<html:hidden property="qendDate" />
		<html:hidden property="qsafeState" value="${param.qsafeState}" />
		<html:hidden property="qriskAttention" value="${param.qriskAttention}" />

		<html:hidden property="ec_id" value="${param.id}" />
		<html:hidden property="id" value="${dtaqSituationMotionanal.id}" />
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
				运营期安全分析-编辑
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
						<input type="text" id="recordDate" name="recordDate"
							class="form_input"
							value='<fmt:formatDate pattern="yyyy-MM-dd" value="${dtaqSituationMotionanal.recordDate}"/>'
							onfocus="WdatePicker()" />
					</td>
					<td>
						线路：
						<span class="redSpan">*</span>
					</td>
					<td>
						<input type="text" readonly="readonly" id="line_id" name="line_id"
							class="form_input" size="30" value="${line_name}" />
					</td>
				</tr>
				<tr>
					<td>
						标段：
						<span class="redSpan">*</span>
					</td>
					<td>
						<input type="text" readonly="readonly" id="segment_id"
							name="segment_id" class="form_input" value="${segment_name}" />
					</td>
					<td>
						车站区间：
						<span class="redSpan">*</span>
					</td>
					<td>
						<input type="text" readonly="readonly" id="station_id"
							name="station_id" class="form_input" value="${station_name}" />
					</td>
				</tr>
				<tr>
					<td>
						工程安全风险状态：
						<span class="redSpan">*</span>
					</td>
					<td>
						<ex:dictSelect property="safeState" type="AnalyseSafeState" />
					</td>
					<td>
						是否重点关注：
						<span class="redSpan">*</span>
					</td>
					<td>
						<ex:dictSelect property="riskAttention" type="RiskAttention" />
					</td>
				</tr>

				<tr>
					<td>
						编制人：
						<span class="noRedSpan">*</span>
					</td>
					<td>
						<input type="text" readonly="readonly" id="weaveAuthor"
							name="weaveAuthor" class="form_input" value="${oper}" />
					</td>
					<td>
						编制日期：
						<span class="noRedSpan">*</span>
					</td>
					<td>
						<fmt:formatDate value="${dtaqSituationMotionanal.weaveDate}"
							pattern="yyyy-MM-dd" />
					</td>
				</tr>
				<tr>
					<td>
						安全分析:
						<span class="noRedSpan">*</span>
					</td>
				</tr>
				<tr>
					<td colspan="4">
						<input type="hidden" name="safeAnal" value="${safeAnal}" />
						<iframe id="eWebEditor1"
							src="ewebeditor/ewebeditor.htm?id=safeAnal&style=coolblue"
							frameborder="0" scrolling="no" width="100%" HEIGHT="400"></iframe>
					</td>
				</tr>



			</table>
		</fieldset>

		<div class="saveDiv">
			<input id="btn_save" value="确  定" type="button" icon="icon_save" />
			<input id="nextsave" value="保存并新增下一个" type="button" class="button1" icon="icon_save"/>
			<input id="btn_back" value="${texts['button.back']}" type="button"
				icon="icon_back" />
		</div>
	</html:form>
</body>
</html:html>
