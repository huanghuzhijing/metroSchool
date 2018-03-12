<%@ page contentType="text/html;charset=UTF-8" %>
<script type="text/javascript">
var method='${param.method}';
if(method=='delete'){
	location.href='eVideoTourAction.do?method=list&flagPage=${param.flagPage}';
}else{
	parent.pageRefresh();
	parent.art.dialog({id:'commonDialog'}).close();
}
</script>