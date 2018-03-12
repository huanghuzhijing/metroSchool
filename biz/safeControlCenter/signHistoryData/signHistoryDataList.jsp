
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
<html:html>
<head>
<script type="text/javascript" src="${ctx}/scripts/json2.js"></script>
<script type="text/javascript" src="${ctx}/scripts/enterKey.js" ></script>
<script type="text/javascript" src="${ctx}/scripts/queryLines.js"></script>
<script type="text/javascript">
		var oper_id="";
		$(document).ready(function(){
			
		  
			//控制按钮
			var ec_id='${param.ec_id}';
			var oldOrNew='${oldOrNew}';
			//var ec_auditStatus=0;
			if(ec_id==null||ec_id==""){
				ec_id='${ec_id}';
			}
			
			
			pullValue(ec_id,oldOrNew);
			//新增
			
			$("#btn_check").click(function(){ 
			    var url ="dtaqWarnSignAction.do?method=stationTree";
			  	art.dialog({id:'commonDialog1',title:'站点选择', iframe:url, width:'800', height:'400',top:'30'});
			});  
			
		});
		//刷新
		
		
	  	//设置list页面id
	//	function setPullValue(common_oper_id,mutil_auditStatus,select_count){
		function setPullValue(common_oper_id,select_count){
			oper_id=common_oper_id;
			var operObj = $("input[type=radio][name='select_id'][checked]");
			var state=operObj.attr("paramStatus");
			if(state==1){
				$("#btn_edit").show();
			}else{
				$("#btn_edit").hide();
			}
			if(select_count==1){
			$("#btn_edit").show();
			$("#btn_delete").show();
			}else{
			$("#btn_edit").hide();
			$("#btn_delete").hide();
			}
		}
		function viewAnalyse(id){
		var url ='dtaqWarnSignAction.do?method=view&ec_id='+id+'&qstartDate=${param.qstartDate}&qendDate=${param.qendDate}&station_id=${param.station_id}&fid='+id+'&ec_p='+$("input[name='ec_p']").val()+'&ec_crd='+$("[name='ec_rd']").val(); 
			commonUrl(url);
		}
	</script>
</head>
<content tag="heading">
	批示信息查询中心
</content>
<body >
	<table class="queryTable" >
		<tr>
			<td class="queryTitle">
				<span >查询条件</span>
			</td>
		</tr>
		<tr>
			<td>
				<html:form action="dtaqWarnSignAction.do?method=list&ec_p=${param.ec_p}&ec_id=${param.id}&ec_crd=${param.ec_crd}">
					<table align="left">
						       <tr>
								<td>批阅日期：</td>
								<td>
									<input type="text"  name="qstartDate"  class="inputText" value="${qstartDate}"  onfocus="WdatePicker()" />--<input type="text"  name="qendDate"  class="inputText" value="${qendDate}" onfocus="WdatePicker()" />
								</td>
								
							   <td>批阅人：</td>
								<td>
								<html:text  property="qsigner"   />
								</td>
							     <td>工点：</td>
							   <html:hidden property="station_id" />
							   <td>
							   <html:text property="station_name"  style="width:200px;" />
						       
						
							    </td>
						 		
								<td align="right">
								<div class="saveDiv"><input id="btn_check" value="选择" type="button" icon="icon_save"/>
									<input type="submit" value="查询" icon="icon_query" /></div>
								</td>
						</tr>
					</table>
				</html:form>
			</td>
		</tr>
	</table>

<ec:table items="dtaqWarnSigns" var="dtaqWarnSign" action="dtaqWarnSignAction.do"
	title="" width="100%"  sortable="false" rowsDisplayed="10"
	imagePath="${ctx}/styles/extremecomponents/images/*.gif" locale="zh_CN" 
	retrieveRowsCallback="limit" filterRowsCallback="limit" sortRowsCallback="limit">
  	<ec:row highlightRow="true" onclick="pullValue('${dtaqWarnSign.id}');" ondblclick="showView('${dtaqWarnSign.id}');">
		<ec:column property="rowcount" cell="rowCount" sortable="false" title="序号" width="5%"/>
		
		<ec:column property="station_id" title="工点" width="200px">
			
					<a href="javascript:viewAnalyse('${dtaqWarnSign.extendid}')"><c:out value="${dtaqWarnSign.station_id.station_name}" /></a>
				
		</ec:column>
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
</body>

</html:html>
