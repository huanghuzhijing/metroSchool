<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
<html:html>
<head>
	<%@ include file="/commons/meta.jsp"%>
	<script type="text/javascript">
		$(document).ready(function(){
			var empIds="";
			//
			$("#btn_save").click(function(){
				$.each( $(".cbox_select"), function(i, obj){
					if(obj.checked==true){
						if(empIds==""){
							empIds=","+$(this).val()+",";
						}else{
							empIds+=$(this).val()+",";
						}
					}
				});
				if(empIds==""){
					alert("请至少选择一个员工！");
				}else{
					$("#empIds").val(empIds);
					document.forms[0].submit();
				}
			});
			//
			$("#btn_close").click(function(){
				parent.art.dialog({id:'commonDialog1'}).close();
			}); 
			//
			
		});
	</script>
</head> 
<body>
	<html:form enctype="multipart/form-data" action="prjSegmentInfoAction.do?method=saveEmpForConstr" method="POST">
		<input id="empIds" name="empIds"  type="hidden">
		<input name="segId" value="${param.staticSegId }" type="hidden">
	</html:form>
	<div class="promptDiv">
		所属单位名称：<span class="redSpan">${corpname}</span>	
	</div>
	<ec:table items="employees" var="employee" 
		action="prjSegmentInfoAction.do?method=selectEmpForConstr" title=""  locale="zh_CN"
	  	showPagination="false" sortable="false" rowsDisplayed="10" imagePath="${ctx}/styles/extremecomponents/images/*.gif"
	>
		<ec:row highlightRow="true" 		>
			<ec:column property="rowcount" cell="rowCount" sortable="false" title="序号" />
			<ec:column property="null" title="选择" >
				<input value="${employee.id}" type="checkbox" class="cbox_select">
			</ec:column>
			<ec:column property="empname" title="姓名" />
			<ec:column property="empduty" title="职务" />
			<ec:column property="tel" title="电话" />
			<ec:column property="phone" title="手机" />
		</ec:row>
	</ec:table>
		<div  class="saveDiv">
			<input id="btn_save" type="button"  icon="icon_save"  value="${texts['button.save']}"  />
			<input id="btn_close" type="button"  icon="icon_close"  value="${texts['button.close']}"  />
		</div>

</body>
</html:html>
