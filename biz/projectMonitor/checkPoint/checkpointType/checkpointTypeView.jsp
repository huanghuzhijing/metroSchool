<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>
<ex:bundle/>
<html:html>
<head>
<title><fmt:message key="dtaq.pointType.title"/></title>
<content tag="heading"><fmt:message key="dtaq.pointType.title"/></content>
</head>
<body>
   <html:form action="dtaqCheckpointTypeAction.do">
	    <html:hidden property="type_id"/>
	    <html:hidden property="type_kind"/>
	    <html:hidden property="status"/>
		<html:hidden property="ts"/>
    <table width="100%" border="0" align="center" cellpadding="4" cellspacing="1" class="tableblue">
         	<COLGROUP>
            <COL class="tr03" align="right" width="20%">
            <COL class="tr02" width="30%">
            <COL class="tr03" align="right" width="20%">
            <COL class="tr02" width="30%">
    </COLGROUP>
    		<tr>
             <td><fmt:message key="dtaq.pointType.bigtype_name"/></td>
             <td>${mianType.name}</td>
             <td><fmt:message key="dtaq.pointType.dtaq.pointType.smalltype_name"/></td>
             <td>${dtaqCheckpointType.type_name}</td>
            </tr>
            <c:if test="${dtaqCheckpointType.type_kind != '5'}">
	           <tr>
	           	 <td><fmt:message key="dtaq.pointType.abs_critical_value"/></td>
	             <td>${dtaqCheckpointType.abs_critical_value}</td>
	           	 <td><fmt:message key="dtaq.pointType.abs_warning_value"/></td>
	             <td>${dtaqCheckpointType.abs_warning_value}</td>
	           </tr>
	           <tr>
	           	 <td><fmt:message key="dtaq.pointType.rel_critical_value"/></td>
	             <td>${dtaqCheckpointType.rel_critical_value}</td>
	           	 <td><fmt:message key="dtaq.pointType.rel_warning_value"/></td>
	             <td>${dtaqCheckpointType.rel_warning_value}</td>
	           </tr>
           </c:if>
           <c:if test="${dtaqCheckpointType.type_kind == '5'}">
           		<tr>
	           	 <td><fmt:message key="dtaq.pointType.dtaq.pointType.max_value"/></td>
	             <td colspan="3">${dtaqCheckpointType.abs_warning_value}</td>
	           </tr>
           </c:if>
         </table>
</html:form>
  </body>
</html:html>
