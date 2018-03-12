<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>
<%@ include file="/commons/meta.jsp" %>

<ex:bundle/>
<html:html>

<head>

<title>人员选择</title>
<script src="<c:url value="/scripts/public.js"/>" type="text/javascript"></script>
<script type="text/javascript">

jQuery(document).ready(function(){
	init();
	selectmicType();
	initTable() ;
});

var selectPhones = ",";
var selectIncepter = ",";
function selectOrgFlag(value){
	if(value=="0"){
		jQuery("#outOrgType").hide();
		jQuery("#outOrgName").hide();
		jQuery("#innerOrgType").show();
		jQuery("[name='economictype'] option:eq(0)").attr("checked","checked");
		jQuery("[name='static_orgid'] option:eq(0)").attr("checked","checked");
	}else if(value=="1"){
	 	jQuery("#outOrgType").show();
		jQuery("#outOrgName").show();
		jQuery("#innerOrgType").hide();
		jQuery("[name='deptid'] option:eq(0)").attr("checked","checked");
	}
}

function init(){
	value = jQuery("[name='orgflag']").val();
	if(value=="0"){
		jQuery("#outOrgType").hide();
		jQuery("#outOrgName").hide();
		jQuery("#innerOrgType").show();
		jQuery("[name='economictype'] option:eq(0)").attr("checked","checked");
		jQuery("[name='static_orgid'] option:eq(0)").attr("checked","checked");
	}else if(value=="1"){
		jQuery("#outOrgType").show();
		jQuery("#outOrgName").show();
		jQuery("#innerOrgType").hide();
		jQuery("[name='deptid'] option:eq(0)").attr("checked","checked");
	}
}

function selectmicType() {
  var economictype = jQuery("[name='economictype']").val();
  if(economictype == null || economictype == ""){
  	economictype = '${economictype}';
  }
//  var url = "${ctx}/employeeinAction.do?method=queryOrgInfoByOrgType";
//  var myajax = new Ajax.Request(url, {method:"post", parameters:"economictype="+economictype, onComplete:responseOrgList});

$.ajax({
					type: "POST",
					url: "${ctx}/employeeAction.do?method=queryOrgInfoByOrgType",
					data: "economictype="+economictype,
					success: function(msg){
						responseOrgList(msg);
					}
				});

}

//得到联动项目信息并构建options
function responseOrgList(selRequest){
	var static_orgid = jQuery("[name='static_orgid']");
	var resulttext = selRequest;
  	if(resulttext==null || resulttext==""){
  		initSelect(static_orgid) ;
		return false;
	}
	else{
		fillSelect(static_orgid,resulttext,"${static_orgid}") ;
	}
}

function windowClose(){
	parent.art.dialog({id:'selectEmp'}).close();
}

function selectEmployee(object){
	var obj = jQuery(object) ;
	if(obj.attr("checked")){
		var text = object.val().split(",");
		jQuery("#signer",parent.document).val(text[0]) ;
		jQuery("#signer_name",parent.document).val(text[1]) ;
	   	windowClose();  	
	}
}

function initTable(){
	this.selectPhones = parent.selectPhones; 
	this.selectIncepter = parent.selectIncepter;
	if(this.selectPhones.length > 1){
		var allEmployees = jQuery("[name='allemployee']");
		var tempArr = this.selectPhones.split(",") ;
		allEmployees.each(function(){
			for(var i=0;i<tempArr.length;i++){
				if(chkMail(tempArr[i])){
					if(tempArr[i] == jQuery(this).val()){
						jQuery(this).attr("checked","checked") ;
					}
				}
			}
		}) ;
	}
}

function selectCheck(type){
    var allemployees = jQuery("[name='allemployee']");
    if(type == "all"){
    	allemployees.each(function(){
    	
    		if(chkMail(jQuery(this).attr("empphone")) == true){
    			jQuery(this).attr("checked","checked") ;
	    		if(this.selectPhones.indexOf(","+jQuery(this).attr("empphone")+",") <= -1){
		     			this.selectPhones += jQuery(this).attr("empphone") + ",";
		     			this.selectIncepter += jQuery(this).attr("empname") + ",";
		     	}
    		}
    	}) ;
    }else if(type == "none"){
    	 for(var i=0;i<allemployees.length;i++){
    	 	if(allemployees[i].checked == true){
    	 		allemployees[i].checked = false;
    	 		if(this.selectPhones.indexOf(","+allemployees[i].empphone+",") > -1){
    	 			this.selectPhones = this.selectPhones.replace(","+allemployees[i].empphone+",",",");
    	 			this.selectIncepter = this.selectIncepter.replace(","+allemployees[i].empname+",",",");
	     		}
    	 	}
	    }
    }
    parent.selectPhones = this.selectPhones;
	parent.selectIncepter = this.selectIncepter;
}

function chkMail(mailAddress){
	var pattern = /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(\.[a-zA-Z0-9_-])+/;
	if(mailAddress ==''){
		return false;
	}
	if(pattern.test(mailAddress)){
		return true;
	}else{
		return false;
	}
}


