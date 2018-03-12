<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
<html:html>
<head>
<%@ include file="/commons/meta.jsp"%>
	<script type="text/javascript">  
		$(document).ready(function(){
			//
		 	$("#ec_table>tbody>tr").dblclick(function(){
 	            parent.$("#plug_ctrId").val($("td",this).find(".selectButton").attr("paramId"));
				parent.$("#plug_designCorpName").val($("td",this).find(".selectButton").attr("paramName"));
				var values=$("td",this).find(".selectButton").attr("paramArray").split("@@");
				parent.$("#plug_ctrCode").val(values[0]);
				parent.$("#plug_ctrName").val(values[1]);
				parent.$("#plug_ctrSort").val(values[2]);
				parent.$("#plug_payClause").val(values[3]);
				parent.$("#plug_prjId").val(values[4]);
				parent.$("#plug_prjCode").val(values[5]);
				parent.$("#plug_prjName").val(values[6]);
				parent.$("#plug_segName").val(values[7]);
				parent.$("#plug_ctrSort").val(values[8]);
				parent.$("#plug_signDate").val(values[9]);
				parent.$("#plug_ctrSum").val(values[10]);
				parent.$("#plug_estimateSum").val(values[11]);
				//
				var paramWindow=$("[name='paramWindow']").val();
				if(paramWindow==1){
					window.opener.setParamCtrValue($("td",this).find(".selectButton").attr("paramId"),$("td",this).find(".selectButton").attr("paramName"),values[0],values[1],values[2],values[3],values[4],values[5],values[6],values[7],values[10],values[11],values[9]);
					window.close();
				}else{
					parent.art.dialog({id:'commonDialog1'}).close();
				}
 	    	});
			//
			$(".selectButton").click(function(){ 
				parent.$("#plug_ctrId").val($(this).attr("paramId"));
				parent.$("#plug_designCorpName").val($(this).attr("paramName"));
				var values=$(this).attr("paramArray").split("@@");
				parent.$("#plug_ctrCode").val(values[0]);
				parent.$("#plug_ctrName").val(values[1]);
				parent.$("#plug_ctrSort").val(values[2]);
				parent.$("#plug_payClause").val(values[3]);
				parent.$("#plug_prjId").val(values[4]);
				parent.$("#plug_prjCode").val(values[5]);
				parent.$("#plug_prjName").val(values[6]);
				parent.$("#plug_segName").val(values[7]);
				parent.$("#plug_ctrSort").val(values[8]);
				parent.$("#plug_signDate").val(values[9]);
				parent.$("#plug_ctrSum").val(values[10]);
				parent.$("#plug_estimateSum").val(values[11]);
				//
				var paramWindow=$("[name='paramWindow']").val();
				if(paramWindow==1){
					window.opener.setParamCtrValue($(this).attr("paramId"),$(this).attr("paramName"),values[0],values[1],values[2],values[3],values[4],values[5],values[6],values[7],values[10],values[11],values[9]);
					window.close();
				}else{
					parent.art.dialog({id:'commonDialog1'}).close();
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
				<html:form action="contentSelectAction.do?method=selectOaCtr&paramWindow=${param.paramWindow }&queryCtrType=${param.queryCtrType}">
					<table class="queryContentTable">
						<tr>
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
								   <html:option value="-1">请选择</html:option>
								   </c:if>
									<c:forEach items="${lowDeclareInfos}" var="lowDeclareInfo">
										<html:option value="${lowDeclareInfo.id}" >${lowDeclareInfo.nodeName}</html:option>
									</c:forEach>
								</html:select>
							</td>
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
		action="contentSelectAction.do?method=selectOaCtr&queryCtrType=${param.queryCtrType}" title="" locale="zh_CN"
		sortable="false" rowsDisplayed="10" imagePath="${ctx}/styles/extremecomponents/images/*.gif"
		retrieveRowsCallback="limit" filterRowsCallback="limit" sortRowsCallback="limit">
		<ec:row highlightRow="true" >
			<ec:column property="rowcount" cell="rowCount" sortable="false" title="序号" />
			<ec:column property="ctrCode" title="合同编号" />
			<ec:column property="ctrName" title="合同名称" />
			<ec:column property="chargeDept" calcTitle="chargeDept"	title="主管部门" width="10%">
				<ex:orgDisplay id="${contractInfo.chargeDept}"/>
			</ec:column>
			<ec:column property="ctrSort" calcTitle="ctrSort" title="合同类型" >
				<ex:dicDisplay dictIdentify="OaCtrSort" dictValue="${contractInfo.ctrSort}"/>
			</ec:column>
			<ec:column property="ctrSum" calcTitle="ctrSum" title="合同金额(元)" >
				<fmt:formatNumber pattern="#,##0.00" value="${contractInfo.ctrSum}"/>
			</ec:column>
			<ec:column property="secondPartyId" title="签订方" >
			<ex:corpDisplay id="${contractInfo.secondPartyId.id}"/>
			</ec:column>
			<ec:column property="null" title="选择" >
				<input type="button"  class="selectButton" icon="icon_confirm" value="${texts['label.select']}"  
				       paramId="${contractInfo.id}" paramName="${contractInfo.secondPartyId.corpname}" paramArray='${contractInfo.ctrCode}@@${contractInfo.ctrName}@@${contractInfo.ctrSort}@@${contractInfo.payClause}@@1@@1@@1@@1@@<ex:dicDisplay dictIdentify="CTRSORT" dictValue="${contractInfo.ctrSort}"/>@@<fmt:formatDate value="${contractInfo.signDate}" pattern="yyyy-MM-dd"/>@@<fmt:formatNumber pattern="#,##0.00" value="${contractInfo.ctrSum}"/>@@1' /> 
			</ec:column>
		</ec:row>
	</ec:table>
</body>
</html:html>
