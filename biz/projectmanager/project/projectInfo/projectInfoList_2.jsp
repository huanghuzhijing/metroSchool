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
		$("#btn_edit").hide();
		$("#btn_delete").hide();
		$("#btn_view").hide();
		$("#btn_submit").hide();
		$("#btn_editBudget").hide();
		$("#btn_trackedit").hide(); 
		$("#btn_manView").hide();
		$("#btn_manConfig").hide();
		$("#btn_pass").hide();
		$("#btn_nopass").hide();
		$("#btn_editPrjStatus").hide();
		//增加按钮控制
		var staticPrjStatus='${param.staticPrjStatus}';
		var staticPrjType='${param.staticPrjType}';
		if(staticPrjStatus==""||staticPrjType==""){
			$("#btn_add").hide();
		}
		//控制按钮
		var ec_id='${param.ec_id}';
		var ec_auditStatus='${param.ec_auditStatus}';
		if(ec_id==null||ec_id==""){
			ec_id='${ec_id}';
			ec_auditStatus='${ec_auditStatus}';
		}
		pullValue(ec_id,ec_auditStatus);
		//
		$("#btn_add").click(function(){ 
			location.href='projectInfoAction.do?method=create&staticPrjStatus=${param.staticPrjStatus}&staticPrjType=${param.staticPrjType}&staticFootNode=${param.staticFootNode}&flag=${param.flag}';
		}); 
		//
		$("#btn_edit").click(function(){
			commonEdit(oper_id);
		}); 
		//
		$("#btn_delete").click(function(){ 
			ret = window.confirm('${texts['dtaq.common.delete.msg']}');
			if(ret){
				var url='projectInfoAction.do?method=delete&staticPrjStatus=${param.staticPrjStatus}&id='+oper_id+'&ec_p='+$("input[name='ec_p']").val()+'&staticPrjType=${param.staticPrjType}&staticFootNode=${param.staticFootNode}&flag=${param.flag}';
				commonUrl(url);
			}
		});
		//
		$("#btn_view").click(function(){ 
			showView(oper_id);
		});
		//
		$("#btn_editBudget").click(function(){
			var url='prjBudgetManagerAction.do?method=list&staticPrjStatus=${param.staticPrjStatus}&editPrjId='+oper_id+'&parent_ec_p='+$("input[name='ec_p']").val()+'&staticPrjType=${param.staticPrjType}&staticFootNode=${param.staticFootNode}&flag=${param.flag}';
			commonUrl(url);
		}); 
		//
		$("#btn_trackedit").click(function(){
			commonEdit(oper_id);
		}); 
		//提交
       $("#btn_submit").click(function(){
       		ret = window.confirm("是否上报？");
			if(ret){
				var url='projectInfoAction.do?method=upReport&id='+oper_id+'&ec_p='+$("input[name='ec_p']").val()+'&staticPrjStatus=${param.staticPrjStatus}&staticPrjType=${param.staticPrjType}&staticFootNode=${param.staticFootNode}&flag=${param.flag}'+'&ec_auditStatus=1&ec_id='+oper_id;
      			commonUrl(url);
			}
       });
       //
       $("#btn_pass").click(function(){
       		ret = window.confirm("是否复核？");
			if(ret){
				var url='projectInfoAction.do?method=pass&id='+oper_id+'&ec_p='+$("input[name='ec_p']").val()+'&staticPrjStatus=${param.staticPrjStatus}&staticPrjType=${param.staticPrjType}&staticFootNode=${param.staticFootNode}&flag=${param.flag}'+'&ec_auditStatus=-1&ec_id='+oper_id;
      			commonUrl(url);
			}
       });
       //
       $("#btn_nopass").click(function(){
       		ret = window.confirm("是否驳回？");
			if(ret){
				var url='projectInfoAction.do?method=nopass&id='+oper_id+'&ec_p='+$("input[name='ec_p']").val()+'&staticPrjStatus=${param.staticPrjStatus}&staticPrjType=${param.staticPrjType}&staticFootNode=${param.staticFootNode}&flag=${param.flag}'+'&ec_auditStatus=-2&ec_id='+oper_id;
      			commonUrl(url);
			}
       });
       $("#btn_manView").click(function(){
      		var url ='projectInfoAction.do?method=manView'+'&id='+oper_id+'&ec_p='+$("input[name='ec_p']").val()+'&staticPrjStatus=${param.staticPrjStatus}&staticPrjType=${param.staticPrjType}&staticFootNode=${param.staticFootNode}&flag=${param.flag}';
			commonUrl(url);
       });
       //
       $("#btn_manConfig").click(function(){
      		var url ='projectInfoAction.do?method=manConfig'+'&id='+oper_id+'&ec_p='+$("input[name='ec_p']").val()+'&staticPrjStatus=${param.staticPrjStatus}&staticPrjType=${param.staticPrjType}&staticFootNode=${param.staticFootNode}&flag=${param.flag}';
			commonUrl(url);
       });
       //
       $("#btn_editPrjStatus").click(function(){
      		var url ='projectInfoAction.do?method=editPrjStatus'+'&id='+oper_id;
			art.dialog({id:'commonDialog1',title:'项目管理', iframe:url, width:'550', height:'210'});
       });
       //
	});
	
	//详细页面
	function showView(id){
    	var url ='projectInfoAction.do?method=view'+'&id='+id+'&ec_p='+$("input[name='ec_p']").val()+'&staticPrjStatus=${param.staticPrjStatus}&staticPrjType=${param.staticPrjType}&staticFootNode=${param.staticFootNode}&flag=${param.flag}'+'&viewFlag=true';
		commonUrl(url);
  	}
  	//编辑页面
	function commonEdit(id){
    	var url='projectInfoAction.do?method=edit&staticPrjStatus=${param.staticPrjStatus}&id='+id+'&ec_p='+$("input[name='ec_p']").val()+'&staticPrjType=${param.staticPrjType}&staticFootNode=${param.staticFootNode}&flag=${param.flag}';
		commonUrl(url);
  	}
  	//设置list页面id
	function setPullValue(common_oper_id,mutil_auditStatus,select_count){
		oper_id=common_oper_id;
		if(select_count!=0){
			if(oper_id!=""){
				if(mutil_auditStatus==0){
					$("#btn_editBudget").hide();
					$("#btn_trackedit").hide();
					$("#btn_manConfig").hide();
					$("#btn_pass").hide();
					$("#btn_nopass").hide();
					$("#btn_editPrjStatus").hide();
				}else if(mutil_auditStatus==1){
					$("#btn_editBudget").hide();
					$("#btn_trackedit").hide();
					$("#btn_manConfig").hide();
					$("#btn_pass").show();
					$("#btn_nopass").show();
					$("#btn_editPrjStatus").hide();
				}else if(mutil_auditStatus==-2){
					$("#btn_editBudget").hide();
					$("#btn_trackedit").hide();
					$("#btn_manConfig").hide();
					$("#btn_pass").hide();
					$("#btn_nopass").hide();
					$("#btn_editPrjStatus").hide();
				}else if(mutil_auditStatus==-1){
					$("#btn_editBudget").show();
					$("#btn_trackedit").show();
					$("#btn_manConfig").show();
					$("#btn_pass").hide();
					$("#btn_nopass").hide();
					$("#btn_editPrjStatus").show();
				}else{
					$("#btn_editBudget").hide();
					$("#btn_trackedit").hide();
					$("#btn_manConfig").hide();
					$("#btn_pass").hide();
					$("#btn_nopass").hide();
					$("#btn_editPrjStatus").hide();
				}
				$("#btn_manView").show();
			}else{
				$("#btn_editBudget").hide();
				$("#btn_trackedit").hide();
				$("#btn_manView").hide();
				$("#btn_manConfig").hide();
				$("#btn_pass").hide();
				$("#btn_nopass").hide();
				$("#btn_editPrjStatus").hide();
			}
		}	
	}
	//指令码判断
	function checkCmd(){
		var cmdIds='${userinfo.cmdIds}';
		if(!isContains(cmdIds,",projectInfo_add,"))$("#btn_add").hide();
		if(!isContains(cmdIds,",projectInfo_edit,"))$("#btn_edit").hide();
		if(!isContains(cmdIds,",projectInfo_trackedit,"))$("#btn_trackedit").hide();
		if(!isContains(cmdIds,",projectInfo_delete,"))$("#btn_delete").hide();
		if(!isContains(cmdIds,",projectInfo_editBudget,"))$("#btn_editBudget").hide();
		if(!isContains(cmdIds,",projectInfo_editPrjStatus,"))$("#btn_editPrjStatus").hide();
	}
	//刷新页面
	function pageRefresh(){
		var url='projectInfoAction.do?method=list&ec_p='+$("input[name='ec_p']").val()+'&staticPrjStatus=${param.staticPrjStatus}&staticPrjType=${param.staticPrjType}&staticFootNode=${param.staticFootNode}&flag=${param.flag}';
      	commonUrl(url);
	}
