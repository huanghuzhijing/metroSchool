<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
<script type="text/javascript">
	//加载
	$(document).ready(function(){
			$("#plug_btnSelect").click(function(){ 
					//
					var url = "contentSelectAction.do?method=selectParcelSingle&queryParcelType=${queryParcelType}";
					art.dialog({id:'commonDialog1',title:'地块选择', iframe:url, width:'750', height:'425',top:'110'}).close(function(){
					  	setParcelParamValue($("#plug_parcelId").val(),$("#plug_parcelCode").val(),$("#plug_parcelName").val());
					});	
			}); 
	});
</script>
	<input id="plug_btnSelect" value="选择" type="button"  class="button1" icon="icon_selectInfo" />
	<div style="display: none;">
		<input id="plug_parcelId" type="text" >
		<input id="plug_parcelCode" type="text" >
		<input id="plug_parcelName" type="text" >
		
	</div>



	



