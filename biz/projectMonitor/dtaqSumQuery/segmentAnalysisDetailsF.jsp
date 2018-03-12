<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>
<html>
<body>
<iframe width="100%" height="100%" frameborder="0" src="${ctx}/dtaq/sumQuery.do?method=segmentAnalysisDetails&isthird=${isthird}&line_id=${line_id}&segment_id=${segment_id}&type_id=${type_id}&startDate=${startDate}&endDate=${endDate}">
</iframe>
</body>
</html>