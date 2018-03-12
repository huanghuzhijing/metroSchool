<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
<html:html>
<head>
<%@ include file="/commons/meta.jsp"%>
	<script type="text/javascript">  
		$(document).ready(function(){
			//
			$(".selectButton").click(function(){ 
				ret = window.confirm('之前用户填报的人员委派信息将自动删除，是否确定选择？');
				if(ret){
					location.href='prjSegmentInfoAction.do?method=saveCtr&ctrId='+$(this).attr("paramId")+'&staticSegId=${param.staticSegId}';
				}
			});
			//
		});
		
	</script>
</head>
<body>
	<table class="queryTable" >
		<tr>
			<td class="queryTitle">
				<span >&nbsp;[${texts['dtaq.common.query_field']}]&nbsp;</span>
			</td>
		</tr>
		<tr>
			<td>
				<html:form action="prjSegmentInfoAction.do?method=selectCtr&staticSegId=${param.staticSegId}">
					<table class="queryContentTable">
						<tr>
							<td >
								项目名称：
							</td>
							<td>
								<html:text property="qprjName" maxlength="25" styleClass="inputText"></html:text>
							</td>
							<td >
								合同名称：
							</td>
							<td>
								<html:text property="qctrName" maxlength="25" styleClass="inputText"></html:text>
							</td>
							<td >
								主管部门：
							</td>
							<td>
								<html:select property="qorganName">
								   <c:if test="${fn:length(lowDeclareInfos)!=1}">
								   <html:option value="">请选择</html:option>
								   </c:if>
									<c:forEach items="${lowDeclareInfos}" var="lowDeclareInfo">
										<html:option value="${lowDeclareInfo.id}" >${lowDeclareInfo.nodeName}</html:option>
									</c:forEach>
								</html:select>
							</td>
						</tr>
						<tr>
							<%-- 
							<td >
								合同类型：
							</td>
							<td>
								<ex:dictSelect property="qctrSort" type="CTRSORT" />
							</td>
							--%>
							<td >
								签订方：
							</td>
							<td>
								<html:text property="qsecondPartyName" maxlength="25" styleClass="inputText"></html:text>
							</td>
							<td >
								<input type="submit" icon="icon_query" value="${texts['button.query']}" />
							</td>
						</tr>
					</table>
				</html:form>
			</td>
		</tr>
	</table>
	<ec:table items="contractInfos" var="contractInfo"
		action="prjSegmentInfoAction.do?method=selectCtr&staticSegId=${param.staticSegId }" title="" locale="zh_CN"
		sortable="false" rowsDisplayed="10" imagePath="${ctx}/styles/extremecomponents/images/*.gif"
		retrieveRowsCallback="limit" filterRowsCallback="limit" sortRowsCallback="limit">
		<ec:row highlightRow="true" >
			<ec:column property="rowcount" cell="rowCount" sortable="false" title="序号" />
			<ec:column property="prjId.prjName" title="项目名称" />
			<ec:column property="ctrCode" title="合同编号" />
			<ec:column property="ctrName" title="合同名称" />
			<ec:column property="chargeDept" calcTitle="chargeDept"	title="主管部门" width="10%">
				<ex:orgDisplay id="${contractInfo.chargeDept}"/>
			</ec:column>
			<ec:column property="ctrSort" calcTitle="ctrSort" title="合同类型" >
				<ex:dicDisplay dictIdentify="CTRSORT" dictValue="${contractInfo.ctrSort}"/>
			</ec:column>
			<ec:column property="ctrSum" calcTitle="ctrSum" title="合同金额(元)" >
				<fmt:formatNumber pattern="#,##0.00" value="${contractInfo.ctrSum}"/>
			</ec:column>
			<ec:column property="secondPartyId" title="签订方" >
			<ex:corpDisplay id="${contractInfo.secondPartyId.id}"/>
			</ec:column>
			<ec:column property="null" title="选择" >
				<input type="button"  class="selectButton" icon="icon_confirm" value="${texts['label.select']}"  
				       paramId="${contractInfo.id}"  /> 
			</ec:column>
		</ec:row>
	</ec:table>
</body>
</html:html>
