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
							$("[name='kind']").val("save");
								var properties = new Array();
								properties[0] = [ "name", "姓名" ];
								properties[1] = [ "sex", "性别" ];
								properties[2] = [ "birthday", "出生年月" ];
								properties[3] = [ "job_type", "工种" ];
								properties[4] = [ "qualify_limit", "资格证有效期" ];
								properties[5] = [ "isjob_training", "岗前培训" ];
								properties[6] = [ "job_state", "状态" ];
								
								saveValidateRequired("#btn_save", properties,
										"constructorForm");
							});
							
							//"nextsave"
		$("#nextsave").click(function(){
        $("[name='kind']").val("next");
			var properties=new Array(); 
			                   properties[0] = [ "name", "姓名" ];
								properties[1] = [ "sex", "性别" ];
								properties[2] = [ "birthday", "出生年月" ];
								properties[3] = [ "job_type", "工种" ];
								properties[4] = [ "qualify_limit", "资格证有效期" ];
								properties[5] = [ "isjob_training", "岗前培训" ];
								properties[6] = [ "job_state", "状态" ];
			saveValidateRequired("#nextsave",properties,"constructorForm");
		}); 
					//返回
					$("#btn_back")
							.click(
									function() {
										location.href = "${ctx}/constructorAction.do?method=list&lineId=${param.lineId}&segmentId=${param.segmentId}&organId=${param.organId}";
									});

				});
				
				
		
		function fileClear(){
			 $("#fileName_").val("");
			 $("#fileAddr_").val("");
		}
		function showUploadDialogAndRefresh(URL,tWidth,tHeight){
	dlgFeatures = "dialogWidth:" + tWidth + "px;dialogHeight:" + tHeight +"px;resizable:yes;center:yes;";
	
		var url = URL;
		art.dialog({id:'newwindow',title:'文件上传', iframe:url, width:'500', height:'250',top:'50%'}) ;	
}   
	
</script>
</head>

<body>
	
	<html:form enctype="multipart/form-data"
		action="constructorAction.do" method="POST">
		<input name="method" value="save" type="hidden" />
		
		<html:hidden property="kind"/>
		<html:hidden property="cons_id" />
		<html:hidden property="ec_p" />
		<html:hidden property="ec_crd" />
		<html:hidden property="line_id"  value="${dtaqSegment.line_id.line_id}"/>
       <html:hidden property="segment_id"  value="${dtaqSegment.segment_id}" />
       <html:hidden property="organ_sg"  value="${dtaqSegment.e_org.f_id}"/>
		<fieldset>
			<legend>
				人员资质信息-新增
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
						${dtaqSegment.line_id.line_name}
					</td>
					<td>
						标段：
						<span class="noRedSpan">*</span>
					</td>
					<td>
						${dtaqSegment.segment_name}
					</td>
				</tr>


				<tr>
					<td>
						施工单位：
						<span class="noRedSpan">*</span>
					</td>
					<td>
						${dtaqSegment.e_org.f_name}
					</td>
				</tr>

				<tr>
					<td>
						姓名：
						<span class="redSpan">*</span>
					</td>
					<td>
						<input type="text"  id="name" name="name"
							class="form_input" />
					</td>
					<td>
						性别：
						<span class="redSpan">*</span>
					</td>
					<td>
						<ex:dictSelect type="EmployeeSex" property="sex"/>

					</td>
				</tr>
				<tr>
					<td>
						出生日期：
						<span class="redSpan">*</span>
					</td>
					<td>
						<html:text property="birthday" 
							styleClass="inputText"
							onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})" />
					</td>
					<td>
						身份证号：
						<span class="noRedSpan">*</span>
					</td>
					<td>
						<input type="text"  id="card_code" name="card_code"
							class="form_input" />

					</td>
				</tr>
				<tr>
					<td>
						工种：
						<span class="redSpan">*</span>
					</td>
					<td>
						<ex:dictSelect type="JobType" property="job_type"/>
					</td>
					<td>
						资格证号：
						<span class="noRedSpan">*</span>
					</td>
					<td>
						<input type="text"  id="qualify_card" name="qualify_card"
							class="form_input" />

					</td>
				</tr>
				<tr>
					<td>
						资格证有效期：
						<span class="redSpan">*</span>
					</td>
					<td>
						<html:text property="qualify_limit" value="${currDate}"
							styleClass="inputText"
							onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})" />
					</td>
					<td>
						岗前培训：
						<span class="redSpan">*</span>
					</td>
					<td>
						<ex:dictSelect type="IsJobTrainning" property="isjob_training"/>

					</td>
				</tr>
				<tr>
					<td>
						状态：
						<span class="redSpan">*</span>
					</td>
					<td>
						<ex:dictSelect type="JobState" property="job_state"/>
					</td>
					<td>
						联系电话：
						<span class="noRedSpan">*</span>
					</td>
					<td>
						<input type="text"  id="phone" name="phone"
							class="form_input" />

					</td>
				</tr>
				<tr>
					<td>
						上岗资格证图片：
						<span class="noRedSpan">*</span>
					</td>
					<td >
							<input type="text" id="fileName_" name="fileName_" class="inputText"  size="30"/>
							<input type="button" icon="icon_currWeek" onclick="javascript:showUploadDialogAndRefresh('contentSelectAction.do?method=uploadFile&flag=1&suffix=t&mainTableName=${maintable}',900,700);" style="width: 76px; height: 65px; cursor:pointer" value="单附件上传" alt="进入文件上传页面" />
							<input type="button" icon="icon_delete" onclick="fileClear(this)" style="width: 76px; height: 65px; cursor:pointer" value="清空"/>
			                 <font color="orange">(上传附件格式为：gif,jpg,jpeg,png,bmp)</font>
						</td>
						<td style="display:none">
							文件地址：<span class="noRedSpan">*</span>
						</td>
						<td style="display:none">
							<input type="text" id="fileAddr_" name="fileAddr_" class="inputText" readonly="readonly" size="30"/>

						</td>
					
				</tr>
				



			</table>
		</fieldset>

		<div class="saveDiv">
			<input id="btn_save" value="确  定" type="button" icon="icon_save" />
			<input id="nextsave" value="保存并新增下一个" type="button" class="button1" icon="icon_save"/>
			<input id="btn_back" value="${texts['button.back']}" type="button"
				icon="icon_back" />
		</div>
	</html:form>
</body>
</html:html>
