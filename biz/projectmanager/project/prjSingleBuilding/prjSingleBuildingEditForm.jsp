<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
<html:html>
<head>
<script type="text/javascript" src="${ctx}/scripts/enterKey.js" ></script>
	<script type="text/javascript">
	 $(document).ready(function(){
	 //保存
	 	$("#btn_save").click(function(){
			var properties=new Array(); 
			properties[0]=["singleCode","单体编号"];
			properties[1]=["singleName","单体名称"];
			saveValidateRequired("#btn_save",properties,"prjSingleBuildingForm");
			}); 
		//返回		
		 $("#btn_back").click(function(){ 
			document.forms[0].action='prjSingleBuildingAction.do?method=list&ec_p=${param.ec_p}&ec_id=${param.id}&ec_crd=${param.ec_crd}&staticPrjId=${param.staticPrjId}&staticSegId=${param.staticSegId}'; 
	    	document.forms[0].submit();
	    }); 
	}); 
</script>
</head>
<content tag="heading">
	项目单体-编辑
</content>
<body>

<html:form action="prjSingleBuildingAction.do&staticPrjId=${param.staticPrjId}&staticSegId=${param.staticSegId}" styleClass="form" method="POST" styleId="prjSingleBuildingForm" enctype="multipart/form-data">
<input type="hidden" name="method" value="save">
<html:hidden property="ec_crd" />
<html:hidden property="id" />
<html:hidden property="ec_id" value="${param.id}"/>
<html:hidden property="prjId" value="${param.staticPrjId}"/>
<html:hidden property="segId" value="${param.staticSegId}"/>

<fieldset>
<legend>单体管理-编辑</legend>
<table class="formTable">
	<COLGROUP >
		<COL class="tdLeftTwo" />
		<COL class="tdRightTwo" />
		<COL class="tdLeftTwo" />
		<COL class="tdRightTwo" />
	</COLGROUP>
	<tr>
		<td>
			项目名称：<span class="noRedSpan">*</span>
		</td>
		<td>
			${projectInfo.prjName}
		</td>
		<td>
			标段名称：<span class="noRedSpan">*</span>
		</td>
		<td>
			${prjSegmentInfo.segName}
		</td>
	</tr>
	<tr>
		<td>
			单体编号：<span class="redSpan">*</span>
		</td>
		<td>
			<html:text property="singleCode" styleClass="inputText" maxlength="100" size="30" />
		</td>
		<td>
			单体名称：<span class="redSpan">*</span>
		</td>
		<td>
			<html:text property="singleName" styleClass="inputText" maxlength="100" size="30" />
		</td>
	</tr>
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
		<div class="inputInfoDiv">
			<span class="inputShowLeft">填&nbsp;报&nbsp;人：${userinfo.empName} </span>
			<span class="inputShowRight"> 填报日期：${now_date}</span>
		</div>
		<div class="saveDiv">
			<input id="btn_save" value="确  定" type="button" icon="icon_save"/>
			<input id="btn_back" value="返  回" type="button" icon="icon_back"/>
		</div>
	</html:form>
	</body>
</html:html>
