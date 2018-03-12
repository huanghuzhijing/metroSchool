<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
<html:html>
<head>
<%@ include file="/commons/meta.jsp"%>
	<script type="text/javascript">
		var tempParent = parent ;
	
		$(document).ready(function(){
			//
			$(".selectButton").click(function(){ 
				parent.$("#plug_br_id").val($(this).attr("paramId"));
				parent.$("#plug_roomcode").val($(this).attr("paramArray"));
				parent.$("#plug_roomname").val($(this).attr("paramName"));
				parent.art.dialog({id:'commonDialog1'}).close();
			});
			//
		});
		function selectOnclick(br_id,roomcode,roomname)
		{
		        parent.$("#plug_br_id").val(br_id);
				parent.$("#plug_roomcode").val(roomcode);
				parent.$("#plug_roomname").val(roomname);
				parent.art.dialog({id:'commonDialog1'}).close();
		}
	</script>
</head>
<body>
	<table class="queryTable" >
		<tr>
			<td class="queryTitle">
				<span >&nbsp;[${texts['dtaq.common.query_field']}]&nbsp;</span>
			</td>
		</tr>
		<tr>
			<td>
				<html:form action="contentSelectAction.do?method=selectBoardroom&queryBrType=${param.queryBrType}&meetingDate=${param.meetingDate}&meetingEndDate=${param.meetingEndDate}">
					<table class="queryContentTable">
						<tr>
							<td >会议室名称：</td>
							<td><html:text property="qroomname" maxlength="25" styleClass="inputText"></html:text></td>
							<td >
								<input type="submit" icon="icon_query" value="${texts['button.query']}" />
							</td>
						</tr>
					</table>
				</html:form>
			</td>
		</tr>
	</table>
	<ec:table items="oaBoardroomInfos" var="oaBoardroomInfo"
		action="contentSelectAction.do?method=selectBoardroom&queryBrType=${param.queryBrType}" title="" locale="zh_CN"
		sortable="false" rowsDisplayed="10" imagePath="${ctx}/styles/extremecomponents/images/*.gif"
		retrieveRowsCallback="limit" filterRowsCallback="limit" sortRowsCallback="limit">
		<ec:row highlightRow="true" >
			<ec:column property="rowcount" cell="rowCount" sortable="false" title="序号" />
		<ec:column property="roomcode" calcTitle="roomcode" title="会议室编号"/>
		<ec:column property="roomname" calcTitle="roomname" title="会议室"/>
		<ec:column property="position" calcTitle="position" title="方&nbsp;&nbsp;&nbsp;&nbsp;位"/>
		<ec:column property="seat" calcTitle="seat" title="座位数"/>
		<ec:column property="null" title="选择" >
			<c:if test="${oaBoardroomInfo.isUsed==0}">
				<input type="button"  class="selectButton" icon="icon_confirm" value="${texts['label.select']}" 
			       paramId="${oaBoardroomInfo.id}" paramName="${oaBoardroomInfo.roomname }" paramArray="${oaBoardroomInfo.roomcode }" />
			</c:if>
			<c:if test="${oaBoardroomInfo.isUsed==1}">
				该时间段正在使用
			</c:if>
		</ec:column>
		</ec:row>
	</ec:table>
</body>
</html:html>
