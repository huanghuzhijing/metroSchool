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
				var url = "sysUsergroupAction.do?method=create";
				art.dialog({id:'commonDialog1',title:'用户组管理', iframe:url, width:'600', height:'350',top:'30'});
			}); 
			//
			$(".btn_edit").click(function(){ 
			    
				var url = "sysUsergroupAction.do?method=edit&id="+$(this).attr("paramid");
				
				art.dialog({id:'commonDialog1',title:'用户组管理', iframe:url, width:'500', height:'250',top:'30'});
			}); 
			//
			$(".btn_delete").click(function(){ 
				ret = window.confirm('将此用户组关联的用户组员工信息一并删除，是否确定删除？');
				if(ret){
					location.href='sysUsergroupAction.do?method=delete&id='+$(this).attr("paramid");
				}
			});
			//
		});
		
		function pageRefresh(){
			location.href='sysUsergroupAction.do?method=list'+'&pageIndex='+$("input[name='ec_p']").val();
			document.forms[0].submit();
		}
	</script>
</head>
<content tag="heading">
	用户组管理
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
				<html:form action="sysUsergroupAction.do?method=list">
					<table class="queryContentTable">
						<tr>
							<td >岗位名称：</td>
							<td><html:text property="qusergroupname" maxlength="25" styleClass="inputText"></html:text></td>
							<td >
								<input type="submit" value="${texts['button.query']}" icon="icon_query"  />
							</td>
						</tr>
					</table>
				</html:form>
			</td>
		</tr>
	</table>

		<div  class="listButtonDiv">
			<input  id="btn_add" type="button" icon="icon_add"  value="新  增"  />
		</div>
	
	<ec:table items="sysUsergroups" var="sysUsergroup" 
		action="sysUsergroupAction.do" title=""  locale="zh_CN"
		sortable="false" rowsDisplayed="10" imagePath="${ctx}/styles/extremecomponents/images/*.gif"
		retrieveRowsCallback="limit" filterRowsCallback="limit" sortRowsCallback="limit"
	>
		<ec:row highlightRow="true" >
			<ec:column property="rowcount" cell="rowCount" sortable="false" title="序号" />
			<ec:column property="usergroupname" title="岗位名称" />
			<ec:column property="memo" title="岗位描述" />
			<ec:column property="orderNo" title="排列号" />	
			<ec:column property="null" title="${texts['label.operate']}" >
				<input type="button" class="btn_edit"  value="${texts['button.edit']}" icon="icon_edit" paramid="${sysUsergroup.id}"/>
				<input type="button" class="btn_delete" value="${texts['button.delete']}" icon="icon_delete" paramid="${sysUsergroup.id}"/>
			</ec:column>
		
		</ec:row> 
	</ec:table>
</body>
</html:html>
"