<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
<html:html>
<head>
	<%@ include file="/commons/meta.jsp"%>
	<script type="text/javascript">
	$(document)
			.ready(function() {
				var flag="${param.flag}";
					//返回
					$("#btn_back")
							.click(
									function() {
									if(flag==1){
									var url = "${ctx}/constructorAction.do?method=list&lineId=${param.lineId}&segmentId=${param.segmentId}&organId=${param.organId}&ec_id=${param.cons_id}&ec_p=${param.ec_p}&ec_crd=${param.ec_crd}";
									document.forms[0].action=url;
									document.forms[0].submit();
									}
									if(flag==2){
									var url = "${ctx}/constructorAction.do?method=queryList&flag=${param.flagExp}&lineId=${param.lineId}&segmentId=${param.segmentId}&organId=${param.organId}&qsex=${param.qsex}&qstartDate=${param.qstartDate}&qendDate=${param.qendDate}&ec_id=${param.cons_id}&ec_p=${param.ec_p}&ec_crd=${param.ec_crd}";
									document.forms[0].action=url;
									document.forms[0].submit();
									}
										
									});

				});
	
</script>
</head>

<body>
	
	<html:form enctype="multipart/form-data"
		action="constructorAction.do" method="POST">
		<input name="method"  type="hidden" />
		<html:hidden property="qname" />
		<fieldset>
			<legend>
				人员资质信息-详细
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
						施工单位：
						<span class="noRedSpan">*</span>
					</td>
					<td>
						${organ_name}
					</td>
				</tr>

				<tr>
					<td>
						姓名：
						<span class="noRedSpan">*</span>
					</td>
					<td>
						${constructor.name}
					</td>
					<td>
						性别：
						<span class="noRedSpan">*</span>
					</td>
					<td>
					<ex:dicDisplay dictIdentify="EmployeeSex" dictValue="${constructor.sex}"/>
						

					</td>
				</tr>
				<tr>
					<td>
						出生日期：
						<span class="noRedSpan">*</span>
					</td>
					<td>
					<fmt:formatDate value="${constructor.birthday}" pattern="yyyy-MM-dd"/>
						
							
					</td>
					<td>
						身份证号：
						<span class="noRedSpan">*</span>
					</td>
					<td>
						${constructor.card_code}

					</td>
				</tr>
				<tr>
					<td>
						工种：
						<span class="noRedSpan">*</span>
					</td>
					<td>
					<ex:dicDisplay dictIdentify="JobType" dictValue="${constructor.job_type}"/>
						
					</td>
					<td>
						资格证号：
						<span class="noRedSpan">*</span>
					</td>
					<td>
						${constructor.qualify_card}

					</td>
				</tr>
				<tr>
					<td>
						资格证有效期：
						<span class="noRedSpan">*</span>
					</td>
					<td>
					<fmt:formatDate value="${constructor.qualify_limit}" pattern="yyyy-MM-dd"/>
						
							
					</td>
					<td>
						岗前培训：
						<span class="noRedSpan">*</span>
					</td>
					<td>
					<ex:dicDisplay dictIdentify="IsJobTrainning" dictValue="${constructor.isjob_training}"/>
						

					</td>
				</tr>
				<tr>
					<td>
						状态：
						<span class="noRedSpan">*</span>
					</td>
					<td>
					<ex:dicDisplay dictIdentify="JobState" dictValue="${constructor.job_state}"/>
						
					</td>
					<td>
						联系电话：
						<span class="noRedSpan">*</span>
					</td>
					<td>
						${constructor.phone}

					</td>
				</tr>
				<tr>
					<td>
						上岗资格证图片：
						<span class="noRedSpan">*</span>
					</td>
					<td>
						<c:if test="${not empty constructor.training_pic_address}">
							<img alt=""
								src="${ctx}/constructorAction.do?method=download&cons_id=${constructor.cons_id}"
								width="250px" height="250px">
							
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
