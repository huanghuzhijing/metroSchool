<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>
<ex:bundle/>
<html:html>
<head>
<%-- <script src="<c:url value="/js/windowsJS.js"/>" type="text/javascript"></script>--%>
<title>业务管理系统！</title>
<content tag="heading">
我的工作台
</content>  
<style >
body{
font-size:10px;
}
</style>
<script src="<c:url value="/scripts/public.js"/>" type="text/javascript" ></script>
</head>
<body>
<c:if test="${projectInfos ne null}">
	<ec:table items="projectInfos" var="projectInfo" action="projectInfoAction.do"
			title="待复核项目" width="100%" sortable="false" rowsDisplayed="10">
		<ec:row>
    	 <ec:column property="prj_code" calcTitle="prj_code" title="项目编号"/>
    	 <ec:column property="prj_name" calcTitle="prj_name" title="项目名称"/>
    	 <ec:column property="prj_status" calcTitle="prj_status" title="项目状态">
    	 	<ex:dictDisplayEl type="PrjStatus" value="${projectInfo.prj_status}"/>
    	 </ec:column>
    	 <ec:column property="prj_dept.name" calcTitle="prj_dept.name" title="工程科室"/>
    	 <ec:column property="prj_investsize" calcTitle="prj_investsize" title="投资规模<br>万元" cell="currency" />
    	 <ec:column property="prj_planstartdate" parse="yyyy-mm-dd" cell="date" calcTitle="prj_planstartdate" title="计划开工<br>时间"/>
    	 <ec:column property="null" calcTitle="null" title="操作">
    	 	<input type="button" value="复核通过" class="button1" onclick="location.href='projectInfoAction.do?method=review&id=${projectInfo.id}'" />
    	 </ec:column>
		</ec:row>
    </ec:table>
</c:if>
<c:if test="${payPayApplys ne null}">
    <ec:table items="payPayApplys" var="payPayApply" action="payPayApplyAction.do" title="待复核支付申请" showPagination="false" sortable="false">
    	<ec:row>
    	 <ec:column property="rowcount" cell="rowCount" sortable="false" title="序号" />
    	 <ec:column property="ctrid.prjid.prj_code" calcTitle="prj_code" title="项目编号"/>
    	 <ec:column property="ctrid.prjid.prj_name" calcTitle="prj_name" styleClass="pay_name" title="项目名称"/>
    	 <ec:column property="ctrid.ctrcode" calcTitle="ctrcode" title="合同编号"/>
    	 <ec:column property="ctrid.ctrname" calcTitle="ctrname" styleClass="pay_name" title="合同名称"/>
    	 <ec:column property="ctrid.ctrsum" calcTitle="ctrsum" cell="currency" title="合同金额(元)" />
    	 <ec:column property="ctrid.clientid.id" calcTitle="clientid" title="乙方单位">
    	 	<ex:organDisplay id="${payPayApply.ctrid.clientid.id}"/>
    	 </ec:column>
    	 	<ec:column property="applycode" calcTitle="applycode" title="申请编号"/>
    	 	<ec:column property="applyyear" calcTitle="year" title="年度"/>
    	 	<ec:column property="applymonth" calcTitle="month" title="月份"/>
    	 <ec:column property="paytype" calcTitle="paytype" title="支付类型">
    	 	<ex:dictDisplayEl type="PayType" value="${payPayApply.paytype}"/>
    	 </ec:column> 
    	 <ec:column property="applysum" calcTitle="applysum" cell="currency" title="本期合同<br>申请金额(元)" />
    	 <ec:column property="applyaltersum" calcTitle="applyaltersum" cell="currency" title="本期新增工程<br>申请金额(元)" />
    	 <ec:column property="null" calcTitle="null" title="操作">
    	 	<input type="button" value="复核通过" class="button1" onclick="location.href='payPayApplyAction.do?method=review&id=${payPayApply.id}'" />
    	 </ec:column>
		</ec:row>
    </ec:table>
</c:if>

