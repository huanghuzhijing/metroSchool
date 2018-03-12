<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>
<ex:bundle/>
<html>
<head>
<script type="text/javascript">
	$(document).ready(function(){
		//返回
       $("#btn_back").click(function(){
       		location.href='organizationAction.do?method=list&ec_id=${organization.f_id}&qf_no=${param.qf_no}&static_parent_id=${param.static_parent_id}&fIsdelete=${param.fIsdelete}&name=${param.name}&ec_p=${param.ec_p}';
       });
       //
	 });
</script>
</head>
<content tag="heading">
内部组织信息管理
</content>  
<body>
	<fieldset >
		<legend>组织信息维护</legend>
	<table class="titleTable" >
	                     <COLGROUP >
							<COL class="tdLeftTwo" />
							<COL class="tdRightTwo" />
							<COL class="tdLeftTwo" />
							<COL class="tdRightTwo" />
						</COLGROUP>
		<tr>
	
						<c:if test="${organization eq null}">
							<td >上级组织名称：&nbsp;&nbsp;</td>
							<td>组织树 &nbsp;&nbsp;</td>
							<td >组织编号：&nbsp;&nbsp;</td>
							<td>&nbsp;&nbsp;</td>
						</c:if>

						<c:if test="${organization ne null}">
							<td >
								上级组织名称：<span class="noRedSpan">*</span>
							</td>
							<td>
								<input type="text" value="${parent.f_name}" class="showText" size="40">
							</td>
							<td >
								组织编号：<span class="noRedSpan">*</span>
							</td>
							<td>
								<input  type="text" value="${parent.f_no}" value="" class="showText">
							</td>
						</c:if>
		</tr>
	</table>
	</fieldset>
	<fieldset >
			<legend>组织信息详细</legend>
			<table class="titleTable" >
		         <COLGROUP>
		           	<COL class="tdLeftTwo" />
					<COL class="tdRightTwo" />
					<COL class="tdLeftTwo" />
					<COL class="tdRightTwo" />
		          </COLGROUP>
		          <tr>
		             <td>组织名称：&nbsp;&nbsp;</td>
		             <td>${organization.f_name}&nbsp;</td>
		             <td>组织编号：&nbsp;&nbsp;</td>
		             <td>${organization.f_no}&nbsp;</td>
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
									备&nbsp;&nbsp;&nbsp;&nbsp;注：<span class="noRedSpan">*</span>
								</td>
								<td colspan="3">
									${organization.attr2}
								</td>
							</tr>
		           
		           
		           
		           
		       
			</table>
	</fieldset>
	
	<div class="saveDiv">
		<input type="button" icon="icon_back" id="btn_back" value="<fmt:message key="button.back"/>" />
	</div>
  </body>
</html>


