<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
<html:html>
<head>
	
	<script type="text/javascript">
	$(document)
			.ready(function() {
				//确定
					$("#btn_save").click(function() {
						var properties = new Array();
			properties[0]=["general_name","任务名称"];			
			properties[1]=["general_type","任务类型"];
			properties[2]=["general_rank","关注等级"];
			properties[3]=["allot_empids","指定人员"];

							saveValidateRequired("#btn_save", properties,
									"maGeneralWorkForm");
						});
					//返回
					$("#btn_back")
							.click(
									function() {
										location.href = "${ctx}/maGeneralWorkAction.do?method=list";
									});

				});
				
				
//	function selectEmployee(){
//			var url ="${ctx}/employeeAction.do?method=selectEmpNoteOGCOrgan";
//		 	art.dialog({id:'selectEmployee',title:'选择人员', iframe:url, width:'800', height:'450',top:'10'});
//}

function setParamValue(empIds,empNames){
		$("[name='allot_empids']").val(empIds);
		$("[name='allot_names']").val(formatStringComma(empNames));
	}

function clearMember(){
	jQuery("[name='allot_empids']").val("");
	jQuery("[name='allot_names']").val("") ;
	this.selectPhones = ",";
	this.selectIncepter = ",";
}

function setCheckBox(prompt_way){
	var promptObj = jQuery("[name='prompt_ways']");
	if(prompt_way != ""){
		promptObj.each(function(){
			if(prompt_way.indexOf(jQuery(this)) != -1){
				jQuery(this).attr("checked","checked") ;
			}
		})
	}else{
		jQuery("[name='prompt_ways']:eq(0)").attr("checked","checked") ;
	}
}				
</script>
</head>
<content tag="heading">
	一般工作管理
</content>
<body onload="setCheckBox('${maGeneralWork.prompt_way}')">

	<html:form enctype="multipart/form-data"
		action="maGeneralWorkAction.do" method="POST">
		<input name="method" value="save" type="hidden" />
		
		
		<html:hidden property="qgeneralName" />
		<html:hidden property="qgeneralType" />
		<html:hidden property="qgeneralRank" />
		<html:hidden property="qgeneralStatus" />

		<html:hidden property="general_id" />
		<html:hidden property="ec_p" />
		<html:hidden property="ec_crd" />
		
		<fieldset>
			<legend>
				一般工作管理-新增
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
						<span class="redSpan">*</span>
					</td>
					<td>
						<html:text property="general_name" styleClass="text" size="90" />
					</td>
				</tr>
				<tr>
					<td>
						任务类型：
						<span class="redSpan">*</span>
					</td>
					<td>
						<ex:dictSelect property="general_type" type="GeneralWorkType"
							value="1" />
					</td>
					<td>
						关注等级：
						<span class="redSpan">*</span>
					</td>
					<td>
						<ex:dictSelect property="general_rank" type="TaskWorkRank"
							/>
					</td>
				</tr>
				<tr>
				<td>
						指定人员：
						<span class="redSpan">*</span>
					</td>
					<td colspan="3">
								<html:hidden property="allot_empids" />
								<html:text property="allot_names" size="90" styleClass="text" maxlength="50" readonly="true"/>
<!--								<input type="button" name="abc" value="选择" class="button1" onclick="selectEmployee()">-->
<%@ include file="/biz/sysmanager/sysmaintain/sysPlug/selectEmpNoteOrganGroupCorp/selectEmpNoteOrganGroupCorp.jsp" %>
		                         <input type="button" name="def" value="清空" class="button1" onclick="clearMember()">
								
							</td>
				</tr>
				<tr>
				<td>
						说明：
						<span class="noRedSpan">*</span>
					</td>
				<td colspan="3">
           			<html:textarea property="general_memo" styleId="general_memo" cols="85" rows="8" onkeydown="textCounter('general_memo','spanAim5',4000)" onkeyup="textCounter('general_memo','spanAim5',4000)" ></html:textarea><br>
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
