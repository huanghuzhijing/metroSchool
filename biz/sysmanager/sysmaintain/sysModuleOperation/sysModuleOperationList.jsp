<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
<html:html>
<head>
<script type="text/javascript" src="${ctx}/scripts/enterKey.js" ></script>
	<script type="text/javascript">
		$(document).ready(function(){
			//
			$("#btn_add").click(function(){ 
				location.href = 'sysModuleOperationAction.do?method=create&staticModuleId=${param.staticModuleId }';
			}); 
			//
			$(".btn_edit").click(function(){ 
				location.href = 'sysModuleOperationAction.do?method=edit&staticModuleId=${param.staticModuleId}&f_mmid='+$(this).attr("paramid")+'&qcommandcode='+$("input[name='qcommandcode']").val()+'&qcommandname='+$("input[name='qcommandname']").val();
			}); 
			//
			$(".btn_delete").click(function(){ 
				ret = window.confirm('${texts['dtaq.common.delete.msg']}');
				if(ret){
					location.href='sysModuleOperationAction.do?method=delete&staticModuleId=${param.staticModuleId}&f_mmid='+$(this).attr("paramid");
				}
			});
			//
			$("#btn_back").click(function(){ 
				parent.art.dialog({id:'commonDialog1'}).close();
			}); 
			//
		});
		
		function pageRefresh(){
			location.href='sysModuleOperationAction.do?method=list&staticModuleId=${param.staticModuleId }';
		}
	</script>
</head>
<content tag="heading">
	模块指令管理
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
				<html:form action="sysModuleOperationAction.do?method=list&staticModuleId=${param.staticModuleId }">
					<table class="queryContentTable">
						<tr>
							<td >指令名称：</td>
							<td><html:text property="qcommandname" maxlength="25" styleClass="inputText"></html:text></td>

							<td >指令代码：</td>
							<td><html:text property="qcommandcode" maxlength="25" styleClass="inputText"></html:text></td>
							<td >
								<input type="submit" icon="icon_query" value="${texts['button.query']}" />
							</td>
						</tr>
					</table>
				</html:form>
			</td>
		</tr>
	</table>
		<div class="listButtonDiv">
			<input id="btn_back" value="关闭" type="button" icon="icon_back"/>
			<input id="btn_add" value="${texts['button.new']}" type="button" icon="icon_add" />
		</div>
	<ec:table items="sysModuleOperations" var="sysModuleOperation"
		action="sysModuleOperationAction.do?method=list&staticModuleId=${param.staticModuleId }" title=""  locale="zh_CN"
		sortable="false" rowsDisplayed="10" imagePath="${ctx}/styles/extremecomponents/images/*.gif"
		retrieveRowsCallback="limit" filterRowsCallback="limit" sortRowsCallback="limit" >
		<ec:row highlightRow="true"	>
			<ec:column property="rowcount" cell="rowCount" sortable="false" title="序号" />
			<ec:column property="f_mid.f_mname" title="所属模块" />
			<ec:column property="f_mname" title="指令码名称" />
	
			<ec:column property="f_mcode" title="指令代码" />
			<ec:column property="null" title="${texts['label.operate']}" >
				<input type="button" class="btn_edit" icon="icon_edit" value="${texts['button.edit']}" paramId="${sysModuleOperation.f_mmid}"/>
				<input type="button" class="btn_delete" icon="icon_edit" value="${texts['button.delete']}" paramId="${sysModuleOperation.f_mmid}"/>
			</ec:column>
		</ec:row>
	</ec:table>
</body>
</html:html>
