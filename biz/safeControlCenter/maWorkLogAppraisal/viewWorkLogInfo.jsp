<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>
<%@ include file="/commons/meta.jsp" %>

<ex:bundle/>
<html:html>
<head>
<title>评价任务查看</title>
<script src="${ctx}/scripts/public.js" type="text/javascript"></script>
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

function closeWindow(){

	parent.art.dialog({id:'dialog1'}).close();
	}

</script>
</head>
<body>
   <html:form action="maSiteWorkAction.do" method="POST">
  	    <table class="table_borwse">
		<c:if test="${pojo_type == 'MaSiteWorkLog'}">
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
		</c:if>
		<c:if test="${pojo_type == 'MaGeneralWorkLog'}">
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
		</c:if>
	 </table> 
		<div align="center">
		  	<html:button property="back"  styleClass="backButton" value="关闭" onclick="closeWindow()" />
		</div>
</html:form>
</body>
</html:html>
