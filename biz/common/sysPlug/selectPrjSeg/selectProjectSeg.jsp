<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
<script type="text/javascript">
	//加载
	$(document).ready(function(){
			//
			$("#plug_selectPrjSeg").click(function(){
				var url ='contentSelectAction.do?method=selectPrjSegment&queryPrjSegType=${queryPrjSegType}&prj_id='+$("#prj_id").val();
				art.dialog({id:'commonDialog1',title:'项目标段信息', iframe:url, width:'600', height:'400',top:'0'}).close(function(){
				  	//
					setParamSegValue($("#plug_prjId").val(),$("#plug_prjName").val(),$("#plug_prjCode").val(),$("#plug_segId").val(),$("#plug_segName").val());
				});	
			}); 
			//
	});
</script>
	<input id="plug_selectPrjSeg" value="项目标段选择" type="button"  icon="icon_selectInfo"/>
	<div style="display: none;">
		<input id="plug_segId" type="text" />
	    <input id="plug_segName" type="text" />
	    <input id="plug_prjId" type="text" />
	    <input id="plug_prjName" type="text" />
	    <input id="plug_prjCode" type="text" />
	</div>



	



