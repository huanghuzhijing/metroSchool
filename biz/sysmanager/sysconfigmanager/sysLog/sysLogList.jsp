<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
<html>
<script type="text/javascript" src="${ctx}/scripts/enterKey.js" ></script>
<script type="text/javascript">
function selectOrgan(){
	var url ="${ctx}/organizationAction.do?method=queryOrgInfoList";
 	 art.dialog({id:'queyOrg',title:'查看组织', iframe:url, width:'700', height:'400',top:'10'});
}

function clearOrgan(){
	jQuery("[name='org_id']").val("") ;
	jQuery("[name='org_name']").val("") ;
}


</script>
	<content tag="heading">
		系统日志管理
	</content>
	<body>
	<table class="queryTable" >
		<tr>
			<td class="queryTitle">
				<span >&nbsp;[${texts['dtaq.common.query_field']}]&nbsp;</span>
			</td>
		</tr>
		<tr>
			<td>
				<html:form action="sysLogAction.do?method=list">
					<table class="queryContentTable">
						<tr>
							<td>
								登录名：&nbsp;&nbsp;
							</td>
							<td>
								<html:text property="qopername" size="30" styleClass="inputText"/>
							</td>
							<td>
								单位/部门：&nbsp;&nbsp;
							</td>
							<td colspan="4">
								<div style="float:left">
									<html:hidden property="org_id" styleId="org_id"/>
								    <html:text property="org_name" styleId="org_name" size="40" readonly="true" styleClass="text"/>
								</div>
							    <div style="float:left">
						    		<input type="button" class="button1" value="选择" onclick="selectOrgan()" icon="icon_selectInfo">
						    	</div>
						    	<div style="float:left">
									<input type="button" class="button1" value="清空" onclick="clearOrgan()" icon="icon_delete">
						    	</div>
							</td>
							</tr>
							<tr>
							<td>
								登录时间：&nbsp;&nbsp;
							</td>
							<td>
								<input type="text"  name="qstartDate"  class="inputText" value="${qstartDate}"  onfocus="WdatePicker()" />--<input type="text"  name="qendDate"  class="inputText" value="${qendDate}" onfocus="WdatePicker()" />
							</td>
							<td colspan="2">
								<input type="submit" id="btn_query" icon="icon_query" value="查 询" />
							</td>
						</tr>
					</table>
				</html:form>
			</td>
		</tr>
	</table>

					<ec:table items="sysLogs" var="sysLog"
						action="sysLogAction.do" title="" locale="zh_CN"
						sortable="false" rowsDisplayed="10" imagePath="${ctx}/styles/extremecomponents/images/*.gif"
						retrieveRowsCallback="limit" filterRowsCallback="limit" sortRowsCallback="limit">
						<ec:row highlightRow="true" >
							<ec:column property="rowcount" cell="rowCount" sortable="false" title="序号" />
							<ec:column property="opername" title="登录名" />
							<ec:column property="deptid" title="单位/部门" >
							<ex:orgDisplay id="${sysLog.deptid}"/>
							</ec:column>
							<ec:column property="logtime" title="登录时间" format="yyyy-MM-dd HH:mm:ss" cell="date" />
							<ec:column property="localaddr" title="登录IP" />
							<ec:column property="localport" title="登录端口" />
							<ec:column property="serverport" title="服务器端口" />	
							<ec:column property="localname" title="服务器名" />
							<ec:column property="servername" title="服务器IP" />
							
						</ec:row>
					</ec:table>	
	</body>
</html>
