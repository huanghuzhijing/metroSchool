<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
<script type="text/javascript">
	//加载
	$(document).ready(function(){
			//
			$("#plug_selectPrj").click(function(){
			
				var url ='contentSelectAction.do?method=selectPrj&qPrjName=${qPrjName}';
				
				art.dialog({id:'commonDialog1',title:'项目信息', iframe:url, width:'600', height:'400',top:'0'}).close(function(){
				  	//
				  	if($("#plug_prjId").val()!=""){
				  		setPrjParamValue($("#plug_prjId").val(),$("#plug_prjName").val(),$("#plug_prjCode").val(),$("#plug_segId").val(),$("#plug_segName").val());
				  		
				  	}
				});	
			}); 
			//
	});
</script>
	<input id="plug_selectPrj" value="项目选择" type="button"  icon="icon_selectInfo"/>
	<div style="display: none;">
		<input id="plug_prjId" type="text" />
	    <input id="plug_prjCode" type="text" />
	    <input id="plug_prjName" type="text" />
	    <input id="plug_ifHasCtr" type="text" />
	</div>



	



