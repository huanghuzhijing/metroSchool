<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
<script type="text/javascript">
	//加载
	$(document).ready(function(){
			//
			initCostStatisticalAccountParamValue();
			//
			$("#plug_selectCostStatisticalAccount").click(function(){
					$("#flag_costStatisticalAccountId").val(0);
					var querystatisticsSort=$("[name='objectSort'][checked]").val();
					var url ='contentSelectAction.do?method=selectCostStatisticalAccount&queryCostStatisticalAccountType=${queryCostStatisticalAccountType}&oper_id='+$("#plug_costStatisticalAccountId").val()+'&qctrSort='+$("[name='ctrSort'][checked]").val()+'&querystatisticsSort='+querystatisticsSort;
					art.dialog({id:'commonDialog1',title:'统计科目', iframe:url, width:'600', height:'350'}).close(function(){
						if($("#flag_costStatisticalAccountId").val()==1){
							setCostStatisticalAccountParamValue($("#plug_costStatisticalAccountId").val(),$("#plug_costStatisticalAccountCode").val(),$("#plug_costStatisticalAccountName").val());
						}
					});	
			}); 
			//
	});
</script>
	<input id="plug_selectCostStatisticalAccount" value="选择" type="button"  icon="icon_selectInfo"/>
	<div style="display: none;">
		<input id="flag_costStatisticalAccountId" type="text" />
		<input id="plug_costStatisticalAccountId" type="text" />
	    <input id="plug_costStatisticalAccountCode" type="text" />
	    <input id="plug_costStatisticalAccountName" type="text" />
	</div>



	



