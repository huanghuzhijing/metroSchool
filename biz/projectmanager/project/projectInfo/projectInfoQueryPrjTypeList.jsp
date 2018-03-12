<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>
<ex:bundle/>
<html:html>
<head>
<script type="text/javascript" src="${ctx}/scripts/dtree/dtree.js"></script>
<link rel="StyleSheet" href="${ctx}/scripts/dtree/css/dtree.css" type="text/css" />
<script type="text/javascript" src="${ctx}/scripts/enterKey.js" ></script>
<script type="text/javascript">
	var oper_id="";
	//加载
	$(document).ready(function(){
		//
		$("#btn_view").hide();
		//增加按钮控制
		var staticPrjStatus='${param.staticPrjStatus}';
		var staticPrjType='${param.staticPrjType}';
		if(staticPrjStatus==""&&staticPrjType==""){
			$(".promptDiv").hide();
		}
		//控制按钮
		var ec_id='${param.ec_id}';
		var ec_auditStatus='${param.ec_auditStatus}';
		if(ec_id==null||ec_id==""){
			ec_id='${ec_id}';
			ec_auditStatus='${ec_auditStatus}';
		}
		pullValue(ec_id,ec_auditStatus);
		$("#btn_view").click(function(){ 
			showView(oper_id);
		});
	});
	
	//详细页面
	function showView(id){
    	var url ='projectInfoAction.do?method=view'+'&id='+id+'&ec_p='+$("input[name='ec_p']").val()+'&ec_crd='+$("[name='ec_rd']").val()+'&staticPrjStatus=${param.staticPrjStatus}&staticPrjType=${param.staticPrjType}&viewFlag=1';
		commonUrl(url);
  	}
  	//设置list页面id
	function setPullValue(common_oper_id,mutil_auditStatus,select_count){
		oper_id=common_oper_id;
		if(select_count!=0){
		}	
	}
	       	//指令码判断
	function checkCmd(){
		var cmdIds='${userinfo.cmdIds}';
	}
</script>
</head>
<content tag="heading">
项目类型
</content>  
<body > 
<table width="100%" border="0" cellspacing="0" cellpadding="0"> 
       <tr>
       	 <td valign="top" width="150px"> 
	          <div style="overflow: auto;width: 150px;">
					<script language='javascript'>
						var projectInfoTree = new dTree('projectInfoTree');
						projectInfoTree.setIconPath("${ctx}/scripts/dtree/");
						projectInfoTree.add('-1',-99,'项目总汇(${totalPrjCount})','${ctx}/projectInfoAction.do?method=queryList&flag=1&staticParentId=-1');
						<c:forEach items="${prjTypeTrees}" var="prjTypeTree">		
							projectInfoTree.add('${prjTypeTree.nodeId}','${prjTypeTree.parentId}','${prjTypeTree.nodeName}(${prjTypeTree.prjCount})','projectInfoAction.do?method=queryList&flag=1&staticPrjStatus=${prjTypeTree.prjStatus}&staticPrjType=${prjTypeTree.prjType}','','','','');
						</c:forEach>
						document.write(projectInfoTree);
						projectInfoTree.openAll();
					</script>
				</div>
		 </td>
         <td valign="top">
	          <table class="queryTable" >
					<tr>
						<td class="queryTitle">
							<span >&nbsp;[${texts['dtaq.common.query_field']}]&nbsp;</span>
						</td>
					</tr>
					<tr>
						<td>
							<html:form action="projectInfoAction.do?method=queryList&flag=1&staticPrjStatus=${param.staticPrjStatus}&staticPrjType=${param.staticPrjType}">
								<table class="queryContentTable">
									<tr>
										<td >
											项目编号：
										</td>
										<td>
											<html:text property="qprjCode" styleClass="inputText" maxlength="100"></html:text>
										</td>
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
				<div class="promptDiv">
					项目个数：<span class="redSpan">${currentPrjCount}</span>
					项目状态：<span class="redSpan"><ex:dicDisplay dictIdentify="PrjStatus" dictValue="${param.staticPrjStatus}"/></span>
					项目类型：<span class="redSpan"><ex:dicDisplay dictIdentify="PrjType" dictValue="${param.staticPrjType}"/></span>	
				</div>
				<div  class="listButtonDiv">
					<input id="btn_view" value="${texts['button.detail']}" type="button" icon="icon_view"/>
				</div>
				<ec:table items="projectInfos" var="projectInfo" 
					action="projectInfoAction.do?method=queryList&flag=1&staticPrjStatus=${param.staticPrjStatus}&staticPrjType=${param.staticPrjType}" title=""  locale="zh_CN"
					sortable="false" rowsDisplayed="10" imagePath="${ctx}/styles/extremecomponents/images/*.gif"
					retrieveRowsCallback="limit" filterRowsCallback="limit" sortRowsCallback="limit"
				>
					<ec:row highlightRow="true" ondblclick="showView('${projectInfo.id}');"
							onclick="pullValue('${projectInfo.id}','${projectInfo.auditStatus}');"
					>
						<ec:column property="rowcount" cell="rowCount" sortable="false" title="序号" width="6%"/>
						<ec:column property="null" sortable="false" title="选择" width="6%" >
							<input name="select_id" value="${projectInfo.id}" type="radio" auditStatus='${projectInfo.auditStatus}' />
						</ec:column>
						<ec:column property="prjCode" title="项目<br/>编号" width="8%"/>
						<ec:column property="prjName" title="项目名称" width="15%"/>
						<ec:column property="PrjType" title="项目<br/>类型" width="6%">
							<ex:dicDisplay dictIdentify="PrjType" dictValue="${projectInfo.prjType}"/>	
						</ec:column>
						<ec:column property="approvalDate" title="立项日期" cell="date" width="12%"/>
						<ec:column property="investSize" title="投资额<br/>(万元)" styleClass="tdRight" width="12%">
							<fmt:formatNumber pattern="#,##0.0000" value="${projectInfo.investSize}" />
						</ec:column>	
						<ec:column property="null" title="项目<br/>状态" width="6%">
							<ex:dicDisplay dictIdentify="PrjStatus" dictValue="${projectInfo.prjStatus}"/>	
						</ec:column>
					</ec:row>
				</ec:table> 
		</td>
		</tr>
	</table>		
  </body>
</html:html>