<c:if test="${payFundBatchs ne null}">
<ec:table items="payFundBatchs" var="payFundBatch" action="payFundBatchAction.do" title="待复核请款批次" showPagination="false" sortable="false">
  	 <ec:row>
	 <ec:column property="rowcount" cell="rowCount" sortable="false" title="序号" />
	 <ec:column property="fundbatch" calcTitle="fundbatch" styleClass="pay_name" title="请款批次"/>
	 <ec:column property="applydate" title="申请日期" format="yyyy-MM-dd" cell="date" />
	 <ec:column property="recordcorp" calcTitle="recordcorp" title="填报单位">
	 	<ex:organDisplay id="${payFundBatch.recordcorp}"/>
	 </ec:column>
	 <ec:column property="recorder" calcTitle="recorder" title="填报人">
	 	<ex:userName id="${payFundBatch.recorder}"/>
	 </ec:column>
	 <ec:column property="null" calcTitle="null" title="操作">
   	 	<input type="button" value="复核通过" class="button1" onclick="location.href='payFundBatchAction.do?method=review&id=${payFundBatch.id}'" />
   	 </ec:column>
</ec:row>
</ec:table>
</c:if>

<c:if test="${payFinances ne null}">
<ec:table items="payFinances" var="payFinance" action="payFinanceAction.do" title="待复核财政审核" showPagination="false" sortable="false">
  	 <ec:row>
	 <ec:column property="rowcount" cell="rowCount" sortable="false" title="序号" />
	 <ec:column property="payid.ctrid.ctrname" calcTitle="ctrname" title="合同名称"/>
	 <ec:column property="payid.ctrid.ctrsum" calcTitle="ctrsum" cell="currency" title="合同金额"/>
	 <ec:column property="payid.applysum" calcTitle="applysum" cell="currency" title="合同申请金额"/>
	 <ec:column property="batchid.fundbatch" calcTitle="fundbatch" title="请款批次"/>
	 <ec:column property="paysource" calcTitle="paysource" title="支付申请来源">
	 	<ex:dictDisplayEl type="PaySource" value="${payFinance.paysource}"/>
	 </ec:column>
	 <ec:column property="null" calcTitle="null" title="操作">
   	 	<input type="button" value="复核通过" class="button1" onclick="location.href='payFinanceAction.do?method=review&id=${payFinance.id}'" />
   	 </ec:column>
</ec:row>
</ec:table>
</c:if>

<c:if test="${payAccounts ne null}">
<ec:table items="payAccounts" var="payAccount" action="payAccountAction.do" title="待复核到账信息" showPagination="false" sortable="false">
  	 <ec:row>
	 <ec:column property="rowcount" cell="rowCount" sortable="false" title="序号" />
	 <ec:column property="payid.ctrid.ctrname" calcTitle="ctrname" title="合同名称"/>
	 <ec:column property="payid.ctrid.ctrsum" calcTitle="ctrsum" cell="currency" title="合同金额"/>
	 <ec:column property="payid.applysum" calcTitle="applysum" cell="currency" title="合同申请金额"/>
	 <ec:column property="batchid.fundbatch" calcTitle="fundbatch" title="请款批次"/>
	 <ec:column property="paysource" calcTitle="paysource" title="支付申请来源">
	 	<ex:dictDisplayEl type="PaySource" value="${payAccount.paysource}"/>
	 </ec:column>
	 <ec:column property="null" calcTitle="null" title="操作">
   	 	<input type="button" value="复核通过" class="button1" onclick="location.href='payAccountAction.do?method=review&id=${payAccount.id}'" />
   	 </ec:column>
</ec:row>
</ec:table>
</c:if>

<c:if test="${payFactPays ne null}">
<ec:table items="payFactPays" var="payFactPay" action="payFactPayAction.do" title="待复核财务支付" showPagination="false" sortable="false">
  	 <ec:row>
	 <ec:column property="rowcount" cell="rowCount" sortable="false" title="序号" />
	 <ec:column property="payid.ctrid.ctrname" calcTitle="ctrname" title="合同名称"/>
	 <ec:column property="payid.ctrid.ctrsum" calcTitle="ctrsum" cell="currency" title="合同金额"/>
	 <ec:column property="payid.applysum" calcTitle="applysum" cell="currency" title="合同申请金额"/>
	 <ec:column property="batchid.fundbatch" calcTitle="fundbatch" title="请款批次"/>
	 <ec:column property="paysource" calcTitle="paysource" title="支付申请来源">
	 	<ex:dictDisplayEl type="PaySource" value="${payFactPay.paysource}"/>
	 </ec:column>
	 <ec:column property="null" calcTitle="null" title="操作">
   	 	<input type="button" value="复核通过" class="button1" onclick="location.href='payFactPayAction.do?method=review&id=${payFactPay.id}'" />
   	 </ec:column>
