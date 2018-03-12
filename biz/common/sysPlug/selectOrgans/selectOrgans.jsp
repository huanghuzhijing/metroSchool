<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
<script type="text/javascript">
	//加载
	$(document).ready(function(){
			$("#plug_btnSelect").click(function(){ 
					//
					$("#plugTemp_organIds").val($("#plug_organIds").val());
					$("#plugTemp_organCodes").val($("#plug_organCodes").val());
					$("#plugTemp_organNames").val($("#plug_organNames").val());
					//
					var url = "contentSelectAction.do?method=selectOrgans&queryType=${queryType}";
					art.dialog({id:'commonDialog1',title:'组织选择', iframe:url, width:'600', height:'425',top:'110'}).close(function(){
					  	//
					  	setParamValue($("#plug_organIds").val(),$("#plug_organCodes").val(),$("#plug_organNames").val());
					});	
			}); 
	});
	//设值
	function setInitParamValue(plug_organIds,plug_organCodes,plug_organNames){
		$("#plug_organIds").val(plug_organIds);
		$("#plug_organCodes").val(plug_organCodes);
		$("#plug_organNames").val(plug_organNames);
	}
</script>
	<input id="plug_btnSelect" value="组织选择" type="button"  class="button1" icon="icon_selectInfo" />
	<div style="display: none;">
		<input id="plug_organIds" type="text" >
		<input id="plug_organCodes" type="text" >
		<input id="plug_organNames" type="text" >
		
		<input id="plugTemp_organIds" type="text" >
		<input id="plugTemp_organCodes" type="text" >
		<input id="plugTemp_organNames" type="text" >
	</div>



	



