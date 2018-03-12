<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
<html:html>
<head>
<script type="text/javascript">
	$(document).ready(function(){
	  $("#btn_back").click(function(){ 
		  document.forms[0].action='announcementAction.do?method=list&ec_p=${param.ec_p}&ec_id=${param.id}&ec_crd=${param.ec_crd}';   
		  document.forms[0].submit();
			}); 
	});
		
</script>
</head>
<content tag="heading">
	系统公告
</content>
<body>
	<html:form enctype="multipart/form-data" action="announcementAction.do" method="POST">
		<input name="method"  type="hidden" />
		<html:hidden property="id" />
		<html:hidden property="qtitle" />
		<html:hidden property="qcreater" />
		<html:hidden property="qstartDate" />
		<html:hidden property="qendDate" />
		<!--查询定位 开始-->
		<html:hidden property="ec_id" value="${announcement.id}"/>
		<html:hidden property="ec_p" />
		<html:hidden property="ec_crd" />
		<!--查询定位 结束-->
	<fieldset>
			<legend>系统公告详细信息</legend>
			<table class="titleTable" >
		         <COLGROUP>
						<COL class="tdLeftTwo" />
						<COL class="tdRightTwo" />
						<COL class="tdLeftTwo" />
						<COL class="tdRightTwo" />
					</COLGROUP>
					<tr>
						<td>
							标题：<span class="noRedSpan">*</span>
						</td>
						<td colspan="3">
							${announcement.title}&nbsp;
						</td>
					</tr>
					<tr>
				<td>
						  内容：<span class="noRedSpan">*</span>
						</td>
				<td colspan="3">
	   		${announcement.content}&nbsp;
				</tr>
					<tr>
						<td>
							附件：<span class="noRedSpan">*</span>
						</td>
						<td colspan="3">
						<c:if test="${announcement.affixAddress!=null}">
								<a href="<%=request.getContextPath()%>/announcementAction.do?method=download&id=${announcement.id }">${announcement.affixName}</a>
							</c:if>
						  </td> 
					  </tr> 
					    
					<tr>
						<td>
							作者：<span class="noRedSpan">*</span>
						</td>
						<td >
							<ex:empName id="${announcement.creater}"/>&nbsp;
						</td>
                        <td>
			             	创建日期：<span class="noRedSpan">*</span>
			             </td>
			             <td>
			             	<fmt:formatDate value="${announcement.createDate}" />&nbsp;
			             </td>
					</tr>
		          
			</table>
	</fieldset>
	<div class="saveDiv">
		<input type="button" id="btn_back" value="<fmt:message key="button.back"/>" icon="icon_back" />
    </div>
    </html:form>
</body>
</html:html>
