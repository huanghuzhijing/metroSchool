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
						var properties = new Array();
			properties[0]=["work_name","任务名称"];			
			properties[1]=["work_type","任务类型"];
			properties[2]=["work_rank","关注等级"];

							saveValidateRequired("#btn_save", properties,
									"maSiteWorkForm");
						});
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
		<input name="method" value="save" type="hidden" />
		<html:hidden property="station_id" />
		
		<html:hidden property="qworkName" />
		<html:hidden property="qworkType" />
		<html:hidden property="qworkRank" />
		<html:hidden property="qworkStatus" />

		<html:hidden property="work_id" />
		<html:hidden property="ec_p" />
		<html:hidden property="ec_crd" />
		
		<html:hidden property="station_s"
			 />
		<fieldset>
			<legend>
				工点工作管理-编辑
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
						<input type="text" readonly="readonly" id="station"
							 class="form_input"
							value="${station_name}" />
					</td>
				</tr>
				<tr>
				<td>
						任务名称：
						<span class="redSpan">*</span>
					</td>
					<td>
						<html:text property="work_name" styleClass="text" size="90"  value="${maSiteWork.work_name}"/>
					</td>
				</tr>
				<tr>
					<td>
						任务类型：
						<span class="redSpan">*</span>
					</td>
					<td>
						<ex:dictSelect property="work_type" type="TaskWorkType"
							value="${maSiteWork.work_type}" />
					</td>
					<td>
						关注等级：
						<span class="redSpan">*</span>
					</td>
					<td>
						<ex:dictSelect property="work_rank" type="TaskWorkRank" value="${maSiteWork.work_rank}"
							/>
					</td>
				</tr>
				<tr>
				<td>
						说明：
						<span class="noRedSpan">*</span>
					</td>
				<td colspan="3">
           			<html:textarea value="${maSiteWork.work_memo}" property="work_memo" styleId="work_memo" cols="85" rows="8" onkeydown="textCounter('work_memo','spanAim5',4000)" onkeyup="textCounter('work_memo','spanAim5',4000)" ></html:textarea><br>
	             	<span class="req" id="spanAim5" style="display:inline">(4000字符以内!)</span>
	             </td>
				</tr>

				<tr>
					<td>
						创建人：
						<span class="noRedSpan">*</span>
					</td>
					<td>
						<input type="text" readonly="readonly" id="creater"
							name="creater" class="form_input" value="${oper}" />
					</td>
					<td>
					  创建时间：
						<span class="noRedSpan">*</span>
					</td>
					<td>
					<input type="text" readonly="readonly" id="creat_date"
							name="creat_date" class="form_input" value="${currDate}" />
						

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
