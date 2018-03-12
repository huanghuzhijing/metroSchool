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
		if(ec_id==null||ec_id==""){
			ec_id='${ec_id}';
			ec_auditStatus='${ec_auditStatus}';
		}
		pullValue(ec_id);
		//
			$("#btn_add").click(function(){ 
			 	location.href='sysOperatorAction.do?method=create'+'&ec_crd='+$("[name='ec_rd']").val();
			}); 
			//
			$(".btn_edit").click(function(){ 
				var url ='sysOperatorAction.do?method=edit&f_sid='+oper_id+'&ec_p='+$("input[name='ec_p']").val()+'&ec_crd='+$("[name='ec_rd']").val();
				commonUrl(url);
			}); 
			//修改密码
			$(".btn_editPsw").click(function(){ 
				var url ='sysOperatorAction.do?method=editPsw&f_sid='+oper_id+'&ec_p='+$("input[name='ec_p']").val()+'&ec_crd='+$("[name='ec_rd']").val();
				commonUrl(url);
			}); 
			//
			$(".btn_delete").click(function(){ 
					ret = window.confirm("是否删除 并且删除用户所对应的员工");
				if(ret){
					location.href='sysOperatorAction.do?method=delete&f_sid='+oper_id;
				}
			});
			//
			$(".btn_deleteall").click(function(){
				ret = window.confirm("是否删除 并且删除用户所对应的员工");
				if(ret){
					location.href='sysOperatorAction.do?method=delete&flag=1&f_sid='+oper_id;
				}
			});
			//
			$(".btn_seeCompetence").click(function(){ 
				var url = 'sysOperatorAction.do?method=purviewDisplay&id='+$(this).attr("paramId");
				art.dialog({id:'commonDialog1',title:'权限信息', iframe:url, width:'600', height:'400',top:'30'});
			});
			//
		});
		//设置list页面id
	function setPullValue(common_oper_id,mutil_auditStatus,select_count){
		oper_id=common_oper_id;
	}
		//查询提交
	//	function commonUrl(url){
		//	document.forms[0].action=url;   
		//    document.forms[0].submit();   
	//	}
	</script>
</head>
<content tag="heading">
系统用户信息维护
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
				<html:form action="sysOperatorAction.do?method=list&ec_p=${param.ec_p}&ec_id=${param.id}&ec_crd=${param.ec_crd}">
					<table class="queryContentTable">
						<tr>
							<td >用户名：</td>
							<td><html:text property="qusername" maxlength="25" styleClass="inputText" ></html:text></td>
							<td align="right">姓名：</td>
							<td><html:text property="qempname" maxlength="25" styleClass="inputText" ></html:text></td>
							<td >单位类别：</td>	
							<td><html:select property="qcorptype" onchange="changebutton()">
							<html:option value="">请选择</html:option>
							<html:option value="0">内部单位</html:option>
							<html:option value="1">参建单位</html:option>
							</html:select></td>
						</tr>
						<tr>
							<td>角色名称：</td>
                            <td><html:text property="qrolename" maxlength="25" styleClass="inputText" ></html:text></td>
							<td><input type="submit" icon="icon_query" value="${texts['button.query']}" /></td>
						</tr>
					</table>
				</html:form>
			</td>
		</tr>
	</table>
		<div  class="listButtonDiv">
			<input  id="btn_add" type="button" icon="icon_add" value="${texts['button.new']}"  />
			<input  value="${texts['button.edit']}" type="button" class="btn_edit" icon="icon_edit" paramId="${sysOperator.id}"/>
			<input  value="${texts['button.delete']}" type="button" class="btn_delete" icon="icon_delete" paramId="${sysOperator.id}"/>
				
			<input  value="修改密码" type="button" class="btn_editPsw" icon="icon_edit" paramId="${sysOperator.id}"/>
		</div>
	<ec:table items="sysOperators" var="sysOperator"
		action="sysOperatorAction.do?method=list" title=""  locale="zh_CN"
		sortable="false" rowsDisplayed="10" imagePath="${ctx}/styles/extremecomponents/images/*.gif"
		retrieveRowsCallback="limit" filterRowsCallback="limit" sortRowsCallback="limit"
	>
		<ec:row highlightRow="true" onclick="pullValue('${sysOperator.f_sid}');">
			<ec:column property="rowcount" cell="rowCount" sortable="false" title="序号" width="2%"/>
				<ec:column property="null" sortable="false" title="选择" width="2%" >
					<input name="select_id" value="${sysOperator.f_sid}" type="radio"/>
				</ec:column>
			<ec:column property="f_sname" title="用户名" width="6%"/>
			<ec:column property="f_speopleid.employee_name" title="姓名" width="6%"/>
			<ec:column property="null" title="单位名称" width="10%">
				${sysOperator.f_speopleid.e_org.f_name}
			</ec:column>
			<ec:column property="f_speopletype" title="单位类别" width="8%">
				<c:if test="${sysOperator.f_speopletype eq '0'}">内部单位</c:if>
				<c:if test="${sysOperator.f_speopletype eq '1'}">参建单位</c:if></ec:column>
			
		</ec:row>
	</ec:table>
</body>
</html:html>