</ec:row>
</ec:table>
</c:if>
<c:if test="${safePlans ne null}">
	<ec:table items="safePlans" var="safePlan" action="safePlanAction.do" title="待复核质量安全检查计划" showPagination="false" sortable="false">
	  	 <ec:row>
			  <ec:column property="prjid.prj_code" calcTitle="prjid.prj_code" title="项目编号"/>
	    	 <ec:column property="prjid.prj_name" calcTitle="prjid.prj_name" title="项目名称"/>
	    	 <ec:column property="year" calcTitle="year" title="年份"/>
	    	 <ec:column property="month" calcTitle="month" title="月份">
	    	 	<ex:dictDisplayEl value="${safePlan.month}" type="Month"/>	
	    	 </ec:column>
	    	 <ec:column property="recorder" calcTitle="recorder" title="计划填报人">
	    	 	<ex:userName id="${safePlan.recorder}" />
	    	 </ec:column>
	    	 <ec:column property="recorddate" calcTitle="recorddate" cell="date" format="yyyy-MM-dd" title="计划填报日期"/>
			 <ec:column property="null" calcTitle="null" title="操作">
		   	 	<input type="button" value="复核通过" class="button1" onclick="location.href='safePlanAction.do?method=review&id=${safePlan.id}'" />
		   	 </ec:column>
		</ec:row>
	</ec:table>
</c:if>
<c:if test="${safePlanreports ne null}">
	<ec:table items="safePlanreports" var="safePlanreport" action="safePlanreportAction.do" title="待复核质量安全检查报告" showPagination="false" sortable="false">
	  	 <ec:row>
			  <ec:column property="safeplanid.prjid.prj_code" calcTitle="safeplanid.prjid.prj_code" title="项目编号"/>
				    	 <ec:column property="safeplanid.prjid.prj_name" calcTitle="safeplanid.prjid.prj_name" title="项目名称"/>
				    	 <ec:column property="year" calcTitle="year" title="年份"/>
				    	 <ec:column property="month" calcTitle="month" title="月份">
				    	 	<ex:dictDisplayEl value="${safePlanreport.month}" type="Month"/>	
				    	 </ec:column>
				    	 <ec:column property="recorder" calcTitle="recorder" title="报告填报人">
				    	 	<ex:userName id="${safePlanreport.recorder}" />
				    	 </ec:column>
				    	 <ec:column property="recorddate" calcTitle="recorddate" cell="date" title="报告填报日期"/>
			 <ec:column property="null" calcTitle="null" title="操作">
		   	 	<input type="button" value="复核通过" class="button1" onclick="location.href='safePlanreportAction.do?method=review&id=${safePlanreport.id}'" />
		   	 </ec:column>
		</ec:row>
	</ec:table>
