<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>
<%@ include file="/commons/meta.jsp"%>
<ex:bundle/>
<html:html>
<head>
<title>辅助工法信息</title>
<script src="${ctx}/scripts/public.js" type="text/javascript"></script>
<script type="text/javascript">
var t = 0 ;
function saveInfo(){
	submitForm("constructionMethodForm",null,true);
}


</script>
<body>
    <html:form action="dtaqConstructionMethodAction.do" method="POST" styleClass="form">
		<input type="hidden" name="method" value="save"/>
		<html:hidden property="station_id" value="${station_id}"/>
		<html:hidden property="segment_id" value="${segment_id}"/>
		<html:hidden property="station_type" value="${station.station_type}"/>
		
  		<fieldset>
  		<legend>${station.station_name}辅助工法信息</legend>
  		<table class="listTable" id="tableObj" width="100%" align="center" border="0" cellpadding="0" cellspacing="1">
		<thead align="center">
			<tr>
				<c:if test="${station.station_type eq 'P'}">
					<th width='5%'>线路</th>
				</c:if>
				<th width='5%'>起始里程</th>
				<c:if test="${station.station_type eq 'S'}">
					<th width='5%'>Y方向</th>
				</c:if>
				<th width='5%'>结束里程</th>
					
				<c:if test="${station.station_type eq 'S'}">
					<th width='5%'>Y方向</th>
				</c:if>
				<th width='5%'>辅助功法类型</th>
				<th width='30%'>描述</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${constructionMethods}" var="constructionMethod">
		<tr align="center">
			<c:if test="${station.station_type eq 'P'}">
				<td>${constructionMethod.line}</td>
			</c:if>
			<td>${constructionMethod.start_mileage}</td>
			<c:if test="${station.station_type eq 'S'}">
				<td>${constructionMethod.ypointone}</td>	
			</c:if>
			
			<td>${constructionMethod.end_mileage}</td>
			<c:if test="${station.station_type eq 'S'}">
				<td>${constructionMethod.ypointtwo}</td>	
			</c:if>
			
			<td>${constructionMethod.method_type}</td>
			<td align="left">${constructionMethod.description}</td>
		</tr>
		</c:forEach>
		</tbody>
		</table>
  		</fieldset>
	</html:form>
 </body>
</html:html>
