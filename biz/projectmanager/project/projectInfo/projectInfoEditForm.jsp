<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
<html:html>
<head>
	<script type="text/javascript">
	   $(document).ready(function(){
			//
			$("#btn_save").click(function(){
				var properties=new Array(); 
				properties[0]=["prjCode","项目编号"];
				properties[1]=["prjName","项目名称"];
				properties[2]=["approvalDate","立项日期"];
				properties[3]=["investSize","投资规模"];
				properties[4]=["costIncidence","成本归属"];
				saveValidateRequired("#btn_save",properties,"projectInfoForm");
			}); 
			//
			$("#btn_back").click(function(){ 
				document.forms[0].action='projectInfoAction.do?method=list&staticPrjStatus=${param.staticPrjStatus}&ec_p=${param.ec_p}&ec_id=${projectInfo.id}&ec_auditStatus=${projectInfo.auditStatus}&staticPrjType=${param.staticPrjType}&staticFootNode=${param.staticFootNode}&flag=${param.flag}';   
	    		document.forms[0].submit(); 
			});  
			//
			//
			$("input[name='prjCode']").blur(function(){ 
				$.ajax({
				   type: "POST",
				   url: "${ctx}/projectInfoAction.do?method=checkPrjCode",
				   data: "id="+$("input[name='id']").val()+"&prjCode="+$("input[name='prjCode']").val(),
				   success: function(msg){
				   		 if(msg=="no"){ 
				   		 		alert("项目编号 已存在!");
				   		 		$("input[name='prjCode']").val("");     
						  }
				   }
				});
			});  
			//
			$("input[name='prjName']").blur(function(){ 
				$.ajax({
				   type: "POST",
				   url: "${ctx}/projectInfoAction.do?method=checkPrjName",
				   data: "id="+$("input[name='id']").val()+"&prjName="+$("input[name='prjName']").val(),
				   success: function(msg){
				   		 if(msg=="no"){ 
				   		 		alert("项目名称 已存在!");
				   		 		$("input[name='prjName']").val("");     
						  }
				   }
				});
			});  
			//
		});
		//项目类别选择
		function setPrjSortParamValue(prjSortId,prjSortCode,prjSortName){
			if(prjSortId!=""){
				$("#prjSort_id").val(prjSortId);
				$("#prjSortCode").val(prjSortCode);
				$("#prjSortName").val(prjSortName);
			}
		}
	</script>
