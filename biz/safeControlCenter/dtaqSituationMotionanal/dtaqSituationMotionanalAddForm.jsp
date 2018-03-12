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
										location.href = "${ctx}/dtaqSituationMotionanalAction.do?method=list&qlineId=${param.qlineId}&qsegmentId=${param.qsegmentId}&qstationId=${param.qstationId}";
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
		<html:hidden property="qsafeState" />
		<html:hidden property="qriskAttention" />

		<html:hidden property="id" value="" />
		<html:hidden property="ec_p" />
		<html:hidden property="ec_crd" />
		<html:hidden property="lineId"
			value="${dtaqStation.segment_id.line_id.line_id}" />
		<html:hidden property="segmentId"
			value="${dtaqStation.segment_id.segment_id}" />
		<html:hidden property="stationId" value="${dtaqStation.station_id}" />
		<fieldset>
			<legend>
				运营期安全分析-新增
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
						<html:text property="recordDate" value="${currDate}"
							styleClass="inputText"
							onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})" />
					</td>
					<td>
						线路：
						<span class="redSpan">*</span>
					</td>
					<td>
						<input type="text" readonly="readonly" id="lineId" name="lineId"
							class="form_input" size="30"
							value="${dtaqStation.segment_id.line_id.line_name}" />
					</td>
				</tr>
				<tr>
					<td>
						标段：
						<span class="redSpan">*</span>
					</td>
					<td>
						<input type="text" readonly="readonly" id="segmentId"
							name="segmentId" class="form_input"
							value="${dtaqStation.segment_id.segment_name}" />
					</td>
					<td>
						车站区间：
						<span class="redSpan">*</span>
					</td>
					<td>
						<input type="text" readonly="readonly" id="stationId"
							name="stationId" class="form_input"
							value="${dtaqStation.station_name}" />
					</td>
				</tr>
				<tr>
					<td>
						工程安全风险状态：
						<span class="redSpan">*</span>
					</td>
					<td>
						<ex:dictSelect property="safeState" type="AnalyseSafeState"/>
					</td>
					<td>
						是否重点关注：
						<span class="redSpan">*</span>
					</td>
					<td>
						<ex:dictSelect property="riskAttention" type="RiskAttention"/>
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
						${currDate}

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
						<input type="hidden" name="safeAnal" />
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
