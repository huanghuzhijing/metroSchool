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
					$("#btn_save").click(
							function() {
								var properties = new Array();
						//		properties[0] = [ "fk_content", "分析报告" ];
								
								saveValidateRequired("#btn_save", properties,
										"dataEmulationForm");
							});
					//返回
					$("#btn_back")
							.click(
									function() {
										location.href = "${ctx}/dataEmulationAction.do?method=list&qlineId=${param.qlineId}&qsegmentId=${param.qsegmentId}&qstationId=${param.qstationId}";
									});

				});
	
</script>
</head>

<body>
	
	<html:form enctype="multipart/form-data"
		action="dataEmulationAction.do" method="POST">
		<input name="method" value="save" type="hidden" />
		<html:hidden property="qlineId" />
		<html:hidden property="qsegmentId" />
		<html:hidden property="qstationId" />
		<html:hidden property="qstartDate" />
		<html:hidden property="qendDate" />
		
		<html:hidden property="emulation_id"   value=""  />
		<html:hidden property="ec_p" />
		<html:hidden property="ec_crd" />
		<html:hidden property="line_id"  value="${dtaqStation.segment_id.line_id.line_id}"/>
       <html:hidden property="segment_id"  value="${dtaqStation.segment_id.segment_id}" />
       <html:hidden property="station_id"  value="${dtaqStation.station_id}"/>
		<fieldset>
			<legend>
				数值与仿真编辑室-新增
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
						线路：
						<span class="redSpan">*</span>
					</td>
					<td>					 
						<input type="text" readonly="readonly" id="line_id" name="line_id"
							class="form_input"  size="30"
							value="${dtaqStation.segment_id.line_id.line_name}" />
					</td>
					<td>
						标段：
						<span class="redSpan">*</span>
					</td>
					<td>
						<input type="text" readonly="readonly" id="segment_id"
							name="segment_id" class="form_input"
							value="${dtaqStation.segment_id.segment_name}" />
					</td>
				</tr>


				<tr>
					<td>
						车站区间：
						<span class="redSpan">*</span>
					</td>
					<td>
						<input type="text" readonly="readonly" id="station_id"
							name="station_id" class="form_input"
							value="${dtaqStation.station_name}" />
					</td>
				</tr>

				<tr>
					<td>
						创建人：
						<span class="noRedSpan">*</span>
					</td>
					<td>
						<input type="text" readonly="readonly" id="creator" name="creator"
							class="form_input" value="${oper}" />
					</td>
					<td>
						填报时间：
						<span class="noRedSpan">*</span>
					</td>
					<td>
						<input type="text" readonly="readonly" id="create_date"
							name="create_date" class="form_input" value="<fmt:formatDate value='${currDate}' pattern='yyyy-MM-dd HH:mm:ss'/>" />

					</td>
				</tr>
				<tr>
					<td>
						分析报告:
						<span class="noRedSpan">*</span>
					</td>
				</tr>
				<tr>
					<td colspan="4">
						<input type="hidden" name="fk_content" />
						<iframe id="eWebEditor1"
							src="ewebeditor/ewebeditor.htm?id=fk_content&style=coolblue"
							frameborder="0" scrolling="no" width="100%" HEIGHT="400"></iframe>
					</td>
				</tr>



			</table>
		</fieldset>

		<div class="saveDiv">
			<input id="btn_save" value="确  定" type="button" icon="icon_save" />
			<input id="btn_back" value="${texts['button.back']}" type="button"
				icon="icon_back" />
		</div>
	</html:form>
</body>
</html:html>
