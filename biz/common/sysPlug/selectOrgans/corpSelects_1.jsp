<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
<script type="text/javascript">
	//加载
	$(document).ready(function(){
			$("#plug_btnSelect_1").click(function(){ 
					//
					$("#plugTemp_corpIds_1").val($("#plug_corpIds_1").val());
					$("#plugTemp_corpCodes_1").val($("#plug_corpCodes_1").val());
					$("#plugTemp_corpNames_1").val($("#plug_corpNames_1").val());
					//
					var url = "contentSelectAction.do?method=corpSelects_1&corptype=2";
					art.dialog({id:'commonDialog1',title:'设计单位选择', iframe:url, width:'600', height:'425'}).close(function(){
					  	//
					  	setParamValue_1($("#plug_corpIds_1").val(),$("#plug_corpCodes_1").val(),$("#plug_corpNames_1").val());
					});	
			}); 
	});
	//设值
	function setInitParamValue_1(plug_corpIds_1,plug_corpCodes_1,plug_corpNames_1){
		$("#plug_corpIds_1").val(plug_corpIds_1);
		$("#plug_corpCodes_1").val(plug_corpCodes_1);
		$("#plug_corpNames_1").val(plug_corpNames_1);
	}
</script>
	<input id="plug_btnSelect_1" value="单位选择" type="button"  class="button1" icon="icon_selectInfo" />
	<div style="display: none;">
		<input id="plug_corpIds_1" type="text" >
		<input id="plug_corpCodes_1" type="text" >
		<input id="plug_corpNames_1" type="text" >
		
		<input id="plugTemp_corpIds_1" type="text" >
		<input id="plugTemp_corpCodes_1" type="text" >
		<input id="plugTemp_corpNames_1" type="text" >
	</div>



	