</c:if>
<c:if test="${prjHeadWays ne null}">
	<ec:table items="prjHeadWays" var="prjHeadWay" action="prjHeadWayAction.do" title="待复核项目进度基本信息" showPagination="false" sortable="false">
	  	 <ec:row>
			  <ec:column property="prjid.prj_name" calcTitle="prj_name" styleClass="progress_name" title="项目名称"/>
		    	 <ec:column property="prjid.prj_status" calcTitle="prj_status" title="项目状态" width="5%" >
		    	 	<ex:dictDisplayEl type="Projectstatus" value="${prjHeadWay.prjid.prj_status}"/>
		    	 </ec:column>
		    	 <ec:column property="prjid.prj_undertakedate" calcTitle="prj_undertakedate" title="承接时间" format="yyyy-MM-dd" cell="date"/>
		    	 <ec:column property="prjid.prj_planstartdate" calcTitle="prj_planstartdate" title="计划开工时间" format="yyyy-MM-dd" cell="date"/>
		    	 <ec:column property="prjid.prj_plancompletedate" calcTitle="prj_plancompletedate" title="计划完工时间" format="yyyy-MM-dd" cell="date"/>
		    	 <ec:column property="prjid.prj_factstartdate" calcTitle="prj_factstartdate" title="实际开工时间" format="yyyy-MM-dd" cell="date"/>
		    	 <ec:column property="prjid.prj_factcompletedate" calcTitle="prj_factcompletedate" title="实际完工时间" format="yyyy-MM-dd" cell="date"/>
		    	 <ec:column property="updatedate" calcTitle="updatedate" title="更新日期" format="yyyy-MM-dd" cell="date"/>
			 <ec:column property="null" calcTitle="null" title="操作">
		   	 	<input type="button" value="复核通过" class="button1" onclick="location.href='prjHeadWayAction.do?method=review&id=${prjHeadWay.id}'" />
		   	 </ec:column>
		</ec:row>
	</ec:table>
</c:if>
<c:if test="${schSchedulePrjs ne null}">
	<ec:table items="schSchedulePrjs" var="schSchedulePrj" action="schSchedulePrjAction.do" title="待复核项目进度计划" showPagination="false" sortable="false">
	  	 <ec:row>
			  <ec:column property="prjid.prj_code" calcTitle="prj_code" title="项目编号"/>
	    	 <ec:column property="prjid.prj_name" calcTitle="prj_name" styleClass="progress_name" title="项目名称"/>
	    	 <ec:column property="prjid.prj_status" calcTitle="prj_status" title="项目状态" width="5%" >
	    	 	<ex:dictDisplayEl type="Projectstatus" value="${schSchedulePrj.prjid.prj_status}"/>
	    	 </ec:column>
	    	 <ec:column property="year" calcTitle="year" title="年度"/>
	    	 <ec:column property="month" calcTitle="month" title="月份"/>
	    	 <ec:column property="planschedule" calcTitle="planschedule" styleClass="planschedule" title="本月计划进度"/>
	    	 <ec:column property="planrecorder" calcTitle="planrecorder" title="计划填报人">
	    	 	<ex:userName id="${schSchedulePrj.planrecorder}"/>
	    	 </ec:column>
	    	 <ec:column property="planrecorddate" title="计划填报日期" format="yyyy-MM-dd" cell="date" />
	    	 <ec:column property="planrecordcorp" calcTitle="planrecordcorp" title="计划填报单位">
	    	 	<ex:organDisplay id="${schSchedulePrj.planrecordcorp.id}"/>
	    	 </ec:column>
			 <ec:column property="null" calcTitle="null" title="操作">
		   	 	<input type="button" value="复核通过" class="button1" onclick="location.href='schSchedulePrjAction.do?method=review&id=${schSchedulePrj.id}'" />
		   	 </ec:column>
		</ec:row>
	</ec:table>
</c:if>
<c:if test="${schSchedulePrjComps ne null}">
	<ec:table items="schSchedulePrjComps" var="schSchedulePrj" action="schSchedulePrjCompleteAction.do" title="待复核项目进度计划完成" showPagination="false" sortable="false">
	  	 <ec:row>
			  <ec:column property="prjid.prj_code" calcTitle="prj_code" title="项目编号"/>
			    	 <ec:column property="prjid.prj_name" calcTitle="prj_name" styleClass="progress_name" title="项目名称"/>
			    	 <ec:column property="prjid.prj_status" calcTitle="prj_status" title="项目状态" width="5%" >
			    	 	<ex:dictDisplayEl type="Projectstatus" value="${schSchedulePrj.prjid.prj_status}"/>
			    	 </ec:column>
			    	 <ec:column property="year" calcTitle="year" title="年度"/>
			    	 <ec:column property="month" calcTitle="month" title="月份"/>
			    	 <ec:column property="planschedule" calcTitle="planschedule" styleClass="planschedule" title="本月计划进度"/>
			    	 <ec:column property="factschedule" calcTitle="factschedule" styleClass="factschedule" title="本月实际进度"/>
			    	 <ec:column property="completerecorder" calcTitle="completerecorder" title="完成填报人">
			    	 	<ex:userName id="${schSchedulePrj.completerecorder}"/>
			    	 </ec:column>
			    	 <ec:column property="completerecorddate" title="完成填报日期" format="yyyy-MM-dd" cell="date" />
			    	 <ec:column property="completerecordcorp" calcTitle="completerecordcorp" title="完成填报单位">
			    	 	<ex:organDisplay id="${schSchedulePrj.completerecordcorp.id}"/>
			    	 </ec:column>
			 <ec:column property="null" calcTitle="null" title="操作">
		   	 	<input type="button" value="复核通过" class="button1" onclick="location.href='schSchedulePrjCompleteAction.do?method=review&id=${schSchedulePrj.id}'" />
		   	 </ec:column>
		</ec:row>
	</ec:table>
