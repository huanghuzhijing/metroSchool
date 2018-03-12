<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
<script type="text/javascript">
	//加载
	$(document).ready(function(){
			$("#plug_btnSelect_3").click(function(){ 
					//
					$("#plugTemp_corpIds_3").val($("#plug_corpIds_3").val());
					$("#plugTemp_corpCodes_3").val($("#plug_corpCodes_3").val());
					$("#plugTemp_corpNames_3").val($("#plug_corpNames_3").val());
					//
					var url = "contentSelectAction.do?method=corpSelects_safe&corptype=5";
					art.dialog({id:'commonDialog1',title:'安全监理单位选择', iframe:url, width:'600', height:'425'}).close(function(){
					  	//
					  	setParamValue_3($("#plug_corpIds_3").val(),$("#plug_corpCodes_3").val(),$("#plug_corpNames_3").val());
					});	
			}); 
	});
	//设值
	function setInitParamValue_3(plug_corpIds_3,plug_corpCodes_3,plug_corpNames_3){
		$("#plug_corpIds_3").val(plug_corpIds_3);
		$("#plug_corpCodes_3").val(plug_corpCodes_3);
		$("#plug_corpNames_3").val(plug_corpNames_3);
	}
</script>
	<input id="plug_btnSelect_3" value="单位选择" type="button"  class="button1" icon="icon_selectInfo" />
	<div style="display: none;">
		<input id="plug_corpIds_3" type="text" >
		<input id="plug_corpCodes_3" type="text" >
		<input id="plug_corpNames_3" type="text" >
		
		<input id="plugTemp_corpIds_3" type="text" >
		<input id="plugTemp_corpCodes_3" type="text" >
		<input id="plugTemp_corpNames_3" type="text" >
	</div>



	



