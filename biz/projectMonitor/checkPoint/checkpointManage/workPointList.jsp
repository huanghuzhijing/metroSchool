<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>
<ex:bundle/>
<html:html>
<head>
<content tag="heading">测点统计分析</content>
<script src="${ctx}/scripts/public.js" type="text/javascript"></script>
<script  type="text/javascript" language=javascript>
//必须搭配prototype1.16版本
</script>
<script type="text/javascript">
//测点类型联动获取监测部位
			function typeChanage(){
				$.ajax({
					type: "POST",
					url: "${ctx}/checkpointPictureAction.do?method=queryPart",
					data: "type_id="+jQuery("[name='type_id']").val()+"&station_id=${param.station_id}&organ_type=O&picturePart=Y",
					success: function(msg){
						responsePartList(msg);
					}
				});
				//var url = "${ctx}/checkpointPictureAction.do?method=queryPart";
				//var myajax = new Ajax.Request(url, {method:"post", parameters:"type_id="+jQuery("[name='type_id']").val()+"&station_id="+jQuery("[name='station_id']").val()+"&organ_type="+jQuery("[name='organ_type']").val()+"&picturePart=Y", onComplete:responsePartList});
			}
			//得到联动项目信息并构建options
			function responsePartList(selRequest){
			   	var part_id = jQuery("[name='part_id']") ;
			   
			   	
			  	if(selRequest==null || selRequest==""){
				   	initSelect1(part_id) ;
					return false;
				}
				else{
					fillSelect1(part_id,selRequest,"${param.part_id}") ;
				}
			}

function backToList(){
	location.href="checkpointManageAction.do?method=pointTotal&line_id=${line.line_id}&station_state=${param.station_state}";
}

function exportPoints(){
var url="checkpointManageAction.do?method=exportExcelPoints&isthird=N&organ_type=O&line_id=${line_id}&segment_id=${segment_id}&station_id=${param.station_id}&type_id="+jQuery("[name='type_id']").val()+"&part_id="+jQuery("[name='part_id']").val()+"&point_code="+jQuery("[name='point_code']").val();
	location.href=url;
}
</script>
</head>
<body onload="typeChanage()">
<ex:tab id="dataInfo">
	<ex:tabItem name="work" label="施工方" selected="true">
		 <fieldset>
		  <legend><strong>查询条件</strong></legend>
		  <html:form action="checkpointManageAction.do">
		  <input type="hidden" name="method" value="queryPointList">
		  <html:hidden property="line_id" value="${line_id}"/>
		  <html:hidden property="segment_id" value="${segment_id}"/>
		  <html:hidden property="station_id" value="${param.station_id}"/>
		  <html:hidden property="organ_type" value="${param.organ_type}"/>
		  <html:hidden property="isthird" value="N"/>
			  <table class="searchTable" >
				  <tr>
				  	 <td  >线路：</td>
				    <td><html:text property="line_name" value="${line.line_name}" styleClass="text" size="30" readonly="true" /></td>
				    <td >标段：</td>
				    <td><html:text property="segment_name" value="${segment.segment_name}" styleClass="text" size="25" readonly="true" /></td>
				    <td >车站/区间：</td>
				    <td><html:text property="station_name" value="${station.station_name}" styleClass="text" size="25" readonly="true" /></td>
				    <td >&nbsp;</td>
				 </tr>
				 <tr>
				    <td  >监测类型：</td>
				    <td>
					      <html:select property="type_id" styleId="type_id" onchange="typeChanage()">
					        <html:option value="">请选择</html:option>
						    <html:optionsCollection name="types" value="type_id" label="type_name"/>
					      </html:select>
				     </td>
				    <td  >监测部位：</td>
				    <td>
					   <html:select property="part_id"  >
									<html:option value="">请选择</html:option>
								</html:select>
				    </td>
				    <td >测点编码：</td>
				    <td><html:text property="point_code" styleId="point_code" styleClass="text" maxlength="15" /></td>
				    <td  align="right">
				    	<input type="submit" value="${texts['button.query']}" class="saveButton"/>
				    	
				    </td>
			    </tr>
			  </table>
		  </html:form>
		</fieldset>
		<fieldset>
		  <legend><strong><fmt:message key="dtaq.common.list_field"/></strong></legend>
		  <div style="float: right;"><div class="saveDiv"><input type="button" class="button1" value="导&nbsp;&nbsp出" onclick="exportPoints()"/><input type="button" class="backButton" value="${texts['button.back']}" onclick="backToList()"></div></div>
		<ec:table items="dtaqCheckpoints" var="point" action="checkpointManageAction.do?method=queryPointList"
	title="" width="100%"  sortable="false" rowsDisplayed="10"
	imagePath="${ctx}/styles/extremecomponents/images/*.gif" locale="zh_CN" 
	retrieveRowsCallback="limit" filterRowsCallback="limit" sortRowsCallback="limit">
  		<ec:row highlightRow="true" onclick="pullValue('${thing.thing_id}');" >
		<ec:column property="rowcount" cell="rowCount" sortable="false" title="序号" width="5%"/>		
				
				  <ec:column property="point_code" title="测点编码" width="120px"></ec:column>
				  <ec:column property="type_id" title="监测类型" width="120px">
				  		<c:forEach items="${typeList}" var="type">
					  		<c:if test="${type.type_id == point.type_id}">
					  			<c:out value="${type.type_name}"></c:out>
					  		</c:if>
				  		</c:forEach>
				  </ec:column>
				  <ec:column property="point_mechine" title="测量仪器" width="140px"></ec:column>
				 <ec:column property="abs_critical_value" title="绝对临界值（mm）" width="140px">
				  		<fmt:formatNumber value="${point.abs_critical_value}" />
				  </ec:column>
				  <ec:column property="abs_warning_value" title="绝对警戒值（mm）" width="140px">
				  		<fmt:formatNumber value="${point.abs_warning_value}" />
				   </ec:column>
				  <ec:column property="negative_abs_critical_value" title="负绝对临界值（mm）" width="140px">
				  		<fmt:formatNumber value="${point.negative_abs_critical_value}" />
				  </ec:column>
				  <ec:column property="negative_abs_warning_value" title="负绝对警戒值（mm）" width="140px">
				  		<fmt:formatNumber value="${point.negative_abs_warning_value}" />
				   </ec:column>
				  <ec:column property="rel_critical_value" title="相对临界值" width="140px">
				  		<fmt:formatNumber value="${point.rel_critical_value}" />
				  </ec:column>
				  <ec:column property="rel_warning_value" title="相对警戒值" width="140px">
				  		<fmt:formatNumber value="${point.rel_warning_value}" />
				  </ec:column>
				  <ec:column property="check_state" title="是否正在检测" width="120px">
				  	<c:if test="${point.check_state == 'Y'}">是</c:if>
				  	<c:if test="${point.check_state == 'N'}">否</c:if>
				  </ec:column>
				  <ec:column property="project_direction" title="工程方向" width="140px"></ec:column>
			</ec:row>
			</ec:table>
		</fieldset>
  	</ex:tabItem>
  	<ex:tabItem name="third" label="第三方" url="checkpointManageAction.do?method=queryPointList&organ_type=t&isthird=Y&line_id=${param.line_id}&segment_id=${param.segment_id}&station_id=${param.station_id}&station_state=${param.station_state}" disabled="false" />
</ex:tab>
  </body>
</html:html>