</c:if>
<c:if test="${cntHeadWays ne null}">
	<ec:table items="cntHeadWays" var="cntHeadWay" action="cntHeadWayAction.do" title="待复核施工进度基本信息" showPagination="false" sortable="false">
	  	 <ec:row>
			 	 <ec:column property="ctrid.prjid.prj_name" calcTitle="prj_name" styleClass="progress_name" title="项目名称" width="15%"/>
		    	 <ec:column property="ctrid.ctrname" calcTitle="prj_name" styleClass="progress_name" title="合同名称" width="15%"/>
		    	 <ec:column property="ctrid.clientid.name" calcTitle="clientid" alias="clientid" title="施工单位" width="10%"/>
		    	 <ec:column property="ctrid.begindate" calcTitle="begindate" title="计划开始时间" format="yyyy-MM-dd" cell="date" width="10%"/>
		    	 <ec:column property="ctrid.enddate" calcTitle="enddate" title="计划结束时间" format="yyyy-MM-dd" cell="date" width="10%"/>
		    	 <ec:column property="ctrid.factbegindate" calcTitle="factbegindate" title="实际开始时间" width="10%">
		    	 	<div id="factbegindateDiv"><fmt:formatDate value="${cntHeadWay.ctrid.factbegindate}" pattern="yyyy-MM-dd"/></div>
		    	 </ec:column>
		    	 <ec:column property="ctrid.factenddate" calcTitle="factenddate" title="实际结束时间" width="10%">
		    	 	<div id="factenddateDiv"><fmt:formatDate value="${cntHeadWay.ctrid.factenddate}" pattern="yyyy-MM-dd"/></div>
		    	 </ec:column>
<%--		    	 <ec:column property="subtime" calcTitle="subtime" title="合同工期(天)" width="5%">--%>
<%--		    	 	<div id="subTimeDiv"></div>--%>
<%--		    	 </ec:column>--%>
		    	 <ec:column property="recorddate" calcTitle="recorddate" title="更新日期" format="yyyy-MM-dd" cell="date" width="10%"/>
			 <ec:column property="null" calcTitle="null" title="操作">
		   	 	<input type="button" value="复核通过" class="button1" onclick="location.href='cntHeadWayAction.do?method=review&id=${cntHeadWay.id}'" />
		   	 </ec:column>
		</ec:row>
	</ec:table>
</c:if>

