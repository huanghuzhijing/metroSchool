<%@ page contentType="text/html;charset=UTF-8" %>
<script language="javascript">

var checkPointTree = new dTree('checkPointTree');
checkPointTree.setIconPath('${ctx}/scripts/dtree/');
checkPointTree.add('0',-99,'监测部位',null);
<c:forEach items="${parts}" var="part">
  checkPointTree.add('SL_${part.part_id}','0','${part.part_name}','javascript:loadPartData(\'${part.part_id}\',\'${info.info_id}\')',null,null,'','');
</c:forEach> 
  checkPointTree.add('SL_0','0','未填报部位','javascript:loadNoPartData(\'${info.info_id}\')',null,null,'','');
document.write(checkPointTree.toString());

</script>