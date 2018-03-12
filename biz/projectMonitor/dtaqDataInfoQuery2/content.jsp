<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>
<%@ taglib uri="/WEB-INF/cewolf.tld" prefix="cewolf" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<table border="0" cellpadding="0" cellspacing="0" style="width:98%;">
<tr>
<td valign="top" width="20%">
<%@include file="pointTree.jsp" %>
</td>
<td valign="top" width="80%">
	<table>
		<td>填报时间：</td>
		<td>
			<input type="text"  name="startDate"  class="inputText" value="${startDate}"  onfocus="WdatePicker()" />--<input type="text"  name="endDate"  class="inputText" value="${endDate}" onfocus="WdatePicker()" />
		</td>
		
		<td align="right">
			<input type="button" value="查询" icon="icon_query" onclick="query()"/>
		</td>
	</table>
	<table class="queryTable" >
			<tr>
				<td class="queryTitle">
					<span >&nbsp;[${line.line_name}]&nbsp;</span>
				</td>
			</tr>
			<tr>
				<td align="center">
			 		<div  id="chartdiv_1"></div>
			  </td>
			</tr>
		</table>
</td>
</tr>
</table>