<c:if test="${schVisualCellTracks ne null}">
	<ec:table items="schVisualCellTracks" var="schVisualCellTrack" action="schVisualCellTrackAction.do" title="待复核形象单元跟踪" showPagination="false" sortable="false">
	  	 <ec:row>
			<ec:column property="visprjid.prjid.prj_code" calcTitle="prj_code" title="项目编号"/>
		    <ec:column property="visprjid.prjid.prj_name" calcTitle="prj_name" styleClass="schvisual_name" title="项目名称"/>
	    	 <ec:column property="visprjid.prjid.prj_status" calcTitle="prj_status" title="项目状态">
	    	 	<ex:dictDisplayEl type="Projectstatus" value="${schVisualCellTrack.visprjid.prjid.prj_status}"/>
	    	 </ec:column>
		    	<ec:column property="recorder" calcTitle="recorder" title="填报人">
		    	 	<ex:userName id="${schVisualCellTrack.recorder}"/>
		    	</ec:column>
		    	<ec:column property="recorddate" title="填报日期" format="yyyy-MM-dd" cell="date" />
		    	<ec:column property="recordcorp" calcTitle="recordcorp" title="填报单位">
		    	 	<ex:organDisplay id="${schVisualCellTrack.recordcorp.id}"/>
		    	</ec:column>
		    	<ec:column property="upenddate" title="上报截止日期" format="yyyy-MM-dd" cell="date" />
			 <ec:column property="null" calcTitle="null" title="操作">
		   	 	<input type="button" value="复核通过" class="button1" onclick="location.href='schVisualCellTrackAction.do?method=review&id=${schVisualCellTrack.id}'" />
		   	 </ec:column>
		</ec:row>
	</ec:table>
</c:if>

<c:if test="${compCompleteChecks ne null}">
	<ec:table items="compCompleteChecks" var="compCompleteCheck" action="compCompleteCheckAction.do" title="待复核工程竣工验收" showPagination="false" sortable="false">
	  	 <ec:row>
			 <ec:column property="applyid.checkcode" calcTitle="applyid.checkcode" title="验收编号"/>
	    	 <ec:column property="applyid.ctrid.prjid.prj_code" calcTitle="applyid.ctrid.prjid.prj_code" title="项目编号"/>
	    	 <ec:column property="applyid.ctrid.prjid.prj_name" calcTitle="applyid.ctrid.prjid.prj_name" title="项目名称"/>
	    	 <ec:column property="applyid.ctrid.ctrcode" calcTitle="applyid.ctrid.ctrcode" title="合同编号"/>
	    	 <ec:column property="applyid.ctrid.ctrname" calcTitle="applyid.ctrid.ctrname" title="合同名称"/>
	    	 <ec:column property="applyid.iflocale" calcTitle="applyid.iflocale" title="现场验收">
	    	 	<ex:dictDisplayEl value="${compCompleteCheck.applyid.iflocale}" type="Yesorno"/>
	    	 </ec:column>
	    	 <ec:column property="checkdate" calcTitle="checkdate" cell="date" title="验收日期"/>
	    	 <ec:column property="enddate" calcTitle="enddate" cell="date" title="合同保修期"/>
	    	 <ec:column property="reportannex" calcTitle="reportannex" title="竣工验收报告">
	    	 	<c:if test="${compCompleteCheck.reportannex ne null}">
		    	 	<a href="${ctx}/compCompleteCheckAction.do?method=downloadSingle&id=${compCompleteCheck.id }">已发布</a>
	    	 	</c:if>
	    	 	<c:if test="${compCompleteCheck.reportannex eq null}">
	    	 		未发布
	    	 	</c:if>
	    	 </ec:column>
	    	  <ec:column property="recorder" calcTitle="recorder" title="录入人">
	    	 	<ex:userName id="${compCompleteCheck.recorder}" />
	    	 </ec:column>
	    	 <ec:column property="recorddate" calcTitle="recorddate" cell="date" title="录入日期"/>
			 <ec:column property="null" calcTitle="null" title="操作">
		   	 	<input type="button" value="复核通过" class="button1" onclick="location.href='compCompleteCheckAction.do?method=review&id=${compCompleteCheck.id}'" />
		   	 </ec:column>
		</ec:row>
	</ec:table>
</c:if>

