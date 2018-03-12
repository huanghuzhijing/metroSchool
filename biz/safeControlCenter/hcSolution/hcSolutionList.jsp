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
			$("#btn_submit").hide();

			var ec_id='${param.ec_id}';
			if(ec_id==null||ec_id==""){
				ec_id='${ec_id}';
			}
			pullValue(ec_id);	
				//新增
			$("#btn_add").click(function(){ 
			   
				location.href='hcSolutionAction.do?method=create&qstationId=${param.qstationId}&ec_crd='+$("[name='ec_rd']").val()+'';
			}); 
			//编辑
			$("#btn_edit").click(function(){		  
				var url='hcSolutionAction.do?method=edit&id='+oper_id+'&qstationId=${param.qstationId}&pstartDate=${param.pstartDate}&pendDate=${param.pendDate}&jstartDate=${param.jstartDate}&jendDate=${param.jendDate}&qhiddenContent=${param.qhiddenContent}&qhiddenGrade=${param.qhiddenGrade}&ec_p='+$("input[name='ec_p']").val()+'&ec_crd='+$("[name='ec_rd']").val(); 
				commonUrl(url);
			}); 
			//删除
			$("#btn_delete").click(function(){ 
				ret = window.confirm('${texts['dtaq.common.delete.msg']}');
				if(ret){
					var url='hcSolutionAction.do?method=delete&qstationId=${param.qstationId}&id='+oper_id+'&ec_p='+$("input[name='ec_p']").val()+'&ec_crd='+$("[name='ec_rd']").val(); 
					commonUrl(url);
				}
			});
			
			//上报
			$("#btn_submit").click(function(){ 
				ret = window.confirm('是否确认上报');
				if(ret){
					var url='hcSolutionAction.do?method=report&qstationId=${param.qstationId}&id='+oper_id+'&ec_p='+$("input[name='ec_p']").val()+'&ec_crd='+$("[name='ec_rd']").val(); 
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
		   
	    	var url ='hcSolutionAction.do?method=view&id='+id+'&qstationId=${param.qstationId}&pstartDate=${param.pstartDate}&pendDate=${param.pendDate}&jstartDate=${param.jstartDate}&jendDate=${param.jendDate}&qhiddenContent=${param.qhiddenContent}&qhiddenGrade=${param.qhiddenGrade}&ec_p='+$("input[name='ec_p']").val()+'&ec_crd='+$("[name='ec_rd']").val();
			commonUrl(url);
	  	}
		
		
		
		//设置list页面id
		function setPullValue(common_oper_id,mutil_auditStatus,select_count){
			oper_id=common_oper_id;
			var operObj = $("input[type=radio][name='select_id'][checked]");
			if(operObj.attr("state")==0){
			$("#btn_submit").show();
			
			
			}if(operObj.attr("state")==1){
			$("#btn_submit").hide();	
			}
			
			 if(operObj.attr("state")==1&&operObj.attr("state_1")==1){
						
			$("#btn_submit").hide();	
			$("#btn_edit").hide();
			$("#btn_delete").hide();		
			}
			
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
					action="hcSolutionAction.do?method=list&ec_p=${param.ec_p}&ec_id=${param.id}&ec_crd=${param.ec_crd}&qsegmentId=${dtaqStation.segment_id.segment_id}&qstationId=${dtaqStation.station_id}">
					<table align="left">
						<tr>
							<td align="right">
								排查日期：
							</td>
							<td>
								<input type="text" name="pstartDate" class="inputText"
									value="${pstartDate}" onfocus="WdatePicker()" />
								--
								<input type="text" name="pendDate" class="inputText"
									value="${pendDate}" onfocus="WdatePicker()" />
							</td>
						</tr>
						<tr>
							<td align="right">
								截止日期：
							</td>
							<td>
								<input type="text" name="jstartDate" class="inputText"
									value="${jstartDate}" onfocus="WdatePicker()" />
								--
								<input type="text" name="jendDate" class="inputText"
									value="${jendDate}" onfocus="WdatePicker()" />
							</td>
						</tr>
						<tr>
							<td align="right">
								隐患类别 ：
							</td>
							<td>
<!--								<ex:dictSelect property="qhiddenContent" type="HiddenContent" />-->
 <html:select property="qhiddenContent" styleId="qhiddenContent" name="hcSolutionForm">
								 	<html:option value=""><fmt:message key="dictSelect.select" /></html:option>
								 	<html:optionsCollection name="types" value="id" label="sortName"/>
								</html:select>
							</td>
							<td>
								隐患等级 ：
							</td>
							<td>
								<ex:dictSelect property="qhiddenGrade" type="HiddenType" />
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
		<c:if test="${not empty dtaqStation.station_id}">

			<div class="promptDiv">
				标段：
				<span class="keyInfoSpan">${dtaqStation.segment_id.segment_name}</span>&nbsp;&nbsp;&nbsp;&nbsp;
				车站/区间：
				<span class="keyInfoSpan">${dtaqStation.station_name}</span>
			</div>
			<div class="listButtonDiv">
				<input id="btn_add" value="${texts['button.new']}" type="button"
					icon="icon_add" />
				<input id="btn_view" value="${texts['button.detail']}" type="button"
					icon="icon_view" />
				<input id="btn_edit" value="${texts['button.edit']}" type="button"
					icon="icon_edit" />
				<input id="btn_delete" value="${texts['button.delete']}"
					type="button" icon="icon_delete" />
				<input type="button" id="btn_submit" icon="icon-reload"
					class="button1 hidden " value="上  报" />
			</div>
		</c:if>


		<ec:table items="hcSolutions" var="hcSolution"
			action="hcSolutionAction.do?method=list" title="" width="100%"
			sortable="false" rowsDisplayed="10"
			imagePath="${ctx}/styles/extremecomponents/images/*.gif"
			locale="zh_CN" retrieveRowsCallback="limit"
			filterRowsCallback="limit" sortRowsCallback="limit">
			<ec:row highlightRow="true"
				onclick="pullValue('${hcSolution.id}','');"
				ondblclick="showView('${hcSolution.id}');">
				<ec:column property="rowcount" cell="rowCount" sortable="false"
					title="序号" width="5%" />
				<ec:column property="null" sortable="false" title="选择" width="5%">
					<input name="select_id" value="${hcSolution.id}" type="radio"
						state="${hcSolution.reportStatus}" state_1="${hcSolution.affirmStatus}" />
				</ec:column>
				<ec:column property="hiddenContent" title="隐患名称" width="12%">
				${hcSolution.hiddenContent}
			</ec:column>
				<ec:column property="hiddenGrade" title="隐患等级" width="5%">
					<ex:dicDisplay dictIdentify="HiddenType"
						dictValue="${hcSolution.hiddenGrade}" />
				</ec:column>
				<ec:column property="dutyMan" title="第一责任人" width="5%">
				${hcSolution.dutyMan}
			</ec:column>
				<ec:column property="writeDate" title="排查日期" width="5%">
					<fmt:formatDate value="${hcSolution.writeDate}"
						pattern="yyyy-MM-dd" />
				</ec:column>
				<ec:column property="limitDate" title="截止日期" width="5%">
					<fmt:formatDate value="${hcSolution.limitDate}"
						pattern="yyyy-MM-dd" />
				</ec:column>
				<ec:column property="auditResult" title="审核结果" width="5%">
					<ex:dicDisplay dictIdentify="CheckResult"
						dictValue="${hcSolution.auditResult}" />
				</ec:column>
				<ec:column property="reportStatus" title="上报状态" width="5%">
					<ex:dicDisplay dictIdentify="ReportStatus"
						dictValue="${hcSolution.reportStatus}" />
				</ec:column>


			</ec:row>
		</ec:table>
	</fieldset>
</body>

</html:html>