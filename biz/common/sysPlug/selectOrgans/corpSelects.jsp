<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
<script type="text/javascript">
	//加载
	$(document).ready(function(){
			$("#plug_btnSelect").click(function(){ 
					//
					$("#plugTemp_corpIds").val($("#plug_corpIds").val());
					$("#plugTemp_corpCodes").val($("#plug_corpCodes").val());
					$("#plugTemp_corpNames").val($("#plug_corpNames").val());
					//
					var url = "contentSelectAction.do?method=corpSelects&corptype=1";
					art.dialog({id:'commonDialog1',title:'施工单位选择', iframe:url, width:'600', height:'425'}).close(function(){
					  	//
					  	setParamValue($("#plug_corpIds").val(),$("#plug_corpCodes").val(),$("#plug_corpNames").val());
					});	
			}); 
	});
	//设值
	function setInitParamValue(plug_corpIds,plug_corpCodes,plug_corpNames){
		$("#plug_corpIds").val(plug_corpIds);
		$("#plug_corpCodes").val(plug_corpCodes);
		$("#plug_corpNames").val(plug_corpNames);
	}
</script>
	<input id="plug_btnSelect" value="单位选择" type="button"  class="button1" icon="icon_selectInfo" />
	<div style="display: none;">
		<input id="plug_corpIds" type="text" >
		<input id="plug_corpCodes" type="text" >
		<input id="plug_corpNames" type="text" >
		
		<input id="plugTemp_corpIds" type="text" >
		<input id="plugTemp_corpCodes" type="text" >
		<input id="plugTemp_corpNames" type="text" >
	</div>



	