<c:if test="${compHandovers ne null}">
	<ec:table items="compHandovers" var="compHandover" action="compHandoverAction.do" title="待复核工程移交" showPagination="false" sortable="false">
	  	 <ec:row>
			 <ec:column property="prjid.prj_code" calcTitle="prjid.prj_code" title="项目编号"/>
	    	 <ec:column property="prjid.prj_name" calcTitle="prjid.prj_name" title="项目名称"/>
	    	 <ec:column property="handoverdate" cell="date" calcTitle="handoverdate" title="移交日期"/>
	    	 <ec:column property="handoverperson" calcTitle="handoverperson" title="移交经办人"/>
	    	 <ec:column property="inceptcorp" calcTitle="inceptcorp" title="接收单位"/>
	    	 <ec:column property="inceptperson" calcTitle="inceptperson" title="接收经办人"/>
	    	 <ec:column property="begindate" calcTitle="begindate" cell="date" title="保修期起止"/>
	    	 <ec:column property="sumupdate" calcTitle="sumupdate" cell="date" title="总结日期"/>
			 <ec:column property="null" calcTitle="null" title="操作">
		   	 	<input type="button" value="复核通过" class="button1" onclick="location.href='compHandoverAction.do?method=review&id=${compHandover.id}'" />
		   	 </ec:column>
		</ec:row>
	</ec:table>
</c:if>

<c:if test="${compServices ne null}">
	<ec:table items="compServices" var="compService" action="compServiceAction.do" title="待复核保修管理" showPagination="false" sortable="false">
	  	 <ec:row>
			<ec:column property="prjid.prj_code" calcTitle="prjid.prj_code" title="项目编号"/>
	    	 <ec:column property="prjid.prj_name" calcTitle="prjid.prj_name" title="项目名称"/>
	    	 <ec:column property="prjid.prj_factcompletedate" cell="date" calcTitle="prjid.prj_factcompletedate" title="移交日期"/>
	    	 <ec:column property="servicedate" calcTitle="servicedate" cell="date" title="维修日期"/>
	    	 <ec:column property="ifterm" calcTitle="ifterm" title="是否保修期内">
	    	 	<ex:dictDisplayEl value="${compService.ifterm}" type="Yesorno"/>
	    	 </ec:column>
	    	 <ec:column property="servicesum" calcTitle="servicesum" title="维修费用"/>
	    	 <ec:column property="principal" calcTitle="principal" title="经办人"/>
			 <ec:column property="null" calcTitle="null" title="操作">
		   	 	<input type="button" value="复核通过" class="button1" onclick="location.href='compServiceAction.do?method=review&id=${compService.id}'" />
		   	 </ec:column>
		</ec:row>
	</ec:table>
</c:if>

<c:if test="${compBehindprjEvaluates ne null}">
	<ec:table items="compBehindprjEvaluates" var="compBehindprjEvaluate" action="compBehindprjEvaluateAction.do" title="待复核项目后评价" showPagination="false" sortable="false">
	  	 <ec:row>
			 <ec:column property="prjid.prj_code" calcTitle="prjid.prj_code" title="项目编号"/>
	    	 <ec:column property="prjid.prj_name" calcTitle="prjid.prj_name" title="项目名称"/>
	    	 <ec:column property="weavecorp" calcTitle="weavecorp" title="编制单位"/>
	    	 <ec:column property="entrustdate" calcTitle="entrustdate" cell="date" title="委托日期"/>
	    	 <ec:column property="completedate" calcTitle="completedate" cell="date" title="完成日期"/>
	    	 <ec:column property="evaluatedate" calcTitle="evaluatedate" cell="date" title="评审日期"/>
	    	 <ec:column property="evaluateresult" calcTitle="evaluateresult" title="评审结果">
	    	 	<ex:dictDisplayEl value="${compBehindprjEvaluate.evaluateresult}" type="EvaluateResult"/>	
	    	 </ec:column>
			 <ec:column property="null" calcTitle="null" title="操作">
		   	 	<input type="button" value="复核通过" class="button1" onclick="location.href='compBehindprjEvaluateAction.do?method=review&id=${compBehindprjEvaluate.id}'" />
		   	 </ec:column>
		</ec:row>
	</ec:table>
</c:if>



<ec:table showPagination="false" sortable="false" items="oswfentrys" var="oswfentry" tableId="baseinfoList"
		action="${ctx}/corpTypeAction.do">
	<ec:row>
		<ec:column property="showname" title="工作流名称" />
		<ec:column property="null" title="操作" width="30%" sortable="false">
			<input type="button" class="button1" onclick="location.href='${oswfentry.url}&wfentryid=${oswfentry.id}';" value="查看待审核"/>
		</ec:column>
	</ec:row>
</ec:table>
</body>
</html:html>
