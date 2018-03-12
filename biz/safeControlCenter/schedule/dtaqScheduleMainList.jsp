<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>
<%@ include file="/commons/meta.jsp" %>
<ex:bundle/>
<html:html>
<head>
<style type="text/css">
.button1{
	font-size: 8pt;
	font-weight: bold;
	color:  #3777B4;
	
	border:1px ridge #FFAF69;
	background:url(img/bottom1.jpg);
	
	text-align:center;
	text-decoration:blink;
	height:20px ;
	line-height:18px ;
	padding:0px; 
	
}  

</style>
<script type="text/javascript" src="${ctx}/scripts/dtree/dtree.js"></script>
<script src="<c:url value="/scripts/public.js"/>" type="text/javascript"></script>
<script type="text/javascript">
	jQuery.noConflict();

	function viewInfo(main_id){
		location.href = "${ctx}/dtaqScheduleExcavateAction.do?method=showDetail&main_id="+main_id+"&station_id=${dtaqStation.station_id}" ;
	}
</script>
</head>
  <body>
	<fieldset>
 			<legend><strong><fmt:message key="dtaq.common.query_field"/></strong></legend>
 			<html:form action="/dtaqScheduleMainAction.do?method=list">
		  <html:hidden property="station_id" value="${dtaqStation.station_id}"/>
			  <table class="searchTable" width="100%" cellpadding="0" cellspacing="4" border="0">
				  <tr>
				  	 <td width="60px">填报日期：</td>
				    <td><input type="text"  name="qstartDate"  class="inputText" value="${qstartDate}"  onfocus="WdatePicker()" />--<input type="text"  name="qendDate"  class="inputText" value="${qendDate}" onfocus="WdatePicker()" /></td>
				     <td  align="right">
				    	<input type="submit" value="${texts['button.query']}" class="button1" onclick="return validateQuery()"/>
				    </td>
				 </tr>
			  </table>
		  </html:form>
	</fieldset>
	<fieldset>
		<legend><strong><fmt:message key="dtaq.common.list_field"/></strong></legend>
			<table width="100%" cellpadding="0" cellspacing="0" border="0">
			
				<tr>
					<td width="50%" align="center">
						<font color="#50A2E6" size="2"><strong>车站/区间：${dtaqStation.station_name}</strong></font>
					</td>
					<td align="right" width="50%">
						<input type="button" class="button1" value="查询" onclick="createInfo()">&nbsp;&nbsp;
					</td>
				</tr>
			</table>
			<ec:table items="dtaqScheduleMains" var="dtaqScheduleMain" action="dtaqScheduleMainAction.do"
	title="" width="100%"  sortable="false" rowsDisplayed="10"
	imagePath="${ctx}/styles/extremecomponents/images/*.gif" locale="zh_CN" 
	retrieveRowsCallback="limit" filterRowsCallback="limit" sortRowsCallback="limit">
  		<ec:row highlightRow="true" >
		<ec:column property="rowcount" cell="rowCount" sortable="false" title="序号" width="5%"/>
		    	<ec:column property="record_date" title="填报日期" width="150px" format="yyyy-MM-dd" cell="date" />
				<ec:column property="null" title="${texts['label.operate']}" sortable="false" width="150px">
					<div align="center">
					 	<input type="button" class="button1" onclick="viewInfo('${dtaqScheduleMain.main_id}')" value="${texts['label.view']}"/>		
					</div>
				 </ec:column>
				 </ec:row>
				 </ec:table>
	</fieldset>
			
  </body>
</html:html>
