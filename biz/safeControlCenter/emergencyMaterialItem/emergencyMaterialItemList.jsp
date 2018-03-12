<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>
<ex:bundle/>
<html:html>
<head>
<content tag="heading">应急救援预案新版</content>
<script type="text/javascript" src="${ctx}/scripts/dtree/dtree.js"></script>
<script src="<c:url value="/scripts/public.js"/>" type="text/javascript"></script>
<style type="text/css">
.saveDiv1{     /*增加/修改页面 保存按钮显示区 样式*/
	text-align: right;
	border:none;
	background-color:#FFFFFF ;
	margin-top:5px ;
	margin-left:5px ;
	margin-right:5px ;
	margin-bottom:5px ;
	padding-right:0px;
	width:99% ;
}
.saveDiv1 .z-btn{
	display:inline-table;
}
</style>
<script type="text/javascript">

jQuery(document).ready(function(){
})

		function newItem(){
			location.href = '${ctx}/emergencyMaterialItemAction.do?method=edit&qfid=${param.fid}';
		}
		function del(p){
		 if(confirm('${texts['warning.delconfirm']}'))
		 {
		  location.href(p);
		 }
		}

		
							  	
</script>
</head>
  <body>
				<fieldset>
					<legend><strong><fmt:message key="dtaq.common.list_field"/></strong></legend>
						<table width="100%" cellpadding="0" cellspacing="0" border="0">
							<tr>
								<c:if test="${station.station_name != null}">
									<td width="90%" align="center">
										<font color="#50A2E6" size="2"><strong>标段：${segment.segment_name}&nbsp;&nbsp;&nbsp;&nbsp;车站/区间：${station.station_name}</strong></font>
									</td>
								</c:if>
							</tr>
						</table>
						<div class="saveDiv1" align="right">
				<input type="button" value="新增" onclick="newItem()" class="btn_add" style="margin-right: 20px">
				<input type="button" value="返回" onclick="location.href='${ctx}/emergencyMaterialPlanAction.do?method=list'" class="btn_back" />&nbsp;&nbsp;
   		
   		</div>
						<ec:table items="emergencyMaterialItems" var="emergencyMaterialItem"  action="emergencyMaterialItemAction.do"
	title="" width="100%"  sortable="false" rowsDisplayed="10"
	imagePath="${ctx}/styles/extremecomponents/images/*.gif" locale="zh_CN" 
	retrieveRowsCallback="limit" filterRowsCallback="limit" sortRowsCallback="limit">
  	<ec:row highlightRow="true" onclick="pullValue('${emergencyMaterialItem.itemId}');" ondblclick="showView('${emergencyMaterialItem.itemId}');">
							
							
				<ec:column property="rowcount" cell="rowCount" sortable="false"
				title="序号" width="5%" />
				<input type="hidden" name="fid" value="${fid}" />
				<ec:column property="material" title="物资名称" width="25%"/>
				<ec:column property="amount" title="数量" width="15%"/>
				<ec:column property="unit" title="单位" width="15%"/>
				<ec:column property="purpose" title="用途" width="25%"/>
			 	<ec:column property="null" title="操作" width="20%" sortable="false">
			 		<div align="center">
						<input type="button" class="button1" onclick="location.href='emergencyMaterialItemAction.do?method=view&itemId=${emergencyMaterialItem.itemId}&qfid=${param.fid}'" value="<fmt:message key="button.detail"/>"/>
						<input type="button" class="button1" onclick="location.href='emergencyMaterialItemAction.do?method=edit&itemId=${emergencyMaterialItem.itemId}&qfid=${param.fid}'" value="<fmt:message key="label.modify"/>"/>
						<input type="button" class="button1" onclick="del('emergencyMaterialItemAction.do?method=delete&itemId=${emergencyMaterialItem.itemId}&fid=${emergencyMaterialItem.fid.fid}')" value="<fmt:message key="label.delete"/>"/>
					</div>
				</ec:column>
					</ec:row>
					</ec:table>
				</fieldset>
			 </td>
		</tr>
	
  </body>
</html:html>
