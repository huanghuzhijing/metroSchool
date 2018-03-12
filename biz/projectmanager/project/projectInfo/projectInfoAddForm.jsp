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
				location.href='projectInfoAction.do?method=list&staticPrjStatus=${param.staticPrjStatus}&staticPrjType=${param.staticPrjType}&staticFootNode=${param.staticFootNode}&flag=${param.flag}';
			});  
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
			setPrjCode();
			//
		});
		//项目类别选择
		function setPrjSortParamValue(prjSortId,prjSortCode,prjSortName){
			$("#prjSort_id").val(prjSortId);
			$("#prjSortCode").val(prjSortCode);
			$("#prjSortName").val(prjSortName);
		}
		//
		function setPrjCode(){
			var prjType=$("[name='prjType']").val();
			var ruleCode="projectNo_SZ";
			if(prjType==1){
				ruleCode="projectNo_SZ";
			}else if(prjType==2){
				ruleCode="projectNo_FJ";
			}else if(prjType==3){
				ruleCode="projectNo_YL";
			}else if(prjType==4){
				ruleCode="projectNo_QT";
			}
			$.ajax({
			   type: "POST",
			   url: "${ctx}/projectInfoAction.do?method=getPrjCode",
			   data: "flagField=prjType&flagFieldValue="+prjType+"&flagType=2&tableName=PRJ_PROJECT_INFO&queryType=2&fieldValue=prjCode&ruleCode="+ruleCode,
			   success: function(msg){
			   		 $("[name='prjCode']").val(msg);
			   }
			});
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
		<html:hidden property="staticPrjStatus"/>
		<html:hidden property="staticPrjType"  value="${param.staticPrjType}" />
		<html:hidden property="staticFootNode" />
		<html:hidden property="flag" />
		<fieldset >
			<legend>项目管理-新增</legend>
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
						<input id="codeBlur" tableName="PRJ_PROJECT_INFO" readonly="readonly"
						fieldValue="orderNo" name="prjCode" class="showText" 
						>
						</td>
						<td>
							项目名称：<span class="redSpan">*</span>
						</td>
						<td>
							<html:text property="prjName" styleClass="inputText" size="50" maxlength="100"/>
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
							<html:text property="approvalDate" styleClass="inputText"  onfocus="WdatePicker()" value="${now_date}"/>
						</td>
					</tr>
					<tr>
						<td>
							项目状态：<span class="noRedSpan">*</span>
						</td>
						<td >
<!--								<c:if test="${projectInfo.auditStatus==-1}">-->
<!--								<input name="tempprjStatus" value="<ex:dicDisplay dictIdentify="PrjStatus" dictValue="${param.staticPrjStatus}"/>" readonly="readonly" class="showText" />-->
<!--							</c:if>-->
<!--							<c:if test="${projectInfo.auditStatus!=-1}">-->
								<ex:dictSelect property="prjStatus" showSelect="false" type="PrjStatus" value="${param.staticPrjStatus}"/>
<!--							</c:if>-->
<!--							-->
<!--							<html:hidden property="prjStatus" value="${param.staticPrjStatus}"/>-->
<!--							<input type="text" class="showText"  readonly="readonly" value="<ex:dicDisplay dictIdentify="PrjStatus" dictValue="${param.staticPrjStatus}"/>"/>-->
						</td>
						<td>
							投资额：<span class="redSpan">*</span>
						</td>
						<td >
							<input name="investSize" class="inputText"  usage="float4"/>（万元）
						</td>
					</tr>
					<tr>
						<td>
							项目类型：<span class="noRedSpan">*</span>
						</td>
						<td>
							<ex:dictSelect type="PrjType" property="prjType"/>
						</td>
<!--						<td>-->
<!--							项目类型：<span class="noRedSpan">*</span>-->
<!--						</td>-->
<!--						<td>-->
<!--							<input type="hidden" name="prjType" value="${param.staticPrjType}" />-->
<!--								<input type="text" class="showText"  readonly="readonly" value="<ex:dicDisplay dictIdentify="PrjType" dictValue="${param.staticPrjType}"/>"/>-->
<!--						</td>-->
						<td>
							项目属性：<span class="redSpan">*</span>
						</td>
						<td>
							<ex:dictRadio  property="prjProperty" type="PrjProperty" defaultValue="1" />							
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
							<html:text property="planStartDate" styleClass="inputText"  onfocus="WdatePicker()"/>
						</td>
						<td>
							计划完工日期：<span class="noRedSpan">*</span>
						</td>
						<td>
							<html:text property="planCompleteDate" styleClass="inputText"  onfocus="WdatePicker()"/>
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
