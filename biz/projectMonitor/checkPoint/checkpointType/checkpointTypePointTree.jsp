<%@ page contentType="text/html;charset=UTF-8" %>
<link rel="StyleSheet" href="${ctx}/scripts/dtree/css/dtree.css" type="text/css" />
<script language="javascript">
var checkPointTree = new dTree('checkPointTree');
checkPointTree.setIconPath('${ctx}/scripts/dtree/');
checkPointTree.add('0',-99,'地铁工程监测类型',null);
<c:forEach items="${mainTypeList}" var="mainType">
  checkPointTree.add('SL_${mainType.id}','0','${mainType.name}','dtaqCheckpointTypeAction.do?method=list&type_kind=${mainType.id}',null,null,'${ctx}/image/dtaq/line.png','${ctx}/image/dtaq/line.png');
 
</c:forEach> 
document.write(checkPointTree.toString());
</script>