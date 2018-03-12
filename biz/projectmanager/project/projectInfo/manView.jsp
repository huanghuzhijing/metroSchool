<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>
<ex:bundle/>
<html>
<head>
<script type="text/javascript">
	$(document).ready(function(){
		//返回
       $("#btn_back").click(function(){
       		document.forms[0].submit();
       });
       //
	 });
</script>
</head>
<content tag="heading">
项目组织人员预览
</content>
<body>
	<html:form enctype="multipart/form-data" action="projectInfoAction.do?method=list&staticPrjStatus=${param.staticPrjStatus}&ec_p=${param.ec_p}&ec_id=${projectInfo.id}&ec_auditStatus=${projectInfo.auditStatus}&staticPrjSort=${param.staticPrjSort}&staticFootNode=${param.staticFootNode}&flag=${param.flag}" method="POST">
		<!--查询定位 开始-->
		<html:hidden property="qprjCode" />
		<html:hidden property="qprjName"/>
		<html:hidden property="qauditStatus"/>
		<!--查询定位 结束-->
	</html:form>
	<fieldset>
			<legend>项目组织人员预览</legend>
			<table class="listTable" >
				<thead>
					<tr>
						<th>
							姓名
						</th>
						<th >
							单位
						</th>
						<th >
							职务
						</th>
						<th >
							手机
						</th>
					</tr>
				</thead>
				<c:forEach items="${segOrgUserJoins}" var="segOrgUserJoin" varStatus="index">
					<tr >
						<td>
							<ex:employeeName id="${segOrgUserJoin.empId}"/>
							&nbsp;
						</td>
						<td>
							<ex:organNameByEmp id="${segOrgUserJoin.empId}"/>
							&nbsp;
						</td>
						<td>
							${segOrgUserJoin.postName}&nbsp;
						</td>
						<td>
							${segOrgUserJoin.tel}&nbsp;
						</td>
					</tr>
				</c:forEach>
			</table>
	</fieldset>
	
	
	<fieldset>
			<legend>项目标段人员预览</legend>
			<table class="listTable" >
	<thead>
		<tr>
			<th rowspan="2">
				标段
			</th>
			<th colspan="4">
				施工
			</th>
			<th colspan="4">
				监理
			</th>
		</tr>
		<tr>
			<th>
				姓名
			</th>
			<th >
				单位
			</th>
			<th >
				职务
			</th>
			<th >
				手机
			</th>
			<th>
				姓名
			</th>
			<th >
				单位
			</th>
			<th >
				职务
			</th>
			<th >
				手机
			</th>
		</tr>
	</thead>
	<c:set var="signSeg">0</c:set>
	<c:forEach items="${voPrMans}" var="voPrMan" varStatus="index">
		<tr >
			<c:if test="${signSeg!=voPrMan.segId }">
				<td rowspan="${voPrMan.segCount }">
					<ex:segDisplay id="${voPrMan.segId }"/>
				</td>
			</c:if>
			<td>
				${voPrMan.constrManName}&nbsp;
			</td>
			<td>
				${voPrMan.constrManCorp}&nbsp;
			</td>
			<td>
				${voPrMan.constrManPost}&nbsp;
			</td>
			<td>
				${voPrMan.constrManTel}&nbsp;
			</td>
			
			<td>
				${voPrMan.survManName}&nbsp;
			</td>
			<td>
				${voPrMan.survManCorp}&nbsp;
			</td>
			<td>
				${voPrMan.survManPost}&nbsp;
			</td>
			<td>
				${voPrMan.survManTel}&nbsp;
				<c:set var="signSeg">${voPrMan.segId }</c:set>
			</td>
			
		</tr>
	</c:forEach>
</table>
	</fieldset>
	<div class="saveDiv">
		<input id="btn_back" value="${texts['button.back']}" type="button" icon="icon_back"/>
	</div>
  </body>
</html>


