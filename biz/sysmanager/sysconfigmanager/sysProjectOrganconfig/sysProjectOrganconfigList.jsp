<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
<html:html>
<head>
<script type="text/javascript" src="${ctx}/scripts/enterKey.js" ></script>
	<script type="text/javascript">
		var oper_id="";
		$(document).ready(function(){
			//
			$("#btn_delete").hide();
			pullValue('${param.ec_id}');
			//
			$("#btn_add").click(function(){ 
			 	location.href='sysProjectOrganconfigAction.do?method=create';
			}); 
			//
			$("#btn_delete").click(function(){ 
				ret = window.confirm('${texts['dtaq.common.delete.msg']}');
				if(ret){
					location.href='sysProjectOrganconfigAction.do?method=delete&id='+oper_id;
				}
			});
			//
		});
		
		function pullValue(mutil_id){ 
			var select_count=0;
			var sels=$("input[name='select_id']");
			for(i=0;i<sels.length;i++){
				if(sels[i].value==mutil_id){
					select_count++;
					oper_id=mutil_id;
					sels[i].checked=true;
				}
			}
			if(select_count!=0){
				if(oper_id!=""){
					$("#btn_delete").show();
				}else{
					$("#btn_delete").hide();
				}
			}
		}
	</script>
</head>
<content tag="heading">
	员工项目配置
</content>
<body >
	<table class="queryTable" >
		<tr>
			<td class="queryTitle">
				<span >&nbsp;[${texts['dtaq.common.query_field']}]&nbsp;</span>
			</td>
		</tr>
		<tr>
			<td>
				<html:form action="sysProjectOrganconfigAction.do?method=list">
					<table class="queryContentTable">
						<tr>
							<td >项目名称：</td>
							<td><html:text property="qprjname" maxlength="25" styleClass="inputText"></html:text></td>
							<td >
								<input type="submit" icon="icon_query" value="${texts['button.query']}" />
							</td>
						</tr>
					</table>
				</html:form>
			</td>
		</tr>
	</table>
		<div  class="listButtonDiv">
			<input id="btn_add" value="${texts['button.new']}" type="button" icon="icon_add" />
			<input id="btn_delete" value="${texts['button.delete']}" type="button" icon="icon_delete" />
		</div>
	<ec:table items="sysProjectOrganconfigs" var="sysProjectOrganconfig"
		action="sysProjectOrganconfigAction.do?method=list" title=""  locale="zh_CN"
		sortable="false" rowsDisplayed="10" imagePath="${ctx}/styles/extremecomponents/images/*.gif"
		retrieveRowsCallback="limit" filterRowsCallback="limit" sortRowsCallback="limit"
	>
		<ec:row highlightRow="true" 	onclick="pullValue('${sysProjectOrganconfig.id}');"
		>
			<ec:column property="rowcount" cell="rowCount" sortable="false" title="序号" />
			<ec:column property="null" sortable="false" title="选择" >
				<input name="select_id" value="${sysProjectOrganconfig.id}" type="radio"/>
			</ec:column>
			<ec:column property="prjname" title="项目名称" />
			<ec:column property="periodsname" title="项目周期名称" />
			<ec:column property="modulename" title="模块名称" />
			<ec:column property="empname" title="人员" />
		</ec:row>
	</ec:table>
</body>
</html:html>
