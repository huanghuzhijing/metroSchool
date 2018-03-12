<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>
<ex:bundle/>
<html>
<head>
<script type="text/javascript">
	$(document).ready(function(){
		//返回
       $("#btn_back").click(function(){
       		var url='organizationOutAction.do?method=list&ec_id=${param.f_id}&ec_crd=${param.ec_crd}&ec_p=${param.ec_p}&qf_economictype=${param.qf_economictype}';
           document.forms[0].action=url;
	       document.forms[0].submit();
       });
       //
	 });
</script>
</head>
<content tag="heading">
参建单位信息管理
</content>
<body>
	
	
	<html:form action="organizationOutAction.do" method="POST">
		<input type="hidden" name="method" value="" />
		<html:hidden property="f_id" value="${param.f_id}"/>
	     <html:hidden property="ec_crd" />
	    <html:hidden property="qf_name" />
		<html:hidden property="ec_p" />
		<html:hidden property="ec_id" value="${organizationOut.f_id}"/>
		    <fieldset >
			<legend>参建单位信息-详细</legend>
						   	<table class="formTable" >
							<COLGROUP>
								<COL class="tdLeftTwo" />
								<COL class="tdRightTwo" />
								<COL class="tdLeftTwo" />
								<COL class="tdRightTwo" />
							</COLGROUP>
							
							<tr>
								<td>
									组织编号：<span class="redSpan">*</span>
								</td>
								<td>
								${organization.f_no}
								</td>
								<td>
									组织名称：<span class="redSpan">*</span>
								</td>
								<td>
									${organization.f_name}
								</td>
							</tr>
							<tr>
								<td>
									法人：<span class="noRedSpan">*</span>
								</td>
								<td >
										${organization.f_chargeperson}
								</td>
								<td>
									单位类别：<span class="redSpan">*</span>
								</td>
								<td>
								 	<ex:dicDisplay dictIdentify="OrgaizeationEconomictype" dictValue="${organization.f_economictype}" />
								</td>
							</tr>
							<tr>
								<td>
									组织地址：<span class="noRedSpan">*</span>
								</td>
								<td >
										${organization.f_address}
								</td>
								<td>
									组织邮编：<span class="noRedSpan">*</span>
								</td>
								<td>
									${organization.f_postcode}
								</td>
							</tr>
							<tr>
								<td>
									电话：<span class="noRedSpan">*</span>
								</td>
								<td >
										${organization.f_tel}
								</td>
								<td>
									传真：<span class="noRedSpan">*</span>
								</td>
								<td>
										${organization.f_fax}
								</td>
							</tr>
							<tr>
								<td>
									创建日期：<span class="noRedSpan">*</span>
								</td>
								<td><fmt:formatDate value="${organization.f_createdate}" pattern="yyyy-MM-dd"/>&nbsp;</td>
								
								<td>
									注销日期：<span class="noRedSpan">*</span>
								</td>
								<td colspan="3"><fmt:formatDate value="${organization.f_repealdate}" pattern="yyyy-MM-dd"/>&nbsp;</td>
							</tr>
							
							<tr>
								<td>
									属&nbsp;&nbsp;&nbsp;&nbsp;性：<span class="noRedSpan">*</span>
								</td>
								<td colspan="3">
									${organization.f_attribute}
								</td>
							</tr>
							
							<tr>
								<td>
									备&nbsp;&nbsp;&nbsp;&nbsp;注：<span class="noRedSpan">*</span>
								</td>
								<td colspan="3">
									${organization.attr2}
								</td>
							</tr>
			</table>
		</fieldset>
	
		<div class="saveDiv">
			<input id="btn_back" value="<fmt:message key="button.back"/>" type="button" icon="icon_back" />
		</div>
	</html:form>
  </body>
</html>


