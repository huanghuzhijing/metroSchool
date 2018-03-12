<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>

<ex:bundle />
<html:html>
<head>
<content tag="heading">测点变更审查</content>
<script type="text/javascript" src="${ctx}/scripts/json2.js"></script>
<script type="text/javascript" src="${ctx}/scripts/restrictLines.js"></script>
<script type="text/javascript" src="${ctx}/scripts/queryLines.js"></script>
<script type="text/javascript">
		jQuery(document).ready(function(){
			   restrictTypes('${param.qstationId}','${param.qtypeId}');
			  //新增
			$("#btn_add").click(function(){ 
				var qlineId = jQuery("[name=qlineId]").val() ;
				var qsegmentId = jQuery("[name=qsegmentId]").val() ;
				var qstationId = jQuery("[name=qstationId]").val() ;
				var qtypeId = jQuery("[name=qtypeId]").val() ;
				var qstartDate = jQuery("[name=qstartDate]").val() ;
				var qendDate = jQuery("[name=qendDate]").val() ;
				var qorganType = jQuery("[name=qorganType]").val() ;
				
				
				var params = "&qlineId="+qlineId+"&qsegmentId="+qsegmentId+"&qstationId="+qstationId+"&qtypeId="+qtypeId+"&qstartDate="+qstartDate+"&qendDate="+qendDate+"&qorganType="+qorganType+"&dtaqDataInfoList_page=${dtaqDataInfoList_page}";
				
				location.href='dtaqDataInfoAction.do?method=create'+params; 
			}); 
			$("#btn_edit").click(function(){
			var url='dtaqCheckpointAction.do?method=edit&point_id='+oper_id+'&ec_p='+$("input[name='ec_p']").val();
			commonUrl(url);
		}); 
		});
		
	
		
		function editInfo(id,station_id,type_id) {//编辑
		   var url='dtaqCheckpointAction.do?method=edit&checkFlag=t&qorganType=${param.qorganType}&organ_type=${param.qorganType}&qstartDate=${param.qstartDate}&qendDate=${param.qendDate}&qpoint_code=${param.qpoint_code}&point_id='+id+'&station_id='+station_id+'&type_id='+type_id+'&qtypeId='+type_id;
			location.href=url;
		  	
		}
		function viewInfo(id,station_id,type_id) {//详细
		   var url='dtaqCheckpointAction.do?method=view&viewFlag=t&checkFlag=t&qorganType=${param.qorganType}&qstartDate=${param.qstartDate}&qendDate=${param.qendDate}&qpoint_code=${param.qpoint_code}&point_id='+id+'&station_id='+station_id+'&type_id='+type_id+'&qtypeId='+type_id;
			location.href=url;
		  	
		}
		//导出
		function exportExcel(id) {
		  location.href="${ctx}/dtaqDataInfoAction.do?method=exportExcel&info_id="+id;
		}
		
		//根据工点获取第三方监测单位
	function stationChanged(stationId) {
		$.ajax({
			type: "POST",
			url: "dtaqDataInfoAction.do?method=queryThird",
			data: "stationId="+stationId,
			success: function(msg){
				responseJc(msg);
			}
		});
	}	
	
	//施工单位监理单位
	function responseJc(selResponse){
		var text = selResponse;
		if(text != ""){
			jQuery("[name='eorgjc']").val(text) ;
		}else{
			jQuery("[name='eorgjc']").val("") ;
		}
	}
	function issueSign(id){
	var url='dtaqWarnInfoAction.do?method=issueSign&info_id='+id;
	art.dialog({id:'issueSign',title:'警情下发', iframe:url, width:'900', height:'500',top:'10'});
	}
	</script>
</head>

<body >
<table border="0" cellpadding="0" cellspacing="0" width="100%">
		<tr>
			<td class="treeTd"><%@include file="pointTree.jsp" %></td>
			<td valign="top">
	<table class="queryTable" >
		<tr>
		
			<td class="queryTitle">
				<span >查询条件</span>
			</td>
		</tr>
		<tr>
			<td>
				<html:form action="dtaqCheckpointHistoryAction.do?method=list&ec_p=${param.ec_p}&ec_crd=${param.ec_crd}&qstationId=${param.qstationId}&station_state=${param.station_state}&segment_id=${param.segment_id}&qorganType=${param.qorganType}">
					
					<table align="left">
						<tr>
							   
						
						 		<td>修改时间段：</td>
								<td>
									<input type="text"  name="qstartDate"  class="inputText" value="${qstartDate}"  onfocus="WdatePicker()" />--<input type="text"  name="qendDate"  class="inputText" value="${qendDate}" onfocus="WdatePicker()" />
								</td>
								 <td>监测类型：</td>
							    <td>
							    	<select id="qtypeId" name="qtypeId" ></select>
							    </td>
						         <td>测点编码：</td>
							    <td>
							    	<input type="text" id="" name="qpoint_code" value="${param.qpoint_code }"></select>
							    </td>
								<td align="right">
									<input type="submit" value="查询" icon="icon_query" />
								</td>
								</tr>
					</table>
				</html:form>
			</td>
		</tr>
	</table>
	<fieldset>
	<legend><strong><fmt:message key="dtaq.common.list_field"/></strong></legend>
<ec:table items="dtaqCheckpointHistorys" var="point" action="dtaqCheckpointHistoryAction.do"
	title="" width="100%"  sortable="false" rowsDisplayed="10"
	imagePath="${ctx}/styles/extremecomponents/images/*.gif" locale="zh_CN" 
	retrieveRowsCallback="limit" filterRowsCallback="limit" sortRowsCallback="limit">
  	<ec:row highlightRow="true" >
		<ec:column property="rowcount" cell="rowCount" sortable="false" title="序号" width="5%"/>
		  <ec:column property="point_code" title="测点编码" width="140px"></ec:column>
						  <ec:column property="part" title="监测部位" width="140px">
						  		${point.partId.part_name}
						  </ec:column>
						  <ec:column property="type_id" title="监测类型" width="140px">
						  		<c:forEach items="${types}" var="type">
						  			<c:if test="${type.type_id == point.type_id}">
						  				<c:out value="${type.type_name}"></c:out>
						  			</c:if>
						  		</c:forEach>
						  </ec:column>
						  <ec:column property="point_mechine" title="测量仪器" width="140px"></ec:column>
						  <ec:column property="check_state" title="是否正在检测" width="140px">
						  	<c:if test="${point.check_state == 'Y'}">是</c:if>
						  	<c:if test="${point.check_state == 'N'}">否</c:if>
						  </ec:column>
						  <ec:column property="update_date" title="修改日期" width="140px" format="yyyy-MM-dd" cell="date"></ec:column>
						  <ec:column property="update_reason" title="修改原因" width="160px">
						  		<ex:dicDisplay dictIdentify="UpdatePointReason" dictValue="${point.update_reason}"/>
						  </ec:column>
						  <ec:column property="null" title="操作" sortable="false" width="140px">
							  <div align="center">
							   	 	<input type="button" class="button1" value="${texts['label.view']}" onclick="viewInfo('${point.point_id}','${point.station_id }','${point.type_id }')"/>
							   	 	<c:if test="${station.station_state == '1'}">
							    		<input type="button" class="button1" value="${texts['label.modify']}" onclick="editInfo('${point.point_id}','${point.station_id }','${point.type_id }')"/>
							   	 	</c:if>
							   </div>
					  	</ec:column>
		
		
	</ec:row>
</ec:table>
</fieldset>
</td>
</tr>
</table>
</body>

</html:html>