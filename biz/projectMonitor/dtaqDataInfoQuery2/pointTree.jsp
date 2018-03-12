<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp"%>
<script language="javascript">
var checkPointTree = new dTree('checkPointTree');
checkPointTree.setIconPath('${ctx}/scripts/dtree/');
checkPointTree.add('0',-99,'监测数据',null);
<c:forEach items="${lines}" var="line">
  checkPointTree.add('SL_${line.line_id}','0','${line.line_name}','${ctx}/dtaqDataInfoQuery2Action.do?method=list&isthird=${isthird}&line_id=${line.line_id}',null,null,'${ctx}/image/dtaq/line.png','${ctx}/image/dtaq/line.png');
</c:forEach>
document.write(checkPointTree);
</script>