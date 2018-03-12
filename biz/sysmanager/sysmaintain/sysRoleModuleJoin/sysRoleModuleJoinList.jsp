<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
<html:html>
<head>
<script type="text/javascript" src="${ctx}/scripts/enterKey.js" ></script>
	<script type="text/javascript">
		$(document).ready(function(){
			
		});
		
		
		function docompetence(){
			var url = "docompetenceList.html";
			sAlert('b1',null,url,600,400);
		}
		function doedit(){
			location.href='sysoperatorEditForm.html';
		}
		function dodelete(){
			ret = window.confirm("您确定删除此记录？");
			if(ret){
				location.href='sysoperatorList.html';
			}
		}
	</script>
</head>
<content tag="heading">
	用户管理
</content>
<body >
	<table class="titleTable" width="99%" border="0" cellspacing="0"
		cellpadding="0">
		<tr>
			<td class="titleShow">
				<span class="titleContent">&nbsp;[查询条件]&nbsp;</span>
			</td>
		</tr>
		<tr>
			<td>
				<html:form action="sysOperatorAction.do?method=list">
					<table align="left">
						<tr>
							<td nowrap="nowrap">
								用  户  名:<html:text property="qcnt_name" maxlength="25" ></html:text>
							</td>
							<td nowrap="nowrap">
								姓  名:<html:text property="qcnt_code" maxlength="25" ></html:text>
							</td>
							<td nowrap="nowrap">
								角  色  名：<html:text property="qprj_name" maxlength="25" ></html:text>
							</td>
						</tr>
						<tr>
							<td>
								单位类别:
								<html:text property="qctrsum" disabled="true"styleClass="lineinput"  />
							</td>
							<td>
								<html:submit styleClass="button1" value="查  询"></html:submit>
							</td>
						</tr>
					</table>
				</html:form>
			</td>
		</tr>
	</table>
	<%@ include file="btnoper.jsp"%>
	<ex:table datas="sysOperators" var="sysOperator" id="sysOperatorList" sortable="false">
		<!--parameter begin -->
		<ex:parameter name="flag" value="${param.flag}"></ex:parameter>
		<ex:parameter name="qsealtype" value="${qsealtype}"></ex:parameter>
		<ex:parameter name="qbegindate" value="${qbegindate}"></ex:parameter>
		<ex:parameter name="qenddate" value="${qenddate}"></ex:parameter>
		<ex:parameter name="qusedstatus" value="${qusedstatus}"></ex:parameter>
		<!--parameter end -->
		<ex:column property="id" title="序号"  style="text-align:center">
				1
		</ex:column>
		<ex:column property="username" title="用户名" style="text-align:center"/>
		<ex:column property="username" title="姓名"  style="text-align:center"/>
		<ex:column property="username" title="组织名称"  style="text-align:center"/>	
		<ex:column property="username" title="类别" style="text-align:center"/>	
		<ex:column property="username" title="角色信息"  style="text-align:center"/>
		<ex:column property="" title="操作"  style="text-align:center">
			<input type="button" class="button1" onClick="docompetence();" value="查看权限"/>
			<input type="button" class="button1" onClick="doedit();" value="${texts['button.edit']}"/>
			<input type="button" class="button1" onClick="dodelete();" value="${texts['button.delete']}"/>
		</ex:column>
	</ex:table>
</body>
</html:html>
