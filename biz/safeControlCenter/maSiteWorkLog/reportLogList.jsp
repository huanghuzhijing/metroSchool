<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>
<ex:bundle/>
<html:html>
<head>

<script src="<c:url value="/scripts/public.js"/>" type="text/javascript"></script>

<style>
.body_borwse{margin:0; padding:0;  }


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

th,td{
text-align:left;
}
th{
cursor:pointer;}
.content{
display:none;
border:#ABE3FC solid 1px;
margin:3px;
}
.follow{
margin:3px;
border:#ABE3FC solid 1px;
}
textarea{
margin:1px;
width:98%;
height:50px;}
.followHistory{
display:none;
margin:3px;
border:#ABE3FC solid 1px;
}
</style>
<script type="text/javascript">
jQuery(function(){
//	alert('${log_type}');
	jQuery("th").toggle(
		function(){
			jQuery(this).parent().next("tr").find(".content").show(200);
		},
		function(){
			jQuery(this).parent().next("tr").find(".content").hide(200);
		}
	);
});

function validateStations(){
$.ajax({			    
			     url:"maSiteWorkLogAction.do?method=validateStations&empid="+jQuery("[name='empid']").val(),
			    type:'get',
			    dataType:'text',
			    success:function(data){
			
			     if(data==0){
			      alert("没有您管理的工点，不能添加关注点!");
			       
			     }
			    if(data==1){
			   createSiteWork() ;
			     }
			    }
			   });
			   }

function createSiteWork(){
	location.href="${ctx}/maSiteWorkLogAction.do?method=createSiteWork&report_date="+jQuery("[name='report_date']").val();
}

function queryList(){
	location.href="${ctx}/maSiteWorkLogAction.do?method=list&report_date="+jQuery("[name='report_date']").val()+"&radom="+Math.random();
}

function saveLogs(typeValue){
	$("#log_type_id").val(typeValue);
	if(typeValue == "1"){
		if(confirm("确定保存后，已填报的日志信息将不能修改，是否确定保存?")){
			return true;
		}else{
			return false;
		}
	}
	return true;
}

function displayDate(){
    try{
    	window.setTimeout("delayChange()",1);
    }
    catch(e){
    	alert(e);
    }
}

function delayChange(){
	var report_date = jQuery("[name='report_date']").val();
	var nowDate = jQuery("[name='nowDate']").val();
	var log_type = jQuery("[name='logsaveType']").val();
	if(report_date > nowDate){
		alert("填报日期不能晚于当前日期！");
		jQuery("[name='report_date']").val(nowDate) ;
		return;
	}
	if(report_date == nowDate){
		if(log_type == "" || log_type == "0"){
			jQuery("#queryDiv").show();
		}else{
			jQuery("#queryDiv").hide();
		}
	}else{
		jQuery("#queryDiv").hide();
	}
}

function initRadios(){
	delayChange();
	var work_status = document.getElementsByName("work_status");
	for(var i=0; i<work_status.length; i++){
		if(document.all("work_status_"+i)[0].value == work_status[i].value){
			document.all("work_status_"+i)[0].checked = true;
		}else{
			document.all("work_status_"+i)[1].checked = true;
		}
	}
	var general_status = document.getElementsByName("general_status");
	for(var j=0; j<general_status.length; j++){
		if(document.all("general_status_"+j)[0].value == general_status[j].value){
			document.all("general_status_"+j)[0].checked = true;
		}else{
			document.all("general_status_"+j)[1].checked = true;
		}
	}
}
</script>
</head>
<content tag="heading">工作日志填报</content>
<body class="body_borwse" onload="initRadios()">

<ex:tab id="info">
<ex:tabItem name="maSiteWorkLogItem" label="日志填报列表" selected="true">
		<html:form action="maSiteWorkLogAction.do">
		<html:hidden property="method" value="save"/>
