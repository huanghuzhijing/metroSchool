<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
<script type="text/javascript">
	//加载
	$(document).ready(function(){
			//
			$("#plug_selectDocFile").click(function(){
				var url ='contentSelectAction.do?method=selectDocFileManager&queryDocFileManager=${param.queryDocFileManager}';
				art.dialog({id:'commonDialog1',title:'工程文档资料信息', iframe:url, width:'600', height:'400'}).close(function(){
				  	setParamDocFileValue($("#plug_docFile_id").val(),$("#plug_docFile_name").val());
				});	
			}); 
			//
	});
</script>
	<input id="plug_selectDocFile" value="选择" type="button"  icon="icon_selectInfo"/>
	<div style="display: none;">
		<input id="plug_docFile_id" type="text" />
	    <input id="plug_docFile_name" type="text" />
	</div>



	



