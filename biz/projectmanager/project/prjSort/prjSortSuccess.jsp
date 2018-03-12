<%@ page contentType="text/html;charset=UTF-8" %>
<script type="text/javascript">
var method='${param.method}';
if(method=='delete'){
	location.href='prjSortAction.do?method=list';
}else{
	parent.pageRefresh();
	parent.art.dialog({id:'commonDialog'}).close();
	//window.opener.pageRefresh();
	//window.close();
}
</script>