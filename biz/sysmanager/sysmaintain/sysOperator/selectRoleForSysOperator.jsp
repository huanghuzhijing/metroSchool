<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
<html:html>
<head>
<%@ include file="/commons/meta.jsp" %>
<script type="text/javascript" src="${ctx}/scripts/enterKey.js" ></script>
	<script type="text/javascript">
	var oper_id="";
	var selectPhones = ",";
	var selectIncepter = ",";
		$(document).ready(function(){
			initTable();
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
			
			/////
			$("#btn_save").click(function(){
			parent.$("#roleIds").val(selectPhones);
			parent.$("#roleNames").val(selectIncepter);
			parent.art.dialog({id:'commonDialog1'}).close();
			})
		
			$("#btn_back").click(function(){
			parent.art.dialog({id:'commonDialog1'}).close();
			})
		});
		//设置list页面id
	function pullValue(obj){
		oper_id=obj.value;
	}
		function initTable(){
		this.selectPhones = '${param.roleIds}'; 
		this.selectIncepter ='${param.roleNames}';
		if(this.selectPhones.length > 1){
			var allEmployees = document.getElementsByName("select_row");
			for(var i=0; i<allEmployees.length; i++){
				if(allEmployees[i].getAttribute("paramId") != "" && this.selectPhones.indexOf(","+allEmployees[i].getAttribute("paramId")+",") > -1){
					allEmployees[i].checked = true;
				}
			}
		}
	}
	//选中事件
	function employCheck(object){
		if(object.checked == true){//选中
				if(this.selectPhones.indexOf(","+object.value+",") <= -1){
		   			this.selectPhones += object.getAttribute("paramId") + ",";
		   			this.selectIncepter += object.getAttribute("paramName") + ",";
		   		}
		 
		}else{//取消
			if(this.selectPhones.indexOf(","+object.value+",") > -1){
	 			this.selectPhones = this.selectPhones.replace(","+object.getAttribute("paramId")+",",",");
	 			this.selectIncepter = this.selectIncepter.replace(","+object.getAttribute("paramName")+",",",");
		   	}
		}
	}
	function setEmpPhone(){
		parent.selectPhones = this.selectPhones;
		parent.selectIncepter = this.selectIncepter;
		return true;
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
				<html:form action="sysRoleAction.do?method=selectForSysOperator">
					<table class="queryContentTable">
					<html:hidden property="roleIds" value="${param.roleIds}"/>
				    <html:hidden property="roleNames" value="${param.roleNames}"/>
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
								<input type="submit" icon="icon_query" value="${texts['button.query']}" onclick="setEmpPhone()"/>
							</td>
						</tr>
					</table>
				</html:form>
			</td>
		</tr>
	</table>
		
	<ec:table items="sysRoles" var="sysRole" 
			action="sysRoleAction.do?method=selectForSysOperator" title=""  locale="zh_CN"
			sortable="false" rowsDisplayed="10" imagePath="${ctx}/styles/extremecomponents/images/*.gif"
			retrieveRowsCallback="limit" filterRowsCallback="limit" sortRowsCallback="limit">
			<ec:row highlightRow="true" ondblclick="showView('${sysRole.f_rid}');"
					onclick="pullValue('${sysRole.f_rid}');">
				<ec:column property="rowcount" cell="rowCount" sortable="false" title="序号" width="6%"/>
				<ec:column property="null" sortable="false" title="选择"  >
					<input calss="select" name="select_row" value="${sysRole.f_rid}" onclick="employCheck(this)" type="checkbox" paramName="${sysRole.f_rname}" paramId="${sysRole.f_rid}" />
				</ec:column>
				<ec:column property="f_rname" title="角色名称" />
			<ec:column property="f_mid.f_mname" title="所属模块" />
			<ec:column property="f_rstate" title="有效状态" >
				<ex:dicDisplay dictIdentify="RoleDone" dictValue="${sysRole.f_rstate}"/>
			</ec:column>
			<ec:column property="f_rmemo" title="角色备注" />
			</ec:row>
		</ec:table> 
		<div align="center" class="saveDiv">
				<input id="btn_save" value="${texts['button.save']}" type="button" icon="icon_save"/>
				<input id="btn_back" value="关闭" type="button" icon="icon_back"/>
		</div>
</body>
</html:html>

