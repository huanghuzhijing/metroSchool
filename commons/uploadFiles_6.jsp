<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<script src="${ctx}/scripts/uploadfiles.js" type="text/javascript"></script>
<script type="text/javascript">
<!--

//-->
function openWin(url){
	window.open (url, "newwindow", "width="+(window.screen.availWidth-10)+",height="+(window.screen.availHeight-30)+ ",top=0,left=0, toolbar=no, menubar=no, scrollbars=no, resizable=yes, location=no, status=no")
}
</script>
	<input type="hidden" id="annexcount" name="annexcount" value="1" />
	<input type="hidden" id="deleteannex" name="deleteannex" />
	<input type="hidden" name="fileUpload" value="1"/>
	<fieldset><legend>现场照片信息</legend>
	<table class="listTable"  id="annexTable" >
		<thead>
			<tr >
				<th  width="8%">
					序&nbsp;&nbsp;&nbsp;&nbsp;号
				</th>
				<th>
					附件名称
				</th>
				<th  width="15%">
					附件类型
				</th>
				<th  width="15%">
					附件大小(K)
				</th>
				<th  width="20%">
					操&nbsp;&nbsp;&nbsp;&nbsp;作
				</th>
			</tr>
		</thead>
		<c:forEach items="${pubannexLst}" var="annex" varStatus="index">
			<tr id="historytr${annex.id}" ondblclick="window.document.location.href='pubAnnexAction.do?method=download&id=${annex.id}'">
				<td>
					${index.count }
				</td>
				<td>
					${annex.filename}&nbsp;
				</td>
				<td>
					${annex.filetype}&nbsp;
				</td>
				<td>
					${annex.filesize}&nbsp;(K)
				</td>
				<td>
					<input type="button" class="button1"
						value="<fmt:message key="button.download"/>" name="download"
						icon="icon_download"
						onclick="window.document.location.href='pubAnnexAction.do?method=download&id=${annex.id}'" />
					<input type="button" icon="icon_delete"
						value="<fmt:message key="button.delete"/>"
						onclick="deleteHistoryAnnex('${annex.id}')" />
						
				   <c:if test="${fn:contains('doc,docx,ppt,xls,pdf',fn:toLowerCase(annex.filetype))}">
					<input type="button" class="button1"
						value="在线查看" name="download"
						icon="icon_view"
						onclick="openWin('pubAnnexAction.do?method=webOfficeView&id=${annex.id}&fileType=${fn:toLowerCase(annex.filetype)}');" />
					  
					   <c:if test="${fn:contains(userinfo.cmdIds,',sendFile_webEdit,')||fn:contains(userinfo.cmdIds,',deptSendFile_webEdit,')||fn:contains(userinfo.cmdIds,',docMaterials_webEdit,')}">
						<input type="button" class="button1"
						value="在线编辑" name="download"
						icon="icon_edit"
						onclick="openWin('pubAnnexAction.do?method=webOfficeEdit&id=${annex.id}&fileType=${fn:toLowerCase(annex.filetype)}');" />
					
					</c:if>
				 </c:if>	
					
				</td>
			</tr>
		</c:forEach>
	</table>
<br/>
	<table class="formTable" >
					<COLGROUP>
						<COL class="tdLeftTwo" />
						<COL class="tdRightTwo" />
						<COL class="tdLeftTwo" />
						<COL class="tdRightTwo" />
					</COLGROUP>
					<tr id="tr1" style="display: block">
						<td>
							文件名称：&nbsp;&nbsp;
						</td>
						<td>
							<input id="filename1" type="text" class="inputText" name="filename1" size="35" maxlength="50">
						</td>
						<td>
							文件路径：&nbsp;&nbsp;
						</td>
						<td>
							<input onchange="upload_getFileName('1',this);" id="thefile1" class="inputText" size="30" type="file" name="thefile1">
						</td>
					</tr>
					<c:forEach begin="2" end="10" step="1" var="item">
						<tr id="tr${item}" style="display: none">
							<td>
								文件名称：&nbsp;&nbsp;
							</td>
							<td>
								<input id="filename${item}" class="inputText" type="text" size="35" name="filename${item}">
							</td>
							<td>
								文件路径：&nbsp;&nbsp;
							</td>
							<td>
								<span id="upload_span_${item}">
									<input onchange="upload_getFileName('${item}',this);" id="thefiles${item}" size="30" class="inputText" type="file"
										name="thefile${item}">
								</span>
								<input type="button" icon="icon_delete" id="loadFile" value="<fmt:message key="button.delete"/>" onclick='deletetr(${item})'>
							</td>
						</tr>
					</c:forEach>
					<tr>
						<td colspan="4">
							<input type="button" value="继续增加附件" icon="icon-add-row" onclick="insert()" />
						</td>
					</tr>
				</table>

</fieldset>
