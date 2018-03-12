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
									var url = "${ctx}/maGeneralWorkAction.do?method=list&qgeneralType=${param.qgeneralType}&qgeneralRank=${param.qgeneralRank}&qgeneralStatus=${param.qgeneralStatus}&ec_id=${param.general_id}&ec_p=${param.ec_p}&ec_crd=${param.ec_crd}";
									document.forms[0].action=url;
									document.forms[0].submit();
									});

				});
</script>
</head>
<content tag="heading">
	一般工作管理
</content>
<body>

	<html:form enctype="multipart/form-data"
		action="maGeneralWorkAction.do" method="POST">
		<input name="method" type="hidden" />
		
		<html:hidden property="qgeneralName" />
		<html:hidden property="qgeneralType" />
		<html:hidden property="qgeneralRank" />
		<html:hidden property="qgeneralStatus" />

		<html:hidden property="general_id" />
		<html:hidden property="ec_p" />
		<html:hidden property="ec_crd" />
		
		<fieldset>
			<legend>
				一般工作管理-详细
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
						任务名称：
						<span class="noRedSpan">*</span>
					</td>
					<td>
						${maGeneralWork.general_name}
					</td>
				</tr>
				<tr>
					<td>
						任务类型：
						<span class="noRedSpan">*</span>
					</td>
					<td>
					<ex:dicDisplay dictIdentify="GeneralWorkType" dictValue="${maGeneralWork.general_type}"/>
						
					</td>
					<td>
						关注等级：
						<span class="noRedSpan">*</span>
					</td>
					<td>
					<ex:dicDisplay dictIdentify="TaskWorkRank" dictValue="${maGeneralWork.general_rank}"/>
						
					</td>
				</tr>
				<tr>
			<td>
						指定人员：
						<span class="noRedSpan">*</span>
					</td>
			<td colspan="3">
				${maGeneralWork.allot_names}
			</td>
		</tr>
				<tr>
				<td>
						说明：
						<span class="noRedSpan">*</span>
					</td>
				<td colspan="3">
           			<html:textarea value="${maGeneralWork.general_memo}" property="general_memo" styleId="general_memo" cols="85" rows="8"  readonly="true" ></html:textarea><br>
	             	
	             </td>
				</tr>

				<tr>
					<td>
						创建人：
						<span class="noRedSpan">*</span>
					</td>
					<td>
						<ex:employeeName id="${maGeneralWork.creater}"/>
					</td>
					<td>
					  创建时间：
						<span class="noRedSpan">*</span>
					</td>
					<td>
					<fmt:formatDate value="${maGeneralWork.creat_date}"
						pattern="yyyy-MM-dd" />
						

					</td>
				</tr>
				<tr style="display: none;">
           	<td>
					  提交方式：
						<span class="noRedSpan">*</span>
					</td>
           	<td colspan="3">
           		<html:checkbox property="prompt_ways" value="1">站内消息</html:checkbox>
           		<html:checkbox property="prompt_ways" value="2">手机短信</html:checkbox>
           	</td>
           </tr>
				<tr>
				<td>
						任务状态：
						<span class="noRedSpan">*</span>
					</td>
					<td>
					<ex:dicDisplay dictIdentify="TaskWorkStatus" dictValue="${maGeneralWork.general_status}"/>
						
					</td>
				</tr>
				<c:if test="${maGeneralWork.general_status == '3'}">
           		<td>
           		完成人：
				<span class="noRedSpan">*</span>
				</td>
           		<td>
           		<ex:userName id="${maGeneralWork.finish_emp}" />
           		</td>
           		<td>
           		完成时间：
				<span class="noRedSpan">*</span>
           		</td>
           		<td>
           		<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${maGeneralWork.finish_date}" />
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
