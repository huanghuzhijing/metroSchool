<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
<html:html>
<head>
	<%@ include file="/commons/meta.jsp"%>
	<script type="text/javascript">
	$(document)
			.ready(function() {
				var flag="${param.flag}";
				if(flag==1){
				//返回
					$("#btn_back")
							.click(
									function() {
									var url = "${ctx}/safeDocAction.do?method=list&flag=${param.flag}&qlineId=${param.qlineId}&qsegmentId=${param.qsegmentId}&qstartDate=${param.qstartDate}&qendDate=${param.qendDate}&qtypes=${param.qtypes}&ec_id=${param.fid}&ec_p=${param.ec_p}&ec_crd=${param.ec_crd}";
									document.forms[0].action=url;
									document.forms[0].submit();
									});
				}
				if(flag==2){
				//返回
					$("#btn_back")
							.click(
									function() {
									var url = "${ctx}/safeDocAction.do?method=queryList&flag=${param.flag}&qlineId=${param.qlineId}&qsegmentId=${param.qsegmentId}&qstartDate=${param.qstartDate}&qendDate=${param.qendDate}&qtypes=${param.qtypes}&ec_id=${param.fid}&ec_p=${param.ec_p}&ec_crd=${param.ec_crd}";
									document.forms[0].action=url;
									document.forms[0].submit();
									});
				
				}

					
				});
				
				
	
</script>
</head>

<body>

	<html:form enctype="multipart/form-data" action="safeDocAction.do"
		method="POST">
		<input name="method" value="save" type="hidden" />
		<html:hidden property="qlineId" />
		<html:hidden property="qsegmentId" />
		
		<html:hidden property="qstartDate" />
		<html:hidden property="qendDate" />
		
		<html:hidden property="qtypes" />
		<html:hidden property="qtitle" />

		<html:hidden property="fid" />
		<html:hidden property="ec_id" />
		<html:hidden property="ec_p" />
		<html:hidden property="ec_crd" />
		<html:hidden property="lineid"
			value="${safeDoc.lineid}" />
		<html:hidden property="segid"
			value="${safeDoc.segid}" />
		
		<fieldset>
			<legend>
				安全档案-详细
			</legend>
			<table class="formTable">
				<COLGROUP>
					<COL class="tdLeftTwo" />
					<COL class="tdRightTwo" />
					<COL class="tdLeftTwo" />
					<COL class="tdRightTwo" />
				</COLGROUP>
				<tr>
				<td>
						线路：
						<span class="noRedSpan">*</span>
					</td>
					<td>
						${line_name}
					</td>
				

					<td>
						标段：
						<span class="noRedSpan">*</span>
					</td>
					<td>
						${segment_name}
					</td>
				
				</tr>
				<tr>
				<td>
						文件标题：
						<span class="noRedSpan">*</span>
					</td>
					<td>
						${safeDoc.title}
					</td>
				</tr>
				<tr>
				<td>
						文件类型：
						<span class="noRedSpan">*</span>
					</td>
					<td>
					<ex:dicDisplay dictIdentify="ContractOrigin" dictValue="${safeDoc.types}"/>
						
					</td>
				</tr>
				<tr>
				  <td>
						作者：
						<span class="noRedSpan">*</span>
					</td>
					<td>
						${safeDoc.author}	
					</td>
					<td>
						创建日期：
						<span class="noRedSpan">*</span>
					</td>
					<td>
						<fmt:formatDate value="${safeDoc.ts}" pattern="yyyy-MM-dd"/>
					</td>
					</tr>
					
				<tr>
					<td>
						文件内容:
						<span class="noRedSpan">*</span>
					</td>
					<td colspan="4" id="context" align="left">
						<c:out value="${context}" escapeXml="false" />
					</td>
				</tr>
				
			</table>
			
		</fieldset>
		<!-- 附件增加 -->
		<%@ include file="/commons/showFilesException.jsp"%>

		<div class="saveDiv">
			
			<input id="btn_back" value="${texts['button.back']}" type="button"
				icon="icon_back" />
		</div>
	</html:form>
</body>
</html:html>
