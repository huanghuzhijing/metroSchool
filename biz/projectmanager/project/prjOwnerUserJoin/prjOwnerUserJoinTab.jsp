<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<%@ include file="/commons/meta.jsp"%>
<ex:bundle />
<html:html>

<script type="text/javascript">
$(document).ready(function(){
			//
			//
		});
		
		function pageRefresh(){
			location.href='prjOwnerUserJoinAction.do?method=tab&flag=${param.flag}&staticPrjId=${param.staticPrjId}';
		}
</script>
<body>
 <fieldset >
		<legend>项目信息</legend>
		<table class="formTable" >
				<COLGROUP>
					<COL class="tdLeftTwo" />
					<COL class="tdRightTwo" />
					<COL class="tdLeftTwo" />
					<COL class="tdRightTwo" />
				</COLGROUP>
				<tr>
				<td>
						项目编号：<span class="noRedSpan">*</span>
					</td>
					<td>
						${projectInfo.prjCode}&nbsp;
					</td>
					<td>
						项目名称：<span class="noRedSpan">*</span>
					</td>
					<td>
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

<c:if test="${flag == 1}"><c:set value="true" var="tabstate1"></c:set></c:if>
<c:if test="${flag == 2}"><c:set value="true" var="tabstate2"></c:set></c:if>
    <ex:tab id="dockjTab" width="100%">
		<ex:tabItem name="lab1"  url="${ctx}/prjOwnerUserJoinAction.do?method=tab&flag=1&staticPrjId=${staticPrjId}" selected="${tabstate1}" label="业主方" >
			<c:if test="${param.flag == '1'}">
				<%@include file="prjOwnerUserJoinListRight1.jsp" %>
			</c:if>
	    </ex:tabItem>
	      <ex:tabItem name="lab2"  url="${ctx}/prjOwnerUserJoinAction.do?method=tab&staticPrjId=${staticPrjId}&flag=2" label="施工方" selected="${tabstate2}">
		   	<c:if test="${param.flag == '2'}">
				<%@include file="/biz/projectmanager/project/prjCorpUserJoin/prjCorpUserJoinListRightConstr.jsp" %>
			</c:if>
		   </ex:tabItem>
    </ex:tab>
    
   
</body>
</html:html>
