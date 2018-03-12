<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>
<%@ include file="/commons/meta.jsp" %>
<ex:bundle/>
<html:html>
<head>
<script src="<c:url value="/scripts/public.js"/>" type="text/javascript"></script>
<script type="text/javascript">
jQuery(document).ready(function(){
	var t=jQuery("[name='sortType']").val();
	if(t==3){
		jQuery("#hidone").show();
		jQuery("#hidtwo").show();
	}
});
function windowClose(){
	 parent.art.dialog({id:"editMod"}).close();
}

function saveInfos(next) {
	var properties=[]; 
	properties.push(["sortType","类别层级"]);
	properties.push(["sortName","类别名称"]);
	properties.push(["sortCode","类别编码"]);
	properties.push(["footNode","是否最底层节点"]);
	var t=jQuery("[name='sortType']").val();
	if(t==3){
		properties.push(["hiddenGrade","隐患级别"]);
	}else{
		jQuery("[name='hiddenGrade']").val("");
		jQuery("[name='evaluateScore']").val("");
	}
	saveValidateRequired("#btn_save",properties,"hcHiddenTypeForm");
}

function change(obj){
	if(obj.value==3){
		jQuery("[name='footNode']").val(1);
		jQuery("#hidone").show();
		jQuery("#hidtwo").show();
	}else{
		jQuery("[name='footNode']").val(0);
		jQuery("#hidone").hide();
		jQuery("#hidtwo").hide();
	}
}
</script>
</head>
<body>
 <fieldset>
         <legend><strong>上级节点信息</strong></legend>
           <table class="searchTable" width="100%" cellpadding="0" cellspacing="3" border="0">
         	<tr align="left">
         		<td>
         		<font color="#50A2E6" size="2"><strong>
         		编码： ${pCode}
         		</strong></font>
         		</td>
         		<td>
         		<font color="#50A2E6" size="2"><strong>
         		名称： ${pName}        
         		</strong></font>
         		</td>
         	</tr>
         </table>
 </fieldset>
<html:form action="/hcHiddenTypeAction.do"  styleClass="form"  method="POST">
	<html:hidden property="method" value="save"/>
	<html:hidden property="nodeCode"/>
	<html:hidden property="id"/>
	<html:hidden property="parentId" />
	<table class="formTable" >
					<COLGROUP>
						<COL class="tdLeftTwo" />
						<COL class="tdRightTwo" />
						<COL class="tdLeftTwo" />
						<COL class="tdRightTwo" />
					</COLGROUP>
		<tr>
			<td>类别层级*</td>
			<td><ex:dictSelect type="SortType" property="sortType" onchange="change(this);"  showSelect="false"/>
			</td>
		</tr>
		<tr>
			<td>类别名称*</td>
			<td><html:textarea property="sortName" styleClass="text" cols="50" rows="5"/></td>
		</tr>
		<tr>
			<td>类别编码*</td>
			<td>
				<html:text property="sortCode"  styleClass="text" />
			</td>
		</tr>
			<tr>
				<td>是否最底层节点*</td>
				<td>
					<ex:dictSelect type="Yesorno" property="footNode" showSelect="false"/>
				</td>
			</tr>
			<tr>
				<td>排序号*</td>
				<td>
					<html:text property="sortNo"  styleClass="text" />
				</td>
			</tr>
			<tr id="hidone" style="display:none">
				<td>综合分值</td>
				<td>
					<html:text property="evaluateScore"/>
				</td>
			</tr>
			<tr id="hidtwo" style="display:none">
				<td>隐患级别*</td>
				<td><ex:dictSelect type="HiddenType" property="hiddenGrade" />
				</td>
			</tr>
	</table>
	<div align="center">
		<input id="btn_save" type="button" class="button1" value="保&nbsp;&nbsp;存" onclick="saveInfos()" >&nbsp;&nbsp;
		 <input id="btn_close" type="button" class="button1" value="${texts['button.close']}" onclick="windowClose()">
	</div>	
</html:form>
</body>
</html:html>