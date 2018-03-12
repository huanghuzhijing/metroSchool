<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<fieldset><legend>现场图片上传 限jpg格式</legend>
<script type="text/javascript">
<!--

//-->
function openWin(url){
	window.open (url, "newwindow", "width="+(window.screen.availWidth-10)+",height="+(window.screen.availHeight-30)+ ",top=0,left=0, toolbar=no, menubar=no, scrollbars=no, resizable=yes, location=no, status=no")
}
//
function doOver(id){
	if(id!=null&&id!=''){
		$("#div01").html($("#div_"+id).html());
	}
	$("#div01").show();
}
//
function doOut(id){
	$("#div01").hide();
}
</script>
<div id="div01" onmousemove="doOver()" onmouseout="doOut()"
	style="left: 30%;width: 440px;;height: 235px;position: absolute;background-color: silver;
		   top: 10%;text-align: center;padding-top: 5px;display: none;">
	</div>
<table class="listTable" >
	<thead>
		<tr>
			<th width="8%">
				序&nbsp;&nbsp;&nbsp;&nbsp;号
			</th>
			<th>
				附件名称
			</th>
			<th width="15%">
				附件类型
			</th>
			<th width="15%">
				附件大小(K)
			</th>
			<th width="15%">
				操&nbsp;&nbsp;&nbsp;&nbsp;作
			</th>
		</tr>
	</thead>
	<c:forEach items="${pubannexLst}" var="annex" varStatus="index">
		<tr id="historytr${annex.id}" ondblclick="location.href='pubAnnexAction.do?method=download&id=${annex.id}'">
			<td>
				${index.count }
			</td>
			<td
				<c:if test="${fn:contains('jpg,jpeg,gif,png,bmp',fn:toLowerCase(annex.filetype))}">
				onmouseover="doOver(${annex.id})"
				onmouseout="doOut(${annex.id})"
				</c:if>
			>
				${annex.filename}&nbsp;
			</td>
			<td>
				${annex.filetype}&nbsp;
			</td>
			<td>
				${annex.filesize}&nbsp;(K)
			</td>
			<td>
				<div id="div_${annex.id}" style="display: none;">
					<img  width="430px" height="230px" style="cursor: hand;" src="pubAnnexAction.do?method=imageShow&id=${annex.id}">
				</div>
				<input type="button" class="button1" annexid="${annex.id}" 
					value="<fmt:message key="button.download"/>" name="download" icon="icon_download"
					onclick="location.href='pubAnnexAction.do?method=download&id=${annex.id}'" />
					   <c:if test="${fn:contains('doc,docx,ppt,xls,pdf',fn:toLowerCase(annex.filetype))}">
					<input type="button" class="button1"
						value="在线查看" name="download"
						icon="icon_view"
						onclick="openWin('pubAnnexAction.do?method=webOfficeView&id=${annex.id}&fileType=${fn:toLowerCase(annex.filetype)}');" />
					</c:if>
			</td>
		</tr>
	</c:forEach>
</table>
</fieldset>