function employCheck(object){
	var obj = jQuery(object) ;
	if(obj.attr("checked") == true){
		if(chkMail(obj.val()) == false){
			alert("邮箱地址验证不合格，钩选失败");
			obj.attr("checked","") ;
		}else{
			if(this.selectPhones.indexOf(","+obj.val()+",") <= -1){
	   			this.selectPhones += obj.attr("empphone") + ",";
	   			this.selectIncepter += obj.attr("empname") + ",";
	   		}
		}
	}else{
		if(this.selectPhones.indexOf(","+obj.val()+",") > -1){
 			this.selectPhones = this.selectPhones.replace(","+obj.attr("empphone")+",",",");
 			this.selectIncepter = this.selectIncepter.replace(","+obj.attr("empname")+",",",");
   		}
	}
	parent.selectPhones = this.selectPhones;
	parent.selectIncepter = this.selectIncepter;
}

function saveEmp(){
	parent.setPhoneOfEmp(this.selectPhones,this.selectIncepter);
	windowClose()
}

function setEmpPhone(){
alert(this.selectPhones);
alert(this.selectIncepter);
	parent.selectPhones = this.selectPhones;
	parent.selectIncepter = this.selectIncepter;
	jQuery("[name='selectIncepter']").val(this.selectIncepter) ;
	jQuery("[name='selectPhones']").val(this.selectPhones) ;
	return true;
}
</script>
</head>

<body onload="">
<fieldset>
  <legend><strong>查询条件</strong></legend>
  <html:form action="employeeAction.do?method=selectMailEmployee">
  <html:hidden property="method" value="selectMailEmployee"/>
  <html:hidden property="selectIncepter" value="${param.selectIncepter}"/>
  <html:hidden property="selectPhones" value="${param.selectPhones}"/>
  <html:hidden property="selectType" value="${param.selectType}"/>
    <html:hidden property="flag" value="${param.flag}"/>
  	<table class="searchTable" cellspacing="4" align="center" width="100%">
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
  				<html:select property="deptid">
  					<html:option value="">--请选择--</html:option>
  					<html:optionsCollection name="depts" value="f_id" label="f_name"/>
  				
  				
  				
  				</html:select>&nbsp;&nbsp;&nbsp;
  			</td>

  			
  			
  			
  			<td id="outOrgType" style="display:none">
  				单位类别：<ex:dictSelect property="economictype" type="OrgaizeationEconomictype" onchange="selectmicType()"/>
  				&nbsp;&nbsp;&nbsp;
  			</td>
  			<td id="outOrgName" style="display:none">
  				单位名称：
  				<html:select property="static_orgid">
  					<html:option value="">--请选择--</html:option>
  				</html:select>&nbsp;&nbsp;&nbsp;
  			</td>
  		  </tr>
  		<tr>
  		<td>员工工号：<html:text property="qempcode" styleClass="text" />&nbsp;&nbsp;&nbsp;</td>
  		<td>员工姓名：<html:text property="qempname" styleClass="text" />&nbsp;&nbsp;&nbsp;</td>
  		<td align="right">
  			 &nbsp;&nbsp;&nbsp;
			  <input type="submit" value="查询" class="button1" />
  		</td>
  		</tr>
  	</table>
  </html:form>
</fieldset>
<fieldset>
  <legend><strong>员工信息列表</strong></legend>
 <table class="commonTable" border="0" cellpadding="0" cellspacing="0" width="100%">
  	<tr>
  		<td align="left">
  			<input type="button" class="button1" value="全 选" onclick="selectCheck('all')" />
			<input type="button" class="button1" value="全不选" onclick="selectCheck('none')" />
			<input type="button" class="button1" value="保 存" onclick="saveEmp()" />
		    <input type="button" class="button1" value="关 闭" onclick="windowClose()" />
  		</td>
  		<td>
  		<font color="blue">备注：当邮箱地址不存在或验证不合格，选择此人员将失效！</font>
  		</td>
  	</tr>
  </table>
  <ec:table items="employees" var="employee" 
		action="employeeAction.do?method=selectMailEmployee" title=""  locale="zh_CN"
		sortable="false" rowsDisplayed="10" imagePath="${ctx}/styles/extremecomponents/images/*.gif"
		retrieveRowsCallback="limit" filterRowsCallback="limit" sortRowsCallback="limit"
		>
		<ec:row highlightRow="true"  onclick="pullValue('${employee.employee_id}','');"
				ondblclick="showView('${employee.employee_id}');">
			<ec:column property="null" sortable="false" title="选择" width="100px">
			<div align="center">
				<input type="checkbox" name="allemployee" id="${employee.employee_id }" value="${employee.emailaddress}" empname="${employee.employee_name}" empphone="${employee.emailaddress}" onclick="employCheck(this)" />
			</div>
	    </ec:column>
		 <ec:column property="employee_name" title="姓名" width="150px" >
		 <div align="center">
			${employee.employee_name}	
			</div>
		 </ec:column>
		<ec:column property="employee_code" title="工号" width="150px" >
		<div align="center">
			${employee.employee_code}	
			</div>
		 </ec:column>
		<ec:column property="employee_sex" title="性别" width="100px">
		<div align="center">
		<ex:dicDisplay dictIdentify="EmployeeSex" dictValue="${employee.employee_sex}"/>
		</div>	
		</ec:column>
		<ec:column property="emailaddress" title="邮箱地址" width="150px" >
		<div align="center">
			${employee.emailaddress}	
			</div>
		 </ec:column>	
				
				</ec:row>
				</ec:table>
  
  
  
  
</fieldset>
</body>
</html:html>
