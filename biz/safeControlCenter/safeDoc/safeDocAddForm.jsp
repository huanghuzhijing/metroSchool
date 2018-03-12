<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
<html:html>
<head>
	<%@ include file="/commons/meta.jsp"%>
	<script type="text/javascript">
	$(document)
			.ready(function() {
				//确定
					$("#btn_save").click(
							function() {
								var properties = new Array();
		
		     properties[0]=["types","文件类型"];			
			properties[1]=["title","文件标题"];
			
								
								saveValidateRequired("#btn_save", properties,
										"safeDocForm");
							});
					//返回
					$("#btn_back")
							.click(
									function() {
										location.href = "${ctx}/safeDocAction.do?method=list&qlineId=${param.qlineId}&qsegmentId=${param.qsegmentId}";
									});

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
		<html:hidden property="ec_p" />
		<html:hidden property="ec_crd" />
		<html:hidden property="lineid"
			value="${dtaqSegment.line_id.line_id}" />
		<html:hidden property="segid"
			value="${dtaqSegment.segment_id}" />
		
		<fieldset>
			<legend>
				安全档案-新增
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
						<input type="text" readonly="readonly" id="lineid" name="lineid"
							class="form_input" size="30"
							value="${dtaqSegment.line_id.line_name}" />
					</td>
				

					<td>
						标段：
						<span class="noRedSpan">*</span>
					</td>
					<td>
						<input type="text" readonly="readonly" id="segid"
							name="segid" class="form_input"
							value="${dtaqSegment.segment_name}" />
					</td>
				
				</tr>
				<tr>
				<td>
						文件标题：
						<span class="redSpan">*</span>
					</td>
					<td>
						<html:text property="title"  styleClass="inputText" />						
					</td>
				</tr>
				<tr>
				<td>
						文件类型：
						<span class="redSpan">*</span>
					</td>
					<td>
						<ex:dictSelect property="types" type="ContractOrigin"/>
					</td>
				</tr>
				<tr>
				  <td>
						作者：
						<span class="noRedSpan">*</span>
					</td>
					<td>
						<input  type="text" readonly="readonly" id="author" name="author" class="form_input" value="${oper}" />						
					</td>
					<td>
						创建日期：
						<span class="noRedSpan">*</span>
					</td>
					<td>
						<html:text property="ts" value="${currDate}"
							styleClass="inputText"
							onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})" />
					</td>
					</tr>
					
				<tr>
					<td>
						文件内容:
						<span class="noRedSpan">*</span>
					</td>
				</tr>
				<tr>
					<td colspan="4">
						<input type="hidden" name="context" />
						<iframe id="eWebEditor1"
							src="ewebeditor/ewebeditor.htm?id=context&style=coolblue"
							frameborder="0" scrolling="no" width="100%" HEIGHT="400"></iframe>
					</td>
				</tr>


			</table>
		</fieldset>
		<!-- 附件增加 -->
		<%@ include file="/commons/uploadFilesExceptionList.jsp"%>

		<div class="saveDiv">
			<input id="btn_save" value="确  定" type="button" icon="icon_save" />
			<input id="btn_back" value="${texts['button.back']}" type="button"
				icon="icon_back" />
		</div>
	</html:form>
</body>
</html:html>
