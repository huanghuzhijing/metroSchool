<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
<html:html>
<head>
	<script type="text/javascript">
	$(document).ready(function(){
		//返回
        $("#btn_back").click(function(){
       		document.forms[0].action='dataDictAction.do?method=list&ec_id=${param.ec_id}&ec_p=${param.ec_p}&ec_crd=${param.ec_crd}';   
	    	
	    	document.forms[0].submit();
       });
        //保存
       $("#btn_save").click(function(){
			var properties=new Array(); 
			properties[0]=["data_name","字典项名称"];
			properties[1]=["data_value","字典项值"];
			properties[2]=["spell_code","排序值"];
			saveValidateRequired("#btn_save",properties,"dataDictRecordForm");
		}); 
		//
	 });
</script>
</head>
	<content tag="heading">数据字典项</content>
<body>
	<html:form action="dataDictRecordAction.do" method="POST">
		<input type="hidden" name="method" value="save" />
		<html:hidden property="data_id" value="${param.data_id}"/>
		<html:hidden property="dict_id" value="${dicid}"/>
		<html:hidden property="ec_id" value="${param.ec_id}"/>
		<html:hidden property="ec_p" value="${param.ec_p}"/>
		<html:hidden property="ec_crd" value="${param.ec_crd}"/>
		<!-- 查询条件 开始-->
		<input name="qdict_code" value="${param.qdict_code}" type="hidden" />
		<input name="qdata_name" value="${param.qdata_name}" type="hidden" />
		<input name="qdict_name" value="${param.qdict_name}" type="hidden" />
		<input name="pageIndex" value="${param.pageIndex}" type="hidden" />
		<input name="qdiccode" value="${param.qdiccode}" type="hidden" />
		<input name="qdicname" value="${param.qdicname}" type="hidden" />
		<input name="qdisplay" value="${param.qdisplay}" type="hidden" />
		<input name="qdataname" value="${param.qdataname}" type="hidden" />
		<input name="qremark" value="${param.qremark}" type="hidden" />
		<!-- 查询条件 结束-->
		<fieldset >
		<legend>数据字典项-编辑</legend>
			<table class="formTable">
						<COLGROUP>
							<COL class="tdLeftTwo" />
							<COL class="tdRightTwo" />
							<COL class="tdLeftTwo" />
							<COL class="tdRightTwo" />
						</COLGROUP>
						<tr>
							<td>
								字典项名称：<span class="redSpan">*</span>
							</td>

							<td>
								<html:text maxlength="100" property="data_name" styleClass="inputText" size="30"/>
							</td>
							<td>
								字典项值：<span class="redSpan">*</span>
							</td>
							<td>
								<html:text maxlength="20" property="data_short_name" styleClass="inputText" size="30"/>
							</td>
						</tr>
						<tr>
							<td>
								字典名称：<span class="redSpan">*</span>
							</td>
							<td colspan="3">
								${dic.dict_name}&nbsp;
							</td>
						</tr>	
						<tr>
							<td>
								排序值：<span class="redSpan">*</span>
							</td>
							<td colspan="3">
								<ex:numberInput property="spell_code" styleClass="inputText" maxlength="14" size="28"/>
							</td>
						</tr>
						<tr>
							<td>
								备注：<span class="noRedSpan">*</span>
							</td>
							<td colspan="3">
								<html:text maxlength="20" property="spell_code" styleClass="inputText" size="30"/>
						
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
