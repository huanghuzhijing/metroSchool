<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
<html:html>
<head>
	<%@ include file="/commons/meta.jsp"%>
	<script type="text/javascript">
	   $(document).ready(function(){
			//
			$("#btn_save").click(function(){
				var properties=new Array(); 
				properties[0]=["segCode","标段编号"];
				properties[1]=["segName","标段名称"];
				saveValidateRequired("#btn_save",properties,"prjOwnerUserJoinForm");
			}); 
			//
			$("#btn_back").click(function(){ 
				parent.art.dialog({id:'commonDialog1'}).close();	
			//	document.forms[0].action='prjSegmentInfoAction.do?method=listRight&ec_p=${param.ec_p}';   
	    	//	document.forms[0].submit();
			});  
			//
		});
	</script>
</head>

<body>
	<%@ include file="includeProjectInfoView.jsp"%> 
	<html:form enctype="multipart/form-data" action="prjOwnerUserJoinAction.do" method="POST">
		<input name="method" value="save" type="hidden" />
		<html:hidden property="id" />
		<html:hidden property="staticPrjId" value="${param.staticPrjId}"/>
		<!--查询定位 开始-->
		<html:hidden property="parent_ec_p" />
		<html:hidden property="ec_p" />
		<html:hidden property="staticPrjStatus" value="${param.staticPrjStatus}"/>
		<html:hidden property="staticPrjSort" value="${param.staticPrjSort}"/>
		<html:hidden property="staticFootNode" value="${param.staticFootNode}"/>
		<html:hidden property="flag" value="${param.flag}"/>
		<html:hidden property="flagPage" value="${param.flagPage}"/>
		<html:hidden property="qprjCode" value="${qprjCode}"/>
		<html:hidden property="qprjName" value="${qprjName}"/>
		<html:hidden property="qauditStatus" value="${qauditStatus}"/>
		<!--查询定位 结束-->
		<fieldset >
			<legend>标段划分-新增</legend>
			<table class="formTable" >
					<COLGROUP>
						<COL class="tdLeftOneTwo" />
						<COL class="tdRightOneTwo" />
					</COLGROUP>
					<tr>
						<td>
							标段编号：<span class="redSpan">*</span>
						</td>
						<td >
							<html:text property="segCode" styleClass="inputText" maxlength="100" size="48"/>
						</td>
					</tr>
					<tr>
						<td>
							标段名称：<span class="redSpan">*</span>
						</td>
						<td>
							<html:text property="segName" styleClass="inputText" maxlength="100" size="48"/>
						</td>
					</tr>
					<tr>
						<td>
							备注：<span class="noRedSpan">*</span>
						</td>
						<td>
							<html:textarea property="remark" />
						</td>
					</tr>
			</table>
		</fieldset>
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
