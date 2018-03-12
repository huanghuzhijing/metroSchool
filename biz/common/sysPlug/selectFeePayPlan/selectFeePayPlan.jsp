<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
<html:html>
<head>
<%@ include file="/commons/meta.jsp"%>
	<script type="text/javascript">
		var tempParent = parent ;
	
		$(document).ready(function(){
			//
			$(".selectButton").click(function(){ 
				parent.$("#plug_planId").val($(this).attr("paramId"));
				parent.$("#plug_feeName").val($(this).attr("paramName"));
				var values =$(this).attr("paramArray").split("@");
				parent.$("#plug_feeType").val(values[0]);
				parent.$("#plug_yearNum").val(values[1]);
				parent.$("#plug_monthNum").val(values[2]);
				parent.$("#plug_totalBelong").val(values[3]);
				parent.$("#plug_planPaySum").val(values[4]);
				parent.art.dialog({id:'commonDialog1'}).close();
			});
			$("#btn_close").click(function(){
				parent.art.dialog({id:'commonDialog1'}).close();
			});
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
				<html:form action="contentSelectAction.do?method=selectFeePayPlan&queryFeePlanType=${queryFeePlanType}">
					<table class="queryContentTable">
							<tr>
										<td class="tdRight">
											费用名称：
										</td>
										<td>
											<html:text property="qfeeName" styleClass="inputText" maxlength="100"></html:text>
										</td>
										<td class="tdRight">
											费用类型：
										</td>
										
										<td>
											<ex:dictSelect property="qfeeType" type="LandFeeType"/>
										</td>
										<td>年&nbsp;&nbsp;&nbsp;&nbsp;份：</td>
										  <td><html:select property="qyearNum">
													<html:option value="">请选择</html:option>
													<c:forEach items="${listYears}" var="listYear">
														<html:option value="${listYear}" ></html:option>
													</c:forEach>
													</html:select>
					                    </td>
										  <td> 月&nbsp;&nbsp;&nbsp;&nbsp;份：</td>
										  <td><ex:dictSelect property="qmonthNum" type="Month"/></td>
										<td >
											<input type="submit" value="${texts['button.query']}" id="btn_query" icon="icon_query" />
										</td>
									</tr>
					</table>
				</html:form>
			</td>
		</tr>
	</table>
<ec:table items="feePayPlans" var="feePayPlan" 
					action="contentSelectAction.do?method=selectFeePayPlan&queryFeePlanType=${queryFeePlanType}" title=""  locale="zh_CN"
					sortable="false" rowsDisplayed="10" imagePath="${ctx}/styles/extremecomponents/images/*.gif"
					retrieveRowsCallback="limit" filterRowsCallback="limit" sortRowsCallback="limit"
				>
					<ec:row highlightRow="true" 
					>
						<ec:column property="rowcount" cell="rowCount" sortable="false" title="序号" width="5%"/>
						<ec:column property="feeName" title="费用名称" />
							<ec:column property="feeType" title="费用类型" >
							<ex:dicDisplay dictIdentify="LandFeeType" dictValue="${feePayPlan.feeType}"/>
						</ec:column>
						<ec:column property="yearNum" title="年度" />
						<ec:column property="monthNum" title="月份" />
						<ec:column property="applyDept" title="所属部门">
						<ex:orgDisplay id="${feePayPlan.applyDept}"/>
						</ec:column>
						<ec:column property="planPaySum" title="计划金额"  styleClass="tdRight" width="12%">
						<fmt:formatNumber pattern="#,##0.00" value="${feePayPlan.planPaySum}"></fmt:formatNumber>
						</ec:column>
						<ec:column property="auditStatus" title="审核状态" >
							<ex:dicDisplay dictIdentify="AuditState" dictValue="${feePayPlan.auditStatus}"/>
						</ec:column>
						<ec:column property="null" title="选择" >
						<input type="button"  class="selectButton" icon="icon_confirm" value="${texts['label.select']}" 
				    	   paramId="${feePayPlan.id}" paramName="${feePayPlan.feeName }" paramArray='<ex:dicDisplay dictIdentify="FeeType" dictValue="${feePayPlan.feeType}"/>@${feePayPlan.yearNum}@${feePayPlan.monthNum}@ <ex:dicDisplay dictIdentify="SendProperty" dictValue="${feePayPlan.totalBelong}"/>@<fmt:formatNumber pattern="#,##0.00" value="${feePayPlan.planPaySum}"></fmt:formatNumber>'/> 
						</ec:column>
					</ec:row>
				</ec:table> 
		<div class="saveDiv">
			<input id="btn_close" type="button"  icon="icon_close"  value="${texts['button.close']}"  />
		</div>
</body>
</html:html>
