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
	<ec:table showPagination="false" sortable="false" items="corpTypes" var="corpType" tableId="baseinfoList"
			action="${ctx}/corpTypeAction.do">
			<ec:row>
				<ec:column property="type_code" title="类型树编码" />
				<ec:column property="type_name" title="类型树名称" />
				<ec:column property="null" title="操作" width="30%" sortable="false">
					<input type="button" class="button1" onclick="location.href='${ctx}/corpTypeAction.do?method=edit&staticid=${param.staticid }&id=${corpType.id}'" value="<fmt:message key="label.modify"/>"/>
					<input type="button"  class="button1" onclick="location.href='corpTypeAction.do?method=view&id=${corpType.id}'" property="d" value="<fmt:message key="label.view"/>"/> 
					<input type="button" class="button1" onclick="checkDelete('${corpType.id}','${param.staticid }')" value="<fmt:message key="button.delete"/>"/>
				</ec:column>
			</ec:row>
		</ec:table>
</body>
</html:html>
