<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>
<%@ include file="/commons/meta.jsp" %>
<ex:bundle/>
<html>
<head>
<title>数据监测报表</title>
<link rel="StyleSheet" href="${ctx}/scripts/warnColor.css" type="text/css" />
<script type="text/javascript">
function init(){
	var tableObj = $("contractInfoList");
	for(var i = 0;i < tableObj.rows.length;i++){
		var memoObj = $("warn_memo_"+i);
		if(memoObj != null){
			var memo = memoObj.value;
	    	$("tr_"+i).title = memo;
		}
    	
	}
}

function windowClose(){
	parent.art.dialog({id:"viewDetail"}).close();
}
</script>
</head>
<body onload="init()">
<c:if test="${type.type_kind==1}">
<%--<%@include file="../dataQuery/type1.jsp" %>--%>
<%@include file="type1.jsp" %>
</c:if>
<c:if test="${type.type_kind==2}">
<%@include file="type2.jsp" %>
</c:if>
<c:if test="${type.type_kind==3}">
<%@include file="type3.jsp" %>
</c:if>
<c:if test="${type.type_kind==4}">
<%@include file="type4.jsp" %>
</c:if>
<div align="center">
  <input type="button" class="button1" value="关 闭" onclick="windowClose();">
</div>
</body>
</html>