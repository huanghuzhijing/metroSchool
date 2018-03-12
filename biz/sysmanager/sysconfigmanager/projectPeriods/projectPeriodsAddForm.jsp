<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
<html:html>
<head>
	<script type="text/javascript">
	jQuery(document).ready(function(){
		//返回
       jQuery("#btn_back").click(function(){
       		history.back(-1);
       });
       	//验证自动编码重复性
		$("#codeChange").blur(function(){ 
			 checkRuleCode('${ctx}');	
		});
		$("#btn_save").click(function(){
				var properties=new Array(); 
				properties[0]=["periodscode","项目周期编号"];
				properties[1]=["periodsname","项目周期名称"];
				properties[2]=["validstate","有效状态"];
				saveValidateRequired("#btn_save",properties,"projectPeriodsForm");
			}); 
	 });
	
  
</script>
</head>
	<content tag="heading">
	项目周期设置-新增
	</content>
<body>
<fieldset >
		<legend>上级节点信息</legend>
	<table class="titleTable" >
	                     <COLGROUP >
							<COL class="tdLeftTwo" />
							<COL class="tdRightTwo" />
							<COL class="tdLeftTwo" />
							<COL class="tdRightTwo" />
						</COLGROUP>
		<tr>
	
						<c:if test="${pp eq null}">
							<td>上级节点名称：<span class="noRedSpan">*</span></td>
							<td>项目周期树 &nbsp;</td>
							<td>项目周期编号：<span class="noRedSpan">*</span></td>
							<td>&nbsp;&nbsp;</td>
						</c:if>

						<c:if test="${pp ne null}">
							<td >
								上级节点名称：<span class="noRedSpan">*</span>
							</td>
							<td>
								<input type="text" value="${pp.periodsname}" class="showText">
							</td>
							<td >
								项目周期编号：<span class="noRedSpan">*</span>
							</td>
							<td>
								<input type="text" value="${pp.periodscode}" class="showText">
							</td>
						</c:if>
		</tr>
	</table>
	</fieldset>
	
	<html:form action="projectPeriodsAction.do"  method="POST">
		<input type="hidden" name="method" value="save" />
		<html:hidden property="id" value="${projectPeriods.id}"/>
		<html:hidden property="tmpnodecode" value="${param.tmpnodecode}" />
		<html:hidden property="subnodecode" value="${subnodecode}" />
		<html:hidden property="static_parent_id" value="${param.static_parent_id}" />
		<fieldset >
		<legend>基本信息</legend>
			<table class="formTable">
						<COLGROUP>
							<COL class="tdLeftTwo" />
							<COL class="tdRightTwo" />
							<COL class="tdLeftTwo" />
							<COL class="tdRightTwo" />
						</COLGROUP>
						<tr>
							<td>
								项目周期编号：<span class="redSpan">*</span>
							</td>
							<td>
								<input id="codeChange"  tableName="SYS_PROJECT_PERIODS" fieldValue="PERIODSCODE" name="periodscode" class="inputText" size="40" value="<ex:codeRlueDisPlay  tableName="SYS_PROJECT_PERIODS" fieldValue="PERIODSCODE" ruleCode="periodsNo"  />" >
							</td>
							<td>
								项目周期名称：<span class="redSpan">*</span>
							</td>
							<td>
								<html:text maxlength="20" property="periodsname" styleClass="inputText" size="40"/>
							</td>
						</tr>
						<tr>
							<td>
								有效状态：<span class="redSpan">*</span>
							</td>
							<td colspan="3">
								<input type="radio" name="validstate" value="0" checked="checked"/>有效
								<input type="radio" name="validstate" value="1"/>无效
							</td>
						</tr>
					</table>
					</fieldset>
	<div class="inputInfoDiv">
			<span class="inputShowLeft">填&nbsp;&nbsp;报&nbsp;&nbsp;人：${userinfo.empName} </span>
			<span class="inputShowRight"> 填报日期：${now_date}</span>
		</div>
		<div class="saveDiv">
			<input type="button" id="btn_save" value="<fmt:message key="button.save"/>"
				icon="icon_save" />
			&nbsp;&nbsp;
			<input type="button" id="btn_back" value="<fmt:message key="button.back"/>" icon="icon_back" />
		</div>
	</html:form>
</body>
</html:html>
