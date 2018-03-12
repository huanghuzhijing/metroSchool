<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
<html:html>
<head>
	<script type="text/javascript" src="${ctx}/scripts/enterKey.js" ></script>
	<script type="text/javascript">
		$(document).ready(function(){
			//
			//
		});
	</script>
</head>
<content tag="heading">
	消息提醒
</content>
<body >
	<table class="queryTable" >
		<tr>
			<td class="queryTitle">
				<span >&nbsp;[${texts['dtaq.common.query_field']}]&nbsp;</span>
			</td>
		</tr>
		<tr>
			<td>
				<html:form action="sysMessageRemindAction.do?method=list">
					<table class="queryContentTable">
						<tr>
							<td >提醒说明：</td>
							<td><html:text property="qmemo"  styleClass="inputText"></html:text></td>
							<td >是否办理：</td>
							<td><ex:dictSelect property="qifShow"  type="YesOrNo"/></td>
							<td >
								<input type="submit" icon="icon_query" value="${texts['button.query']}" />
							</td>
						</tr>
					</table>
				</html:form>
			</td>
		</tr>
	</table>
	<ec:table items="sysMessageReminds" var="sysMessageRemind"
		action="sysMessageRemindAction.do" title=""  locale="zh_CN"
		sortable="false" rowsDisplayed="10" imagePath="${ctx}/styles/extremecomponents/images/*.gif"
		retrieveRowsCallback="limit" filterRowsCallback="limit" sortRowsCallback="limit">
		<ec:row highlightRow="true" 		>
			<ec:column property="rowcount" cell="rowCount" sortable="false" title="序号" />
			<ec:column property="recordDate" cell="date" title="提醒日期" />
			<ec:column property="memo" title="提醒说明" >
			  <c:if test="${sysMessageRemind.ifShow==0}">	
				<a class="aShow"  href="#" onclick="location.href='${sysMessageRemind.url}';">
					<font color="red" >${sysMessageRemind.memo}</font>
				</a>
			 </c:if>
			</ec:column>
		</ec:row>
	</ec:table>
</body>
</html:html>
