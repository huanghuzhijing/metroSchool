<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
<script type="text/javascript">
	//加载
	$(document).ready(function(){
			//
			$("#plug_selectCtrContractArchived").click(function(){
				var url ='contentSelectAction.do?method=selectCtrContractArchived&queryCtrContractArchived=${queryCtrContractArchived}';
				art.dialog({id:'commonDialog1',title:'合同归档资料信息', iframe:url, width:'750', height:'400'}).close(function(){
				  	setParamArchivedValue($("#plug_CtrContractArchived_id").val(),$("#plug_CtrContractArchived_name").val());
				});	
			}); 
			//
	});
</script>
	<input id="plug_selectCtrContractArchived" value="选择" type="button"  icon="icon_selectInfo"/>
	<div style="display: none;">
		<input id="plug_CtrContractArchived_id" type="text" />
	    <input id="plug_CtrContractArchived_name" type="text" />
	</div>



	