</script>
</head>
<content tag="heading">
项目管理
</content>  
<body > 
<table width="100%" border="0" cellspacing="0" cellpadding="0"> 
       <tr>
       	 <td valign="top" > 
	          <div style="overflow: auto;"  >
					<script language='javascript'>
						var projectInfoTree = new dTree('projectInfoTree');
						projectInfoTree.setIconPath("${ctx}/scripts/dtree/");
						projectInfoTree.add('-1',-99,'项目总汇(${totalPrjCount})','${ctx}/projectInfoAction.do?method=list&staticPrjStatus=${param.staticPrjStatus}&flag=${param.flag}');
						<c:forEach items="${prjTypeTrees}" var="typeTree">		
							projectInfoTree.add('${typeTree.nodeId}','-1','${typeTree.nodeName}(${typeTree.prjCount})','projectInfoAction.do?method=list&staticPrjType=${typeTree.nodeId}&staticFootNode=${prjSort.footNode}&staticPrjStatus=${param.staticPrjStatus}&flag=${param.flag}','','','','');
						</c:forEach>
						document.write(projectInfoTree);
						projectInfoTree.openAll();
					</script>
				</div>
		 </td>
         <td valign="top" width="85%">
	          <table class="queryTable" >
					<tr>
						<td class="queryTitle">
							<span >&nbsp;[${texts['dtaq.common.query_field']}]&nbsp;</span>
						</td>
					</tr>
					<tr>
						<td>
							<html:form action="projectInfoAction.do?method=list&staticPrjStatus=${param.staticPrjStatus}&staticPrjType=${param.staticPrjType}&staticFootNode=${param.staticFootNode}&flag=${param.flag}">
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
											审核状态：
										</td>
										<td>
											<ex:dictSelect property="qauditStatus" type="UP_AuditStatus"/> 
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
					<c:if test="${not empty param.staticPrjType}">
						项目类别：<span class="redSpan"><ex:dicDisplay dictIdentify="PrjType"  dictValue="${param.staticPrjType}"/></span>	
					</c:if>
				</div>
				<div  class="listButtonDiv">
					<input id="btn_add" value="${texts['button.new']}" type="button" icon="icon_add" />
					<input id="btn_view" value="${texts['button.detail']}" type="button" icon="icon_view"/>
					<input id="btn_edit" value="${texts['button.edit']}" type="button" icon="icon_edit" />
					<%-- 
					<input id="btn_submit" value="${texts['button.upreport']}" type="button" icon="icon_submit"/>
					--%>
					<input id="btn_trackedit" value="跟踪维护" type="button" icon="icon_edit" />
					<input id="btn_delete" value="${texts['button.delete']}" type="button" icon="icon_delete" />
					<input type="button" id="btn_submit"    icon="icon-reload"   class="button1 hidden " value="上  报"/>
					<input id="btn_pass" value="复  核" type="button" icon="icon_edit" />
					<input id="btn_nopass" value="驳  回" type="button" icon="icon_edit" />
					<input id="btn_editPrjStatus" value="变更项目状态" type="button" icon="icon_edit"/>
					<input id="btn_editBudget" value="工程概算编辑" type="button" icon="icon_edit"/>
				</div>
				<ec:table items="projectInfos" var="projectInfo"  
					action="projectInfoAction.do?method=list&staticPrjStatus=${param.staticPrjStatus}&staticPrjType=${param.staticPrjType}" title=""  locale="zh_CN"
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
						<%-- 
						<ec:column property="PrjType" title="项目<br/>类型" width="6%">
							<ex:dicDisplay dictIdentify="PrjType" dictValue="${projectInfo.prjType}"/>	
						</ec:column>
						--%>
						<ec:column property="approvalDate" title="立项日期" cell="date" width="12%"/>
						<ec:column property="investSize"  title="投资额<br/>(万元)" styleClass="tdRight" width="12%">
							<fmt:formatNumber pattern="#,##0.0000" value="${projectInfo.investSize}" />
						</ec:column>	
						<ec:column property="null" title="项目<br/>状态" width="6%">
							<ex:dicDisplay dictIdentify="PrjStatus" dictValue="${projectInfo.prjStatus}"/>	
						</ec:column>
						<ec:column property="auditStatus" title="审核状态" width="8%">
							<ex:dicDisplay dictIdentify="AuditState" dictValue="${projectInfo.auditStatus}"/>
						</ec:column>
					</ec:row>
				</ec:table> 
		</td>
		</tr>
	</table>		
  </body>
</html:html>
