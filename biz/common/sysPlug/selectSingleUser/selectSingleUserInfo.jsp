<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
<script type="text/javascript">
	//加载
	$(document).ready(function(){
			//
			$("#plug_selectSingleUser").click(function(){
				var url ='contentSelectAction.do?method=singleUser&queryUserType=${param.queryUserType}';
				art.dialog({id:'commonDialog1',title:'员工信息', iframe:url, width:'600', height:'400',top:'0'}).close(function(){
				  	setParamSingleUserValue($("#plug_user_id").val(),$("#plug_organ_id").val(),$("#plug_user_name").val(),$("#plug_organ_name").val());
				});	
			}); 
			//
	});
</script>
	<input id="plug_selectSingleUser" value="选择" type="button"  icon="icon_selectInfo"/>
	<div style="display: none;">
		<input id="plug_user_id" type="text" />
	    <input id="plug_user_name" type="text" />
	    <input id="plug_organ_id" type="text" />
	    <input id="plug_organ_name" type="text" />
	</div>



	



