<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
<html:html>
<head>
<%@ include file="/commons/meta.jsp"%>
	<script type="text/javascript">
		$(document).ready(function(){
			var prjIds=parent.$("#plugTemp_prjIds").val();
			var prjNames=parent.$("#plugTemp_prjNames").val();
			var prjCodes=parent.$("#plugTemp_prjCodes").val();
			$.each( $(".cbox_select"), function(i, obj){
				if(prjIds.indexOf(","+$(this).val()+",")>-1){
					obj.checked=true;
				}
			});
			//
			$("#btn_save").click(function(){
				var operObj = $("[name='select_id']:checked");
       			var length = operObj.length;
       			if(length<0){
					alert("请至少选择一个项目");
				}else{
				prjIds="";
				prjNames="";
				prjCodes="";
					 $("[name='select_id']:checked").each(function(i){
		       			if(prjIds==""){
								prjIds=","+$(this).val()+",";
							}else{
								prjIds=prjIds+$(this).val()+",";
							}
							if(prjNames==""){
								prjNames=$(this).attr("paramName");
							}else{
								prjNames=prjNames+","+$(this).attr("paramName");
							}
							if(prjCodes==""){
								prjCodes=$(this).attr("paramArray");
							}else{
								prjCodes=prjCodes+","+$(this).attr("paramArray");
							}
						
		       		 })
		       		 	    parent.$("#plug_prjIds").val(prjIds); 
							parent.$("#plug_prjNames").val(prjNames);
							parent.$("#plug_prjCodes").val(prjCodes);
					        parent.art.dialog({id:'commonDialog1'}).close();
		
				}
			});
			//
			//
			$("#btn_close").click(function(){
				parent.art.dialog({id:'commonDialog1'}).close();
			}); 
			//
			
		});
	</script>
</head>
<body>
	 <table class="queryTable" >
		<tr>
			<td class="queryTitle">
				<span >&nbsp;[${texts['dtaq.common.query_field']}]&nbsp;</span>
			</td>
		</tr>
		<tr>
			<td>
				<html:form action="contentSelectAction.do?method=selectPrjs&queryType=${param.queryType}">
					<table class="queryContentTable">
						<tr>
							<td >
								项目名称：
							</td>
							<td>
								<html:text property="qprjName" styleClass="inputText" maxlength="100"></html:text>
							</td>
							<td >
								<input type="submit" value="${texts['button.query']}" icon="icon_query" />
							</td>
						</tr>
					</table>
				</html:form>
			</td>
		</tr>
	</table>
	<ec:table items="projectInfos" var="projectInfo" 
		action="contentSelectAction.do?method=selectPrjs&queryType=${param.queryType}" title=""  locale="zh_CN"
	  	sortable="false" rowsDisplayed="10" imagePath="${ctx}/styles/extremecomponents/images/*.gif"
	  	retrieveRowsCallback="limit" filterRowsCallback="limit" sortRowsCallback="limit"
	>
		<ec:row highlightRow="true" >
			<ec:column property="rowcount" cell="rowCount" sortable="false" title="序号" width="8%"/>
			<ec:column property="null" title="选择" width="8%">
				<input name='select_id' value="${projectInfo.id}" type="checkbox" class="cbox_select" paramName="${projectInfo.prjName}" paramArray="${projectInfo.prjCode}">
			</ec:column>
			<ec:column property="prjCode" title="项目<br/>编号" width="8%"/>
			<ec:column property="prjName" title="项目名称" width="15%"/>
			<ec:column property="PrjType" title="项目<br/>类型" width="6%">
				<ex:dicDisplay dictIdentify="PrjType" dictValue="${projectInfo.prjType}"/>	
			</ec:column>
			<ec:column property="approvalDate" title="立项日期" cell="date" width="12%"/>
			<ec:column property="investSize" title="投资规模<br/>(万元)" styleClass="tdRight" width="12%">
				<fmt:formatNumber pattern="#,##0.0000" value="${projectInfo.investSize}" />
			</ec:column>	
			<ec:column property="null" title="项目<br/>状态" width="6%">
				<ex:dicDisplay dictIdentify="PrjStatus" dictValue="${projectInfo.prjStatus}"/>	
			</ec:column>
		</ec:row>
	</ec:table>
		<div class="saveDiv">
			<input id="btn_save" type="button"  icon="icon_save"  value="${texts['button.save']}"  />
			<input id="btn_close" type="button"  icon="icon_close"  value="${texts['button.close']}"  />
		</div>
</body>
</html:html>
