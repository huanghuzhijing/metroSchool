<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<html:form action="dtaqSumQueryAction">
 监测类型
<html:select property="type_id" styleId="type_id" onchange="typeChanged()">
  <html:option value="">不限</html:option>
<c:forEach var="type" items="${types}">
      <html:option value="${type.type_id}">${type.type_name}</html:option>
    </c:forEach>
</html:select>
<table border="0" cellpaddin="0" cellspacing="0">
<tr>
<td valign="top">
 	<div  id="chartdiv_1"></div>
</td>
<td valign="top" width="50%">
<table class="listTable">
<thead>
<tr>
<th>线路标段</th>
<th>红色预警</th>
<th>黄色预警</th>
<th>正常</th>
<th>操作</th>
</tr>
</thead>
<c:forEach items="${datas}" var="vo">
<tr>
<td>${vo.segment_name }</td>
<td>${vo.red_count }</td>
<td>${vo.yellow_count }</td>
<td>${vo.green_count }</td>
<td><input type="button" class="button1" value="详细" onclick="viewDetails(${vo.segment_id})"></td>
</tr>
</c:forEach>
</table>
</td>
</tr>
</table>
</html:form>