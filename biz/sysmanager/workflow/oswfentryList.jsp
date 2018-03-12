<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>
<ex:bundle/>
<html:html>
<head>
<%-- <script src="<c:url value="/js/windowsJS.js"/>" type="text/javascript"></script>--%>
<title>业务管理系统！</title>
<content tag="heading">
工作流管理




</content>  
<script type="text/javascript">
function del(p){
   if(confirm('删除后将不能恢复，您确认删除？')){
      location.href(p);
   }
}

function goto(wfid)
{
	//location.href='${ctx}/oswfentryAction.do?method=gotoedit&wfentryid='+wfid+'&rand='+Math.random();
	location.href='${ctx}/biz/sysmanager/workflow/workflow.jsp?wfentryid='+wfid+'&rand='+Math.random();
}
</script>
</head>
  
  <body>
  <font color="red">注意：工作流功能由开发方和维护人员修改和维护</font>
     <table width="100%" cellpadding="0" cellspacing="0">
       <tr>
       	<td	align="right">
       		<input type="button"  class="button1" value="<fmt:message key="button.new"/>" onclick="location.href='oswfentryAction.do?method=edit'"/>
       	</td>
       </tr>
       <tr>
    	 <td>
	 			<ec:table items="oswfentrys" var="oswfentry" action="oswfentryAction.do" locale="zh_CN"
					sortable="false" rowsDisplayed="10" imagePath="${ctx}/styles/extremecomponents/images/*.gif"
					>
		    	<ec:row>
				 <ec:column property="rowcount" cell="rowCount" sortable="false" title="序号" width="10%"/>
				 <ec:column property="showname" title="工作流名" />
				 <ec:column property="name" title="工作流标识" />
				 <ec:column property="state" title="开启状态" >
				 
				 <c:if test="${oswfentry.state eq 1}">开启</c:if>
				 <c:if test="${oswfentry.state eq 2}">未开启</c:if>
				 </ec:column>
				 	<ec:column property="null" title="操作" styleClass="width:80px;text-align:center" sortable="false" viewsAllowed="html">
					  <div align="center">
					  <input type="button"  class="button1" onclick="location.href='oswfentryAction.do?method=edit&id=${oswfentry.id}'" property="d" value="<fmt:message key="button.editd"/>"/>
					  <input type="button"  class="button1" onclick="goto('${oswfentry.id}');" property="d1" value="<fmt:message key="button.weave"/>"/>
					  <c:if test="${fn:contains(userinfo.usercmd,'oswfentry_delete')==true}">
		                <input type="button" onclick="del('oswfentryAction.do?method=delete&id=${oswfentry.id}')" class="button1" value="<fmt:message key="button.deleted"/>"/> 
					  </c:if>  
					    </div>
					</ec:column>
				</ec:row>
		    </ec:table>
    	 </td>
       </tr>
    </table>
  </body>
</html:html>
