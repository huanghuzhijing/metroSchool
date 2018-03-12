<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
<script type="text/javascript">
	//加载
	$(document).ready(function(){
			$("#plug_btnSelect_2").click(function(){ 
					//
					$("#plugTemp_corpIds_2").val($("#plug_corpIds_2").val());
					$("#plugTemp_corpCodes_2").val($("#plug_corpCodes_2").val());
					$("#plugTemp_corpNames_2").val($("#plug_corpNames_2").val());
					//
					var url = "contentSelectAction.do?method=corpSelects_2&corptype=3";
					art.dialog({id:'commonDialog1',title:'监理单位选择', iframe:url, width:'600', height:'425'}).close(function(){
					  	//
					  	setParamValue_2($("#plug_corpIds_2").val(),$("#plug_corpCodes_2").val(),$("#plug_corpNames_2").val());
					});	
			}); 
	});
	//设值
	function setInitParamValue_2(plug_corpIds_2,plug_corpCodes_2,plug_corpNames_2){
		$("#plug_corpIds_2").val(plug_corpIds_2);
		$("#plug_corpCodes_2").val(plug_corpCodes_2);
		$("#plug_corpNames_2").val(plug_corpNames_2);
	}
</script>
	<input id="plug_btnSelect_2" value="单位选择" type="button"  class="button1" icon="icon_selectInfo" />
	<div style="display: none;">
		<input id="plug_corpIds_2" type="text" >
		<input id="plug_corpCodes_2" type="text" >
		<input id="plug_corpNames_2" type="text" >
		
		<input id="plugTemp_corpIds_2" type="text" >
		<input id="plugTemp_corpCodes_2" type="text" >
		<input id="plugTemp_corpNames_2" type="text" >
	</div>



	



