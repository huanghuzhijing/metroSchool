<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>
<ex:bundle/>
<html>
<head>
<%@ include file="/commons/meta.jsp"%>
<title><fmt:message key="dtaq.checkpoint.title"/></title>
<content tag="heading">&nbsp;</content>
<script language="javascript">
jQuery.noConflict();
jQuery(document).ready(function(){
	init();
})
function typeChanged() {
  location.href="dtaqCheckpointAction.do?method=doCompare&organ_type=${param.organ_type}&__skip__&station_id=${param.station_id}&type_id="+jQuery("[name='type_id']").val();
}

function partChanged() {
  location.href="dtaqCheckpointAction.do?method=doCompare&organ_type=${param.organ_type}&__skip__&station_id=${param.station_id}&type_id="+jQuery("[name='type_id']").val()+"&part_id="+jQuery("[name='part_id']").val();
}

function pointChanged() {
    location.href="dtaqCheckpointAction.do?method=doCompare&organ_type=${param.organ_type}&__skip__&station_id=${param.station_id}&type_id="+jQuery("[name='type_id']").val()+"&part_id="+jQuery("[name='part_id']").val()+"&point_id="+jQuery("[name='point_id']").val();
}

function init(){
	var selectPoint = '${selectPoint}';
	if(selectPoint != ""){
		var radios = jQuery("[name='sel_point']") ;
		radios.each(function(){
			if(jQuery(this).val == selectPoint){
				jQuery(this).attr("checked","checked") ;
			}
		}) ;
	}
}

function delSelectPoint(){
	var radios = jQuery("[name='sel_point']") ;
	radios.each(function(){
		if(jQuery(this).attr("checked") == "checked"){
			jQuery(this).attr("checked","") ;
		}
	}) ;
	parent.setComparePoint('');
}
</script>
</head>
<body>
<html:form action="dtaqCheckpointAction.do">
<input type="hidden" name="method" value="doCompare" />
<table class="listTable" width="100%" cellpadding="0" cellspacing="0" border="0">
<tr>
  <td width="120px" nowrap>对应施工方测点类型</td>
  <td>
    <html:select property="type_id" styleId="type_id" onchange="typeChanged()">
    <c:forEach var="type" items="${types}">
      <html:option value="${type.type_id}">${type.type_name}</html:option>
    </c:forEach>
    </html:select>
   </td>
  <td width="120px" nowrap>对应施工方测点部位</td>
  <td>
  <html:select property="part_id" styleId="part_id" onchange="partChanged()">
    <html:option value="">-请选择-</html:option>
    <c:forEach var="part" items="${parts}">
      <html:option value="${part.part_id}">${part.part_name}</html:option>
    </c:forEach>
  </html:select>
  </td>
  <td width="120px" nowrap>对应施工方测点编号</td>
  <td>
  <html:select property="point_id" styleId="point_id" onchange="pointChanged()">
    <html:option value="">-请选择-</html:option>
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
  <th>车站/区间</th>
  <th>监测类型</th>
  <th>监测部位</th>
  <th>监测编码</th>
  <th>测点里程</th>
  <th>测量仪器</th>
  <th>监测频率</th>
  <th>对应</th>
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