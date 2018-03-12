<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
<html:html>
<head>
	<script type="text/javascript">
	//加载
	$(document).ready(function(){
		//返回
       $("#btn_back").click(function(){
       		history.back(-1);
       });
       //保存
       $("#btn_save").click(function(){
			var properties=new Array(); 
			properties[0]=["empcode","人员编号"];
			properties[1]=["empname","姓名"];
			saveValidateRequired("#btn_save",properties,"employeeForm");
		}); 
		//
	 });
</script>
</head>
<content tag="heading">
参建单位员工
</content>
<body>
	<html:form action="corpEmployeeAction.do" method="POST">
		<input type="hidden" name="method" value="save" />
		<html:hidden property="id"/>
		<html:hidden property="corpid" value="${corpid}"/>
		<!-- 查询条件 开始-->
		<input name="pageIndex" value="${param.pageIndex}" type="hidden" />
		<input name="qcorpname" value="${qcorpname}" type="hidden" />
		<input name="qempname" value="${qempname}" type="hidden" />
		<input name="static_corptype" value="${static_corptype}" type="hidden" />
		<!-- 查询条件 结束-->
		<fieldset >
		<legend>参建单位员工-编辑</legend>
			<table class="formTable">
						<COLGROUP>
							<COL class="tdLeftTwo" />
							<COL class="tdRightTwo" />
							<COL class="tdLeftTwo" />
							<COL class="tdRightTwo" />
						</COLGROUP>
						<tr>
							<td>
								人员编号：<span class="redSpan">*</span>
							</td>

							<td>
								<html:text maxlength="20" property="empcode" styleClass="inputText" />
							</td>
							<td>
								姓名：<span class="redSpan">*</span>
							</td>
							<td>
								<html:text maxlength="20" property="empname" styleClass="inputText" />
							</td>
						</tr>
						<tr>
							<td>
								所属单位：<span class="redSpan">*</span>
							</td>
							<td colspan="3">
								${corp.corpname}&nbsp;
							</td>
						</tr>	
						<tr>
							<td>
								性别：<span class="redSpan">*</span>
							</td>

							<td>
								<html:radio property="sex" value="0">男</html:radio>
								<html:radio property="sex" value="1">女</html:radio>
							</td>
							<td>
								职务：<span class="noRedSpan">*</span>
							</td>
							<td>
								<html:text maxlength="20" property="empduty" styleClass="inputText" />
							</td>
						</tr>
						<tr>
							<td>
								电话：<span class="noRedSpan">*</span>
							</td>

							<td>
								<html:text maxlength="20" property="tel" styleClass="inputText" />
							</td>
							<td>
								手机：<span class="noRedSpan">*</span>
							</td>
							<td>
								<html:text maxlength="20" property="phone" styleClass="inputText" />
							</td>
						</tr>
						<tr>
							<td>
								QQ：<span class="noRedSpan">*</span>
							</td>

							<td>
								<html:text maxlength="20" property="qq" styleClass="inputText" />
							</td>
							<td>
								MSN：<span class="noRedSpan">*</span>
							</td>
							<td>
								<html:text maxlength="20" property="msn" styleClass="inputText" />
							</td>
						</tr>
						<tr>
							<td>
								出生年月：<span class="noRedSpan">*</span>
							</td>

							<td>
								<html:text property="birthday"  onfocus="WdatePicker()" styleClass="inputText"/>
							</td>
							<td>
								电子邮件：<span class="noRedSpan">*</span>
							</td>
							<td>
								<html:text maxlength="20" property="email" styleClass="inputText" />
							</td>
						</tr>
						<tr>
							<td>
								备注：<span class="noRedSpan">*</span>
							</td>
							<td colspan="3">
								<html:textarea property="remark" 
									onkeydown="textCounter('remark','spanSummary',200)"
									onkeyup="textCounter('remark','spanSummary',200)" />
								<span class="memoFont" id="spanSummary" style="display: inline">（非必选，200字以内）</span>
							</td>
						</tr>
					</table>
					</fieldset>
	     <div class="inputInfoDiv">
			<span class="inputShowLeft">填&nbsp;&nbsp;报&nbsp;&nbsp;人：${userinfo.empName} </span>
			<span class="inputShowRight"> 填报日期：${now_date}</span>
		</div>
		<div class="saveDiv">
			<input id="btn_save" value="${texts['button.save']}" type="button" class="button1" icon="icon_save"/>
			<input id="btn_back" value="${texts['button.back']}" type="button" class="button1" icon="icon_back"/>
		</div>
	</html:form>
</body>
</html:html>
