<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>
<ex:bundle/>

<html:html>
<head>
<title>应急救援预案</title>
<content tag="heading">应急救援预案</content>
<script src="<c:url value="/js/windowsJS.js"/>" type="text/javascript"></script>
<script src="<c:url value="/scripts/public.js"/>" type="text/javascript"></script>
<script type="text/javascript">
function displayDetailWeave(itemId) {
  var url ="${ctx}/emergencyMaterialItemAction.do?method=view&itemId="+itemId+"&mianView=mianView";
  art.dialog({title:'明细', iframe:url, width:'700', height:'370',top:'100'});
}
</script>
</head>
<body>
<fieldset style="margin:10">
         <legend><strong>详细</strong></legend>
<html:form enctype="multipart/form-data" action="emergencyMaterialPlanAction.do" method="POST">
		<input name="method" value="list" type="hidden" />
<html:hidden property="fid"/>
<html:hidden property="qplanName"/>
<html:hidden property="qyearNum" />
<html:hidden property="qmonthNum"/>
  <table class="formTable" >
		<COLGROUP>
				<COL class="tdLeftTwo" />
                <COL class="tdRightTwo" />
                <COL class="tdLeftTwo" />
                <COL class="tdRightTwo" />
		</COLGROUP>
	<tr>
      <td>计划名称：&nbsp;<font color="red">*</font></td>
      <td colspan="3">${emergencyMaterialPlan.planName}</td>
      
    </tr>
    <tr>
      <td>计划年份：&nbsp;<font color="red">*</font></td>
      <td>
  		${emergencyMaterialPlan.planYear}
      </td>
      <td>计划月份：&nbsp;<font color="red">*</font></td>
      <td>
  		${emergencyMaterialPlan.planMonth}
      </td>
    </tr>
    <tr>
      <td>编制人：&nbsp;&nbsp;&nbsp;</td>
      <td colspan="3">${emergencyMaterialPlan.author}</td>
    </tr>
    <tr>
      <td>编制情况：&nbsp;&nbsp;&nbsp;</td>
      <td colspan="3">
      	${emergencyMaterialPlan.condition}
      </td>
    </tr>
</table>
</html:form>
</fieldset>
<fieldset>
 <legend><strong>编制信息</strong></legend>
 <c:set value="1" var="index" />
<table class="listTable" width="100%" align="center" border="0" cellpadding="0" cellspacing="1">
<thead align="center">
  <tr height="25">
  	<th>序号</th>
  	<th>物资名称</th>
  	<th>数量</th>
  	<th>单位</th>
  	<th>用途</th>
  	<th>操作</th>
  </tr>
 </thead>
  <c:forEach items="${emergencyMaterialItems}" var="item">
  	<tr align="center" height="20">
  		<td>${index} <c:set value="${index+1}" var="index" /></td>
  		<td>${item.material}</td>
  		<td>${item.amount}</td>
  		<td>${item.unit}</td>
  		<td>${item.purpose}</td>
  		<td><input type="button" class="button1" onclick="displayDetailWeave(${item.itemId})" value="<fmt:message key="button.detail"/>"/></td>
  	</tr>
  </c:forEach>
</table>
</fieldset>
<div class="saveDiv">
	<input type="button" value="<fmt:message key="button.back"/>" onclick="document.forms[0].submit()" class="backButton" />
</div>
</body>
</html:html>