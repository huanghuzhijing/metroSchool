<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
<html:html>
<head>
	<%@ include file="/commons/meta.jsp"%>
	<script type="text/javascript">
	$(document)
			.ready(function() {
			var flag=true;
			 year = jQuery("[name='year']").val();
			 month = jQuery("[name='month']").val();
			 week = jQuery("[name='week']").val();
				//确定
					$("#btn_save").click(
							function() {
//								if(!validateWeek()&&year==${safeInspecting.year}&&month==${safeInspecting.month}&&week==${safeInspecting.week}){
									var properties = new Array();
									   properties[0] = [ "line_id", "线路" ];
										properties[1] = [ "segment_id", "标段" ];
										properties[2] = [ "station_id", "车站/区间" ];
										properties[3] = [ "year", "年份" ];
										properties[4] = [ "month", "月份" ];
										properties[5] = [ "week", "周次" ];
										properties[6] = [ "content", "内容" ];
										
										saveValidateRequired("#btn_save", properties,
												"safeInspectingForm");
//									return true;								
//									}
								
//							if(!validateWeek()){
//							return false;
//							}
								
										
							});
					//返回
					$("#btn_back")
							.click(
									function() {
										location.href = "${ctx}/safeInspectingAction.do?method=list&qlineId=${param.qlineId}&qsegmentId=${param.qsegmentId}&qstationId=${param.qstationId}&qyear=${param.qyear}&qmonth=${param.qmonth}&qweek=${param.qweek}&ec_id=${param.inspecting_id}&ec_p=${param.ec_p}&ec_crd=${param.ec_crd}";
									});

				});
				
	//验证所选周次是否有填报信息
		function validateWeek(){
	var line_id = jQuery("[name='line_id']").val();
	var segment_id = jQuery("[name='segment_id']").val();
	var station_id = jQuery("[name='station_id']").val();
//	var year = jQuery("[name='year']").val();
//	var month = jQuery("[name='month']").val();
//	var week = jQuery("[name='week']").val();
				
		$.ajax({
			    url:"safeInspectingAction.do?method=validateWeek&line_id="+line_id+"&segment_id="+segment_id+"&station_id="+station_id+"&year="+year+"&month="+month+"&week="+week+"",
			    type:'get',
			    dataType:'text',
			    success:function(data){
			 
			     if(data==1){
			     alert("本周安全巡查信息已经填写,请重选周次");
			    flag=false;
			     }else{
			     flag=true;
			     }
			    }
			   });
		return flag;
}			
	
</script>
</head>

<body>
	
	<html:form enctype="multipart/form-data"
		action="safeInspectingAction.do" method="POST">
		<input name="method" value="save" type="hidden" />
		<html:hidden property="qlineId" />
		<html:hidden property="qsegmentId" />
		<html:hidden property="qstationId" />
		
		<html:hidden property="ec_id" value="${safeInspecting.inspecting_id}"/>
		<html:hidden property="inspecting_id"    />
		<html:hidden property="ec_p" />
		<html:hidden property="ec_crd" />
		<html:hidden property="line_id"  value="${safeInspecting.line_id}"/>
       <html:hidden property="segment_id"  value="${safeInspecting.segment_id}" />
       <html:hidden property="station_id"  value="${safeInspecting.station_id}"/>
		<fieldset>
			<legend>
				安全巡检信息-编辑
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
							value="${line_name}" />																	 					
					</td>
					</tr>
					<tr>
					<td>
						标段：
						<span class="redSpan">*</span>
					</td>
					<td>
						<input type="text" readonly="readonly" id="segment_id"
							name="segment_id" class="form_input"
							value="${segment_name}" />
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
							value="${station_name}" />
					</td>
				</tr>

				<tr>
					<td>
						年份：
						<span class="redSpan">*</span>
					</td>
					<td>
<%--					<html:select property="year" value="${safeInspecting.year}" onchange="validateWeek()">--%>
<%--					   		<html:optionsCollection name="yearoptions"/>--%>
<%--					  </html:select>--%>
						<input type="text" readonly="readonly" 
							name="year" class="form_input"
							value="${safeInspecting.year}" />
					</td>
					<td>
						月份：
						<span class="redSpan">*</span>
					</td>
					<td>
<%--					<html:select property="month" value="${safeInspecting.month}" onchange="validateWeek()">--%>
<%--					   		<html:optionsCollection name="monthoptions"/>--%>
<%--					  </html:select>--%>
						<input type="text" readonly="readonly" 
							name="month" class="form_input"
							value="${safeInspecting.month}" />
					</td>
					</tr>
					<tr>
					<td>
						周次：
						<span class="redSpan">*</span>
					</td>
					<td>
<%--					<ex:dictSelect type="InspectingWeek" property="week" value="${safeInspecting.week }" onchange="validateWeek()"/>--%>
						<input type="text" readonly="readonly" 
							name="week" class="form_input"
							value="${safeInspecting.week}" />
					</td>
					<td>
						记录人：
						<span class="redSpan">*</span>
					</td>
					<td>
						<input type="text" readonly="readonly" id="recorder" name="recorder"
							class="form_input" value="${oper}" />
					</td>
				</tr>
				<tr>
					<td>
						内容:
						<span class="redSpan">*</span>
					</td>		
					<td colspan="3">
			     	<html:textarea property="content" cols="80" rows="7" />
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
