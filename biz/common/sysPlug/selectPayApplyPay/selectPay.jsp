<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
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
				parent.$("#plug_payId").val($("td",this).find(".selectButton").attr("paramId"));
				parent.$("#plug_payCode").val($("td",this).find(".selectButton").attr("paramName"));
				var values=$("td",this).find(".selectButton").attr("paramArray").split("@@");
				parent.$("#plug_payType").val(values[0]);
				parent.$("#plug_yearNum").val(values[1]);
				parent.$("#plug_monthNum").val(values[2]);
				parent.$("#plug_prjName").val(values[3]);
				parent.$("#plug_prjCode").val(values[4]);
				parent.$("#plug_segName").val(values[5]);
				parent.$("#plug_ctrName").val(values[6]);
				parent.$("#plug_ctrCode").val(values[7]);
				parent.$("#plug_corpname").val(values[8]);
				parent.$("#plug_ctrsSum").val(values[9]);
				parent.$("#plug_planPaySum").val(values[10]);
				parent.art.dialog({id:'commonDialog1'}).close();
			});
			//
			$(".selectButton").click(function(){ 
				parent.$("#plug_payId").val($(this).attr("paramId"));
				parent.$("#plug_payCode").val($(this).attr("paramName"));
				var values=$(this).attr("paramArray").split("@@");
				parent.$("#plug_payType").val(values[0]);
				parent.$("#plug_yearNum").val(values[1]);
				parent.$("#plug_monthNum").val(values[2]);
				parent.$("#plug_prjName").val(values[3]);
				parent.$("#plug_prjCode").val(values[4]);
				parent.$("#plug_segName").val(values[5]);
				parent.$("#plug_ctrName").val(values[6]);
				parent.$("#plug_ctrCode").val(values[7]);
				parent.$("#plug_corpname").val(values[8]);
				parent.$("#plug_ctrsSum").val(values[9]);
				parent.$("#plug_planPaySum").val(values[10]);
				parent.art.dialog({id:'commonDialog1'}).close();
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
				<html:form action="contentSelectAction.do?method=selectPayApplyPay&queryType=${param.queryType}">
					<table class="queryContentTable">
						<tr>
							<td >支付申请编号：</td>
							<td><html:text property="qpayCode" maxlength="25" styleClass="inputText"></html:text></td>
							<td >
								<input type="submit" icon="icon_query" value="${texts['button.query']}" />
							</td>
						</tr>
					</table>
				</html:form>
			</td>
		</tr>
	</table>
	<ec:table items="payApplyPays" var="payApplyPay"
		action="contentSelectAction.do?method=selectPayApplyPay&queryType=${param.queryType}" title="" locale="zh_CN"
		sortable="false" rowsDisplayed="10" imagePath="${ctx}/styles/extremecomponents/images/*.gif"
		retrieveRowsCallback="limit" filterRowsCallback="limit" sortRowsCallback="limit">
		<ec:row highlightRow="true" >
			<ec:column property="rowcount" cell="rowCount" sortable="false" title="序号" />
			<ec:column property="payCode" title="申请编号" />
			<ec:column property="ctrId.ctrName" title="合同名称" />
			<ec:column property="ctrId.secondPartyId.corpname" title="乙方单位" />
			<ec:column property="applyDept" calcTitle="applyDept"	title="所属部门" >
				<ex:orgDisplay id="${payApplyPay.applyDept}"/>
			</ec:column>
			<ec:column property="yearNum" title="年份" />
			<ec:column property="monthNum" title="月份" />
			<ec:column property="payType" title="支付类型" >
		  		<ex:dicDisplay dictIdentify="PayType" dictValue="${payApplyPay.payType}"/>
			</ec:column>
			<ec:column property="planPaySum" styleClass="tdRight" title="申请金额(元)" >
				<fmt:formatNumber value="${payApplyPay.payApplySum}" pattern="#,##0.00"/>
			</ec:column>
			<ec:column property="null" title="选择" >
				<input type="button"  class="selectButton" icon="icon_confirm" value="${texts['label.select']}"  
				       paramId="${payApplyPay.id}" paramName="${payApplyPay.payCode}" paramArray='<ex:dicDisplay dictIdentify="PayType" dictValue="${payApplyPay.payType}"/>@@${payApplyPay.yearNum}@@${payApplyPay.monthNum}@@${payApplyPay.prjId.prjName}@@${payApplyPay.prjId.prjCode}@@<ex:segDisplay id="${payApplyPay.ctrId.segid}"/>@@${payApplyPay.ctrId.ctrName}@@${payApplyPay.ctrId.ctrCode}@@${payApplyPay.ctrId.secondPartyId.corpname}@@<fmt:formatNumber pattern="#,##0.00" value="${payApplyPay.ctrId.ctrSum}"/>@@<fmt:formatNumber pattern="###0.00" value="${payApplyPay.payApplySum}"/>' /> 
			</ec:column>
		</ec:row>
	</ec:table>
</body>
</html:html>
