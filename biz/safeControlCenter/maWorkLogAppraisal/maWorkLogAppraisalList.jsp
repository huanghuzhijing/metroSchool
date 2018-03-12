<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>
<ex:bundle/>
<html:html>
<head>

<content tag="heading">工作日志评价</content>
<style type="text/css">
.table_borwse{
 margin-left:8px;
 margin-right:5px;
<%-- margin:1%;--%>
 width:98%;
 border:1px;
 border-collapse:collapse;border-spacing:0;
}

.table_borwse tr{
 /*background-color:#fff;*/
 text-align:center;
 }
 
  .table_borwse th{
 border:1px solid #BED0E2;
 color:#1F4A65;
 background-color:#F6FEEB;
 background-image:url(${ctx}/images/titlebg.gif);
 height:23px;
 }
 
.table_borwse tr:hover{
 background-color:#EAFCD5;
 }
 .table_borwse td{
 border:1px solid #BED0E2;
 }

</style>
<script src="<c:url value="/scripts/public.js"/>" type="text/javascript"></script>
<link rel="StyleSheet" href="${ctx}/scripts/warnColor.css" type="text/css" />
<script  type="text/javascript" language=javascript>

//查询模块 人员选择----单选
function selectEmployee(){
			var url ="${ctx}/employeeAction.do?method=selectEmpNoteOGCOrgan&single=t";
		 	art.dialog({id:'commonDialog1',title:'选择人员', iframe:url, width:'800', height:'450',top:'10'});
}

function setParamValue(empIds,empNames){
		$("[name='emp_id']").val(empIds);
		$("[name='emp_name']").val(formatStringComma(empNames));
	}	

function clareEmployee(){
	jQuery("[name='emp_id']").val("") ;
	jQuery("[name='emp_name']").val("") ;
}

function windowClose(rowIndex,appraisal_id){
	this.sSuc("b1");
	var url = "${ctx}/maWorkLogAppraisalAction.do?method=findAppraisalCount";
	var myajax = new Ajax.Request(url, {method:"post", parameters:"appraisal_id="+appraisal_id+"&rowIndex="+rowIndex, onComplete:showAppraisalCount});//实现ajax请求
}



function showAppraisalCount(selResponse){
	var text = selResponse.responseText;
	if(text != ""){
		var textStr = text.split(",");
		jQuery("#btn"+textStr[1]).val("评价("+textStr[0]+")") ;
	}
}

function viewSiteWorkInfo(appraisal_id,pojo_type){
	var url ="${ctx}/maWorkLogAppraisalAction.do?method=viewSiteWorkInfo&appraisal_id="+appraisal_id+"&pojo_type="+pojo_type+"&random="+Math.random();
	art.dialog({id:'dialog1',title:'信息', iframe:url, width:'800', height:'400',top:'100'});
}

function stationAnalyse(station_id){
	var url ="${ctx}/maWorkLogAppraisalAction.do?method=viewAnalysisReport&station_id="+station_id+"&random="+Math.random();
	art.dialog({id:'dialog1',title:'信息', iframe:url, width:'800', height:'450',top:'100'});

}

function appraisalWork(appraisal_id,rowIndex){
	var url ="${ctx}/maWorkLogAppraisalAction.do?method=appraisalWorkList&appraisal_id="+appraisal_id+"&rowIndex="+rowIndex+"&random="+Math.random();
	art.dialog({id:'dialog1',title:'信息', iframe:url, width:'900', height:'450',top:'100'});
}



</script>
</head>
 <body >
  <fieldset>
  <legend><strong><fmt:message key="dtaq.common.query_field"/></strong></legend>
  <html:form action="/maWorkLogAppraisalAction.do">
	  <table class="searchTable" width="100%" cellpadding="2" cellspacing="4" border="0">
		  <tr>
			  <td width="60px">填报日期</td>
			  <td>
			  <input type="text"  name="start_date"  class="inputText" value="${start_date}"  onfocus="WdatePicker()" />--<input type="text"  name="end_date"  class="inputText" value="${end_date}" onfocus="WdatePicker()" />
				  
			  </td>
			   <td width="60px">填报人</td>
			  <td>
			  	<input  name="emp_name" value="${emp_name }" type="text" readonly="readonly" id="plug_organ_empName" />
				<input name="emp_id"  type="hidden" value="${emp_id }" id="plug_organ_empId" />
				<input onclick="selectEmployee()" type="button" class="button1" value="选择" icon="icon_selectInfo">
<!--<%@ include file="/biz/sysmanager/sysmaintain/sysPlug/selectEmpNoteOrganGroupCorp/selectEmpNoteOrganGroupCorp.jsp" %>-->
				<input onclick="clareEmployee()" type="button" class="button1" value="清空" icon="icon_delete">
			  </td>
			  <td>
				 <input type="submit" value="查询" class="button1" icon="icon_query"/>
			  </td>
		  </tr>
	  </table>
  </html:form>
</fieldset>
<fieldset>
  <legend><strong><fmt:message key="dtaq.common.list_field"/></strong></legend>
  
  <c:set value="1" var="rowIndex" />
   <table class="table_borwse" id="tableObj" width="100%" align="center" border="0" cellpadding="0" cellspacing="1">
		<thead align="center">
			<tr height="25">
				<th width="8%">填报日期</th>
				<th width="8%">填报人</th>
				<th width="40%">工点工作</th>
				<th width="20%">一般工作</th>
				<th width="16%">填报工点</th>
				<th width="8%">评价</th>
			</tr>
		</thead>
		<c:forEach items="${maWorkLogAppraisals}" var="LogAppraisal">
			<tr align="center" height="20">
				<td><fmt:formatDate pattern="yyyy-MM-dd" value="${LogAppraisal.report_date}"/></td>
				<td><ex:employeeName id="${LogAppraisal.report_emp}"/></td>
				<td>
					<a href="javascript:viewSiteWorkInfo('${LogAppraisal.appraisal_id}','MaSiteWorkLog')">${LogAppraisal.work_names}</a>
				</td>
				<td>
					<a href="javascript:viewSiteWorkInfo('${LogAppraisal.appraisal_id}','MaGeneralWorkLog')">${LogAppraisal.general_names}</a>
				</td>
				<td>
					<c:if test="${LogAppraisal.stations != null}">
						<c:forEach items="${LogAppraisal.stations}" var="station">
							<a href="javascript:stationAnalyse('${station.station_id}')">${station.station_name}</a>&nbsp;&nbsp;
						</c:forEach>
					</c:if>
				</td>
				<td>
					<input type="button" id="btn_${rowIndex}" class="button1" value="评价(${LogAppraisal.history_count})" onclick="appraisalWork('${LogAppraisal.appraisal_id}','${rowIndex}')" icon="icon_edit">
				</td>
			</tr>
			 <c:set value="${rowIndex+1}" var="rowIndex" />
		</c:forEach>
	</table>
</fieldset>
</body>
</html:html>