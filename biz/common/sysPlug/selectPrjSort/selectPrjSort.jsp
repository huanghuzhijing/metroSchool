<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
<script type="text/javascript">
	//加载
	$(document).ready(function(){
			//
			$("#plug_selectPrjSort").click(function(){
				var url ='contentSelectAction.do?method=selectPrjSort&queryPrjSortType=${queryPrjSortType}&oper_id='+$("#prjSort_id").val();
					art.dialog({id:'commonDialog1',title:'工程子类', iframe:url, width:'800', height:'400',top:'0'}).close(function(){
				  	setPrjSortParamValue($("#plug_prjSortId").val(),$("#plug_prjSortCode").val(),$("#plug_prjSortName").val());
				});	
			}); 
			//
	});
</script>
	<input id="plug_selectPrjSort" value="选择" type="button"  icon="icon_selectInfo"/>
	<div style="display: none;">
		<input id="plug_prjSortId" type="text" />
	    <input id="plug_prjSortCode" type="text" />
	    <input id="plug_prjSortName" type="text" />
	</div>



	



