<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
<script type="text/javascript">
	//加载
	$(document).ready(function(){
			//
			$("#plug_selectFeePayPlan").click(function(){
				var url ='contentSelectAction.do?method=selectFeePayPlan&queryFeePlanType=${queryFeePlanType}';
				art.dialog({id:'commonDialog1',title:'费用支付计划信息', iframe:url, width:'680', height:'450',top:'0'}).close(function(){
				  	//
				  	setFeePayPlanValue($("#plug_planId").val(),$("#plug_feeName").val(),$("#plug_feeType").val(),$("#plug_yearNum").val(),$("#plug_monthNum").val(),$("#plug_totalBelong").val(),$("#plug_planPaySum").val());
				});	
			}); 
			//
	});
</script>
	<input id="plug_selectFeePayPlan" value="费用计划选择" type="button"  icon="icon_selectInfo"/>
	<div style="display: none;">
		<input id="plug_planId" type="text" />
		<input id="plug_feeName" type="text" />
	    <input id="plug_feeType" type="text" />
	    <input id="plug_yearNum" type="text" />
	    <input id="plug_monthNum" type="text" />
	    <input id="plug_totalBelong" type="text" />
	    <input id="plug_planPaySum" type="text" />
	</div>



	



