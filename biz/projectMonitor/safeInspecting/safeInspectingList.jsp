<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
<html:html>
<head>
	<%@ include file="/commons/meta.jsp"%>
	<script type="text/javascript">
           var oper_id="";
		jQuery(document).ready(function(){
		
		//控制按钮状态
			$("#btn_edit").hide();
			$("#btn_delete").hide();
			$("#btn_view").hide();

			var ec_id='${param.ec_id}';
			if(ec_id==null||ec_id==""){
				ec_id='${ec_id}';
			}
			pullValue(ec_id);	
				//新增
			$("#btn_add").click(function(){ 
			    
				location.href='safeInspectingAction.do?method=create&qlineId=${param.qlineId}&qsegmentId=${param.qsegmentId}&qstationId=${param.qstationId}&ec_crd='+$("[name='ec_rd']").val()+'';
			}); 
			//编辑
			$("#btn_edit").click(function(){		  
				var url='safeInspectingAction.do?method=edit&inspecting_id='+oper_id+'&qlineId=${param.qlineId}&qsegmentId=${param.qsegmentId}&qstationId=${param.qstationId}&qyear=${param.qyear}&qmonth=${param.qmonth}&qweek=${param.qweek}&ec_p='+$("input[name='ec_p']").val()+'&ec_crd='+$("[name='ec_rd']").val(); 
				commonUrl(url);
			}); 
			//删除
			$("#btn_delete").click(function(){ 
				ret = window.confirm('${texts['dtaq.common.delete.msg']}');
				if(ret){
					var url='safeInspectingAction.do?method=delete&qlineId=${param.qlineId}&qsegmentId=${param.qsegmentId}&qstationId=${param.qstationId}&inspecting_id='+oper_id+'&ec_p='+$("input[name='ec_p']").val()+'&ec_crd='+$("[name='ec_rd']").val(); 
					commonUrl(url);
				}
			});
			
			//详情
			$("#btn_view").click(function(){ 
				showView(oper_id);
			});
							
		});
		
		//详细页面
		function showView(id){
		   
	    	var url ='safeInspectingAction.do?method=view&inspecting_id='+id+'&qlineId=${param.qlineId}&qsegmentId=${param.qsegmentId}&qstationId=${param.qstationId}&qyear=${param.qyear}&qmonth=${param.qmonth}&qweek=${param.qweek}&ec_p='+$("input[name='ec_p']").val()+'&ec_crd='+$("[name='ec_rd']").val();
			commonUrl(url);
	  	}
		
		
		
		//设置list页面id
		function setPullValue(common_oper_id,mutil_auditStatus,select_count){
			oper_id=common_oper_id;		
		}
		
		//指令码判断
		function checkCmd(){
			var cmdIds='${userinfo.usercmd}';
		}
		
		//导出excel
		function exportExcel(){
	var qlineId ="${param.qlineId}";
	var qyear = jQuery("[name='qyear']").val();
	var qmonth = jQuery("[name='qmonth']").val();
	if(qlineId != "" && qyear != ""&&qmonth!=""){
		location.href="${ctx}/safeInspectingAction.do?method=exportInspectingExcel&qlineId=${param.qlineId}&qsegmentId=${param.qsegmentId}&qstationId=${param.qstationId}&qyear="+jQuery("[name='qyear']").val()+"&qmonth="+jQuery("[name='qmonth']").val()+"&qweek="+jQuery("[name='qweek']").val();
	}else{
		alert("年份月份必须选");
	}
}
		
</script>
</head>
<body>
	<table class="queryTable">
	
		<tr>
			<td class="queryTitle">
				<span>查询条件</span>
			</td>
		</tr>
		<tr>
			<td>
				<html:form
					action="safeInspectingAction.do?method=list&qlineId=${param.qlineId}&qsegmentId=${param.qsegmentId}&qstationId=${param.qstationId}">
					<table align="left">
						<tr>
							<td align="right">
								线路：
							</td>
							<td>
								${dtaqStation.segment_id.line_id.line_name}
							</td>
							<td align="right">
								标段：
							</td>
							<td>
								${dtaqStation.segment_id.segment_name}
							</td>
							<td align="right">
								车站/区间：
							</td>
							<td>
								${dtaqStation.station_name}
							</td>
						</tr>
						<tr>
							
							<td align="right">
								年份：
							</td>
							<td>
							<html:select property="qyear" >
					   		<html:optionsCollection name="yearoptions"/>
					  </html:select>
							</td>
							<td align="right">
								月份：
							</td>
							<td>
							<html:select property="qmonth">
					   		<html:optionsCollection name="monthoptions"/>
					  </html:select>
							</td>
							<td align="right">
								周次：
							</td>
							<td>
							<ex:dictSelect type="InspectingWeek" property="qweek"/>
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
	<div class="listButtonDiv">
		<input id="btn_add" value="${texts['button.new']}" type="button"
			icon="icon_add" />
		<input id="btn_view" value="${texts['button.detail']}" type="button"
			icon="icon_view" />
		<input id="btn_edit" value="${texts['button.edit']}" type="button"
			icon="icon_edit" />
		<input id="btn_delete" value="${texts['button.delete']}" type="button"
			icon="icon_delete" />
		<input type="button" class="button1" value="导出excel" icon="icon-excel" onclick="exportExcel()"/>	
	</div>
	<ec:table items="safeInspectings" var="safeInspecting"
		action="safeInspectingAction.do?method=list" title="" width="100%"
		sortable="false" rowsDisplayed="10"
		imagePath="${ctx}/styles/extremecomponents/images/*.gif"
		locale="zh_CN" retrieveRowsCallback="limit" filterRowsCallback="limit"
		sortRowsCallback="limit">
		<ec:row highlightRow="true"
			onclick="pullValue('${safeInspecting.inspecting_id}','');"
			ondblclick="showView('${safeInspecting.inspecting_id}');">
			<ec:column property="rowcount" cell="rowCount" sortable="false"
				title="序号" width="5%" />
			<ec:column property="null" sortable="false" title="选择" width="5%">
				<input name="select_id" value="${safeInspecting.inspecting_id}" type="radio" />
			</ec:column>
			<ec:column property="line_id" title="线路" width="12%"  >
			<c:forEach items="${lines}" var="line">
							<c:if test="${line.line_id == safeInspecting.line_id}">
								<c:out value="${line.line_name}"></c:out>
							</c:if>
						</c:forEach>
			</ec:column>						
			<ec:column property="segment_id"  title="标段" width="8%"  >
			<c:forEach items="${segs}" var="segment">
							<c:if test="${segment.segment_id == safeInspecting.segment_id}">
								<c:out value="${segment.segment_name}"></c:out>
							</c:if>
						</c:forEach>
			</ec:column>	
			<ec:column property="station_id" title="车站/区间" width="8%"  >					
					<c:forEach items="${stations}" var="station">
							<c:if test="${station.station_id== safeInspecting.station_id}">
							${station.station_name}
							</c:if>
						</c:forEach>											
			</ec:column>	
			<ec:column property="year" title="年份" width="5%">
				${safeInspecting.year}
			</ec:column>
			<ec:column property="month" title="月份" width="5%">
				${safeInspecting.month}
			</ec:column>
			<ec:column property="week" title="周次" width="5%">
				<ex:dicDisplay dictIdentify="InspectingWeek" dictValue="${safeInspecting.week }"/>
			</ec:column>
			<ec:column property="content" title="内容" width="5%">
				${safeInspecting.content}
			</ec:column>
			

		</ec:row>
	</ec:table>
</body>

</html:html>