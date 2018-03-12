<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
<meta http-equiv="Cache-Control" content="no-store"/>
<meta http-equiv="Pragma" content="no-cache"/>
<meta http-equiv="Expires" content="0"/>
<%--<meta http-equiv="x-ua-compatible" content="ie=7" />--%>
<!--css -->
<%--<link href="<c:url value="/styles/main.css"/>" type="text/css" rel="stylesheet">--%>
<link href="<c:url value="/styles/default.css"/>" type="text/css" rel="stylesheet">
<c:if test="${userinfo.mainset==1}">
<link href="<c:url value="/styles/blue.css"/>" type="text/css" rel="stylesheet">
</c:if>
<c:if test="${userinfo.mainset==2}">
<link href="<c:url value="/styles/red.css"/>" type="text/css" rel="stylesheet">
</c:if>
<c:if test="${userinfo==null}">
<link href="<c:url value="/styles/blue.css"/>" type="text/css" rel="stylesheet">
</c:if>
<link type="text/css" href="${ctx}/scripts/artDialog2.1.1/skin/default.css" rel="stylesheet"  />
<link rel="STYLESHEET" type="text/css" href="<c:url value="/scripts/button/style/button.css"/>" />
<link rel="STYLESHEET" type="text/css" href="<c:url value="/scripts/button/style/icon.css"/>" />

<!--js -->
<script language="javascript" type="text/javascript" src="${ctx}/scripts/jquery-sortable/jquery-1.6.2.js"></script>
	<script language="javascript" type="text/javascript" src="${ctx}/scripts/jquery-sortable/jquery.ui.core.js"></script>
	<script language="javascript" type="text/javascript" src="${ctx}/scripts/jquery-sortable/jquery.ui.widget.js"></script>
	<script language="javascript" type="text/javascript" src="${ctx}/scripts/jquery-sortable/jquery.ui.mouse.js"></script>
	<script language="javascript" type="text/javascript" src="${ctx}/scripts/jquery-sortable/jquery.ui.sortable.js"></script>
	<script language="javascript" src="${ctx}/scripts/button/script/pico-button.js"></script>		



