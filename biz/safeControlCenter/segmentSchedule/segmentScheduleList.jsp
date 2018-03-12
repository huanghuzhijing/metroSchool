<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
<html:html>
<head>
<%@ include file="/commons/meta.jsp"%>
<script type="text/javascript" src="${ctx}/scripts/enterKey.js" ></script>
	<script type="text/javascript">
		
	</script>
</head>

<body >
<fieldset>
<legend>信息列表</legend>
<ec:table items="dtaqSegmentSchedules" var="dtaqSegmentSchedule"
		action="segmentScheduleAction.do?method=list" title="" width="100%"
		sortable="false" rowsDisplayed="10"
		imagePath="${ctx}/styles/extremecomponents/images/*.gif"
		locale="zh_CN" retrieveRowsCallback="limit" filterRowsCallback="limit"
		sortRowsCallback="limit">
		<ec:row highlightRow="true"
			onclick="pullValue('${dtaqSegmentSchedule.sch_id}','');"
			ondblclick="showView('${dtaqSegmentSchedule.sch_id}');">
			<ec:column property="rowcount" cell="rowCount" sortable="false"
				title="序号" width="5%" />
			
							
			<ec:column property="segment"  title="标段" width="8%"  >
			<c:forEach items="${segs}" var="segment">
							<c:if test="${segment.segment_id == dtaqSegmentSchedule.segment.segment_id}">
								<c:out value="${segment.segment_name}"></c:out>
							</c:if>
						</c:forEach>
			</ec:column>	
			<ec:column property="station" title="车站/区间" width="8%"  >					
					<c:forEach items="${stations}" var="station">
							<c:if test="${station.station_id== dtaqSegmentSchedule.station.station_id}">
							${station.station_name}
							</c:if>
						</c:forEach>											
			</ec:column>
			<ec:column property="upload_date" title="创建日期" width="12%">
				<fmt:formatDate value="${dtaqSegmentSchedule.upload_date}"
					pattern="yyyy-MM-dd" />
			</ec:column>	
			<ec:column property="picture_date" title="修改日期" width="12%">
				<fmt:formatDate value="${dtaqSegmentSchedule.picture_date}"
					pattern="yyyy-MM-dd" />
			</ec:column>
			
			<c:if test="${param.station_type eq 'S'}">
	  <ec:column property="plane_jpeg_name" title="形象进度平面图" width="150px" >
	     <div align=center>
		     	<c:if test="${dtaqSegmentSchedule.plane_jpeg_name != null}"><a href='segmentScheduleAction.do?method=download&type=plane&sch_id=${dtaqSegmentSchedule.sch_id}'">${dtaqSegmentSchedule.plane_jpeg_name}</a></c:if>
	     </div>
	  </ec:column>
	  <ec:column property="section_jpeg_name" title="形象进度剖面图" width="150px" >
	  	<div align="center">
		     	<c:if test="${dtaqSegmentSchedule.section_jpeg_name != null}"><a href='segmentScheduleAction.do?method=download&type=section&sch_id=${dtaqSegmentSchedule.sch_id}'">${dtaqSegmentSchedule.section_jpeg_name}</a></c:if>
	    </div>
	  </ec:column>
     </c:if>
  	<c:if test="${param.station_type eq 'P'}">
	  <ec:column property="schematic_jpeg_name" title="形象进度示意图" width="200px" >
	  	<div align="center">
		     	<c:if test="${dtaqSegmentSchedule.schematic_jpeg_name != null}"><a href='segmentScheduleAction.do?method=download&type=schematic&sch_id=${dtaqSegmentSchedule.sch_id}'">${dtaqSegmentSchedule.schematic_jpeg_name}</a></c:if>
	     </div>
	  </ec:column>
     </c:if>
	<c:if test="${param.station_state == '1'}">
	  <ec:column property="null" title="操作" width="100px" sortable="false">
		  	<div align="center">
			  		<input type="button" class="button1" value="上传图片" icon="icon_currWeek" onclick="location.href='segmentScheduleAction.do?method=edit&sch_id=${dtaqSegmentSchedule.sch_id}&segment_id=${param.segment_id}&station_id=${param.station_id}&station_state=${param.station_state}&station_type=${param.station_type}'">
			</div>
	  </ec:column>
	</c:if>

		</ec:row>
	</ec:table>
	</fieldset>
</body>
</html:html>
