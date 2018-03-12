<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
<html:html>
<head>
<script type="text/javascript" src="${ctx}/scripts/enterKey.js" ></script>
	<script type="text/javascript">
	var oper_id="";
		$(document).ready(function(){
		var ec_id='${param.ec_id}';
		var ec_auditStatus='${param.ec_auditStatus}';
		if(ec_id==null||ec_id==""){
			ec_id='${ec_id}';
			ec_auditStatus='${ec_auditStatus}';
		}
		pullValue(ec_id,ec_auditStatus);
			//
			$("#btn_add").click(function(){
				location.href='sysRoleAction.do?method=create&flag=1&qrolename='+$("input[name='qrolename']").val()+'&midName='+$("[name='midName']").val()+'&ec_crd='+$("[name='ec_rd']").val();
			}); 
			//
			$("#btn_edit").click(function(){
				var url ='sysRoleAction.do?method=edit&flag=1&&qrolename='+$("input[name='qrolename']").val()+'&midName='+$("[name='midName']").val()+'&f_rid='+oper_id+'&ec_p='+$("input[name='ec_p']").val()+'&ec_crd='+$("[name='ec_rd']").val();
				commonUrl(url); 
			}); 
			//
			$("#btn_delete").click(function(){ 
				var deleteId=oper_id;
				if(deleteId==1||deleteId==2){
					alert("系统默认角色，不能删除!");
				}else{
					ret = window.confirm('删除角色信息的同时删除赋予给用户的对应角色信息,${texts['dtaq.common.delete.msg']}');
					if(ret){
						location.href='sysRoleAction.do?method=delete&f_rid='+deleteId+"&ec_p="+$("input[name='ec_p']").val();
					}
				}
			});
			//
			$(".btn_copyadd").click(function(){ 
				var url ='sysRoleAction.do?method=edit&saveparam=1&id='+$(this).attr("paramid")+'&pageIndex='+$("input[name='ec_p']").val();
				location.href=url;
			});
			//
			//
			$(".btn_platset").click(function(){ 
				var url ='sysRoleAction.do?method=platformset&id='+$(this).attr("paramid")+'&pageIndex='+$("input[name='ec_p']").val();
				location.href=url;
			});
			//
		});
		//设置list页面id
	function setPullValue(common_oper_id,mutil_auditStatus,select_count){
		oper_id=common_oper_id;
	}
		function commonUrl(url){
			document.forms[0].action=url;   
		    document.forms[0].submit();   
		}
	</script>
</head>
<content tag="heading">
	系统角色权限配置
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
				<html:form action="sysRoleAction.do?method=list">
					<table class="queryContentTable">
						<tr>
							<td >角  色  名：</td>
							<td><html:text styleClass="inputText" property="qrolename" maxlength="25" ></html:text></td>
								<td >所属模块：</td>
							<td> <html:select property="midName">
								<html:option value="">请选择</html:option>
								<c:forEach items="${lists}" var="f_mid1">
									<html:option value="${f_mid1.f_mid}" >${f_mid1.f_mname}</html:option>
								</c:forEach>
									
							</html:select></td>
							<td >
								<input type="submit" icon="icon_query" value="${texts['button.query']}" />
							</td>
						</tr>
					</table>
				</html:form>
			</td>
		</tr>
	</table>
		<div align="right" class="listButtonDiv">
			<input id="btn_add"  value="${texts['button.new']}" type="button" icon="icon_add"/>
			
			<input id="btn_edit" value="${texts['button.edit']}" type="button" icon="icon_edit" />
			<input id="btn_delete" value="${texts['button.delete']}" type="button" icon="icon_delete" />
		</div>
	<ec:table items="sysRoles" var="sysRole" 
			action="sysRoleAction.do?method=list" title=""  locale="zh_CN"
			sortable="false" rowsDisplayed="10" imagePath="${ctx}/styles/extremecomponents/images/*.gif"
			retrieveRowsCallback="limit" filterRowsCallback="limit" sortRowsCallback="limit">
			<ec:row highlightRow="true" ondblclick="showView('${sysRole.f_rid}');"
					onclick="pullValue('${sysRole.f_rid}');">
				<ec:column property="rowcount" cell="rowCount" sortable="false" title="序号" width="6%"/>
				<ec:column property="null" sortable="false" title="选择" width="6%" >
					<input name="select_id" value="${sysRole.f_rid}" type="radio"/>
				</ec:column>
				<ec:column property="f_rname" title="角色名称" />
			<ec:column property="f_mid.f_mname" title="所属模块" />
			<ec:column property="f_rstate" title="有效状态" >
				<ex:dicDisplay dictIdentify="RoleDone" dictValue="${sysRole.f_rstate}"/>
			</ec:column>
			</ec:row>
		</ec:table> 
</body>
</html:html>
