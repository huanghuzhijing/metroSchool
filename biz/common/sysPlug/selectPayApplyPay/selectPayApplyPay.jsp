<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
<script type="text/javascript">
	//加载
	$(document).ready(function(){
			//
			$("#plug_selectPayApplyPay").click(function(){
				var url ='contentSelectAction.do?method=selectPayApplyPay&queryType=${queryType}';
				art.dialog({id:'commonDialog1',title:'支付申请信息', iframe:url, width:'700', height:'400',top:'0'}).close(function(){
				setParamCtrValue($("#plug_payId").val(),$("#plug_payCode").val(),$("#plug_payType").val(),$("#plug_yearNum").val(),$("#plug_monthNum").val(),$("#plug_prjName").val(),$("#plug_prjCode").val(),$("#plug_segName").val(),$("#plug_ctrName").val(),$("#plug_ctrCode").val(),$("#plug_corpname").val(),$("#plug_ctrsSum").val(),$("#plug_planPaySum").val());
				});	
			}); 
	});
</script>
	<input id="plug_selectPayApplyPay" value="支付申请选择" type="button"  icon="icon_selectInfo"/>
	<div style="display: none;">
		<input id="plug_payId" type="text" >
	    <input id="plug_payCode" type="text" >
	    <input id="plug_payType" type="text" >
	    <input id="plug_yearNum" type="text" >
	    <input id="plug_monthNum" type="text" >
	    <input id="plug_prjName" type="text" >
	    <input id="plug_prjCode" type="text" >
	    <input id="plug_segName" type="text" >
	    <input id="plug_ctrName" type="text" >
	    <input id="plug_ctrCode" type="text" >
	    <input id="plug_corpname" type="text" >
	    <input id="plug_ctrsSum" type="text" >
	    <input id="plug_planPaySum" type="text" >
	</div>



	



