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
			properties[0]=["corpcode","参建单位编号"];
			properties[1]=["corpname","参建单位名称"];
			properties[2]=["orderno","排序"];
			properties[3]=["organcode","组织机构代码"];
			saveValidateRequired("#btn_save",properties,"corpForm");
		}); 
		//
	 });
  	//
  	function checkOrganCode(obj){
    	var orgcode = obj.value;
    	$.ajax({
			   type: "POST",
			   url: "${ctx}/corpAction.do?method=checkOrganCode",
			   data: "orgcode="+orgcode,
			   success: function(msg){
			   		msg = msg.split(",");
					if(msg[0]=="no"){
						alert("该组织机构代码已被其它单位所用，请核实后再填报!");
						obj.value='';
						obj.focus();
						return;
					}
					else{
						return;
					}
			   }
			});
    }
</script>
</head>
<content tag="heading">
单位资料修改
</content>
<body>
	<html:form action="corpAction.do" method="POST">
		<input type="hidden" name="method" value="corpSave" />
		<html:hidden property="id"/>
		<html:hidden property="static_corptype" value="${static_corptype}"/>
		<!-- 查询条件 开始-->
		<input name="pageIndex" value="${param.pageIndex}" type="hidden" />
		<input name="qcorpname" value="${qcorpname}" type="hidden" />
		<input name="qempname" value="${qempname}" type="hidden" />
		<!-- 查询条件 结束-->
		<fieldset >
		<legend>[基本信息]</legend>
			<table class="formTable">
						<COLGROUP>
							<COL class="tdLeftTwo" />
							<COL class="tdRightTwo" />
							<COL class="tdLeftTwo" />
							<COL class="tdRightTwo" />
						</COLGROUP>
						<tr>
							<td>
								参建单位编号：<span class="redSpan">*</span> 
							</td>
							<td>
								<html:text maxlength="200" property="corpcode" styleClass="showText" readonly="true" />
							</td>
							<td>
								参建单位名称：<span class="redSpan">*</span> 
							</td>
							<td>
								<html:text maxlength="200" property="corpname" styleClass="showText" readonly="true" size="65"/>
							</td>
						</tr>
						<tr>
						    <td>
								排序：<span class="redSpan">*</span>
							</td>
							<td>
								<ex:numberInput property="orderno" styleClass="inputText" maxlength="14" size="28"/>
							</td>
							<td>
								 单位类型：<span class="redSpan">*</span> 
							</td>
							<td>
								${ctname}&nbsp;
							</td>
						</tr>	
						<tr>
							<td>
								组织机构代码：<span class="redSpan">*</span>
							</td>
							<td>
								<html:text maxlength="20" property="organcode" styleClass="inputText" size="30"/>
							</td>
							<td>
								法人：<span class="noRedSpan">*</span>
							</td>
							<td>
								<html:text maxlength="20" property="chargeperson" styleClass="inputText" size="30"/>
							</td>
						</tr>
						<tr>
							<td>
								地址：<span class="noRedSpan">*</span>
							</td>

							<td>
								<html:text maxlength="20" property="address" styleClass="inputText" size="30"/>
							</td>
							<td>
								邮编：<span class="noRedSpan">*</span>
							</td>
							<td>
								<html:text maxlength="20" property="postcode" styleClass="inputText" size="30"/>
							</td>
						</tr>
						<tr>
							<td>
								电话：<span class="noRedSpan">*</span>
							</td>

							<td>
								<html:text maxlength="20" property="tel" styleClass="inputText" size="30"/>
							</td>
							<td>
								传真：<span class="noRedSpan">*</span>
							</td>
							<td>
								<html:text maxlength="20" property="fax" styleClass="inputText" size="30"/>
							</td>
						</tr>
						
						
						<c:if test="${corp.corptype=='SG'}">
						<tr>
							<td>
								公司资质等级和资质证书编号：<span class="noRedSpan">*</span>
							</td>
							<td>
								<html:text maxlength="20" property="corpLevel" styleClass="inputText" size="30"/>
							</td>
							<td>
								公司安全生产许可证编号：<span class="noRedSpan">*</span>
							</td>
							<td>
								<html:text maxlength="20" property="corpLicence" styleClass="inputText" size="30"/>
							</td>
						</tr>
						<tr>
							<td>
								项目经理：<span class="noRedSpan">*</span>
							</td>
							<td>
								<html:text maxlength="20" property="corpPrjMan" styleClass="inputText" size="30"/>
							</td>
							<td>
								安&nbsp;&nbsp;全&nbsp;&nbsp;员：<span class="noRedSpan">*</span>
							</td>
							<td>
								<html:text maxlength="20" property="corpSafeMan" styleClass="inputText" size="30"/>
							</td>
						</tr>
						<tr>
							<td>
								施&nbsp;&nbsp;工&nbsp;&nbsp;员：<span class="noRedSpan">*</span>
							</td>
							<td>
								<html:text maxlength="20" property="corpConstructMan" styleClass="inputText" size="30"/>
							</td>
							<td>
								资&nbsp;&nbsp;料&nbsp;&nbsp;员：<span class="noRedSpan">*</span>
							</td>
							<td>
								<html:text maxlength="20" property="corpMaterialMan" styleClass="inputText" size="30"/>
							</td>
						</tr>
						</c:if>
						
						
						<c:if test="${corp.corptype=='JL'}">
						<tr>
							<td>
								资质等级和资质证书编号：<span class="noRedSpan">*</span>
							</td>
							<td>
								<html:text maxlength="20" property="corpLevel" styleClass="inputText" size="30"/>
							</td>
							<td>
								总监理工程师：<span class="noRedSpan">*</span>
							</td>
							<td>
								<html:text maxlength="20" property="superHeadMan" styleClass="inputText" size="30"/>
							</td>
						</tr>
						<tr>
							<td>
								现场监理：<span class="noRedSpan">*</span>
							</td>
							<td colspan="3">
								<html:text maxlength="20" property="corpSceneMan" styleClass="inputText" size="30"/>
							</td>
						</tr>
						</c:if>
						
						
						
						<tr>
							<td>
								备注：<span class="noRedSpan">*</span>
							</td>
							<td colspan="3">
								<html:textarea property="remark"  />
							</td>
						</tr>
					</table>
					</fieldset>
		<div class="saveDiv">
			<input id="btn_save" value="${texts['button.save']}" type="button" class="button1" icon="icon_save"/>
		</div>
	</html:form>
</body>
</html:html>
