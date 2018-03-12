<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>
<ex:bundle/>
<html>
<head>
<script type="text/javascript" src="${ctx}/scripts/TableTree/TableTree.js"></script>
<link rel="StyleSheet" href="${ctx}/scripts/TableTree/css/tabletree.css" type="text/css" />
<script type="text/javascript">
	$(document).ready(function(){
		//返回
       $("#btn_back").click(function(){
       		var viewFlag='${param.viewFlag}';
       		if(viewFlag==""){
       			history.back(-1);
       		}else if(viewFlag=="1"){
       			var url='projectInfoAction.do?method=queryList&flag=1&staticPrjType=${param.staticPrjType}&staticPrjStatus=${param.staticPrjStatus}&staticPrjType=${param.staticPrjType}&ec_p=${param.ec_p}&ec_crd=${param.ec_crd}&ec_id=${projectInfo.id}&ec_auditStatus=${projectInfo.auditStatus}';
				commonUrl(url);
       		}else if(viewFlag=="2"){
       			var url='projectInfoAction.do?method=queryList&flag=2&staticPrjType=${param.staticPrjType}&staticPrjStatus=${param.staticPrjStatus}&staticPrjType=${param.staticPrjType}&ec_p=${param.ec_p}&ec_crd=${param.ec_crd}&ec_id=${projectInfo.id}&ec_auditStatus=${projectInfo.auditStatus}';
				commonUrl(url);
       		}else{
       			document.forms[0].submit();
       		}
       });
       //
	 });
	function showGridTree(){
		gridTree=new TableTree4J("gridTree","${ctx}/scripts/TableTree/");
		gridTree.tableDesc="<table border=\"1\" class=\"GridView\"  id=\"table1\"   >";	
		var headerDataList=new Array("概算项编码","概算项名称","统计科目","概算项单价","概算项数量","概算项合价");
		var widthList=new Array("15%","15%","15%","15%","15%","15%");
		//参数: arrayHeader,id,headerWidthList,booleanOpen,classStyle,hrefTip,hrefStatusText,icon,iconOpen
		gridTree.setHeader(headerDataList,-1,widthList,true,"GridHead","This is a tipTitle of head href!","header status text","","");				
		//设置列样式
		gridTree.gridHeaderColStyleArray=new Array("leftClo","centerClo","centerClo","centerClo","centerClo","centerClo");
		gridTree.gridDataCloStyleArray=new Array("leftClo","centerClo","centerClo","rightClo","rightClo","rightClo");
		
		var icon = gridTree.icon.folder;
		var openIcon = gridTree.icon.folderOpen;
		var booleanOpen='';
		var src ='';
		
		var classStyle='';
		var target="_self";
		var codeTip='';
		
		<c:forEach items="${prjBudgetItems}" var="prjBudgetItem">
			var budgetCode = '${prjBudgetItem.budgetCode}'
			var budgetName = '${prjBudgetItem.budgetName}';
			var accountName = '${prjBudgetItem.accountName}';
			var price = '<fmt:formatNumber value="${prjBudgetItem.price}" pattern="#,##0.00"/>';
			if('${prjBudgetItem.auditPrice}'!=''){
				price = '<fmt:formatNumber value="${prjBudgetItem.auditPrice}" pattern="#,##0.00"/>';
			}
			var amount = '<fmt:formatNumber value="${prjBudgetItem.amount}" pattern="#,##0.00"/>';
			if('${prjBudgetItem.auditAmount}'!=''){
				amount = '<fmt:formatNumber value="${prjBudgetItem.auditAmount}" pattern="#,##0.00"/>';
			}
			var budgetSum = '<fmt:formatNumber value="${prjBudgetItem.budgetSum}" pattern="#,##0.00"/>';
			if('${prjBudgetItem.auditBudgetSum}'!=''&&'${prjBudgetItem.auditBudgetSum}'!=0){
				budgetSum = '<fmt:formatNumber value="${prjBudgetItem.auditBudgetSum}" pattern="#,##0.00"/>';
			}
			var dataList=new Array(budgetCode,budgetName,accountName,price,amount,budgetSum);
			//添加节点
			gridTree.addGirdNode(dataList,'${prjBudgetItem.id}','${prjBudgetItem.parentId}',booleanOpen,'${prjBudgetItem.orderNum}',src,target,"",classStyle,icon,null,codeTip,"");
		</c:forEach>
		gridTree.printTableTreeToElement("gridTreeDiv");
	}
