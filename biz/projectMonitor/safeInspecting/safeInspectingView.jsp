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
										location.href = "${ctx}/safeInspectingAction.do?method=list&qlineId=${param.qlineId}&qsegmentId=${param.qsegmentId}&qstationId=${param.qstationId}&qyear=${param.qyear}&qmonth=${param.qmonth}&qweek=${param.qweek}&ec_id=${param.inspecting_id}&ec_p=${param.ec_p}&ec_crd=${param.ec_crd}";
									});

				});
	
</script>
</head>

<body>
	
	<html:form enctype="multipart/form-data"
		action="safeInspectingAction.do" method="POST">
		<input name="method"  type="hidden" />
		
		<fieldset>
			<legend>
				安全巡检信息-详细
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
					</tr>
					<tr>
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
						年份：
						<span class="noRedSpan">*</span>
					</td>
					<td>
						${safeInspecting.year}
					</td>
					<td>
						月份：
						<span class="noRedSpan">*</span>
					</td>
					<td>
						${safeInspecting.month}
					</td>
					</tr>
					<tr>
					<td>
						周次：
						<span class="noRedSpan">*</span>
					</td>
					<td>
					<ex:dicDisplay dictIdentify="InspectingWeek" dictValue="${safeInspecting.week }"/>
						
					</td>
					<td>
						记录人：
						<span class="noRedSpan">*</span>
					</td>
					<td>
						<ex:empName id="${safeInspecting.recorder}"/>
					</td>
				</tr>
				<tr>
					<td>
						内容:
						<span class="noRedSpan">*</span>
					</td>		
					<td colspan="3">
					<html:textarea property="content" cols="80" rows="7" readonly="true" value="${safeInspecting.content }"/>
			     	
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
