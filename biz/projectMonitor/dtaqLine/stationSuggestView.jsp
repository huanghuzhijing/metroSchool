<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
<html:html>
<head>
<script type="text/javascript" src="${ctx}/scripts/json2.js"></script>
<script type="text/javascript" src="${ctx}/scripts/enterKey.js" ></script>
<script type="text/javascript" src="${ctx}/scripts/queryLines.js"></script>
<%@ include file="/commons/meta.jsp"%>
<script type="text/javascript">
		var oper_id="";
		$(document).ready(function(){
			$("#btn_back").click(function(){
			//history.back(-1);
		 	//document.forms[0].action='dtaqLineAction.do?method=gisAnalyseIndex';
			//document.forms[0].submit();
			parent.document.location='dtaqLineAction.do?method=gisAnalyseIndex';
		}) ;
		});
	</script>
</head>
<body >
<fieldset>
<legend>
${stations.station_name}批阅信息

</legend>


<ec:table items="dtaqWarnSigns" var="dtaqWarnSign" action="dtaqLineAction.do?method=stationSuggestView"
	title="" width="100%"  sortable="false" rowsDisplayed="10"
	imagePath="${ctx}/styles/extremecomponents/images/*.gif" locale="zh_CN" 
	retrieveRowsCallback="limit" filterRowsCallback="limit" sortRowsCallback="limit">
  	<ec:row highlightRow="true" >
		<ec:column property="signer" title="批阅人" width="150px">
			<ex:employeeName id="${dtaqWarnSign.signer}"/>
		</ec:column>
		<ec:column property="deptid" title="批阅部门" width="220px">
			<ex:orgDisplay id="${dtaqWarnSign.deptid}"/>
		</ec:column>
		<ec:column property="signdate" title="时间" width="200px" format="yyyy-MM-dd HH:mm:ss" cell="date" />
		<ec:column property="opinion" title="意见" width="400px">
			<div class="opinion">${dtaqWarnSign.opinion}</div>
		</ec:column>
		
	</ec:row>
</ec:table>
</fieldset>
<div class="saveDiv">
	<input id="btn_back" value="返回" type="button" icon="icon_back"/>
</div>
</body>

</html:html>
