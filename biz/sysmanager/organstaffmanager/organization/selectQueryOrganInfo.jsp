<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>
<%@ include file="/commons/meta.jsp" %>
<ex:bundle/>
<html:html>

<head>
<title>组织选择</title>
<script src="<c:url value="/scripts/public.js"/>" type="tect/javascript"></script>
<script type="text/javascript">
function selectOrgFlag(value){
	if(value=="0"){
	   jQuery("#outOrgType").hide();
	   jQuery("[name='economictype'] option:eq(0)").attr("selected","selected") ;
	}else if(value=="1"){
	   jQuery("#outOrgType").show();
	}
}


function windowClose(){
	parent.art.dialog({id:'queyOrg'}).close();
}

function selectOrg(object){
	var obj = jQuery(object) ;
	if(obj.attr("checked")){
		var text = obj.val().split(",");
		
		
		jQuery("#org_id",parent.document).val(text[0]) ;
		jQuery("#org_name",parent.document).val(text[1]) ;
	   	windowClose(); 	
	}
}

function init(value){
	if(value != ""){
		if(value=="0"){
		   jQuery("#outOrgType").hide();
	   		jQuery("[name='economictype'] option:eq(0)").attr("selected","selected") ;
		}else if(value=="1"){
		    jQuery("#outOrgType").show();
		}
	}
}
</script>
</head>

<body onload="init('${orgflag}')">
<fieldset>
  <legend><strong>查询条件</strong></legend>
  <html:form action="organizationAction.do?method=queryOrgInfoList">
  <html:hidden property="method" value="queryOrgInfoList"/>
  	<table cellspacing="4" align="center" width="100%">
  		<tr>
  			<td>
  			单位性质：<html:select property="orgflag" onchange="selectOrgFlag(this.value)">
  						<html:option value="0">公司本部</html:option>
  						<html:option value="1">参建单位</html:option>
  					</html:select>
  					&nbsp;&nbsp;&nbsp;
  			</td>
  			<td id="outOrgType" style="display:none">
  				单位类别：<ex:dictSelect property="economictype" type="OrgaizeationEconomictype"/>
  				&nbsp;&nbsp;&nbsp;
  			</td>
  			<td>
  				单位名称：
  				<html:text property="detpname" styleClass="text" />
  			</td>
  			<td width="100px" align="right"><input type="submit" value="<fmt:message key="button.query"/>" class="button1"/></td>
  		</tr>
  	</table>
  </html:form>
</fieldset>
<fieldset>
  <legend><strong>部门信息列表</strong></legend>
  <table width="100%" align="center">
  	<tr>
  		<td>
  			<table id="fileTable" width="100%" align="center" border="0" cellpadding="0" cellspacing="1" >
				<tr align="center" bgcolor="#DFF0F9" height="25" id="trSite">
				  <td width="10%"><font color="#4C78A6"><strong>序号</strong></font></td>
				  <td width="30%"><font color="#4C78A6"><strong>名称</strong></font></td>
				  <td width="20%"><font color="#4C78A6"><strong>编号</strong></font></td>
				  <td width="20%"><font color="#4C78A6"><strong>创建日期</strong></font></td>
				  <td width="10%"><font color="#4C78A6"><strong>电话</strong></font></td>
				  <td width="10%"><font color="#4C78A6"><strong>选择</strong></font></td>
				</tr>
				<c:set var="index" value="0"></c:set>
				<c:forEach items="${organizations}" var="organization">
					<tr class="tr07" align="center" height="20" bgcolor="#C6DFF7">
						<td>${index+1}</td>
						<td>${organization.f_name}</td>
						<td>${organization.f_no}</td>
						<td><fmt:formatDate value="${organization.f_createdate}" pattern="yyyy-MM-dd"/></td>
						<td>${organization.f_tel}</td>
						<td>
							<input type="radio" id="checkOrgs" name="checkOrgs" onclick="selectOrg(this)" value="${organization.f_id},${organization.f_name}">
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
