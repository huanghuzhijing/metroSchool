<OCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>
<ex:bundle/>
<html:html>
<head>
<script src="${ctx}/scripts/TableTree/TableTree-1.1.1.js"></script>
<link rel="StyleSheet" href="${ctx}/scripts/TableTree/css/tabletree.css" type="text/css" />
<script type="text/javascript">
function waitCtr(){
	var url="landCtrBalanceAction.do?method=list&flag=1";
	commonUrl(url);
}

function changeCtr(){
	var url="landCtrBalanceAction.do?method=list&flag=2";
	commonUrl(url);
}
function commonUrl(url){
			document.forms[0].action=url;   
		    document.forms[0].submit();   
}
</script>
</head>
<content tag="heading">
<c:if test="${param.flag == 1}">业主方</c:if>
<c:if test="${param.flag == 2}">施工方</c:if>

</content>
<body>
    <ex:tab id="dockjTab" width="100%">
	<ex:tabItem name="lab1" url="javascript:onclick=waitCtr()" selected="${tab1}" label="业主方" >
		<c:if test="${param.flag == '1'}">
		<%@include file="prjOwnerUserJoinListRight1.jsp" %>
		</c:if>
    </ex:tabItem>
    <ex:tabItem name="lab2"  url="javascript:onclick=changeCtr()" label="施工方" selected="${tab2}">
    	<c:if test="${param.flag == '2'}">
    	<%@include file="prjOwnerUserJoinListRight2.jsp" %>
    	</c:if>
    </ex:tabItem>
    </ex:tab>
 </body>
</html:html>