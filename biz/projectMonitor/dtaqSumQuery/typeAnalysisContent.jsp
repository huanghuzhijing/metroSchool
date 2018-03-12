<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<script type="text/javascript">
<!--
function back(){
	alert("dtaqSumQueryAction.do?method=list&startDate=${startDate}&endDate=${endDate}&type_id="+jQuery("[name='type_id']").val()+"&isthird=${isthird}&line_id=${line_id}");
	location.href="dtaqSumQueryAction.do?method=list&startDate=${startDate}&endDate=${endDate}&type_id="+jQuery("[name='type_id']").val()+"&isthird=${isthird}&line_id=${line_id}";
}
//-->
</script>
<html:form action="dtaqSumQueryAction.do">
<%--<cewolf:chart id="redPie" title="${texts['dtaq.data.red_warn']}" type="pie">--%>
<%--    <cewolf:data>--%>
<%--        <cewolf:producer id="redDatas" />--%>
<%--    </cewolf:data>--%>
<%--</cewolf:chart>--%>
<%----%>
<%--<cewolf:chart id="yellowPie" title="${texts['dtaq.data.yellow_warn']}" type="pie">--%>
<%--    <cewolf:data>--%>
<%--        <cewolf:producer id="yellowDatas" />--%>
<%--    </cewolf:data>--%>
<%--</cewolf:chart>--%>
<%----%>
<%--<cewolf:chart id="bluePie" title="${texts['dtaq.data.normal']}" type="pie">--%>
<%--    <cewolf:data>--%>
<%--        <cewolf:producer id="blueDatas" />--%>
<%--    </cewolf:data>--%>
<%--</cewolf:chart>--%>
&nbsp;标段
<html:select property="segment_id" styleId="segment_id" onchange="segmentChanged()">
  <html:option value="">不限</html:option>
<c:forEach var="segment" items="${segments}">
      <html:option value="${segment.segment_id}">${segment.segment_name}</html:option>
    </c:forEach>
</html:select>
&nbsp;&nbsp;
<%--<html:button property="back" value="${texts['button.back']}" styleClass="button1" onclick="back()"></html:button>--%>
<table border="0" cellpadding="0" cellspacing="0" width="100%">
<tr>
<td valign="top">
<div  id="chartdiv_1"></div>
</td>
<td valign="top">
<div  id="chartdiv_2"></div>
</td>
</tr>
<tr>
<td valign="top"  colspan="3">
<div  id="chartdiv_3"></div>
</td>
</tr>
<tr>
<td valign="top" width="70%">
<table class="listTable">
<thead>
<tr>
<th>监测类型</th>
<th>红色预警</th>
<th>黄色预警</th>
<th>正常</th>
<th>操作</th>
</tr>
</thead>
<c:forEach items="${datas}" var="vo">
 <tr>
 <td>${vo.type_name}</td>
 <td>${vo.red_count}</td>
 <td>${vo.yellow_count}</td>
 <td>${vo.blue_count}</td>
 <td><input type="button" class="button1" value="详细" onclick="viewDetails(${vo.type_id})"></td>
 </tr>
</c:forEach>
</table>
</td>
</tr>
</table>
</html:form>