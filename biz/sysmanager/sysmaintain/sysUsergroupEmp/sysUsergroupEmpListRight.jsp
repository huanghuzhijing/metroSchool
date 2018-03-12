<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
<html:html>
<head>
	<%@ include file="/commons/meta.jsp"%>
	<script type="text/javascript" src="${ctx}/scripts/enterKey.js" ></script>
	<script type="text/javascript">
		$(document).ready(function(){
			//
			$("#btn_add").click(function(){
				var staticGroupId='${staticGroupId}'; 
				if(staticGroupId==""||staticGroupId==-1){
					alert("请选择用户组");
				}else{
				    //$("#roleIds").val($("#tempRoleIds").val());
					var url='sysUsergroupEmpAction.do?method=create&staticGroupId=${staticGroupId}';
					art.dialog({id:'commonDialog1',title:'用户组员工管理', iframe:url, width:'600', height:'400',top:'30'}).close(function(){
						$("#tmpEmployees").val('${selectEmployees}');
					});
				}
			}); 
			//
			$(".btn_delete").click(function(){ 
				ret = window.confirm('${texts['dtaq.common.delete.msg']}');
				if(ret){
					location.href='sysUsergroupEmpAction.do?method=delete&staticGroupId=${staticGroupId}&empId='+$(this).attr("paramid");
				}
			});
			//
		});
		
		function pageRefresh(){
			location.href='sysUsergroupEmpAction.do?method=listRight&staticGroupId=${staticGroupId}';
		}
	</script>
</head>
<body >
	<table class="queryTable" >
		<tr>
			<td class="queryTitle">
			<span >查询条件</span>
			</td>
		</tr>
		<tr>
			<td>
				<html:form action="sysUsergroupEmpAction.do?method=listRight&staticGroupId=${param.staticGroupId}">
					<table class="queryContentTable">
						<tr>
							<td>姓 名：</td>
							<td><html:text property="qempname" maxlength="25" styleClass="inputText"></html:text></td>
							<td>
								<input type="submit" icon="icon_query" value="${texts['button.query']}" />
							</td>
						</tr>
					</table>
				</html:form>
			</td>
		</tr>
	</table>
	<div class="promptDiv">
	     <!-- 页面第一次加载时新增不可操作，组织树下面只能有一个根节点  -->
		本级岗位名称：<span class="keyInfoSpan">
		<c:if test="${staticGroupId !=null && staticGroupId !='' }">
		${staticGroup.usergroupname}</c:if>
		</span>	
	</div>
	<div  class="listButtonDiv">
		<input id="selectEmployees" value="${selectEmployees}" type="hidden"/>
		<input id="tmpEmployees" value="${selectEmployees}" type="hidden"/>
		<input  id="btn_add" type="button" icon="icon_add" value="${texts['button.new']}"  />
	</div>
	<ec:table items="sysUsergroupEmps" var="sysUsergroupEmp"
		action="sysUsergroupEmpAction.do?method=listRight" title=""  locale="zh_CN"
		sortable="false" rowsDisplayed="10" imagePath="${ctx}/styles/extremecomponents/images/*.gif"
		retrieveRowsCallback="limit" filterRowsCallback="limit" sortRowsCallback="limit"
	>
		<ec:row highlightRow="true" >
			<ec:column property="rowcount" cell="rowCount" sortable="false" title="序号" />
			<ec:column property="empcode" title="工号" />
			<ec:column property="empname" title="姓名" />
			<ec:column property="sex" title="性别">
				<ex:dicDisplay dictIdentify="Sex" dictValue="${sysUsergroupEmp.sex}"/>
			</ec:column>
			<ec:column property="null" title="${texts['label.operate']}" >
				<input value="${texts['button.delete']}" type="button" class="btn_delete" icon="icon_delete" paramid="${sysUsergroupEmp.id}"/>
			</ec:column>	
		</ec:row>
	</ec:table>
</body>
</html:html>
