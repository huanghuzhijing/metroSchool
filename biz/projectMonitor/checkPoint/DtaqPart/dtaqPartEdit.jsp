<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>

<ex:bundle />
<html:html>
<head>
	<script type="text/javascript">
	   $(document).ready(function(){

			
			$("#btn_save").click(function(){
			 $.ajax({
				   type: "POST",
				   url: "${ctx}/dtaqPartAction.do?method=validate",	
				   data:"part_name="+jQuery("[name='part_name']").val()+"&type_id=${type_id}&station_id=${qstation_id}&part_id=${param.part_id}",
				   success: function(msg){
						 if(msg=="no"){
							 alert('该监测部位名称已存在，请您重新填写');
							
						 }else{
						 var properties=new Array(); 
							properties[0]=["part_name","监测部位名称"];
							properties[1]=["check_state","检测状态"];
							saveValidateRequired("#btn_save",properties,"dtaqPartForm");
						 }
					}
				}); 
				
			}); 
			//
			 
			$("#btn_back").click(function(){ 
				location.href='dtaqPartAction.do?method=list&ec_crd=${param.ec_crd}&organ_type=${organ_type}&qlineId=${qlineId}&qsectionId=${qsectionId}&qstation_id=${qstation_id}&type_id=${type_id}&station_state=${station_state}';
			});  
			
		});
		//
		
	
		//
	</script>
</head>
<content tag="heading">
监测点信息维护
</content> 
<body>
	<html:form enctype="multipart/form-data" action="dtaqPartAction.do" method="POST">
		<input name="method" value="save" type="hidden" />
		
		<!--查询定位 开始-->
		<html:hidden property="part_id"/>
		<html:hidden property="ec_crd" />
		<html:hidden property="ec_p" />
		<html:hidden property="ec_id" value="${dtaqPart.part_id}"/>
		<html:hidden property="type_id" value="${param.type_id}"/>
		<html:hidden property="qlineId" value="${param.qlineId}"/>
		<html:hidden property="qsectionId" value="${param.qsectionId}"/>
		<html:hidden property="organ_type" />
		<html:hidden property="qstation_id" value="${param.qstation_id}"/>
		<html:hidden property="station_state"/>
		<!--查询定位 结束-->
		<fieldset >
			<legend>编辑</legend>
			<table class="formTable" >
					<COLGROUP>
						<COL class="tdLeftTwo" />
						<COL class="tdRightTwo" />
						<COL class="tdLeftTwo" />
						<COL class="tdRightTwo" />
					</COLGROUP>
					<tr>
						<td>
							所属类型名称：<span class="redSpan">*</span>
						</td>
						<td >
							<ex:typeId id="${type_id}"/>
						</td>

						<td>
							监测部位名称：<span class="noRedSpan">*</span>
						</td>
						<td >
							<html:text property="part_name"  styleClass="inputText" maxlength="100" size="30"/>
						</td>
					</tr>
					<tr>

    					<td>
							是否正在检测：<span class="noRedSpan">*</span>
						</td>
						<td>
						 <ex:dictSelect property="check_state" type="Yesorno" />
						</td>
					</tr>
					<tr>
						<td>
							备&nbsp;&nbsp;&nbsp;&nbsp;注：<span class="noRedSpan">*</span>
						</td>
						<td colspan="3">
							<html:textarea  property="remark"></html:textarea>
						</td>
					</tr>
			</table>
		</fieldset>
	
		<div class="saveDiv">
			<input id="btn_save" value="${texts['button.save']}" type="button" icon="icon_save"/>
			<input id="btn_back" value="${texts['button.back']}" type="button" icon="icon_back"/>
		</div>
	</html:form>
</body>
</html:html>