<%--		<html:hidden property="log_type"/>--%>
<input type="hidden" name="log_type" id="log_type_id"/>
		<html:hidden property="nowDate" value="${nowDate}"/>
		<html:hidden property="logsaveType" value="${log_type}"/>
		<table class="searchTable" width="100%" cellpadding="2" cellspacing="2" border="0">
			<tr align="center">
				<td align="left" width="40%">
					填报日期&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="text"  name="report_date"  class="inputText" value="${report_date}"  onfocus="WdatePicker()"  onchange="displayDate()"/>
					&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="submit" value="查询" icon="icon_query" onclick="queryList()" />
					&nbsp;&nbsp;
				</td>
				<td align="right" width="50%" style="margin-right: 5px">
				<input id="btn_add" value="新增关注点" type="button" icon="icon_add" onclick="validateStations()" />
					
					<div id="queryDiv" align="right" >
						<c:if test="${log_type == null || log_type == '0'}">
							<html:submit value="保存草稿" property="btnDraft" styleClass="button1" onclick="return saveLogs('0')"   />&nbsp;&nbsp;
							<html:submit value="确定保存" property="btnSubmit" styleClass="button1" onclick="return saveLogs('1')"  />&nbsp;&nbsp;
						</c:if>
					</div>
				</td>
			</tr>
		</table>
		<c:if test="${log_type != null && log_type == '0'}">
				<div align="center" style="width:100%"><font color="orange" size="2"><strong>提示：以下填报信息为草稿信息，还未正式保存！</strong></font></div>
		</c:if>
		<c:if test="${isHistoryData == null}">
			<table class="table_borwse">
			<thead>
		  	</thead>
	        <tbody>
	        	<c:set value="0" var="index" />
	        	<c:forEach items="${mySiteWorks}" var="maSiteWork">
	        	<tr>
	         		 <th>
	          		 <html:hidden property="work_id" value="${maSiteWork.work_id}"/>
	          		 <html:hidden property="work_log_id" value="${maSiteWork.log_id}"/>
	          		 <html:hidden property="work_status" value="${maSiteWork.continue_status}"/>
	          		 【<ex:dicDisplay dictIdentify="TaskWorkRank" dictValue="${maSiteWork.work_rank}"/>】【${maSiteWork.station.station_name}】${maSiteWork.work_name}
	         		 </th>
	        		 </tr>
	        		 <tr>
	            		<td>
	                		<div class="content">
	                			${maSiteWork.work_memo}<br/>
	                			创建人：<ex:employeeName id="${maSiteWork.creater}"/>&nbsp;&nbsp;
	                			创建时间：<fmt:formatDate value="${maSiteWork.creat_date}" pattern="yyyy-MM-dd HH:mm:ss"/>
	                		</div>
	                		<div class="follow">
		                		<html:textarea property="work_log_content" value="${maSiteWork.log_content}" />
	                			<br/>
	                			<html:radio property="work_status_${index}" value="0">进行中</html:radio>
	                			<html:radio property="work_status_${index}" value="1">处理完成</html:radio>
	                  </div>
	                 </td>
	             </tr>
	             <c:set value="${index+1}" var="index" />
	        	</c:forEach>
	        	<c:set value="0" var="temp" />
	        	<c:forEach items="${mygeneralWorks}" var="maGeneralWork">
	        		<tr>
	        			<th>
	        				<html:hidden property="general_id" value="${maGeneralWork.general_id}"/>
	         		 		<html:hidden property="general_log_id" value="${maGeneralWork.log_id}"/>
	         		 		<html:hidden property="general_status" value="${maGeneralWork.continue_status}"/>
	        				【<ex:dicDisplay dictIdentify="TaskWorkRank" dictValue="${maGeneralWork.general_rank}"/>】【${maGeneralWork.general_type=='1'?'文档汇编':'需求报告'}】${maGeneralWork.general_name}
	        			</th>
	        		</tr>
	        		 <tr>
	            		<td>
	                		<div class="content">
	                			${maGeneralWork.general_memo}<br/>
	                			创建人：<ex:employeeName id="${maGeneralWork.creater}"/>&nbsp;&nbsp;
	                			创建时间：<fmt:formatDate value="${maGeneralWork.creat_date}" pattern="yyyy-MM-dd HH:mm:ss"/>
	                		</div>
	                		<div class="follow">
		                		<html:textarea property="general_log_content" value="${maGeneralWork.log_content}" />
	                			<br/>
	                			<html:radio property="general_status_${temp}" value="0">进行中</html:radio>
	                			<html:radio property="general_status_${temp}" value="1">处理完成</html:radio>
	                  		</div>
	                 </td>
	             </tr>
	             <c:set value="${temp+1}" var="temp" />
	        	</c:forEach>
	        </tbody>
	    </table>
		</c:if>
		<c:if test="${isHistoryData != null}">
			<table class="table_borwse">
				<c:forEach items="${maSiteWorkLogList}" var="maSiteWorkLog">
			     	<tr>
			      		 <th>
			       		 【<ex:dicDisplay dictIdentify="TaskWorkRank" dictValue="${maSiteWorkLog.maSiteWork.work_rank}"/>】【${maSiteWorkLog.maSiteWork.station.station_name}】${maSiteWorkLog.maSiteWork.work_name}
			      		 </th>
			     		 </tr>
			     		 <tr>
			         		<td>
			             		<div class="content">
			             			${maSiteWorkLog.maSiteWork.work_memo}<br/>
			             			创建人：<ex:employeeName id="${maSiteWorkLog.maSiteWork.creater}"/>&nbsp;&nbsp;
			             			创建时间：<fmt:formatDate value="${maSiteWorkLog.maSiteWork.creat_date}" pattern="yyyy-MM-dd HH:mm:ss"/>
			             		</div>
			             		<div class="follow">
			              			<html:textarea property="work_log_content" readonly="true" value="${maSiteWorkLog.log_content}" />
			             			<br/>
			             			填报状态：
			             			<c:if test="${maSiteWorkLog.continue_status == '0'}">
			             				进行中
			             			</c:if>
			             			<c:if test="${maSiteWorkLog.continue_status == '1'}">
				             			处理完成
			             			</c:if>
				             		&nbsp;&nbsp;填报日期：<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${maSiteWorkLog.log_date}"/>
			               </div>
			              </td>
			          </tr>
		          </c:forEach>
				<c:forEach items="${maGeneralWorkLogList}" var="maGeneralWorkLog">
					<tr>
		     			<th>
		     				【<ex:dicDisplay dictIdentify="TaskWorkRank" dictValue="${maGeneralWorkLog.maGeneralWork.general_rank}"/>】【${maGeneralWorkLog.maGeneralWork.general_type=='1'?'文档汇编':'需求报告'}】${maGeneralWorkLog.maGeneralWork.general_name}
		     			</th>
		     		</tr>
		     		 <tr>
		         		<td>
		             		<div class="content">
		             			${maGeneralWorkLog.maGeneralWork.general_memo}<br/>
		             			创建人：<ex:employeeName id="${maGeneralWorkLog.maGeneralWork.creater}"/>&nbsp;&nbsp;
		             			创建时间：<fmt:formatDate value="${maGeneralWorkLog.maGeneralWork.creat_date}" pattern="yyyy-MM-dd HH:mm:ss"/>
		             		</div>
		             		<div class="follow">
		             				<html:textarea readonly="true" property="general_log_content" value="${maGeneralWorkLog.log_content}" />
		             			<br/>
		             			填报状态：
		             			<c:if test="${maGeneralWorkLog.continue_status == '0'}">
		             				进行中
		             			</c:if>
		             			<c:if test="${maGeneralWorkLog.continue_status == '1'}">
			             			处理完成
		             			</c:if>
		             			&nbsp;&nbsp;填报日期：<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${maGeneralWorkLog.log_date}"/>
		               		</div>
		             	 </td>
		          		</tr>
		          </c:forEach>
	 		</table> 
		</c:if>
	</html:form>
</ex:tabItem>
<ex:tabItem name="mafinishWorkLogItem" label="日志完成列表" url="${ctx}/maSiteWorkLogAction.do?method=finishList" disabled="false" />
</ex:tab>
</body>
</html:html>