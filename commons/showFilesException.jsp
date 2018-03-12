<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/commons/taglibs.jsp"%> 
<fieldset><legend>附件信息</legend>
<script type="text/javascript">
<!--

//-->
function openWin(url){
	window.open (url, "newwindow", "width="+(window.screen.availWidth-10)+",height="+(window.screen.availHeight-30)+ ",top=0,left=0, toolbar=no, menubar=no, scrollbars=no, resizable=yes, location=no, status=no")
}
</script>
<table class="listTable" >
	<thead>
		<tr>
			<th width="8%">
				序&nbsp;&nbsp;&nbsp;&nbsp;号
			</th>
			<th>
				附件名称
			</th>
			 <c:if test="${maintable!='emergencyMember'&&maintable!='accidentReport'}">
			<th width="15%">
				附件类型
			</th>
			<th width="15%">
				附件大小(K)
			</th>
			</c:if>
			<c:if test="${maintable=='emergencyMember'||maintable=='accidentReport'}">
			<th width="10%">
				附件类型
			</th>
			<th width="10%">
				上传人
			</th>
			<th width="10%">
				上传时间
			</th>
			</c:if>
			<th width="15%">
				操&nbsp;&nbsp;&nbsp;&nbsp;作
			</th>
		</tr>
	</thead>
	<c:forEach items="${voList}" var="annex" varStatus="index">
		<tr  id="historytr${annex.annexId}" ondblclick="location.href='contentSelectAction.do?method=download&fileaddress=${annex.annexaddress}&filename=${annex.annexname}'">
			<td>
				${index.count }
			</td>
			<td>
				${annex.annexname}&nbsp;
			</td>
			<c:if test="${maintable!='emergencyMember'&&maintable!='accidentReport'}">
			<td>
				${annex.formattype}&nbsp;
			</td>
			<td>
				${annex.annexsize}&nbsp;(K)
			</td>
			</c:if>
			<c:if test="${maintable=='emergencyMember'||maintable=='accidentReport'}">
			<td>
			<ex:dicDisplay dictIdentify="AttachType" dictValue="${annex.attachType}" />&nbsp;
			
			</td>
			<td>
				<ex:employeeName id="${annex.uploadMan}"/>&nbsp;
			</td>
			<td>
				${annex.uploadDate}&nbsp;
			</td>
			</c:if>
			
			<td>
				<div  class="listButtonDiv">
				<input type="button" class="button1" annexid="${annex.annexId}" 
					value="<fmt:message key="button.download"/>" name="download" icon="icon_download"
					onclick="location.href='contentSelectAction.do?method=download&fileaddress=${annex.annexaddress}&filename=${annex.annexname }&fileType=${fn:toLowerCase(annex.formattype)}'" />
					   <c:if test="${fn:contains('doc,docx,ppt,xls,pdf',fn:toLowerCase(annex.formattype))}">
					<input type="button" class="button1"
						value="在线查看" name="download"
						icon="icon_view"
						onclick="openWin('contentSelectAction.do?method=webOfficeView&fileaddress=${annex.annexaddress}&filename=${annex.annexname }&fileType=${fn:toLowerCase(annex.formattype)}');" />
					</c:if>
					</div>
			</td>
		</tr>
	</c:forEach>
</table>
</fieldset>