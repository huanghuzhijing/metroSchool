<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
<html:html>
<head>
	<script type="text/javascript">
		$(document).ready(function(){
			var ids='${ids}';
			//
			$.each( $(".cbox_select"), function(i, obj){
				if(ids.indexOf(","+$(this).val()+",")>-1){
					obj.checked=true;
				}
			});
			//
			$("#btn_save").click(function(){
				var mids="";
				$.each( $("[class='cbox_select'][type='checkbox']"), function(i, obj){
					if($(this).attr("checked")==true){
						if(mids==""){
							mids=$(this).val();
						}else{
							mids+=","+$(this).val();
						}
					}
				});
				if(mids==""){
					alert("请至少选择一项！");
				}else{
					location.href='sysRoleAction.do?method=platformSave&roleId=${param.id}&pageIndex=${param.pageIndex}&mids='+mids;
				}
			});
			//
			$("#btn_back").click(function(){ 
				history.back(-1);
			}); 
			//
			//全选
	       $("#btn_allSelect").click(function(){
	       	 var ids = "" ;
	       		 $("[name='select_id']").attr("checked","checked") ;
	       		 $("[name='select_id']:checked").each(function(i){
	       			ids += $(this).val()+"," ;
	       		 })
	       });
	        //全不选
	       $("#btn_notSelect").click(function(){
	       	 $("[name='select_id']").attr("checked","") ;
	       });
	       //
		});
	</script>
</head>
<content tag="heading">
	工作台设置
</content>
<body >
		<div class="listButtonDiv">
			<input type="button" id="btn_allSelect"   icon="icon_allSelect"                value="全  选"/>
            <input type="button" id="btn_notSelect"    icon="icon_notSelect"          value="全不选"/>
		</div>
		<ec:table items="portalModuleInfos" var="portalModuleInfo"
			action="sysRoleAction.do?method=platformset" title=""  locale="zh_CN"
			sortable="false" rowsDisplayed="10" imagePath="${ctx}/styles/extremecomponents/images/*.gif"
			showPagination="false"
		>
			<ec:row highlightRow="true" >
				<ec:column property="rowcount" cell="rowCount" sortable="false" title="序号" />
				<ec:column property="null" title="选择" >
					<input value="${portalModuleInfo.id}" type="checkbox" name="select_id" class="cbox_select" >
				</ec:column>
				<ec:column property="moduleName" title="模块名称" />
				<ec:column property="orderNum" title="排序号" />
			</ec:row>
		</ec:table>
		<div  class="saveDiv">
			<input id="btn_save" type="button"  icon="icon_save"  value="${texts['button.save']}" />
			<input id="btn_back" type="button"  icon="icon_back" value="${texts['button.back']}" />
		</div>
</body>
</html:html>
