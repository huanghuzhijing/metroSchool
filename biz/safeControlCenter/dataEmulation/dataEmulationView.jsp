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
										location.href = "${ctx}/dataEmulationAction.do?method=list&qlineId=${param.qlineId}&qsegmentId=${param.qsegmentId}&qstationId=${param.qstationId}&qstartDate=${param.qstartDate}&qendDate=${param.qendDate}&ec_id=${param.emulation_id}&ec_p=${param.ec_p}&ec_crd=${param.ec_crd}";
									});

				});
	
</script>
</head>

<body>
	
	<html:form enctype="multipart/form-data"
		action="dataEmulationAction.do" method="POST">
		<input name="method"  type="hidden" />
		<html:hidden property="qlineId" />
		<html:hidden property="qsegmentId" />
		<html:hidden property="qstationId" />
		<html:hidden property="qstartDate" />
		<html:hidden property="qendDate" />
		<html:hidden property="ec_id" value="${dataEmulation.emulation_id}"/>
		<html:hidden property="emulation_id" />
		<html:hidden property="ec_p" />
		<html:hidden property="ec_crd" />
		<html:hidden property="line_id"  value="${dataEmulation.line_id}"/>
       <html:hidden property="segment_id"  value="${dataEmulation.segment_id}" />
       <html:hidden property="station_id"  value="${dataEmulation.station_id}"/>
		<fieldset>
			<legend>
				数值与仿真编辑室-详细
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
						<span class="noRedSpan">*</span>
					</td>
					<td>					 
						${line_name}
					</td>
					<td>
						标段：
						<span class="noRedSpan">*</span>
					</td>
					<td>
						${segment_name}
					</td>
				</tr>


				<tr>
					<td>
						车站区间：
						<span class="noRedSpan">*</span>
						</td>
					<td>
						${station_name}
					</td>
				</tr>

				<tr>
					<td>
						创建人：
						<span class="noRedSpan">*</span>
					</td>
					<td>
						<ex:empName id="${dataEmulation.creator}"/>
					</td>
					<td>
						填报时间：
						<span class="noRedSpan">*</span>
					</td>
					<td>
						<fmt:formatDate value='${dataEmulation.create_date}' pattern='yyyy-MM-dd HH:mm:ss'/>

					</td>
				</tr>
				<tr>
					<td>
						分析报告：
						<span class="noRedSpan">*</span>
					</td>
					<td colspan="4" id="fckTD" align="left">
			     	<c:out value="${fk_content}" escapeXml="false" />
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
