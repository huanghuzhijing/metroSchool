<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
<script type="text/javascript">
	//加载
	$(document).ready(function(){
			//
			$("#plug_selectWorkFlow").click(function(){
				var url ='contentSelectAction.do?method=selectWorkFlow&queryWorkFlowType=${param.queryWorkFlowType}';
				art.dialog({id:'commonDialog1',title:'工作流信息', iframe:url, width:'600', height:'400',top:'0'}).close(function(){
				  	setParamWorkFlowValue($("#plug_workFlow_id").val(),$("#plug_workFlow_name").val());
				});	
			}); 
			//
	});
</script>
	<input id="plug_selectWorkFlow" value="选择" type="button"  icon="icon_selectInfo"/>
	<div style="display: none;">
		<input id="plug_workFlow_id" type="text" />
	    <input id="plug_workFlow_name" type="text" />
	</div>



	



