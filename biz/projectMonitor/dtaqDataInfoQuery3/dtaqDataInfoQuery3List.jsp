<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
<html:html>
<head>
<script type="text/javascript" src="${ctx}/scripts/enterKey.js" ></script>
<%@ include file="/commons/meta.jsp"%>
<script type="text/javascript">
		jQuery(document).ready(function(){
				//lineInitChanged();
				//segmentInitChanged();
				//stationInitChanaged();
		})
		//选择线路联动标段
		///function lineChanged() {
			//$.ajax({
			//	type: "POST",
		//		url: "${ctx}/dtaqDataInfoQuery3Action.do?method=querySegment",
		//		data: "line_id="+jQuery("[name='qlineId']").val(),
		//		success: function(msg){
		//			responseList(msg);
		//		}
		//	});
	//	}
		
	//	function lineInitChanged() {
	//		$.ajax({
	//			type: "POST",
	//			url: "${ctx}/dtaqDataInfoQuery3Action.do?method=querySegment",
	//			data: "line_id="+jQuery("[name='qlineId']").val(),
	//			success: function(msg){
	//				responseList(msg);
	//			}
	//		});
	//	}
		//得到联动项目信息并构建options
	//	function responseList(selRequest){
	//	   	var qsegmentId = jQuery("[name='qsegmentId']");
		   	
	//	  	if(selRequest==null || selRequest==""){
	//	  		initSelect1(qsegmentId) ;
	//			return false;
	//		}
	//		else{
	//			fillSelect1(qsegmentId,selRequest,"${qsegmentId}") ;
	//		}
	//	}
		//选择标段联动工点
	//	function segmentChanged() {
	//		$.ajax({
	//			type: "POST",
	//			url: "${ctx}/dtaqDataInfoQuery3Action.do?method=queryStation",
	//			data: "segment_id="+jQuery("[name='qsegmentId']").val(),
	//			success: function(msg){
	//				responseStationList(msg);
	//			}
	//		});
			
	//		$.ajax({//施工单位监理单位
	//			type: "POST",
	//			url: "${ctx}/dtaqDataInfoQuery3Action.do?method=querySgjl",
	//			data: "segment_id="+jQuery("[name='qsegmentId']").val(),
	//			success: function(msg){
	//				responseSgjcList(msg);
	//			}
	//		});
			
	//	}
		//选择标段联动工点
		//function segmentInitChanged() {
			//var segment_id = '${qsegmentId}';
	//		$.ajax({
	//			type: "POST",
	//			url: "${ctx}/dtaqDataInfoQuery3Action.do?method=queryStation",
	//			data: "segment_id="+segment_id,
	//			success: function(msg){
	//				responseStationList(msg);
	//			}
	//		});
			
			//$.ajax({//施工单位监理单位
			//	type: "POST",
			//	url: "${ctx}/dtaqDataInfoQuery3Action.do?method=querySgjl",
			//	data: "segment_id="+segment_id,
			//	success: function(msg){
				//	responseSgjcList(msg);
				//}
		//	});
		//}	
		
		
		//得到联动项目信息并构建options
	//	function responseStationList(selRequest){
	//	   	var qstationId = jQuery("[name='qstationId']") ;
	//	  	if(selRequest==null || selRequest==""){
	//			initSelect1(qstationId) ;
	//			return false;
	//		}else{
	//			fillSelect1(qstationId,selRequest,"${qstationId}") ;
	//		}
	//	}
		//施工单位监理单位
		//function responseSgjcList(selResponse){
		//	var text = selResponse;
		//	if(text != ""){
			//	var textStr = text.split("@");
			//	jQuery("[name='eorg']").val(textStr[0]) ;
			//	jQuery("[name='eorgjl']").val(textStr[1]) ;
			//}else{
			//	jQuery("[name='eorg']").val("") ;
			//	jQuery("[name='eorgjl']").val("") ;
			//}
		//}
	
		//选择工点联动类型
	//	function stationChanaged(){
	//		$.ajax({
	//			type: "POST",
	//			url: "${ctx}/dtaqDataInfoQuery3Action.do?method=queryType",
	//			data: "station_id="+jQuery("[name='qstationId']").val(),
	//			success: function(msg){
	//				responseTypeList(msg);
	//			}
	//		});
	//	}
		//选择工点联动类型
	//	function stationInitChanaged(){
	//		var station_id = '${qstationId}';
	//		alert(station_id);
	//		$.ajax({
	//			type: "POST",
	//			url: "${ctx}/dtaqDataInfoQuery3Action.do?method=queryType",
	//			data: "station_id="+station_id,
	//			success: function(msg){
	//				responseTypeList(msg);
	//			}
	//		});
	//	}
		//得到联动项目信息并构建options
	//	function responseTypeList(selRequest){
	//	   	var qtypeId = jQuery("[name='qtypeId']") ;
	//	  	if(selRequest==null || selRequest==""){
	//	  		initSelect1(qtypeId) ;
	//			return false;
	//		}else{
	//			fillSelect1(qtypeId,selRequest,"${qtypeId}") ;
	//		}
	//	}
		//详细
		function viewInfo(id) {
			var qlineId = jQuery("[name=qlineId]").val() ;
			var qsegmentId = jQuery("[name=qsegmentId]").val() ;
			var qstationId = jQuery("[name=qstationId]").val() ;
			var qtypeId = jQuery("[name=qtypeId]").val() ;
			var qstartDate = jQuery("[name=qstartDate]").val() ;
			var qendDate = jQuery("[name=qendDate]").val() ;
			var qorganType = jQuery("[name=qorganType]").val() ;
			
			
			var params = "&qlineId="+qlineId+"&qsegmentId="+qsegmentId+"&qstationId="+qstationId+"&qtypeId="+qtypeId+"&qstartDate="+qstartDate+"&qendDate="+qendDate+"&qorganType="+qorganType+"&dtaqDataInfoList_page=${dtaqDataInfoList_page}";
		  	location.href="${ctx}/dtaqDataInfoQuery3Action.do?method=view&thirdList=${param.thirdList}&info_id="+id+params;
		  	
		}
		//导出
		function exportExcel(id) {
		  location.href="${ctx}/dtaqDataInfoQuery3Action.do?method=exportExcel&info_id="+id;
		}
	</script>
