<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<legend>部位列表信息</legend>

	<div class="listButtonDiv">
		<input id="btn_add" value="${texts['button.new']}" type="button" icon="icon_add" />
		 <input id="btn_edit" value="${texts['button.edit']}" type="button" icon="icon_edit" />
	    <input id="btn_delete" value="${texts['button.delete']}" type="button" icon="icon_delete" />
	</div>
	<div class="promptDiv">
测点部位：<span class="redSpan">${checkPointType.type_name}</span>
</div>
		<ec:table items="dtaqParts" var="dtaqPart"
			action="dtaqPartAction.do" title=""  locale="zh_CN"
			sortable="false" rowsDisplayed="10" imagePath="${ctx}/styles/extremecomponents/images/*.gif"
			retrieveRowsCallback="limit" filterRowsCallback="limit" sortRowsCallback="limit">
				<ec:row highlightRow="true" ondblclick="showView('${dtaqPart.part_id}');"
							onclick="pullValue('${dtaqPart.part_id}');">
		
					<ec:column property="rowcount" cell="rowCount" sortable="false" title="序号" />
					<ec:column property="null" sortable="false" title="选择" >
						<input type="radio" name="select_id" value="${dtaqPart.part_id}" />
					</ec:column>
					 <ec:column property="part_name" title="监测部位名称"  width="15%"/>
				   <ec:column property="null" title="测点数量"  width="8%"/>		   
					<ec:column property="type_id" title="测点类型" />
					<ec:column property="check_state" title="是否正在检测" >
					       <c:if test="${dtaqPart.check_state == '1'}">是</c:if>
	                      	<c:if test="${dtaqPart.check_state == '0'}">否</c:if>
					</ec:column>	
				</ec:row>
		     </ec:table>