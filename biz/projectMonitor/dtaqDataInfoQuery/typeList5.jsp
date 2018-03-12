<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp"%>
<ec:table items="dtaqDatas" var="dtaqData" action="dtaqDataInfoQueryAction.do"
	title="" width="100%"  sortable="false" rowsDisplayed="10"
	imagePath="${ctx}/styles/extremecomponents/images/*.gif" locale="zh_CN" 
	retrieveRowsCallback="limit" filterRowsCallback="limit" sortRowsCallback="limit">
  	<ec:row highlightRow="true" >
		<ec:column property="rowcount" cell="rowCount" sortable="false" title="序号" width="6%"/>
		<ec:column property="part_id.part_name" calcTitle="part_id.part_name" title="监测部位"/>
		<ec:column property="point_code" calcTitle="point_code" title="测点编码"/>

		<ec:column property="null" title="监测日期">
				<fmt:formatDate value="${dtaqData.write_date}" pattern="yyyy-MM-dd"/>
		</ec:column>
		
		<ec:column property="curr_value" calcTitle="curr_value" title="${type.current_value_title}"/>
		<ec:column property="curr_change" calcTitle="curr_change" title="${type.current_change_title}"/>
		<ec:column property="total_change" calcTitle="total_change" title="${type.total_change_title}"/>
		<ec:column property="change_rate" calcTitle="change_rate" title="${type.change_rate_title}"/>
		<ec:column property="warn_state"  title="预警状态">
			<div id="v_warn_state_${idx}" class="state${dtaqData.warn_state}" style="width:50px;display:block;height:18px;"></div>
		</ec:column>
		<ec:column property="null" title="操作" sortable="false">
	    <div align="center">
	    	<input type="button" value="时序曲线" class="button1" onclick="showComparePointTimes('${dtaqData.point_id.point_id}','${dtaqData.info_id.info_id}')">
	    </div>
	  </ec:column>
	</ec:row>
</ec:table>
