<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
<script type="text/javascript">
	//加载
	$(document).ready(function(){
			//
			$("#plug_selectCtr").click(function(){
				var paramWindow=$("[name='paramWindow']").val();
				if(paramWindow==1){
					var url ='contentSelectAction.do?method=selectCtr&paramWindow=1&queryCtrType=${queryCtrType}&prj_id='+$("#prj_id").val();
					window.open(url,"合同信息","");
				}else{
					var url ='contentSelectAction.do?method=selectCtr&queryCtrType=${queryCtrType}&prj_id='+$("#prj_id").val();
					art.dialog({id:'commonDialog1',title:'合同信息', iframe:url, width:'700', height:'400',top:'0'}).close(function(){
						setParamCtrValue($("#plug_ctrId").val(),$("#plug_designCorpName").val(),$("#plug_ctrCode").val(),$("#plug_ctrName").val(),$("#plug_ctrSort").val(),$("#plug_payClause").val(),$("#plug_prjId").val(),$("#plug_prjCode").val(),$("#plug_prjName").val(),$("#plug_segName").val(),$("#plug_ctrSum").val(),$("#plug_estimateSum").val(),$("#plug_signDate").val());
					});
				}
			}); 
	});
</script> 
	<input id="plug_selectCtr" value="选择" type="button"  icon="icon_selectInfo"/>
	<div style="display: none;">
		<input id="plug_ctrId" type="text" >
	    <input id="plug_ctrCode" type="text" >
	    <input id="plug_ctrName" type="text" >
	    <input id="plug_designCorpName" type="text" >
	    <input id="plug_ctrSum" type="text" >
	    <input id="plug_estimateSum" type="text" >
	    <input id="plug_ctrSort" type="text" >
	    <input id="plug_payClause" type="text" >
	    <input id="plug_prjId" type="text" >
	    <input id="plug_prjCode" type="text" >
	    <input id="plug_prjName" type="text" >
	    <input id="plug_segName" type="text" >
	    <input id="plug_ctrSum" type="text" >
	    <input id="plug_signDate" type="text" >
	</div>



	



