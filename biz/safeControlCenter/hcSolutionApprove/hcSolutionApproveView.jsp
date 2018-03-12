<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
<html:html>
<head>
	
	<script type="text/javascript">
	$(document)
			.ready(function() {

				//返回
					$("#btn_back")
							.click(
									function() {
										location.href = "${ctx}/hcSolutionApproveAction.do?method=list&qlineId=${param.qlineId}&qsegmentId=${param.qsegmentId}&qstationId=${param.qstationId}&pstartDate=${param.pstartDate}&pendDate=${param.pendDate}&jstartDate=${param.jstartDate}&jendDate=${param.jendDate}&qhiddenContent=${param.qhiddenContent}&qhiddenGrade=${param.qhiddenGrade}&ec_id=${param.id}&ec_p=${param.ec_p}&ec_crd=${param.ec_crd}";
									});

				});

	function init() {
		var fileCount = '${fileCount}';
		if (fileCount != "0") {
			var count = parseInt(fileCount);
			for ( var i = 1; i <= count; i++) {
				var obj = document.getElementById('tr' + i);
				if (obj.style.display == 'none') {
					obj.style.display = 'block';
				}
			}
		}
	}
</script>
</head>
<content tag="heading">
	质安隐患信息审核
</content>
<body>

	<html:form enctype="multipart/form-data" action="hcSolutionApproveAction.do"
		method="POST">
		<input name="method" value="save" type="hidden" />
		<html:hidden property="qsegmentId" />
		<html:hidden property="qstationId" />
		<html:hidden property="pstartDate" />
		<html:hidden property="pendDate" />
		<html:hidden property="jstartDate" />
		<html:hidden property="jendDate" />
		<html:hidden property="qhiddenContent" />
		<html:hidden property="qhiddenGrade" />

		<html:hidden property="id" />
		<html:hidden property="ec_p" />
		<html:hidden property="ec_crd" />
		<html:hidden property="line_id" value="${hcSolution.line_id}" />
		<html:hidden property="segment_id" value="${hcSolution.segment_id}" />
		<html:hidden property="station_id" value="${hcSolution.station_id}" />
		<fieldset>
			<legend>
				质安隐患信息管理-详细
			</legend>
			<table class="formTable">
				<COLGROUP>
					<COL class="tdLeftTwo" />
					<COL class="tdRightTwo" />
					<COL class="tdLeftTwo" />
					<COL class="tdRightTwo" />
				</COLGROUP>
				<tr>
					<th width='100%' colspan="2" align="center"
						style="font-weight: bold; font-size: 13px">
						排查信息
					</th>
				</tr>

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
						隐患排查时间:
						<span class="noRedSpan">*</span>
					</td>
					<td>
						<fmt:formatDate value="${hcSolution.writeDate}" />

					</td>
				</tr>
				<tr>
					<td>
						排查人:
						<span class="noRedSpan">*</span>
					</td>
					<td>
						${hcSolution.writeUser}
					</td>
					<td>
						排查单位:
						<span class="noRedSpan">*</span>
					</td>
					<td>
						${hcSolution.writeCorp}
					</td>
				</tr>
				<tr>
					<td>
						隐患名称:
						<span class="noRedSpan">*</span>
					</td>
					<td colspan="3">
						${hcSolution.hiddenContent}


					</td>
				</tr>
				<tr>
					<td>
						第一责任人:
						<span class="noRedSpan">*</span>
					</td>
					<td>
						${hcSolution.dutyMan}
					</td>
					<td>
						隐患等级:
						<span class="noRedSpan">*</span>
					</td>
					<td>
						<ex:dicDisplay dictIdentify="HiddenType"
							dictValue="${hcSolution.hiddenGrade}" />
					</td>
				</tr>
				<tr>
					<td>
						隐患部位:
						<span class="noRedSpan">*</span>
					</td>
					<td colspan="3">
						${hcSolution.hiddenPart}
					</td>
				</tr>
				<tr>
					<td>
						隐患描述:
						<span class="noRedSpan">*</span>
					</td>
					<td colspan="3">
						${hcSolution.hiddenDescription}

					</td>
				</tr>
				<tr>
					<td>
						消除要求:
						<span class="noRedSpan">*</span>
					</td>
					<td colspan="3">
						${hcSolution.disposeDemand}

					</td>
				</tr>
				<tr>
					<td>
						整改截止日期:
						<span class="noRedSpan">*</span>
					</td>
					<td>
						<fmt:formatDate value="${hcSolution.limitDate}" />


					</td>
					<td>
						整改下发日期:
						<span class="noRedSpan">*</span>
					</td>
					<td>
						<fmt:formatDate value="${hcSolution.issuedDate}" />

					</td>
				</tr>
				<tr>
					<th width='100%' colspan="2" align="center"
						style="font-weight: bold; font-size: 13px">
						治理信息
					</th>
				</tr>
				<tr>
					<td>
						隐患治理内容:
						<span class="noRedSpan">*</span>
					</td>
					<td colspan="3">
						${hcSolution.governContent}

					</td>
				</tr>
				<tr>
					<td>
						整改日期:
						<span class="noRedSpan">*</span>
					</td>
					<td>
						<fmt:formatDate value="${hcSolution.reformDate}" />

					</td>
					<td>
						审核日期:
						<span class="noRedSpan">*</span>
					</td>
					<td>
						<fmt:formatDate value="${hcSolution.reviewDate}" />
					</td>
				</tr>
				<tr>
					<td>
						审核结果:
						<span class="noRedSpan">*</span>
					</td>
					<td>
						<ex:dicDisplay dictIdentify="CheckResult"
							dictValue="${hcSolution.auditResult}" />
					</td>
					<td>
						审核人:
						<span class="noRedSpan">*</span>
					</td>
					<td>
						${hcSolution.auditPerson}
					</td>
				</tr>
				<tr>
					<td>
						审核意见:
						<span class="noRedSpan">*</span>
					</td>
					<td colspan="3">
						${hcSolution.auditOpinion}
					</td>
				</tr>
				<tr>
					<th width='100%' colspan="2" align="center"
						style="font-weight: bold; font-size: 13px">
						附件信息
					</th>
				</tr>
				<tr>
					<td>
						整改前照片:
						<span class="noRedSpan">*</span>
					</td>
					<td>
						<c:if test="${not empty hcSolution.annexAddr}">
							<img alt=""
								src="${ctx}/hcSolutionAction.do?method=download&id=${hcSolution.id}&index=1"
								width="250px" height="250px">
							<font color="red"><a
								href="${ctx}/hcSolutionAction.do?method=download&id=${hcSolution.id}&index=1">${hcSolution.annexName}&nbsp;&nbsp;下载</a>
							</font>
						</c:if>
					</td>

				</tr>
				<tr>
					<td>
						整改后照片:
						<span class="noRedSpan">*</span>
					</td>
					<td>
						<c:if test="${not empty hcSolution.governPicAddr}">
							<img alt=""
								src="${ctx}/hcSolutionAction.do?method=download&id=${hcSolution.id}&index=2"
								width="250px" height="250px">
							<font color="red"><a
								href="${ctx}/hcSolutionAction.do?method=download&id=${hcSolution.id}&index=2">${hcSolution.governPic}&nbsp;&nbsp;下载</a>
							</font>
						</c:if>
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
