<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
<html:html>
<head>
	<script type="text/javascript">
	function backToList() {
  location.href="${ctx}/maSiteWorkLogAction.do?method=list&report_date=${report_date}";
}

function saveInfo(){
	var properties = new Array();
			properties[0]=["work_name","任务名称"];			
			properties[1]=["work_type","任务类型"];
			properties[2]=["work_rank","关注等级"];
			properties[3]=["station_id","工点名称"];

							saveValidateRequired("#btn_save", properties,
									"maSiteWorkForm");
}
</script>
</head>
<content tag="heading">新增关注点</content>
<body>

	<html:form action="maSiteWorkLogAction.do" method="POST"  styleId="maSiteWorkForm">
  	    <input type="hidden" name="method" value="saveSiteWork">
	    <html:hidden property="work_id"/>
	    <html:hidden property="work_status" value="0"/>
	    <html:hidden property="report_date" value="${report_date}"/>
		<html:hidden property="creater" value="${empid}"/>
		<fieldset>
			<legend>
				新增关注点
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
						工点名称：
						<span class="redSpan">*</span>
					</td>
					<td colspan="3">
				<html:select property="station_id">
					<html:option value="">${texts['dictSelect.select']}</html:option>
					<html:optionsCollection name="stations" value="station_id" label="station_name"/>
				</html:select>	
			</td>
				</tr>
				<tr>
				<td>
						任务名称：
						<span class="redSpan">*</span>
					</td>
					<td>
						<html:text property="work_name" styleClass="text" size="90" />
					</td>
				</tr>
				<tr>
					<td>
						任务类型：
						<span class="redSpan">*</span>
					</td>
					<td>
						<ex:dictSelect property="work_type" type="TaskWorkType"
							value="1" />
					</td>
					<td>
						关注等级：
						<span class="redSpan">*</span>
					</td>
					<td>
						<ex:dictSelect property="work_rank" type="TaskWorkRank"
							/>
					</td>
				</tr>
				<tr>
				<td>
						说明：
						<span class="noRedSpan">*</span>
					</td>
				<td colspan="3">
           			<html:textarea property="work_memo" styleId="work_memo" cols="85" rows="8" onkeydown="textCounter('work_memo','spanAim5',4000)" onkeyup="textCounter('work_memo','spanAim5',4000)" ></html:textarea><br>
	             	<span class="req" id="spanAim5" style="display:inline">(4000字符以内!)</span>
	             </td>
				</tr>

				<tr>
					<td>
						创建人：
						<span class="noRedSpan">*</span>
					</td>
					<td>
						<ex:employeeName id="${empid}" />
					</td>
					<td>
					  创建时间：
						<span class="noRedSpan">*</span>
					</td>
					<td>
					${creat_date}
						

					</td>
				</tr>
				

			</table>
		</fieldset>

		<div class="saveDiv">
			<input id="btn_save" value="确  定" type="button" icon="icon_save"  onclick="saveInfo()" />
			<input id="btn_back" value="${texts['button.back']}" type="button"
				icon="icon_back"  onclick="backToList()"/>
		</div>
	</html:form>
</body>
</html:html>
