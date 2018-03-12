<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
<script type="text/javascript">
	//加载
	$(document).ready(function(){
			$("#plug_btnSelect").click(function(){ 
					//
					$("#plugTemp_parcelIds").val($("#plug_parcelIds").val());
					$("#plugTemp_parcelCodes").val($("#plug_parcelCodes").val());
					$("#plugTemp_parcelNames").val($("#plug_parcelNames").val());
					//
					var url = "contentSelectAction.do?method=selectParcels&queryParcelType=${queryParcelType}";
					art.dialog({id:'commonDialog1',title:'地块选择', iframe:url, width:'750', height:'425',top:'110'}).close(function(){
					  	setParcelParamValue($("#plug_parcelIds").val(),$("#plug_parcelCodes").val(),$("#plug_parcelNames").val());
					});	
			}); 
	});
</script>
	<input id="plug_btnSelect" value="选择" type="button"  class="button1" icon="icon_selectInfo" />
	<div style="display: none;">
		<input id="plug_parcelIds" type="text" >
		<input id="plug_parcelCodes" type="text" >
		<input id="plug_parcelNames" type="text" >
		
		<input id="plugTemp_parcelIds" type="text" >
		<input id="plugTemp_parcelCodes" type="text" >
		<input id="plugTemp_parcelNames" type="text" >
	</div>



	



