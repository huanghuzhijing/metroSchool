<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
<html:html>
<head>
<%@ include file="/commons/meta.jsp"%>
	<script type="text/javascript">
		$(document).ready(function(){
			var segids=parent.$("#segids${param.corpid}").val();
			var segnames=parent.$("#segnames${param.corpid}").val(); 
			$.each( $(".cbox_select"), function(i, obj){
				if(segids.indexOf(","+$(this).val()+",")>-1){
					obj.checked=true;
				}
			});
			//
			$("#btn_save").click(function(){
				segids="";
				segnames="";
				$.each( $(".cbox_select"), function(i, obj){
					if(obj.checked==true){
						if(segids==""){
							segids=","+$(this).val()+",";
							segnames=","+$(this).attr("paramName")+",";
						}else{
							segids+=$(this).val()+",";
							segnames+=$(this).attr("paramName")+",";
						}
					}
				});
				if(segids==""){
					alert("请至少选择一个标段！");
				}else{
					$("[name='segmentid']").val(segids);
					parent.$("#segids${param.corpid}").val(segids);
					parent.$("#segnames${param.corpid}").val(segnames);
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
	<html:form enctype="multipart/form-data" action="projectInfoConfigAction.do?method=saveSegForSurv" method="POST">
		<input name="prjid" value="${param.prjid }" type="hidden">
		<input name="segmentid"  type="hidden">
		<input name="corpid" value="${param.corpid }" type="hidden">
	</html:form>
	<ec:table items="prjSegmentInfos" var="prjSegmentInfo" 
		action="projectInfoConfigAction.do?method=selectSegForSurv" title=""  locale="zh_CN"
	  	showPagination="false" sortable="false" rowsDisplayed="10" imagePath="${ctx}/styles/extremecomponents/images/*.gif"
	>
		<ec:row highlightRow="true" >
			<ec:column property="rowcount" cell="rowCount" sortable="false" title="序号" width="8%"/>
			<ec:column property="null" title="选择" width="8%">
				<input value="${prjSegmentInfo.id}" type="checkbox" class="cbox_select" paramName="${prjSegmentInfo.segName}">
			</ec:column>
			<ec:column property="segName" title="标段名称" />
		</ec:row>
	</ec:table>
		<div class="saveDiv">
			<input id="btn_save" type="button"  icon="icon_save"  value="${texts['button.save']}"  />
			<input id="btn_close" type="button"  icon="icon_close"  value="${texts['button.close']}"  />
		</div>
</body>
</html:html>