</script>
</head>
<content tag="heading">
项目管理
</content>
<body>
	<html:form enctype="multipart/form-data" action="projectInfoAction.do?method=list&staticPrjStatus=${param.staticPrjStatus}&ec_p=${param.ec_p}&ec_id=${projectInfo.id}&ec_auditStatus=${projectInfo.auditStatus}&staticPrjType=${param.staticPrjType}&staticFootNode=${param.staticFootNode}&flag=${param.flag}" method="POST">
		<!--查询定位 开始-->
		<html:hidden property="qprjCode" />
		<html:hidden property="qprjName"/>
		<html:hidden property="qauditStatus"/>
		<!--查询定位 结束-->
	</html:form>
	<fieldset>
			<legend>项目管理详细信息</legend>
			<table class="titleTable" >
		         <COLGROUP>
		           	<COL class="tdLeftTwo" />
					<COL class="tdRightTwo" />
					<COL class="tdLeftTwo" />
					<COL class="tdRightTwo" />
		          </COLGROUP>
		           <tr>
						<td>
							项目编号：<span class="noRedSpan">*</span>
						</td>
						<td>
							${projectInfo.prjCode}&nbsp;
						</td>
						<td>
							项目名称：<span class="noRedSpan">*</span>
						</td>
						<td>
							${projectInfo.prjName}&nbsp;
						</td>
					</tr>
					<tr>
						<td>
							成本归属：<span class="noRedSpan">*</span>
						</td>
						<td >
							<ex:dicDisplay dictIdentify="Company_Main" dictValue="${projectInfo.costIncidence}"/>
						</td>
						<td>
							立项日期：<span class="noRedSpan">*</span>
						</td>
						<td >
							<fmt:formatDate value="${projectInfo.approvalDate}" />
						</td>
					</tr>
					<tr>
						<td>
							项目状态：<span class="noRedSpan">*</span>
						</td>
						<td >
							<ex:dicDisplay dictIdentify="PrjStatus" dictValue="${projectInfo.prjStatus}"/>
						</td>
						<td>
							投资额：<span class="noRedSpan">*</span>
						</td>
						<td >
							<fmt:formatNumber pattern="#,##0.0000" value="${projectInfo.investSize}" />（万元）
						</td>
					</tr>
					<tr>
							<td>
							项目类型：<span class="noRedSpan">*</span>
						</td>
						<td>
							<ex:dicDisplay dictIdentify='PrjType' dictValue='${projectInfo.prjType}'/>
						</td>
						<td>
							项目属性：<span class="noRedSpan">*</span>
						</td>
						<td >
							<ex:dicDisplay dictIdentify="PrjProperty" dictValue="${projectInfo.prjProperty}"/>
						</td>
					</tr>
					<tr>
						<td>
							建设规模：<span class="noRedSpan">*</span>
						</td>
						<td colspan="3">
							${projectInfo.buildScope}&nbsp;
						</td>
					</tr>
					<tr>
						<td>
							计划开工日期：<span class="noRedSpan">*</span>
						</td>
						<td>
							<fmt:formatDate value="${projectInfo.planStartDate}" pattern="yyyy-MM-dd"/>
						</td>
						<td>
							计划完工日期：<span class="noRedSpan">*</span>
						</td>
						<td>
							<fmt:formatDate value="${projectInfo.planCompleteDate}" pattern="yyyy-MM-dd"/>
						</td>
					</tr>
					<tr>
						<td>
							项目概况：<span class="noRedSpan">*</span>
						</td>
						<td colspan="3">
							${projectInfo.prjGeneral}&nbsp;
						</td>
					</tr>
					<tr>
						<td>
							备&nbsp;&nbsp;&nbsp;&nbsp;注：<span class="noRedSpan">*</span>
						</td>
						<td colspan="3">
							${projectInfo.remark}&nbsp;
						</td>
					</tr>
		           	<tr>
						<td>
							确认状态：<span class="noRedSpan">*</span>
						</td>
						<td colspan="3">
							<ex:dicDisplay dictIdentify="AuditState" dictValue="${projectInfo.auditStatus}"/>
						</td>
					</tr>
		            <tr>
			             <td>
			             	登&nbsp;&nbsp;记&nbsp;&nbsp;人：<span class="noRedSpan">*</span>
			             </td>
			             <td>
			             	<ex:empName id="${projectInfo.recorder}"/>&nbsp;
			             </td>
			             <td>
			             	登记日期：<span class="noRedSpan">*</span>
			             </td>
			             <td>
			             	<fmt:formatDate value="${projectInfo.recordDate}" pattern="yyyy-MM-dd"/>&nbsp;
			             </td>
		           </tr>
		           <tr>
			             <td>
			             	修&nbsp;&nbsp;改&nbsp;&nbsp;人：<span class="noRedSpan">*</span>
			             </td>
			             <td>
			             	<ex:empName id="${projectInfo.updateMan}"/>&nbsp;
			             </td>
			             <td>
			             	修改日期：<span class="noRedSpan">*</span>
			             </td>
			             <td >
			             	<fmt:formatDate value="${projectInfo.updateDate}" pattern="yyyy-MM-dd"/>&nbsp;
			             </td>
		           </tr>
			</table>
	</fieldset>
       <fieldset >
			<legend>工程概算</legend>
			<table class="formTable">
				<COLGROUP>
					<COL class="tdLeftTwo" />
					<COL class="tdRightTwo" />
					<COL class="tdLeftTwo" />
					<COL class="tdRightTwo" />
				</COLGROUP>
			    <tr>
					<td>
						初始批复日期：<span class="noRedSpan">*</span>
					</td>
					<td >
					<fmt:formatDate value="${prjBudgetManager.initialDate}" pattern="yyyy-MM-dd"/>
					</td>
					<td>
						初始概算金额：<span class="noRedSpan">*</span>
					</td>
					<td>
						<fmt:formatNumber value='${prjBudgetManager.initialSum}' pattern='###0.00'/>(元)
					</td>
				</tr>
				<tr>
					<td>
						最终批复日期：<span class="noRedSpan">*</span>
					</td>
					<td >
						<fmt:formatDate value="${prjBudgetManager.finalDate}" pattern="yyyy-MM-dd"/>
					</td>
					<td>
						最终批复金额：<span class="noRedSpan">*</span>
					</td> 
					<td>
						<fmt:formatNumber value='${prjBudgetManager.finalSum}' pattern='###0.00'/>(元)
					</td>
				</tr>
				<tr>
					<td>
						预估日期：<span class="noRedSpan">*</span>
					</td>
					<td >
						<fmt:formatDate value="${prjBudgetManager.estimateDate}" pattern="yyyy-MM-dd"/>
					</td>
					<td>
						预估审计费：<span class="noRedSpan">*</span>
					</td>
					<td>
						<fmt:formatNumber value='${prjBudgetManager.estimateAuditFee}' pattern='###0.00'/>(元)
					</td>
				</tr>
				<tr>
					<td>
						批复单位：<span class="noRedSpan">*</span>
					</td>
					<td colspan="3">
						${prjBudgetManager.auditCorp}
					</td>
				</tr>
				<tr>
					<td>
						备&nbsp;&nbsp;&nbsp;&nbsp;注：<span class="noRedSpan">*</span>
					</td>
					<td colspan="3">
						${prjBudgetManager.remark}
					</td>
				</tr>
			</table>
	</fieldset>
	<fieldset >
		<legend>工程概算项</legend>
				<div id="gridTreeDiv" class="tableTreeDiv"></div>
				<script type="text/javascript">
						showGridTree();
				</script>
	</fieldset>
	<fieldset>
		<legend>项目变更项目状态历史记录信息</legend>
		<table class="listTable">
			<th>序号</th>
			<th>项目状态</th>
			<th>编辑日期</th>
			<c:forEach items="${prjStatusHistorys}" var="prjStatusHistory" varStatus="index"> 
				<tr>
					<td>
						${index.count}
					</td>
					<td>
						<ex:dicDisplay dictIdentify="PrjStatus" dictValue="${prjStatusHistory.prjStatus}"/>
					</td>
					<td>
						<fmt:formatDate value="${prjStatusHistory.editDate}" pattern="yyyy-MM-dd"/>&nbsp;
					</td>
				</tr>
			</c:forEach>
		</table>
	</fieldset>
	<%@ include file="/commons/showFiles.jsp"%>
	<%--<%@ include file="/commons/showSecondFiles.jsp"%>--%>
	<!--审核信息 -->
	<div class="saveDiv">
		<input id="btn_back" value="${texts['button.back']}" type="button" icon="icon_back"/>
	</div>
  </body>
</html>


