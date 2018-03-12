<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>
<ex:bundle/>
<html:html>

<head>
<%@ include file="/commons/meta.jsp" %>
<script src="<c:url value="/scripts/public.js"/>" type="tect/javascript"></script>
<script type="text/javascript">
function selectOrgFlag(value){
	if(value=="0"){
		jQuery(".outOrg").hide();
		jQuery(".innerOrgType").show();
		jQuery("select[name='economictype'] option:eq(0)").attr("selected","selected") ;
		jQuery("select[name='orgid'] option:eq(0)").attr("selected","selected") ;
	}else if(value=="1"){
		jQuery(".outOrg").show();
		jQuery(".innerOrgType").hide();
		jQuery("select[name='deptid'] option:eq(0)").attr("selected","selected") ;
	}
}

function init(){
	value = jQuery("[name='orgflag']").val();
	if(value=="0"){
	  	jQuery(".outOrg").hide();
		jQuery(".innerOrgType").show();
		jQuery("select[name='economictype'] option:eq(0)").attr("selected","selected") ;
		jQuery("select[name='orgid'] option:eq(0)").attr("selected","selected") ;
	}else if(value=="1"){
		jQuery(".outOrg").show();
		jQuery(".innerOrgType").hide();
		jQuery("select[name='deptid'] option:eq(0)").attr("selected","selected") ;
	}
}
function selectOrgan(){
	var url='contentSelectAction.do?method=selectOrgans&noSelect=t&qf_economictype='+$("[name='economictype']").val();
	
	art.dialog({id:'selectOrgan',title:'选择单位', iframe:url, width:'800', height:'450'});
	}
function selectmicType() {
  var economictype = jQuery("[name='economictype']").val();
  if(economictype == null || economictype == ""){
  	  economictype = '${economictype}';
  }
  var url = "${ctx}/employeeinAction.do?method=queryOrgInfoByOrgType";
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
	parent.art.dialog({id:"selectEmp"}).close();
}

function selectEmployee(object){
	var data_ids = jQuery("[name='data_ids']").val();
	var obj = jQuery(object) ;
	if(obj.attr("checked")){
		var objectValue = ","+obj.val()+",";
		if(data_ids.indexOf(objectValue) > -1){
			alert("${texts['dtaq.warnAnalysis.select_person_error']}");
			objectValue.checked = false;
		}else{
			parent.employeeIds +=  object.value+",";
		}
	}else{
		if(parent.employeeIds.indexOf(","+object.value+",") >= 0){
			parent.employeeIds = parent.employeeIds.replace(","+object.value+",",",");
		}
	}
}

function save() {
	var pointids = "";
	var data_ids = jQuery("[name='data_ids']").val();
	var employeeIds = parent.employeeIds;
	if(employeeIds != null && employeeIds != ","){
		var empids = employeeIds.substring(1,employeeIds.length-1).split(",");
		for(var i=0; i<empids.length; i++){
			if(data_ids == "" || (data_ids !="" && data_ids.indexOf(","+empids[i]+",") < 0)){
				parent.queryEmployeeInfo(empids[i]);
			}
		}
		windowClose();
	}
	else{
		alert("${texts['dtaq.warnAnalysis.save_error']}");
	}
}

function initSelect(){
	var data_ids = jQuery("[name='data_ids']").val();
	var checkObjs = document.getElementsByName("checkPoints");
	if(checkObjs != null && data_ids != ""){
		var dataIds = data_ids.split(",");
		for(var i=0; i<checkObjs.length; i++){
			for(var j=0; j<dataIds.length; j++){
				if(checkObjs[i].value == dataIds[j]){
					checkObjs[i].checked = true;
				}
			}
		}
	}
}

function queryInfo(){
	var orgflag = jQuery("[name='orgflag']").val();
	if(orgflag !=""){
		if(orgflag == "0"){
			var deptid = jQuery("[name='deptid']").val();
			if(deptid == ""){
				alert("请你先选择所属部门！");
				return false;
			}
		}else if(orgflag == "1"){
			var economictype = jQuery("[name='economictype']").val();
			if(economictype == ""){
				alert("请你先选择单位类别！");
				return false;
			}
		}
	}else{
		alert("请选择部门！");
		return false;
	}
	document.forms[0].action="dtaqWarnAnalysisAction.do?method=selectSignEmployee&orgflag="+$("[name='orgflag']").val()+"&deptid="+$("[name='deptid']").val()+"&economictype="+$("[name='economictype']").val()+"&orgid="+$("[name='orgid']").val()+"&qcode="+$("[name='qcode']").val()+"&qsex="+$("[name='qsex']").val()+"&data_ids="+$("[name='data_ids']").val();
	document.forms[0].submit();
}

