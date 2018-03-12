<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
<script type="text/javascript">
	//加载
	$(document).ready(function(){
			//
			$("#plug_btnSelect").click(function(){
					var  deptFlag='${param.deptFlag}';
					if($("[name='letterDeptFlag']").val()!=null&&$("[name='letterDeptFlag']").val()!=""){
						deptFlag=$("[name='letterDeptFlag']").val();
					}
					var url = "employeeAction.do?method=selectEmpNoteOGOrgan&deptFlag="+deptFlag;
					art.dialog({id:'commonDialog1',title:'人员选择', iframe:url, width:'600', height:'425',top:'110'}).close(function(){
						//
						$("#plug_organ_empIds").val($("#plug_empIds").val().replaceAll(' ',''));
						$("#plug_organ_empNames").val($("#plug_empNames").val().replaceAll(' ',''));
						$("#plug_organ_organNames").val($("#plug_organNames").val().replaceAll(' ',''));
					  	$("#plug_organSelect").html($("#plug_trueSelect").html());
					  	//
					  	$("#plug_group_empIds").val($("#plug_empIds").val().replaceAll(' ',''));
						$("#plug_group_empNames").val($("#plug_empNames").val().replaceAll(' ',''));
						$("#plug_group_organNames").val($("#plug_organNames").val().replaceAll(' ',''));
					  	$("#plug_groupSelect").html($("#plug_trueSelect").html());
					  	//
					  	$("#plug_corp_empIds").val($("#plug_empIds").val());
						$("#plug_corp_empNames").val($("#plug_empNames").val());
						$("#plug_corp_organNames").val($("#plug_organNames").val());
					  	$("#plug_corpSelect").html($("#plug_trueSelect").html());
					  	//
					  	setParamValue($("#plug_empIds").val(),$("#plug_empNames").val(),$("#plug_organNames").val());
					});	
			});
			// 
	});
	
</script>
	<input id="plug_btnSelect" name="plug_btnSelect" value="人员选择" type="button"  class="button1" icon="icon_selectInfo" />
	<div style="display: none;">
		<input id="plug_empIds" type="text" >
	    <input id="plug_empNames" type="text" >
	    <input id="plug_organNames" type="text" >
		
		<input id="plug_organ_empIds" type="text" >
	    <input id="plug_organ_empNames" type="text" >
	    <input id="plug_organ_organNames" type="text" >
	    
	    <input id="plug_group_empIds" type="text" >
	    <input id="plug_group_empNames" type="text" >
	    <input id="plug_group_organNames" type="text" >
		
		<input id="plug_corp_empIds" type="text" >
	    <input id="plug_corp_empNames" type="text" >
	    <input id="plug_corp_organNames" type="text" >
		
		<select multiple id="plug_trueSelect" style="width: 100px;height:240px"></select>
		<select multiple id="plug_organSelect" style="width: 100px;height:240px"></select>	
		<select multiple id="plug_groupSelect" style="width: 100px;height:240px"></select>
		<select multiple id="plug_corpSelect" style="width: 100px;height:240px"></select>
		
	</div>

<script type="text/javascript">
	var moduleSign='${moduleSign}';
	if(moduleSign=='PrjSegmentInfo'){
		$("#plug_btnSelect").val('新  增');
	}
</script>

	



