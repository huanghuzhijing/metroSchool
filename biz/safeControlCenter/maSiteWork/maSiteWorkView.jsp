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
										var url = "${ctx}/maSiteWorkAction.do?method=list&station_id=${param.station_id}&qworkType=${param.qworkType}&qworkRank=${param.qworkRank}&qworkStatus=${param.qworkStatus}&ec_id=${param.work_id}&ec_p=${param.ec_p}&ec_crd=${param.ec_crd}";
										document.forms[0].action=url;
										document.forms[0].submit();
									});

				});
</script>
</head>

<body>

	<html:form enctype="multipart/form-data"
		action="maSiteWorkAction.do" method="POST">
		<input name="method" type="hidden" />
		<html:hidden property="station_id" />
		
		<html:hidden property="qworkName" />
		<html:hidden property="qworkType" />
		<html:hidden property="qworkRank" />
		<html:hidden property="qworkStatus" />

		<html:hidden property="work_id" />
		<html:hidden property="ec_p" />
		<html:hidden property="ec_crd" />
		
		<html:hidden property="station"
			value="${maSiteWork.station}" />
		
		<fieldset>
			<legend>
				工点工作管理-详细
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
						车站区间：
						<span class="noRedSpan">*</span>
					</td>
					<td>
						${station_name}
					</td>
				</tr>
				<tr>
				<td>
						任务名称：
						<span class="noRedSpan">*</span>
					</td>
					<td>
						${maSiteWork.work_name}
					</td>
				</tr>
				<tr>
					<td>
						任务类型：
						<span class="noRedSpan">*</span>
					</td>
					<td>
					<ex:dicDisplay dictIdentify="TaskWorkType" dictValue="${maSiteWork.work_type}"/>
						
					</td>
					<td>
						关注等级：
						<span class="noRedSpan">*</span>
					</td>
					<td>
					<ex:dicDisplay dictIdentify="TaskWorkRank" dictValue="${maSiteWork.work_rank}"/>
						
					</td>
				</tr>
				<tr>
				<td>
						说明：
						<span class="noRedSpan">*</span>
					</td>
				<td colspan="3">
           			<html:textarea value="${maSiteWork.work_memo}" property="work_memo" styleId="work_memo" cols="85" rows="8"  readonly="true" ></html:textarea><br>
	             	
	             </td>
				</tr>

				<tr>
					<td>
						创建人：
						<span class="noRedSpan">*</span>
					</td>
					<td>
						<ex:employeeName id="${maSiteWork.creater}"/>
					</td>
					<td>
					  创建时间：
						<span class="noRedSpan">*</span>
					</td>
					<td>
					<fmt:formatDate value="${maSiteWork.creat_date}"
						pattern="yyyy-MM-dd" />
						

					</td>
				</tr>
				<tr>
				<td>
						任务状态：
						<span class="noRedSpan">*</span>
					</td>
					<td>
					<ex:dicDisplay dictIdentify="TaskWorkStatus" dictValue="${maSiteWork.work_status}"/>
						
					</td>
				</tr>
				<c:if test="${maSiteWork.work_status == '3'}">
           		<td>
           		完成人：
				<span class="noRedSpan">*</span>
				</td>
           		<td>
           		<ex:userName id="${maSiteWork.finish_emp}" />
           		</td>
           		<td>
           		完成时间：
				<span class="noRedSpan">*</span>
           		</td>
           		<td>
           		<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${maSiteWork.finish_date}" />
           		</td>
           </c:if>



			</table>
		</fieldset>

		<div class="saveDiv">

			<input id="btn_back" value="${texts['button.back']}" type="button"
				icon="icon_back" />
		</div>
	</html:form>
</body>
</html:html>
