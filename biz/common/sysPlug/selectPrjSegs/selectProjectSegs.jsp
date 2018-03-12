<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
<script type="text/javascript">
	//加载
	$(document).ready(function(){
			$("#plug_btnSelect").click(function(){ 
					//
					$("#plugTemp_prjIds").val($("#plug_prjIds").val());
					$("#plugTemp_prjCodes").val($("#plug_prjCodes").val());
					$("#plugTemp_prjNames").val($("#plug_prjNames").val());
					//
					var url = "contentSelectAction.do?method=selectPrjSegments";
					art.dialog({id:'commonDialog1',title:'标段选择', iframe:url, width:'600', height:'425',top:'110'}).close(function(){
					  	//
					  	setParamValue($("#plug_prjIds").val(),$("#plug_prjCodes").val(),$("#plug_prjNames").val());
				
					});	
			}); 
	});
	//设值
	function setInitParamValue(plug_prjIds,plug_prjCodes,plug_prjNames){
		$("#plug_prjIds").val(plug_prjIds);
		$("#plug_prjCodes").val(plug_prjCodes);
		$("#plug_prjNames").val(plug_prjNames);
		
	}
</script>
	<input id="plug_btnSelect" value="标段选择" type="button"  class="button1" icon="icon_selectInfo" />
	<div style="display: none;">
		<input id="plug_prjIds" type="text" >
		<input id="plug_prjCodes" type="text" >
		<input id="plug_prjNames" type="text" >
		
		<input id="plugTemp_prjIds" type="text" >
		<input id="plugTemp_prjCodes" type="text" >
		<input id="plugTemp_prjNames" type="text" >
	</div>



	



