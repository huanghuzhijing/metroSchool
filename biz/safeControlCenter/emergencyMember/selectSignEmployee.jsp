<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>
<ex:bundle/>
<html:html>

<head>
<title>人员选择</title>
<content tag="heading">人员选择</content>
<script src="<c:url value="/scripts/public.js"/>" type="tect/javascript"></script>
<script type="text/javascript">
function selectOrgFlag(value){
	if(value=="0"){
	   jQuery("#outOrgType").hide();
		jQuery("#outOrgName").hide();
		jQuery("#innerOrgType").show();
		jQuery("select[name='economictype'] option:eq(0)").attr("selected","selected") ;
		jQuery("select[name='orgid'] option:eq(0)").attr("selected","selected") ;
	}else if(value=="1"){
	   jQuery("#outOrgType").show();
		jQuery("#outOrgName").show();
		jQuery("#innerOrgType").hide();
		jQuery("select[name='deptid'] option:eq(0)").attr("selected","selected") ;
	}
}

function init(){
	value = jQuery("[name='orgflag']").val();
	if(value=="0"){
	   jQuery("#outOrgType").hide();
		jQuery("#outOrgName").hide();
		jQuery("#innerOrgType").show();
		jQuery("select[name='economictype'] option:eq(0)").attr("selected","selected") ;
		jQuery("select[name='orgid'] option:eq(0)").attr("selected","selected") ;
	   
	}else if(value=="1"){
	   	jQuery("#outOrgType").show();
		jQuery("#outOrgName").show();
		jQuery("#innerOrgType").hide();
		jQuery("select[name='deptid'] option:eq(0)").attr("selected","selected") ;
	}
}

function selectmicType() {
  var economictype = jQuery("[name='economictype']").val();
  if(economictype == null || economictype == ""){
  	economictype = '${economictype}';
  }
  var url = "${ctx}/emergencyMemberAction.do?method=queryOrgInfoByOrgType";
  var myajax = new Ajax.Request(url, {method:"post", parameters:"economictype="+economictype, onComplete:responseOrgList});
}

//得到联动项目信息并构建options
function responseOrgList(selRequest){
   	var orgid = jQuery("[name='orgid']");
	var resulttext = selRequest.responseText;
  	if(resulttext==null || resulttext==""){
  		initSelect(orgid) ;
		return false;
	}
	else{
	    fillSelect(orgid,resulttext,"${orgid}") ;
	}
}

function windowClose(){
	parent.art.dialog({id:'selectEmployee'}).close();
}

function selectEmployee(object){
	if(object.checked == true){
		var text = object.value.split(",");
		jQuery("#signer",parent.document).val(text[0]) ;
		jQuery("#signer_name",parent.document).val(text[1]) ;
		windowClose();
	}
}

</script>
</head>

<body onload="init();selectmicType();">
<fieldset>
  <legend><strong>查询条件</strong></legend>
  <html:form action="emergencyMemberAction.do">
  <html:hidden property="method" value="selectSignEmployee"/>
  	<table class="queryTable" cellspacing="4" align="center" width="100%">
  		<tr>
  			<td>
  			单位性质：<html:select property="orgflag" onchange="selectOrgFlag(this.value)">
  						<html:option value="0">公司本部</html:option>
  						<html:option value="1">参建单位</html:option>
  					</html:select>
  					&nbsp;&nbsp;&nbsp;
  			</td>
  			<td id="innerOrgType" style="display:none" colspan="2">
  				所属部门：
  				<html:select property="deptid" name="organizationForm">
  					<html:option value="">--请选择--</html:option>
  					<html:optionsCollection name="depts" value="id" label="name"/>
  				</html:select>&nbsp;&nbsp;&nbsp;
  			</td>
  			<td id="outOrgType" style="display:none">
  				单位类别：<ex:dictSelect property="economictype" type="OrgaizeationEconomictype" onchange="selectmicType()"/>
  				&nbsp;&nbsp;&nbsp;
  			</td>
  			<td id="outOrgName" style="display:none">
  				单位名称：
  				<html:select property="orgid" name="organizationForm">
  					<html:option value="">--请选择--</html:option>
  				</html:select>&nbsp;&nbsp;&nbsp;
  			</td>
  		</tr>
  		<tr>
  		<td>员工工号：<html:text property="qcode" styleClass="text" name="organizationForm" />&nbsp;&nbsp;&nbsp;</td>
  		<td>员工姓名：<html:text property="qname" styleClass="text" name="organizationForm" />&nbsp;&nbsp;&nbsp;</td>
  		<td align="right">
  			 &nbsp;&nbsp;&nbsp;
		          	<html:hidden property="signid" value="${signid}"/>
			  	<html:hidden property="pojo" value="${param.model}"/>
			  <input type="submit" value="<fmt:message key="button.query"/>" class="button1"/>
  		</td>
  		</tr>
  	</table>
  </html:form>
</fieldset>
<fieldset>
  <legend><strong>员工信息列表</strong></legend>
  <table width="100%" align="center">
  	<tr>
  		<td>
  			<table class="def_table" id="fileTable" width="100%" align="center" border="0" cellpadding="0" cellspacing="1" bgcolor="#CCCCCC">
  			<thead>
				<tr align="center"  height="25" id="trSite">
				  <th width="10%">序号</th>
				  <th width="30%">所属单位/部门</th>
				  <th width="20%">员工姓名</th>
				  <th width="20%">员工工号</th>
				  <th width="10%">员工性别</th>
				  <th width="10%">选择</th>
				</tr>
				</thead>
				<c:set var="index" value="0"></c:set>
				<c:forEach items="${employees}" var="employee">
					<tr class="tr07" align="center" height="20" >
						<td>${index+1}</td>
						<td>${employee.eorg.name}</td>
						<td>${employee.name}</td>
						<td>${employee.code}</td>
						<td><c:if test="${employee.sex eq 0}">女</c:if><c:if test="${employee.sex eq 1}">男</c:if></td>
						<td>
							<input type="radio" id="checkPoints" name="checkPoints" onclick="selectEmployee(this)" value="${employee.id},${employee.name}">
						</td>
					</tr>
					<c:set var="index" value="${index+1}"></c:set>
				</c:forEach>
			</table>
  		</td>
  	</tr>
  </table>			
</fieldset>
	</body>
</html:html>