</head>
<content tag="heading">
项目管理
</content> 
<body>
	<html:form enctype="multipart/form-data" action="projectInfoAction.do" method="POST">
		<input name="method" value="save" type="hidden" />
		<html:hidden property="id" />
		<html:hidden property="staticPrjStatus" />
		<html:hidden property="staticPrjType"  value="${param.staticPrjType}" />
		<html:hidden property="staticFootNode" />
		<html:hidden property="flag" />
		<!--查询定位 开始-->
		<html:hidden property="ec_p" />
		<html:hidden property="ec_id" value="${projectInfo.id}"/>
		<html:hidden property="ec_auditStatus"  value="${projectInfo.auditStatus}"/>
		<html:hidden property="qprjCode" />
		<html:hidden property="qprjName"/>
		<html:hidden property="qauditStatus"/>
		<!--查询定位 结束-->
		<fieldset >
			<legend>项目管理-编辑</legend>
			<table class="formTable" >
					<COLGROUP>
						<COL class="tdLeftTwo" />
						<COL class="tdRightTwo" />
						<COL class="tdLeftTwo" />
						<COL class="tdRightTwo" />
					</COLGROUP>
					<tr>
						<td>
							项目编号：<span class="redSpan">*</span>
						</td>
						<td>
							<html:text property="prjCode" styleClass="inputText" maxlength="100" />
						</td>
						<td>
							项目名称：<span class="redSpan">*</span>
						</td>
						<td>
							<html:text property="prjName" size="50" styleClass="inputText" maxlength="100"/>
						</td>
					</tr>
					<tr>
						<td>
							成本归属：<span class="redSpan">*</span>
						</td>
						<td >
						<ex:dictSelect type="Company_Main" property="costIncidence" showSelect="false"/>
						</td>
						<td>
							立项日期：<span class="redSpan">*</span>
						</td>
						<td >
							<c:set var="approvalDate"><fmt:formatDate value="${projectInfo.approvalDate}" pattern="yyyy-MM-dd"/></c:set>
							<html:text property="approvalDate" value="${approvalDate}" styleClass="inputText"  onfocus="WdatePicker()"/>
						</td>
					</tr>
					<tr>
						<td>
							项目状态：<span class="noRedSpan">*</span>
						</td>
						<td >
							<c:if test="${projectInfo.auditStatus==-1}">
								<input name="tempprjStatus" value="<ex:dicDisplay dictIdentify="PrjStatus" dictValue="${projectInfo.prjStatus}"/>" readonly="readonly" class="showText" />
							</c:if>
							<c:if test="${projectInfo.auditStatus!=-1}">
								<ex:dictSelect property="prjStatus" showSelect="false" type="PrjStatus"/>
							</c:if>
						</td>
						<td>
							投资额：<span class="redSpan">*</span>
						</td>
						<td >
							<input name="investSize" value="<fmt:formatNumber pattern="###0.0000" value='${projectInfo.investSize}' />" class="inputText"  usage="float4"/>（万元）
						</td>
					</tr>
					<tr>
						<td>
							项目类型：<span class="noRedSpan">*</span>
						</td>
						<td>
							<ex:dictSelect type="PrjType" property="prjType"/>
						</td>
						<td>
							项目属性：<span class="redSpan">*</span>
						</td>
						<td >
								<ex:dictRadio  property="prjProperty" type="PrjProperty" />							
						</td>
					</tr>
					<tr>
						<td>
							建设规模：<span class="noRedSpan">*</span>
						</td>
						<td colspan="3">
							<html:textarea property="buildScope"></html:textarea>
						</td>
					</tr>
					<tr>
						<td>
							计划开工日期：<span class="noRedSpan">*</span>
						</td>
						<td>
							<c:set var="planStartDate"><fmt:formatDate value="${projectInfo.planStartDate}" pattern="yyyy-MM-dd"/></c:set>
							<html:text property="planStartDate" value="${planStartDate}" styleClass="inputText"  onfocus="WdatePicker()"/>
						</td>
						<td>
							计划完工日期：<span class="noRedSpan">*</span>
						</td>
						<td>
							<c:set var="planCompleteDate"><fmt:formatDate value="${projectInfo.planCompleteDate}" pattern="yyyy-MM-dd"/></c:set>
							<html:text property="planCompleteDate" value="${planCompleteDate}" styleClass="inputText"  onfocus="WdatePicker()"/>
						</td>
					</tr>
					<tr>
						<td>
							项目概况：<span class="noRedSpan">*</span>
						</td>
						<td colspan="3">
							<html:textarea property="prjGeneral"></html:textarea>
						</td>
					</tr>
					<tr>
						<td>
							备&nbsp;&nbsp;&nbsp;&nbsp;注：<span class="noRedSpan">*</span>
						</td>
						<td colspan="3">
							<html:textarea property="remark"></html:textarea>
						</td>
					</tr>
			</table>
		</fieldset>
		<!-- 附件增加 -->
		<%@ include file="/commons/uploadFiles.jsp"%>
		<div class="inputInfoDiv">
			<span class="inputShowLeft">填&nbsp;&nbsp;报&nbsp;&nbsp;人：${userinfo.empName} </span>
			<span class="inputShowRight"> 填报日期：${now_date}</span>
		</div>
		<div class="saveDiv">
			<input id="btn_save" value="${texts['button.save']}" type="button" icon="icon_save"/>
			<input id="btn_back" value="${texts['button.back']}" type="button" icon="icon_back"/>
		</div>
	</html:form>
</body>
</html:html>
