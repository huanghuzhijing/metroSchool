<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>

<ex:bundle />

<html:html>
<head>
</head>
		<%@ include file="/commons/meta.jsp"%>
		
	<body>
	<fieldset style="margin:10">
  <legend><strong><fmt:message key="dtaq.common.list_field"/></strong></legend>
  <table class="commonTable">
  	<tr><td align="right"><c:if test="${station.station_id != null && station.station_state == '1'}">
		<input type="button" class="addButton" value="${texts['button.new']}" onclick="location.href='dtaqCheckpointUseAction.do?method=create&station_id=${station.station_id}'">
  	</c:if></td></tr>
  </table>
<ec:table items="dtaqProjMachCheckpoints" var="info" action="dtaqCheckpointUseAction.do?method=list"
	title="" width="100%"  sortable="false" rowsDisplayed="10"
	imagePath="${ctx}/styles/extremecomponents/images/*.gif" locale="zh_CN" 
	retrieveRowsCallback="limit" filterRowsCallback="limit" sortRowsCallback="limit">
  		<ec:row highlightRow="true" onclick="pullValue('${thing.thing_id}');" ondblclick="showView('${thing.thing_id}');">
		<ec:column property="rowcount" cell="rowCount" sortable="false" title="序号" width="5%"/>
	  	<ec:column property="station.station_name" title="车站/区间">
	  		 <c:forEach items="${stations}" var="station">
						  			<c:if test="${station.station_id == info.stationid}">
						  				<c:out value="${station.station_name}"></c:out>
						  			</c:if>
						  		</c:forEach>
	  	</ec:column>
    	 <ec:column property="pointTypeId.type_name" title="监测类型">
    	 <c:forEach items="${types}" var="type">
						  			<c:if test="${type.type_id == info.pointtypeid}">
						  				<c:out value="${type.type_name}"></c:out>
						  			</c:if>
						  		</c:forEach>
    	 </ec:column>
    	 <ec:column property="onuse" title="启用状态" width="300px">
    	 	<ex:dicDisplay dictIdentify="CheckpointTypeOnuse" dictValue="${info.onuse}"/>
<%--    	 	<ex:dictDisplayEl type="Onuse" value="${info.onuse}"/>--%>
    	 </ec:column>
	  	<c:if test="${station.station_id != null && station.station_state == '1'}">
		  <ec:column property="null" title="操作" width="200px">
		  	<div align="center">
			  		<input type="button" class="button1" value="${texts['label.modify']}" onclick="location.href='dtaqCheckpointUseAction.do?method=edit&id=${info.id}&dtaqProjMachCheckpointList_page=${dtaqProjMachCheckpointList_page}&isthird=${isthird}&segment_id=${segment_id}&station_id=${station.station_id}&station_state=${station_state}'">
			</div>
		  </ec:column>
		 </c:if>
		 </ec:row>
		 </ec:table>
</fieldset>
	
	
		</body></html:html>