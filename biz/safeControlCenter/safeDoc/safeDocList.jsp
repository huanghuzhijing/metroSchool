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
			   
				location.href='safeDocAction.do?method=create&qlineId=${param.qlineId}&qsegmentId=${param.qsegmentId}&ec_crd='+$("[name='ec_rd']").val()+'';
			}); 
			//编辑
			$("#btn_edit").click(function(){		  
				var url='safeDocAction.do?method=edit&fid='+oper_id+'&qlineId=${param.qlineId}&qsegmentId=${param.qsegmentId}&qstartDate=${param.qstartDate}&qendDate=${param.qendDate}&qtypes=${param.qtypes}&ec_p='+$("input[name='ec_p']").val()+'&ec_crd='+$("[name='ec_rd']").val(); 
				commonUrl(url);
			}); 
			//删除
			$("#btn_delete").click(function(){ 
				ret = window.confirm('${texts['dtaq.common.delete.msg']}');
				if(ret){
					var url='safeDocAction.do?method=delete&qlineId=${param.qlineId}&qsegmentId=${param.qsegmentId}&fid='+oper_id+'&ec_p='+$("input[name='ec_p']").val()+'&ec_crd='+$("[name='ec_rd']").val(); 
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
		   
	    	var url ='safeDocAction.do?method=view&flag=1&fid='+oper_id+'&qlineId=${param.qlineId}&qsegmentId=${param.qsegmentId}&qstartDate=${param.qstartDate}&qendDate=${param.qendDate}&qtypes=${param.qtypes}&ec_p='+$("input[name='ec_p']").val()+'&ec_crd='+$("[name='ec_rd']").val();
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
					action="safeDocAction.do?method=list&ec_p=${param.ec_p}&ec_id=${param.id}&ec_crd=${param.ec_crd}&qlineId=${dtaqSegment.line_id.line_id }&qsegmentId=${dtaqSegment.segment_id}">
					<table align="left">
					<tr>
							<td align="right">
								线路：
							</td>
							<td>
								${dtaqSegment.line_id.line_name}
							</td>
							<td align="right">
								标段：
							</td>
							<td>
								${dtaqSegment.segment_name}
							</td>
						</tr>
						<tr>
							<td align="right">
								创建日期：
							</td>
							<td>
								<input type="text" name="qstartDate" class="inputText"
									value="${qstartDate}" onfocus="WdatePicker()" />
								--
								<input type="text" name="qendDate" class="inputText"
									value="${qendDate}" onfocus="WdatePicker()" />
							</td>
						</tr>
						
						<tr>
							<td align="right">
								文件类型 ：
							</td>
							<td>
								<ex:dictSelect property="qtypes" type="ContractOrigin"/>
							</td>
							<td>
								文件标题 ：
							</td>
							<td>
								<html:text property="qtitle" />
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
		<legend>
			信息列表
		</legend>
		
			<div class="listButtonDiv">
				<input id="btn_add" value="${texts['button.new']}" type="button"
					icon="icon_add" />
				<input id="btn_view" value="${texts['button.detail']}" type="button"
					icon="icon_view" />
				<input id="btn_edit" value="${texts['button.edit']}" type="button"
					icon="icon_edit" />
				<input id="btn_delete" value="${texts['button.delete']}"
					type="button" icon="icon_delete" />
				
			</div>
		


		<ec:table items="safeDocs" var="safeDoc"
			action="safeDocAction.do?method=list" title="" width="100%"
			sortable="false" rowsDisplayed="10"
			imagePath="${ctx}/styles/extremecomponents/images/*.gif"
			locale="zh_CN" retrieveRowsCallback="limit"
			filterRowsCallback="limit" sortRowsCallback="limit">
			<ec:row highlightRow="true"
				onclick="pullValue('${safeDoc.fid}','');"
				ondblclick="showView('${safeDoc.fid}');">
				<ec:column property="rowcount" cell="rowCount" sortable="false"
					title="序号" width="5%" />
				<ec:column property="null" sortable="false" title="选择" width="5%">
					<input name="select_id" value="${safeDoc.fid}" type="radio"	/>
				</ec:column>
				<ec:column property="lineid" title="线路" width="12%">
				<c:forEach items="${lines}" var="line">
			 		<c:if test="${line.line_id == safeDoc.lineid}">
			 			<c:out value="${line.line_name}"></c:out>
			 		</c:if>
			 	</c:forEach>
			</ec:column>
				<ec:column property="segid" title="标段" width="5%">
					<c:forEach items="${segs}" var="segment">
			 		<c:if test="${segment.segment_id == safeDoc.segid}">
			 			<c:out value="${segment.segment_name}"></c:out>
			 		</c:if>
			 	</c:forEach>
				</ec:column>
				<ec:column property="title" title="文件标题" width="5%">
				${safeDoc.title}
			</ec:column>
				<ec:column property="types" title="文件类型" width="5%">
					<ex:dicDisplay dictIdentify="ContractOrigin"  dictValue="${safeDoc.types}"/>
				</ec:column>
				<ec:column property="author" title="作者" width="5%">
					${safeDoc.author}
				</ec:column>
				<ec:column property="ts" title="创建日期" width="5%">
					<fmt:formatDate value="${safeDoc.ts}"  pattern="yyyy-MM-dd"/>
				</ec:column>
				
			</ec:row>
		</ec:table>
	</fieldset>
</body>

</html:html>