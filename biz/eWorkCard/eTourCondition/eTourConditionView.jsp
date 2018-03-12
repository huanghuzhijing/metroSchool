<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
<html:html>
<head>
<script type="text/javascript">
	$(document).ready(function(){
	  $("#btn_back").click(function(){ 
				var url='eTourConditionAction.do?method=findList&qifFinishStatus=${param.qifFinishStatus}&qpatralRecordStatus=${param.qpatralRecordStatus}&qtourEngineer=${param.qtourEngineer}&ec_p=${param.ec_p}&ec_id=${eTourCondition.id}&ec_crd=${param.ec_crd}&qendDate=${param.qendDate}&qstartDate=${param.qstartDate}&qsectionId=${param.qsectionId}&qlineId=${param.qlineId}';   
	    		document.forms[0].action=url;
				document.forms[0].submit();
			}); 
	});
		
</script>
</head>
<content tag="heading">
		工程巡查情况查询
</content>
<body>
	<html:form action="ePatrolRecordExcavationAction.do" styleClass="form" method="POST" styleId="eTourConditionForm">
<input type="hidden" name="method" value="save">
<html:hidden property="conditionIdTemp" value="${condition.id}"/>
<html:hidden property="id" />
<html:hidden property="qifFinishStatus" value="${param.qifFinishStatus}"/>
<html:hidden property="qpatralRecordStatus" value="${param.qpatralRecordStatus}"/>
<html:hidden property="qtourEngineer" value="${param.qtourEngineer}" />
<html:hidden property="qifFinishStatus" />
<html:hidden property="qpatralRecordStatus" />
<html:hidden property="qtourEngineer" />
</html:form>
	<fieldset>
			<legend>	工程巡查情况详细信息</legend>
			<table class="titleTable" >
		         <COLGROUP>
						<COL class="tdLeftTwo" />
						<COL class="tdRightTwo" />
						<COL class="tdLeftTwo" />
						<COL class="tdRightTwo" />
					</COLGROUP>
					<tr>
						<td>
							线路：<span class="noRedSpan">*</span>
						</td>
						<td >
							${eTourCondition.lineId.line_name}&nbsp;
						</td>
						<td>
							工点：<span class="noRedSpan">*</span>
						</td>
						<td >
							${eTourCondition.stationId.station_name}&nbsp;
						</td>
					</tr>
					<tr>
						<td>
							巡视时间：<span class="noRedSpan">*</span>
						</td>
						<td>
						<fmt:formatDate value="${eTourCondition.tourDate}" pattern="yyyy-MM-dd"/>&nbsp;
						</td>
						<td>
							巡视工程师：<span class="noRedSpan">*</span>
						</td>
						<td>
							${eTourCondition.tourEngineer}&nbsp;
						</td>
					</tr>
					<tr>
					  <td>
						计划填报时间：<span class="noRedSpan">*</span>
						</td>
						<td>
							${eTourCondition.planRegisterDate}&nbsp;
						</td>
						<td>
							完成填报时间：<span class="noRedSpan">*</span>
						</td>
						<td>
							${eTourCondition.finishRegisterDate}&nbsp;
						</td>
						
					</tr>
					
				<tr>
						<td>
							工点重点关注风险：<span class="noRedSpan">*</span>
						</td>
						<td >
							${eTourCondition.emphasisRisk}&nbsp;
						</td>
						</tr>
					<tr>
						<td>
							备注（计划）：<span class="noRedSpan">*</span>
						</td>
						<td>
							${eTourCondition.planRemark}&nbsp;
						</td>
					</tr>
					<tr>
						<td>
							是否完成巡视：<span class="noRedSpan">*</span>
						</td>
						<td >
							<ex:dicDisplay dictIdentify="Yesorno"  dictValue="${eTourCondition.ifFinish}"/>
						</td>
						
					</tr>
					
					<tr>
						<td>
							备注（完成）：<span class="noRedSpan">*</span>
						</td>
						<td>
							${eTourCondition.finishRemark}&nbsp;
						</td>
					</tr>
		          
			</table>
	</fieldset>
