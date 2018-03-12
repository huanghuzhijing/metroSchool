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
	jQuery("th").toggle(
		function(){
			jQuery(this).parent().next("tr").find(".content").show(200);
		},
		function(){
			jQuery(this).parent().next("tr").find(".content").hide(200);
		}
	);
});
</script>
</head>
<content tag="heading">工作日志填报</content>
<body class="body_borwse">
<ex:tab id="info">
<ex:tabItem name="maSiteWorkLogItem" label="日志填报列表" url="${ctx}/maSiteWorkLogAction.do?method=list" disabled="false" />
<ex:tabItem name="mafinishWorkLogItem" label="日志完成列表" selected="true">
		<html:form action="maSiteWorkLogAction.do">
			<html:hidden property="method" value="finishList"/>
			<table class="searchTable" width="100%" cellpadding="2" cellspacing="2" border="0">
				<tr align="center">
					<td align="left" width="40%">
						完成日期&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="text"  name="startDate"  class="inputText" value="${startDate}"  onfocus="WdatePicker()" />--<input type="text"  name="endDate"  class="inputText" value="${endDate}" onfocus="WdatePicker()" />
						&nbsp;&nbsp;
						<input type="submit" value="查询" icon="icon_query"  />
					</td>
				</tr>
			</table>
	</html:form>
<c:if test="${siteWorkLogList != null || generalWorkLogList != null}">
	<table class="table_borwse">
	<thead>
	 	</thead>
	      <tbody>
	     	<c:forEach items="${siteWorkLogList}" var="maSiteWorkLog">
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
	             			完成时间：<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${maSiteWorkLog.finish_date}"/>
	               </div>
	              </td>
	          </tr>
	     	</c:forEach>
	     	<c:forEach items="${generalWorkLogList}" var="maGeneralWorkLog">
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
	             			完成时间：<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${maGeneralWorkLog.finish_date}"/>
	               		</div>
	              </td>
	          </tr>
	     	</c:forEach>
	     </tbody>
	 </table>
</c:if>
</ex:tabItem>
</ex:tab>
</body>
</html:html>