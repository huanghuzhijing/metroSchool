<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
<html:html>
<head>
	<script type="text/javascript">
		//加载
	   $(document).ready(function(){
			//
			$("#btn_back").click(function(){ 
				history.back(-1);
			}); 
			//
			$("#btn_reload").click(function(){ 
				location.href="personMailboxSendAction.do?method=sendmailbefortransmit&sendid=${personMailboxSend.id}&flag=${flag}&ec_crd=${param.ec_crd}";
			}); 
			//
		});
	</script>
</head>
<content tag="heading">
	信件信息
</content>
<body>
	<fieldset >
		<legend>[信件信息]</legend>
		<html:hidden property="flag" value="${param.flag}" />
				<table class="titleTable">
					<COLGROUP>
				         <COL class="tdLeftOneTwo" />
					     <COL class="tdRightOneTwo" />
				    </COLGROUP>
					<tr>
						<td>
							收&nbsp;&nbsp;件&nbsp;&nbsp;人：<span class="noRedSpan">*</span>
						</td>
						<td colspan="3">
							${receiveperson_name}&nbsp;
						</td>
					</tr>
					<tr>
						<td>
							标&nbsp;&nbsp;&nbsp;&nbsp;题：<span class="noRedSpan">*</span>
						</td>
						<td colspan="3">
							${personMailboxSend.title}&nbsp;
						</td>
					</tr>
					<tr>
						<td>
							内&nbsp;&nbsp;&nbsp;&nbsp;容：<span class="noRedSpan">*</span>
						</td>
						<td colspan="3">
							${tempContent}&nbsp;
						</td>
					</tr>
				</table>
	</fieldset>
	<fieldset>
			<legend>收件人查看列表</legend>
			<ec:table items="personMailboxReceives" var="personMailboxReceive" tableId="tab01"
				action="personMailboxSendAction.do" title=""  locale="zh_CN" showPagination="false"
				sortable="false" rowsDisplayed="10" imagePath="${ctx}/styles/extremecomponents/images/*.gif"
			>
				<ec:row highlightRow="true" 
				>
					<ec:column property="rowcount" cell="rowCount" sortable="false" title="序号" />
					<ec:column property="receiveperson" title="收件人" >
						<ex:employeeName id="${personMailboxReceive.receiveperson}"/>
					</ec:column>
					<ec:column property="readDate" title="查看时间" >
						<fmt:formatDate value="${personMailboxReceive.readDate}" pattern="yyyy-MM-dd"/>
					</ec:column>	
				</ec:row>
			</ec:table> 
	</fieldset>
	<%@ include file="/commons/showFiles.jsp"%>
	<div  class="saveDiv">
		<input id="btn_back" value="${texts['button.back']}" type="button"  icon="icon_back"/>
		<input id="btn_reload" value="转  发" 					 type="button"  icon="icon-reload"/>
	</div>
</body>
</html:html>