</script>
</head>

<body onload="init();selectmicType();initSelect()">
<fieldset>
  <legend><strong><fmt:message key="dtaq.common.query_field"/></strong></legend>
  <html:form action="dtaqWarnAnalysisAction.do">
  <html:hidden property="method" value="selectSignEmployee"/>
  <html:hidden property="data_ids" value="${data_ids}"/>
  <html:hidden property="ids" value="${param.ids}"/>
  	<table cellspacing="4" align="center" width="100%">
  		<tr>
  			<td>
  			单位性质 
  			</td>
  			<td>
  					<html:select property="orgflag" onchange="selectOrgFlag(this.value)">
  						<html:option value="0">公司本部</html:option>
  						<html:option value="1">参建单位</html:option>
  					</html:select>
  					&nbsp;&nbsp;&nbsp;
  			</td>
  			<td class="innerOrgType" style="display:none" >
  				所属部门
  				</td>
  			<td class="innerOrgType">
  				<html:select property="deptid" name="dtaqWarnAnalysisForm">
  					<html:option value="">请选择</html:option>
  					<html:optionsCollection name="depts" value="f_id" label="f_name"/>
  				</html:select>&nbsp;&nbsp;&nbsp;
  			</td>
  			<td class="outOrg" style="display:none">
  				单位类别
  				</td>
  			<td class="outOrg">
				<ex:dictSelect property="economictype" type="OrgaizeationEconomictype" onchange="selectmicType()"/>
  				&nbsp;&nbsp;&nbsp;
  			</td>
  			
  		
  			<td class="outOrg">
  				单位名称
  				
					</td >
  			<td class="outOrg">		     
  			
  			<input id="plug_corpNames" value="<ex:organNameById id="${param.orgid }"/>"  type="text" size="20"/>
  			
							      <input type="button"   class="selectOrgan" value="选择单位" onclick="selectOrgan()"/>
							    
							     <input id="plug_corpIds" type="hidden" name="orgid" value="${param.orgid }"/>
							      
  			</td>
  			</tr>
  		<tr>
  		<td>员工工号</td>
  			<td><html:text property="qcode" styleClass="text" name="dtaqWarnAnalysisForm" />&nbsp;&nbsp;&nbsp;</td>
  		<td>员工姓名</td>
  			<td><html:text property="qname" styleClass="text" name="dtaqWarnAnalysisForm" />&nbsp;&nbsp;&nbsp;</td>
  		<td>
  			 员工性别</td>
  			<td>
  			 	<ex:dictSelect type="EmployeeSex" property="qsex"/>
  			&nbsp;&nbsp;&nbsp;
		          	<html:hidden property="signid" value="${signid}"/>
			  	<html:hidden property="pojo" value="${param.model}"/>
			  <input type="button" value="<fmt:message key="button.query"/>" class="button1" onclick="queryInfo()"/>
  		</td>
  		</tr>
  	</table>
  </html:form>
</fieldset>
<fieldset>
  <legend><strong><fmt:message key="dtaq.common.list_field"/></strong></legend>
  <table width="100%" align="center">
  	<tr>
  		<td>
  			<table id="fileTable" class="listTable" width="100%" border="0" cellpadding="0" cellspacing="1" align="center" >
				<thead>
				<tr align="center" height="25" id="trSite">
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
					<tr class="tr07" align="center" height="20" bgcolor="#C6DFF7">
						<td>${index+1}</td>
						<td>${employee.e_org.f_name}</td>
						<td>${employee.employee_name}</td>
						<td>${employee.employee_code}</td>
						<td><ex:dicDisplay  dictIdentify="EmployeeSex" dictValue="${employee.employee_sex}"/></td>
						<td>
							<input type="checkbox" id="checkPoints" name="checkPoints" value="${employee.employee_id}" onchange="selectEmployee(this)">
						</td>
					</tr>
					<c:set var="index" value="${index+1}"></c:set>
				</c:forEach>
			</table>
  		</td>
  	</tr>
  	<tr align="center">
  		<td>
  			<input type="button" class="button1" value="${texts['button.save']}" onclick="save()">
	  	 	<input type="button" class="button1" value="${texts['button.close']}" onclick="windowClose()">
  		</td>
  	</tr>
  </table>			
</fieldset>
	</body>
</html:html>
