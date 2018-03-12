<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
<html:html>
<head>
	<%@ include file="/commons/meta.jsp"%>
	<%@ include file="/commons/easyui.jsp"%>
	<script type="text/javascript">
		$(document).ready(function(){
			//
			//
		});
		
		function pageRefresh(){
			location.href='prjCorpUserJoinActionAction.do?method=listRight&flag=${param.flag}&staticPrjId=${param.staticPrjId}';
		}
	</script>
	<c:if test="${staticPrjId!=null}"><c:set var="staticPrjId" value="${staticPrjId}"></c:set></c:if>
	<c:if test="${staticPrjId==null}"><c:set var="staticPrjId" value="${param.staticPrjId}"></c:set></c:if>
</head>
<body >
<fieldset >
		<legend>项目基本信息</legend>
					<table class="titleTable" >
					    	<colgroup>
									<COL class="tdLeftTwo" />
							<COL class="tdRightTwo" />
							<COL class="tdLeftTwo" />
							<COL class="tdRightTwo" />
							</colgroup>
						  <tr>
							    <td >项目编号：<span class="noRedSpan">*</span></td>
							    <td >
									${projectInfo.prjCode}&nbsp;
								</td>
								<td >项目名称：<span class="noRedSpan">*</span></td>
							    <td >
									${projectInfo.prjName}&nbsp;
								</td>
						  </tr>
						<tr>
							<td>
								项目类型：<span class="noRedSpan">*</span>
							</td>
							<td colspan="3">
								<ex:dicDisplay dictIdentify="PrjType" dictValue="${projectInfo.prjType}"/>
							</td>
			        	</tr>
						
					</table>
	</fieldset>
		<c:if test="${param.flag == 1}"><c:set value="true" var="tabstate1"></c:set></c:if>
		<c:if test="${param.flag == 2}"><c:set value="true" var="tabstate2"></c:set></c:if>
		<c:if test="${param.flag == 3}"><c:set value="true" var="tabstate3"></c:set></c:if>
		<ex:tab id="dockjTab" width="100%">
		 
			<ex:tabItem name="lab1" url="${ctx}/prjCorpUserJoinAction.do?method=listRight&staticPrjId=${staticPrjId}&flag=1" selected="${tabstate1}" label="业主方" >
				<c:if test="${param.flag == '1'}">
					<%@include file="prjCorpUserJoinListRightOwner.jsp" %>
				</c:if>
			   </ex:tabItem>
			   
			   
		   <ex:tabItem name="lab2"  url="${ctx}/prjCorpUserJoinAction.do?method=listRight&staticPrjId=${staticPrjId}&flag=2" label="施工方" selected="${tabstate2}">
		   	<c:if test="${param.flag == '2'}">
				<%@include file="prjCorpUserJoinListRightConstr.jsp" %>
			</c:if>
		   </ex:tabItem>
		   <ex:tabItem name="lab3" url="${ctx}/prjCorpUserJoinAction.do?method=listRight&staticPrjId=${staticPrjId}&flag=3" label="监理方" selected="${tabstate3}">
		   	<c:if test="${param.flag == '3'}">
				<%@include file="prjCorpUserJoinListRightSurv.jsp" %>
			</c:if>
		   </ex:tabItem>
		</ex:tab>
</body>
</html:html>
