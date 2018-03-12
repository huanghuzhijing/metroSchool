<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>
<ex:bundle/>
<html>
<head>
<%@ include file="/commons/meta.jsp"%>
<title><fmt:message key="dtaq.checkpoint.title"/></title>
<script language="javascript">
function typeChanged() {
  location.href="${ctx}/dtaq/point.do?method=doCompare&isthird=${isthird}&__skip__&station_id=${station_id}&type_id="+jQuery("[name='type_id']").val();
}

function partChanged() {
  location.href="${ctx}/dtaq/point.do?method=doCompare&isthird=${isthird}&__skip__&station_id=${station_id}&type_id="+jQuery("[name='type_id']").val()+"&part_id="+jQuery("[name='part_id']").val();
}

function pointChanged() {
    location.href="${ctx}/dtaq/point.do?method=doCompare&isthird=${isthird}&__skip__&station_id=${station_id}&type_id="+jQuery("[name='type_id']").val()+"&part_id="+jQuery("[name='part_id']").val()+"&point_id="+jQuery("[name='point_id']").val();
}

function init(){
	var selectPoint = '${selectPoint}';
	if(selectPoint != ""){
		var radios = document.getElementsByName("sel_point");
		for(var i=0; i<radios.length;i++){
			if(radios[i].value == selectPoint){
				radios[i].checked = true;
				//break;
			}
		}
	}
}

function delSelectPoint(){
	var radios = document.getElementsByName("sel_point");
	for(var i=0; i<radios.length;i++){
		if(radios[i].checked == true){
			radios[i].checked = false;
			break;
		}
	}
	parent.setComparePoint('');
}
</script>
</head>
<body onload="init();">
<html:form action="/dtaq/point">
<input type="hidden" name="method" value="doCompare">
<table width="100%" cellpadding="0" cellspacing="0" border="0">
<tr>
  <td width="120px" nowrap><fmt:message key="dtaq.checkpoint.compare_type"/></td>
  <td>
    <html:select property="type_id" styleId="type_id" onchange="typeChanged()">
    <c:forEach var="type" items="${types}">
      <html:option value="${type.type_id}">${type.type_name}</html:option>
    </c:forEach>
    </html:select>
   </td>
  <td width="120px" nowrap><fmt:message key="dtaq.checkpoint.compare_part"/></td>
  <td>
  <html:select property="part_id" styleId="part_id" onchange="partChanged()">
    <html:option value=""><fmt:message key="dtaq.common.select.option"/></html:option>
    <c:forEach var="part" items="${parts}">
      <html:option value="${part.part_id}">${part.part_name}</html:option>
    </c:forEach>
  </html:select>
  </td>
  <td width="120px" nowrap><fmt:message key="dtaq.checkpoint.compare_point"/></td>
  <td>
  <html:select property="point_id" styleId="point_id" onchange="pointChanged()">
    <html:option value=""><fmt:message key="dtaq.common.select.option"/></html:option>
    <c:forEach var="point" items="${points}">
      <html:option value="${point.point_id}">${point.point_code}</html:option>
    </c:forEach>
  </html:select>
  </td>
<td align="right"><html:button property="btnDel" value="${texts['button.cancel']}" styleClass="button1" onclick="delSelectPoint()"></html:button>
</td>
</tr>
<tr>
<td colspan="7">
<table width=100% align="center" cellspacing="0" borderColorLight="#008080" border="1"  borderColorDark="white" id="PROJGROUP">
<tr>
  <th><fmt:message key="dtaq.common.station"/></th>
  <th><fmt:message key="dtaq.common.type"/></th>
  <th><fmt:message key="dtaq.common.part"/></th>
  <th><fmt:message key="dtaq.common.point_code"/></th>
  <th><fmt:message key="dtaq.checkpoint.point_distince"/></th>
  <th><fmt:message key="dtaq.checkpoint.point_mechine"/></th>
  <th><fmt:message key="dtaq.checkpoint.check_frequency"/></th>
  <th><fmt:message key="dtaq.checkpoint.compare_point_id"/></th>
</tr>
<c:if test="${currPoint==null}">
<c:forEach items="${points}" var="point">
<tr>
  <td>${station.station_name}</td>
  <td>${currType.type_name}</td>
  <td>${currPart.part_name}</td>
  <td>${point.point_code}</td>
  <td>${point.point_distince}</td>
  <td>${point.point_mechine}</td>
  <td>${point.check_frequency}</td>
  <td><input type="radio" name="sel_point" id="sel_point" value="${point.point_id}" onclick="parent.setComparePoint('${point.point_id}')"></td>
</tr>
</c:forEach>
</c:if>
<c:if test="${currPoint!=null}">
<tr>
  <td>${station.station_name}</td>
  <td>${currType.type_name}</td>
  <td>${currPart.part_name}</td>
  <td>${currPoint.point_code}</td>
  <td>${currPoint.point_distince}</td>
  <td>${currPoint.point_mechine}</td>
  <td>${currPoint.check_frequency}</td>
  <td><input type="radio" name="sel_point" value="${currPoint.point_id}" onclick="parent.setComparePoint('${currPoint.point_id}')"></td>
</tr>
</c:if>
</table>
</td>
</tr>
</table>
</html:form>
</body>
</html>