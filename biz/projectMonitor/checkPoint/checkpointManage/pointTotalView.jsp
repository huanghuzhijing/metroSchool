<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>
<ex:bundle/>
<html:html>
<head>
<title><fmt:message key="dtaq.pointTotal.title"/></title>
<content tag="heading"><fmt:message key="dtaq.pointTotal.title"/></content>
<script src="<c:url value="/scripts/public.js"/>" type="text/javascript"></script>
<script  type="text/javascript" language=javascript>
function initCont() {
	jQuery.each(jQuery(".thirdProDirect"),function(index,item){
		var obj = jQuery(item);
		obj.attr("title",obj.html());
		if(obj.html().lengthCheck()>15){
			obj.html(substr(obj.html(),15)+'...');
		}
	});
	jQuery.each(jQuery(".workProDirect"),function(index,item){
		var obj = jQuery(item);
		obj.attr("title",obj.html());
		if(obj.html().lengthCheck()>15){
			obj.html(substr(obj.html(),15)+'...');
		}
	});
}
function backToList() {
  location.href="${ctx}/dtaq/point.do?method=pointTotal&line_id=${line_id}";
}
</script>
</head>
<body>
     <fieldset style="margin:10">
         <legend><strong><fmt:message key="dtaq.point.total.title"/></strong></legend>
           <html:form action="/dtaq/point">
        	<ec:table items="thirdpoints" var="point" showTitle="true" title="${texts['dtaq.point.total.third.title']}" action="${ctx}/dtaq/point.do?method=pointTotalView&station_id=${station_id}">
			<ec:row>
				<ec:column property="point_code" title="${texts['dtaq.point.point_code']}" width="100px"></ec:column>
				  <ec:column property="point_mechine" title="${texts['dtaq.point.point_mechine']}" width="100px"></ec:column>
				  <ec:column property="type_id" title="${texts['dtaq.point.type_id']}" width="100px">
				  	<c:forEach items="${checkpointTypes}" var="pointType">
				  		<c:if test="${pointType.type_id == point.type_id}">
				  			<c:out value="${pointType.type_name}" />
				  		</c:if>
				  	</c:forEach>
				  </ec:column>
				  <ec:column property="part" title="${texts['dtaq.point.part_id']}" width="100px">
				  	<c:out value="${point.part.part_name}"></c:out>
				  </ec:column>
				  <ec:column property="init_value" title="${texts['dtaq.point.init_value']}" width="100px"></ec:column>
				  <ec:column property="abs_critical_value" title="${texts['dtaq.point.abs_critical_value']}" width="100px">
				  		<fmt:formatNumber value="${point.abs_critical_value}" />
				  </ec:column>
				  <ec:column property="abs_warning_value" title="${texts['dtaq.point.abs_warning_value']}" width="100px">
				  		<fmt:formatNumber value="${point.abs_warning_value}" />
				   </ec:column>
				  <ec:column property="rel_critical_value" title="${texts['dtaq.point.rel_critical_value']}" width="100px">
				  		<fmt:formatNumber value="${point.rel_critical_value}" />
				  </ec:column>
				  <ec:column property="rel_warning_value" title="${texts['dtaq.point.rel_warning_value']}" width="100px">
				  		<fmt:formatNumber value="${point.rel_warning_value}" />
				  </ec:column>
				  <ec:column property="check_state" title="${texts['dtaq.point.check_state']}" width="100px">
				  	<c:if test="${point.check_state == 'Y'}"><fmt:message key="dtaq.common.ok"/></c:if>
				  	<c:if test="${point.check_state == 'N'}"><fmt:message key="dtaq.common.cancel"/></c:if>
				  </ec:column>
				  <ec:column property="compare_point" title="${texts['dtaq.point.total.compart_point_code']}" width="100px">
				  	<c:if test="${point.compare_point != null}">
				  	 <c:forEach items="${points}" var="currentPoint">
						<c:if test="${currentPoint.point_id == point.compare_point}">
							<c:out value="${currentPoint.point_name}"></c:out>
						</c:if>				  	 
				  	 </c:forEach>
				  	 </c:if>
				  </ec:column>
				  <ec:column property="project_direction" styleClass="thirdProDirect" title="${texts['dtaq.point.project_direction']}" width="100px"></ec:column>
			</ec:row>
		</ec:table>
		<br>
		<ec:table items="workpoints" var="point" showTitle="true" title="${texts['dtaq.point.total.work.title']}" action="${ctx}/dtaq/point.do?method=pointTotalView&station_id=${station_id}">
			<ec:row>
				<ec:column property="point_code" title="${texts['dtaq.point.point_code']}" width="100px"></ec:column>
				  <ec:column property="point_mechine" title="${texts['dtaq.point.point_mechine']}" width="100px"></ec:column>
				  <ec:column property="type_id" title="${texts['dtaq.point.type_id']}" width="100px">
				  	<c:forEach items="${checkpointTypes}" var="pointType">
				  		<c:if test="${pointType.type_id == point.type_id}">
				  			<c:out value="${pointType.type_name}" />
				  		</c:if>
				  	</c:forEach>
				  </ec:column>
				  <ec:column property="part" title="${texts['dtaq.point.part_id']}" width="100px">
				  	<c:out value="${point.part.part_name}"></c:out>
				  </ec:column>
				  <ec:column property="init_value" title="${texts['dtaq.point.init_value']}" width="100px"></ec:column>
				  <ec:column property="abs_critical_value" title="${texts['dtaq.point.abs_critical_value']}" width="100px">
				  		<fmt:formatNumber value="${point.abs_critical_value}" />
				  </ec:column>
				  <ec:column property="abs_warning_value" title="${texts['dtaq.point.abs_warning_value']}" width="100px">
				  		<fmt:formatNumber value="${point.abs_warning_value}" />
				   </ec:column>
				  <ec:column property="rel_critical_value" title="${texts['dtaq.point.rel_critical_value']}" width="100px">
				  		<fmt:formatNumber value="${point.rel_critical_value}" />
				  </ec:column>
				  <ec:column property="rel_warning_value" title="${texts['dtaq.point.rel_warning_value']}" width="100px">
				  		<fmt:formatNumber value="${point.rel_warning_value}" />
				  </ec:column>
				  <ec:column property="check_state" title="${texts['dtaq.point.check_state']}" width="100px">
				  	<c:if test="${point.check_state == 'Y'}"><fmt:message key="dtaq.common.ok"/></c:if>
				  	<c:if test="${point.check_state == 'N'}"><fmt:message key="dtaq.common.cancel"/></c:if>
				  </ec:column>
				  <ec:column property="project_direction" styleClass="workProDirect" title="${texts['dtaq.point.project_direction']}" width="120px"></ec:column>
			</ec:row>
		</ec:table>
		</html:form>
    </fieldset>
   	<div align="center">
   		<input type="button" value="<fmt:message key="button.back"/>" onclick="backToList()" class="backButton" />
   	</div>
  </body>
</html:html>
