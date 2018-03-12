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
       //验证自动编码重复性
		$("#codeChange").change(function(){ 
			 checkChangeRuleCode('${ctx}');	
		});
		//
		$("#btn_save").click(function(){
			var properties=new Array(); 
			properties[0]=["typecode","参建单位类型编码"];
			properties[1]=["typename","参建单位类型名称"];
			properties[2]=["orderno","排序"];
			properties[3]=["corptype","参建单位类型标识"];
			saveValidateRequired("#btn_save",properties,"corpTypeForm");
		}); 
		//
	 });
	
</script>
</head>
<content tag="heading">
参建单位类型管理
</content>
<body>
	<fieldset >
		<legend>上级节点信息</legend>
				<table class="titleTable">
						<COLGROUP >
							<COL class="tdLeftTwo" />
							<COL class="tdRightTwo" />
							<COL class="tdLeftTwo" />
							<COL class="tdRightTwo" />
						</COLGROUP>
					<tr>
						<c:if test="${ct eq null}">
							<td>上级节点名称：<span class="noRedSpan">*</span></td>
							<td>参建单位类型树 &nbsp;&nbsp;</td>
							<td>参建单位类型编码：<span class="noRedSpan">*</span></td>
							<td>&nbsp;&nbsp;</td>
						</c:if>

						<c:if test="${ct ne null}">
							<td >
								上级节点名称：<span class="noRedSpan">*</span>
							</td>
							<td>
								<input type="text" value="${ct.typename}" class="showText">&nbsp;
							</td>
							<td >
								参建单位类型编码：<span class="noRedSpan">*</span>
							</td>
							<td>
								<input type="text" value="${ct.typecode}" class="showText">&nbsp;
							</td>
						</c:if>
				</tr>
				</table>
		</fieldset>
	
	<html:form action="corpTypeAction.do"   method="POST">
		<input type="hidden" name="method" value="save" />
		<html:hidden property="tmpnodecode" value="${param.tmpnodecode}" />
		<html:hidden property="subnodecode" value="${subnodecode}" />
		<html:hidden property="static_parent_id"
			value="${param.static_parent_id}" />
		<html:hidden property="id" value="${corpType.id}"/>
		<!-- 查询条件 开始-->
		<input name="pageIndex" value="${param.pageIndex}" type="hidden" />
		<input name="qtypecode" value="${qtypecode}" type="hidden" />
		<input name="qtypename" value="${qtypename}" type="hidden" />
		<!-- 查询条件 结束-->
		<fieldset >
		<legend>基本信息</legend>	
			<table class="formTable">
						<COLGROUP >
							<COL class="tdLeftTwo" />
							<COL class="tdRightTwo" />
							<COL class="tdLeftTwo" />
							<COL class="tdRightTwo" />
						</COLGROUP>
						<tr>
							<td>
								参建单位类型编码：<span class="redSpan">*</span>
							</td>

							<td>
							<input id="codeChange" onkeypress="return regInput0(this,String.fromCharCode(event.keyCode))" tableName="SYS_CORP_TYPE" fieldValue="typecode" name="typecode" class="inputText" size="30" value="${corpType.typecode}"  />
							</td>
							<td>
								参建单位类型名称：<span class="redSpan">*</span>
							</td>
							<td>
								<html:text maxlength="20" property="typename" styleClass="inputText" size="30"/>
							</td>
						</tr>
						<tr>
							<td>
								排序：<span class="redSpan">*</span>
							</td>
							<td>
								<ex:numberInput property="orderno" styleClass="inputText" maxlength="14" size="30"/>
							</td>
							<td>
								参建单位类型标识：<span class="redSpan">*</span>
							</td>
							<td>
								<html:text maxlength="20" property="corptype" styleClass="inputText" size="30"/>
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