</head>
<body >
	<table class="queryTable" >
		<tr>
			<td class="queryTitle">
				<span >查询条件</span>
			</td>
		</tr>
		<tr>
			<td>
				<html:form action="dtaqDataInfoQuery3Action.do?method=list&ec_p=${param.ec_p}&ec_id=${param.id}&ec_crd=${param.ec_crd}&qlineId=${qlineId}&qsegmentId=${qsegmentId}&qstationId=${qstationId}&thirdList=${param.thirdList}">
					<table align="left">
						<tr>
								<td align="right">线路：</td>
								<td>${dtaqLine.line_name}</td>
								<td align="right">标段：</td>
								<td>${dtaqSegment.segment_name}</td>
						</tr>
					 	<tr>
					 			<td align="right">车站/区间：</td>
					 			<td>${dtaqStation.station_name}</td>
							    <td align="right">监测类型：</td>
							    <td>
							    	<html:select property="qtypeId">
									 <html:option value="">请选择</html:option>
									 <c:if test="${types !=null}">
									 	<html:optionsCollection name="types" value="type_id" label="type_name"/>
									 </c:if>
									 
									</html:select>
							    </td>
						</tr>
						<tr>
								<td align="right">施工单位：</td>
								<td>
									${sgName}
<!--									<html:text property="eorg"  styleClass="text" size="29" readonly="true"/>-->
								</td>
								<td align="right">监理单位：</td>
								<td>
									${jlName}
<!--									<html:text property="eorgjl"  styleClass="text" size="29" />-->
								</td>
						</tr>
						<tr>
						 		<td align="right">填报时间：</td>
								<td>
									<input type="text"  name="qstartDate"  class="inputText" value="${qstartDate}"  onfocus="WdatePicker()" />--<input type="text"  name="qendDate"  class="inputText" value="${qendDate}" onfocus="WdatePicker()" />
								</td>
								
								<c:if test="${param.thirdList!='thirdList'}">
									<td align="right">第三方/施工方：</td>
									<td>
										<html:select property="qorganType">
											<html:option value="T">第三方</html:option>
											<html:option value="O">施工方</html:option>
										</html:select>
									</td>
								</c:if>
								<c:if test="${param.thirdList=='thirdList'}">
									<html:hidden property="qorganType" value="T"/>
								
								</c:if>
								
								<td align="right">
									<input type="submit" value="查询" icon="icon_query" />
								</td>
								</tr>
					</table>
				</html:form>
			</td>
		</tr>
	</table>

<ec:table items="dtaqDataInfos" var="dtaqDataInfo" action="dtaqDataInfoQuery3Action.do?method=list"
	title="" width="100%"  sortable="false" rowsDisplayed="10"
	imagePath="${ctx}/styles/extremecomponents/images/*.gif" locale="zh_CN" 
	retrieveRowsCallback="limit" filterRowsCallback="limit" sortRowsCallback="limit">
  	<ec:row highlightRow="true" >
		<ec:column property="rowcount" cell="rowCount" sortable="false" title="序号" width="5%"/>
		<ec:column property="line_id.line_name"  title="线路" width="15%"/>
		<ec:column property="segment_id.segment_name"  title="标段" width="10%"/>
		<ec:column property="station_id.station_name" title="车站/区间" width="10%"/>
		<ec:column property="type_id.type_name" title="监测类型" width="10%"/>
		<ec:column property="write_date" title="填报日期" width="10%">
			<fmt:formatDate value="${dtaqDataInfo.write_date}" pattern="yyyy-MM-dd HH:mm:ss"/>
		</ec:column>
		<ec:column property="monitoring_date" title="监测日期" width="10%"/>
		<ec:column property="write_user" title="填报人" width="10%">
			<ex:employeeName id="${dtaqDataInfo.write_user}" />
		</ec:column>
		<ec:column property="null" title="操作" width="12%">
			<div align="center">
				<input type="button" class="button1" value="查看明细" onclick="viewInfo('${dtaqDataInfo.info_id}')">
		    	<input type="button" class="button1"value="导出Excel" onclick="exportExcel('${dtaqDataInfo.info_id}')">
			</div>
		</ec:column>
		
		
	</ec:row>
</ec:table>
</body>

</html:html>