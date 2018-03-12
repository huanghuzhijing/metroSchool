<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
<html:html>
<head>
<script type="text/javascript">
	$(document).ready(function(){
	  $("#btn_back").click(function(){ 
			var url ='dtaqRiskPatrolAction.do?method=list&qtype=${param.qtype}&ec_p=${param.ec_p}&ec_id=${dtaqRiskPatrol.id}&ec_crd=${param.ec_crd}';
			document.forms[0].action=url;
			document.forms[0].submit();
	    	
			}); 
	});
		
</script>
</head>
<content tag="heading">
	工程安全报告室
</content>
<body>
	
	<fieldset>
			<legend>工程安全报告室详细信息</legend>
			<html:form enctype="multipart/form-data" action="dtaqRiskPatrolAction.do" method="POST">
		<!--查询定位 开始-->
		<html:hidden property="qname" />
		
		<html:hidden property="ec_crd" />
		<html:hidden property="ec_id" value="${param.id}"/>
		<html:hidden property="ec_p" />
		<html:hidden property="id" />
		<!--查询定位 结束-->
</html:form>
			<table class="titleTable" >
		         <COLGROUP>
						<COL class="tdLeftTwo" />
						<COL class="tdRightTwo" />
						<COL class="tdLeftTwo" />
						<COL class="tdRightTwo" />
					</COLGROUP>
					<tr>
						<td>
							名称：<span class="noRedSpan">*</span>
						</td>
						<td colspan="3">
							${dtaqRiskPatrol.name}&nbsp;
						</td>
					</tr>
					<tr>
						<td>
							上传附件：<span class="noRedSpan">*</span>
						</td>
						<td colspan="3">
						<c:if test="${dtaqRiskPatrol.attach_address!=null}">
								<a href="<%=request.getContextPath()%>/dtaqRiskPatrolAction.do?method=download&id=${dtaqRiskPatrol.id }">${dtaqRiskPatrol.attach_name}</a>
							</c:if>
						  </td>    
					  </tr> 
					    <tr> 
						<td>
							类型：<span class="noRedSpan">*</span>
						</td>
						<td >
							<ex:dicDisplay dictIdentify="RiskPatrolType" dictValue="${dtaqRiskPatrol.type}"/>&nbsp;
						</td>
						 <c:if test="${type=='1'}">
						<td id="sta1">
						  车站/区间：<span class="noRedSpan">*</span>
						</td>
						<td id="sta2">
						${station_name}
						</td>
						</c:if>
					</tr>
					<tr>
						<td>
							填报人：<span class="noRedSpan">*</span>
						</td>
						<td >
							${dtaqRiskPatrol.recoder}&nbsp;
						</td>
                        <td>
			             	填报日期：<span class="noRedSpan">*</span>
			             </td>
			             <td>
			             	<fmt:formatDate value="${dtaqRiskPatrol.recoder_date}"/>&nbsp;
			             </td>
					</tr>
		          
			</table>
	</fieldset>
	<div class="saveDiv">
		<input type="button" id="btn_back" value="<fmt:message key="button.back"/>" icon="icon_back" />
    </div>
</body>
</html:html>
