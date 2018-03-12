<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
<script type="text/javascript">
	//加载
	$(document).ready(function(){
			//
			$("#plug_selectEmp").click(function(){
				var url ='contentSelectAction.do?method=selectEmp&queryEmpType=${queryEmpType}';
				art.dialog({id:'commonDialog1',title:'基本信息', iframe:url, width:'600', height:'400'}).close(function(){
				  	//
				  	if($("#plug_empId").val()!=""){
				  		setEmpParamValue($("#plug_empId").val(),$("#plug_empName").val());
				  	}
				});	
			}); 
			//
	});
</script>
	<input id="plug_selectEmp" value="人员选择" type="button"  icon="icon_selectInfo"/>
	<div style="display: none;">
		<input id="plug_empId" type="text" />
	    <input id="plug_empName" type="text" />
	</div>



	



