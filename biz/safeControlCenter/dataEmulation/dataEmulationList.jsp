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
			    var object="${dtaqStation}";			   
			    if(object==""){
			     alert("请选中车站后再新增!");
			     return  false;
			    }
				location.href='dataEmulationAction.do?method=create&qlineId=${param.qlineId}&qsegmentId=${param.qsegmentId}&qstationId=${param.qstationId}&ec_crd='+$("[name='ec_rd']").val()+'';
			}); 
			//编辑
			$("#btn_edit").click(function(){		  
				var url='dataEmulationAction.do?method=edit&emulation_id='+oper_id+'&qlineId=${param.qlineId}&qsegmentId=${param.qsegmentId}&qstationId=${param.qstationId}&qstartDate=${param.qstartDate}&qendDate=${param.qendDate}&ec_p='+$("input[name='ec_p']").val()+'&ec_crd='+$("[name='ec_rd']").val(); 
				commonUrl(url);
			}); 
			//删除
			$("#btn_delete").click(function(){ 
				ret = window.confirm('${texts['dtaq.common.delete.msg']}');
				if(ret){
					var url='dataEmulationAction.do?method=delete&qlineId=${param.qlineId}&qsegmentId=${param.qsegmentId}&qstationId=${param.qstationId}&emulation_id='+oper_id+'&ec_p='+$("input[name='ec_p']").val()+'&ec_crd='+$("[name='ec_rd']").val(); 
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
		   
	    	var url ='dataEmulationAction.do?method=view&emulation_id='+id+'&qlineId=${param.qlineId}&qsegmentId=${param.qsegmentId}&qstationId=${param.qstationId}&qstartDate=${param.qstartDate}&qendDate=${param.qendDate}&ec_p='+$("input[name='ec_p']").val()+'&ec_crd='+$("[name='ec_rd']").val();
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
					action="dataEmulationAction.do?method=list&ec_p=${param.ec_p}&ec_id=${param.id}&ec_crd=${param.ec_crd}&qlineId=${qlineId}&qsegmentId=${qsegmentId}&qstationId=${qstationId}">
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
						</tr>
						<tr>
							<td align="right">
								车站/区间：
							</td>
							<td>
								${dtaqStation.station_name}
							</td>
							<td align="right">
								填报时间：
							</td>
							<td>
								<input type="text" name="qstartDate" class="inputText"
									value="${qstartDate}" onfocus="WdatePicker()" />
								--
								<input type="text" name="qendDate" class="inputText"
									value="${qendDate}" onfocus="WdatePicker()" />
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
	</div>
	<ec:table items="dataEmulations" var="dataEmulation"
		action="dataEmulationAction.do?method=list" title="" width="100%"
		sortable="false" rowsDisplayed="10"
		imagePath="${ctx}/styles/extremecomponents/images/*.gif"
		locale="zh_CN" retrieveRowsCallback="limit" filterRowsCallback="limit"
		sortRowsCallback="limit">
		<ec:row highlightRow="true"
			onclick="pullValue('${dataEmulation.emulation_id}','');"
			ondblclick="showView('${dataEmulation.emulation_id}');">
			<ec:column property="rowcount" cell="rowCount" sortable="false"
				title="序号" width="5%" />
			<ec:column property="null" sortable="false" title="选择" width="5%">
				<input name="select_id" value="${dataEmulation.emulation_id}" type="radio" />
			</ec:column>
			<ec:column property="line_id" title="线路" width="12%"  >
			<c:forEach items="${lines}" var="line">
							<c:if test="${line.line_id == dataEmulation.line_id}">
								<c:out value="${line.line_name}"></c:out>
							</c:if>
						</c:forEach>
			</ec:column>						
			<ec:column property="segment_id"  title="标段" width="8%"  >
			<c:forEach items="${segments}" var="segment">
							<c:if test="${segment.segment_id == dataEmulation.segment_id}">
								<c:out value="${segment.segment_name}"></c:out>
							</c:if>
						</c:forEach>
			</ec:column>	
			<ec:column property="station_id" title="车站/区间" width="8%"  >					
					<c:forEach items="${stations}" var="station">
							<c:if test="${station.station_id== dataEmulation.station_id}">
							${station.station_name}
							</c:if>
						</c:forEach>											
			</ec:column>	
			<ec:column property="creator" title="创建人" width="5%">
				<ex:empName id="${dataEmulation.creator}" />
			</ec:column>
			<ec:column property="create_date" title="填报日期" width="12%">
				<fmt:formatDate value="${dataEmulation.create_date}"
					pattern="yyyy-MM-dd HH:mm:ss" />
			</ec:column>

		</ec:row>
	</ec:table>
</body>

</html:html>