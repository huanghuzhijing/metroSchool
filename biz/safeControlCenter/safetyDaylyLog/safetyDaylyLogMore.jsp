<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>
<ex:bundle/>
<html:html>
<head>
<%-- <script src="<c:url value="/js/windowsJS.js"/>" type="text/javascript"></script>--%>
<title>业务系统</title>
<content tag="heading">
安全工作日报
</content>  
<script type="text/javascript">

</script>
</head>
  
  <body>
     <table width="100%" cellpadding="0" cellspacing="0">
     <tr>
     	<td align="right"><input type="button" value="<fmt:message key="button.back"/>" onclick="history.back()" class="backButton"></td>
     </tr>
       <tr>
    	 <td>
	 			<ec:table items="safetyDaylyLogs" var="safetyDaylyLog" action="safetyDaylyLogAction.do">
		    	<ec:row>
		    	 <ec:column property="rowcount" cell="rowCount" sortable="false" title="序号" width="10%"/>
				 <ec:column alias="segmentname" property="segmentname" title="标段" width="25%">
		    	 </ec:column>
		    	 <ec:column property="log.f_projid.projectName" alias="projectName" title="车站/区间名称" width="25%">
		    	 </ec:column>
		    	 <ec:column alias="date" property="log.f_reportdate" title="报告日期" cell="date" parse="yyyy-MM-dd" width="10%"/>
		    	 <ec:column alias="state" property="log.state" title="上报状态">
		    	 	<ex:dictDisplayEl type="Upstate" value="${safetyDaylyLog.log.state}"/>
		    	 </ec:column>
				 <ec:column alias="user" property="log.f_userid" title="填写人" width="10%">
				 	<ex:userName id="${safetyDaylyLog.log.f_userid}"/>
				 </ec:column>
				 	<ec:column property="null" title="操作" styleClass="width:80px;text-align:center" sortable="false" viewsAllowed="html">
					  <html:button styleClass="button1" onclick="location.href='safetyDaylyLogAction.do?method=view&id=${safetyDaylyLog.log.id}'" property="d" value="${texts['label.detail']}"/> 
					</ec:column>
				</ec:row>
		    </ec:table>
    	 </td>
       </tr>
    </table>
  </body>
</html:html>
