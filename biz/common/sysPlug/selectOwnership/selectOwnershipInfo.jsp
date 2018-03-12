<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
<script type="text/javascript">
	//加载
	$(document).ready(function(){
			//
			$("#plug_selectOwnership").click(function(){
				var url ='contentSelectAction.do?method=selectOwnership&queryOwnershipType=${queryOwnershipType}';
				art.dialog({id:'commonDialog1',title:"权属单位选择", iframe:url, width:'700', height:'400',top:'0'}).close(function(){
				  	//
				  	setParamOwnershipValue($("#plug_ownershipId").val(),$("#plug_ownershipType").val(),$("#plug_ownershipName").val());
				});	
			}); 
			//
	});
</script>
	<input id="plug_selectOwnership" value="权属单位选择" type="button"  icon="icon_selectInfo"/>
	<div style="display: none;">
		<input id="plug_ownershipId" type="text" >
	    <input id="plug_ownershipType" type="text" >
	    <input id="plug_ownershipName" type="text" >
	</div>



	