<c:if test="${eTourCondition.patrolType!=null}">	
<c:if test="${flagPage == 1}"><c:set value="true" var="tabstate1"></c:set></c:if>
<c:if test="${flagPage == 2}"><c:set value="true" var="tabstate2"></c:set></c:if>
<c:if test="${flagPage == 3}"><c:set value="true" var="tabstate3"></c:set></c:if>
<c:if test="${flagPage == 4}"><c:set value="true" var="tabstate4"></c:set></c:if>
<c:if test="${flagPage == 5}"><c:set value="true" var="tabstate5"></c:set></c:if>

    <ex:tab id="dockjTab" width="100%">
    <c:if test="${ePatrolRecordOpenCut!=null}">
		<ex:tabItem name="lab1"  url="${ctx}/eTourConditionAction.do?method=view&flagPage=1&qifFinishStatus=${param.qifFinishStatus}&qpatralRecordStatus=${param.qpatralRecordStatus}&qtourEngineer=${param.qtourEngineer}&ec_p=${param.ec_p}&ec_id=${param.id}&ec_crd=${param.ec_crd}&id=${param.id}&qstartDate=${param.qstartDate}&qendDate=${param.qendDate}&qsectionId=${param.qsectionId}&qlineId=${param.qlineId}" selected="${tabstate1}" label="明挖基坑施工" >
			<c:if test="${flagPage == '1'}">
				<%@include file="/biz/eWorkCard/ePatrolRecordOpenCut/ePatrolRecordOpenCutView.jsp"%>
			</c:if>
	    </ex:tabItem>
	    </c:if>
	    
	    <c:if test="${ePatrolRecordCoverCut!=null}">
		    <ex:tabItem name="lab2"  url="${ctx}/eTourConditionAction.do?method=view&flagPage=2&qifFinishStatus=${param.qifFinishStatus}&qpatralRecordStatus=${param.qpatralRecordStatus}&qtourEngineer=${param.qtourEngineer}&ec_p=${param.ec_p}&ec_id=${param.id}&ec_crd=${param.ec_crd}&id=${param.id}&qstartDate=${param.qstartDate}&qendDate=${param.qendDate}&qsectionId=${param.qsectionId}&qlineId=${param.qlineId}" selected="${tabstate2}" label="盖挖基坑施工">
		    	<c:if test="${flagPage == '2'}">
		    	<%@include file="/biz/eWorkCard/ePatrolRecordCoverCut/ePatrolRecordCoverCutView.jsp"%>
				</c:if>
		    </ex:tabItem>
	   </c:if>
	   
		      <c:if test="${ePatrolRecordSTM!=null}">
		      <ex:tabItem name="lab3"  url="${ctx}/eTourConditionAction.do?method=view&flagPage=3&qifFinishStatus=${param.qifFinishStatus}&qpatralRecordStatus=${param.qpatralRecordStatus}&qtourEngineer=${param.qtourEngineer}&ec_p=${param.ec_p}&ec_id=${param.id}&ec_crd=${param.ec_crd}&id=${param.id}&qstartDate=${param.qstartDate}&qendDate=${param.qendDate}&qsectionId=${param.qsectionId}&qlineId=${param.qlineId}" selected="${tabstate3}" label="盾构隧道施工">
		    	<c:if test="${flagPage == '3'}">
		    	<%@include file="/biz/eWorkCard/ePatrolRecordSTM/ePatrolRecordSTMView.jsp"%>
				</c:if>
		    </ex:tabItem>
	   </c:if>
	     
		      <c:if test="${ePatrolRecordExcavation!=null}">
		      <ex:tabItem name="lab4"  url="${ctx}/eTourConditionAction.do?method=view&flagPage=4&qifFinishStatus=${param.qifFinishStatus}&qpatralRecordStatus=${param.qpatralRecordStatus}&qtourEngineer=${param.qtourEngineer}&ec_p=${param.ec_p}&ec_id=${param.id}&ec_crd=${param.ec_crd}&id=${param.id}&qstartDate=${param.qstartDate}&qendDate=${param.qendDate}&qsectionId=${param.qsectionId}&qlineId=${param.qlineId}" selected="${tabstate4}" label="暗挖施工">
		    	<c:if test="${flagPage == '4'}">
		    	<%@include file="/biz/eWorkCard/ePatrolRecordExcavation/ePatrolRecordExcavationView.jsp"%>
				</c:if>
		    </ex:tabItem>
	    </c:if>
	     
		      <c:if test="${ePatrolRecordBrace!=null}">
		      <ex:tabItem name="lab5"  url="${ctx}/eTourConditionAction.do?method=view&flagPage=5&qifFinishStatus=${param.qifFinishStatus}&qpatralRecordStatus=${param.qpatralRecordStatus}&qtourEngineer=${param.qtourEngineer}&ec_p=${param.ec_p}&ec_id=${param.id}&ec_crd=${param.ec_crd}&id=${param.id}&qstartDate=${param.qstartDate}&qendDate=${param.qendDate}&qsectionId=${param.qsectionId}&qlineId=${param.qlineId}" selected="${tabstate5}" label="高架施工">
		    	<c:if test="${flagPage == '5'}">
		    	<%@include file="/biz/eWorkCard/ePatrolRecordBrace/ePatrolRecordBraceView.jsp"%>
				</c:if>
		    </ex:tabItem>
	   </c:if>
	     
    </ex:tab>
    </c:if>
	
	
	<div class="saveDiv">
		<input type="button" id="btn_back" value="<fmt:message key="button.back"/>" icon="icon_back" />
    </div>
</body>
</html:html>
