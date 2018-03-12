<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
<script type="text/javascript">
	//加载
	$(document).ready(function(){
			//
			$("#plug_selectPrj").click(function(){
				var url ='contentSelectAction.do?method=selectEmp&queryEmpType=${queryEmpType}';
				art.dialog({id:'commonDialog1',title:'项目信息', iframe:url, width:'600', height:'400',top:'0'}).close(function(){
				  	//
				  	setEmpParamValue($("#plug_empId").val(),$("#plug_empName").val());
				});	
			}); 
			//
	});
</script>
	<input id="plug_selectPrj" value="员工选择" type="button"  icon="icon_selectInfo"/>
	<div style="display: none;">
		<input id="plug_empId" type="text" />
	    <input id="plug_empName" type="text" />
	</div>



	



