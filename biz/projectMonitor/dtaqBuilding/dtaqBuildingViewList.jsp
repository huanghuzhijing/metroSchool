<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>
<%@ include file="/commons/meta.jsp"%>
<ex:bundle/>
<html:html>
<head>
<title><fmt:message key="dtaq.projectMaterials.title"/></title>
<script src="${ctx}/scripts/public.js" type="text/javascript"></script>
<script type="text/javascript">
function saveInfo(){
	submitForm("buildingForm",null,true);
}

</script>
<body>
    <html:form action="dtaqBuildingAction.do" method="POST" styleClass="form">
		<input type="hidden" name="method" value="save"/>
		<html:hidden property="station_id" value="${station_id}"/>
		<html:hidden property="segment_id" value="${segment_id}"/>
		<html:hidden property="station_type" value="${station.station_type}"/>
	
  		<fieldset>
  		<legend>${station.station_name}建筑物信息</legend>
  		<table class="listTable" id="tableObj" width="100%" align="center" border="0" cellpadding="0" cellspacing="1">
		<thead align="center">
			<tr>
				<th width='6%'>名称</th>
				<th width='4%'>所处里程</th>
				<c:if test="${station.station_type eq 'P'}">
					<th width='3%'>最近隧道左右</th>
				</c:if>
				<c:choose>
					<c:when test="${station.station_type eq 'P'}">
						<th width='5%'>中心线水平距离</th>
					</c:when>
					<c:otherwise>
						<th width='3%'>Y方向</th>
					</c:otherwise>
				</c:choose>
				<th width='4%'>基础形式</th>
				<th width='4%'>基础埋深</th>
				<th width='4%'>结构形式</th>
				<th width='4%'>使用年限</th>
				<th width='4%'>高度</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${buildings}" var="building">
		<tr align="center">
			<td>${building.name}</td>
			<td>${building.in_mileage}</td>
			<c:if test="${station.station_type eq 'P'}">
				<td>${building.recently_line}</td>
			</c:if>
			<td>${building.center_distance}</td>
			<td>${building.base_form}</td>
			<td>${building.base_depth}</td>
			<td>${building.structure_form}</td>
			<td>${building.limited_years}</td>
			<td>${building.protection_leve}</td>
		</tr>
		</c:forEach>
		</tbody>
		</table>
  		</fieldset>
	</html:form>
 </body>
</html:html>
