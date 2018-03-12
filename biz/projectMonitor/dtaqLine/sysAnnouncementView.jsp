<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
<html:html>
	<%@ include file="/commons/meta.jsp"%>
<head>
	<script type="text/javascript" src="${ctx}/scripts/enterKey.js" ></script>
	<script type="text/javascript" src="${ctx}/scripts/publicFunction.js"></script>
	<script type="text/javascript">
	jQuery(document).ready(function(){
		$("#btn_back").click(function(){
			//history.back(-1);
		 	//document.forms[0].action='dtaqLineAction.do?method=gisAnalyseIndex';
			//document.forms[0].submit();
			parent.document.location='dtaqLineAction.do?method=gisAnalyseIndex';
		}) ;
		
	})
</script>
</head>
<body>
<html:form enctype="multipart/form-data" action="dtaqStationAction.do" method="POST">
		<!--查询定位 开始-->
<!--		<html:hidden property="ec_crd" />-->
<!--		<html:hidden property="ec_id"/>-->
<!--		<html:hidden property="ec_p" />-->
		<!--查询定位 结束-->
</html:form>
<fieldset>
	<legend>系统公告</legend>
				<table class="titleTable">
					<COLGROUP>
						<COL class="tdLeftTwo" />
						<COL class="tdRightTwo" />
						<COL class="tdLeftTwo" />
						<COL class="tdRightTwo" />
					</COLGROUP>	
					<tr>
						<td>
							标题：<span class="noRedSpan">*</span>
						</td>
						<td>
							${sysAnnouncement.title}
						</td>
					</tr>
					<tr>
			             <td>内容：<span class="noRedSpan">*</span></td>
			             <td colspan="3">
			             ${sysAnnouncement.content}
			             </td>
		            </tr>
		            <tr>
				      <td>作者：<span class="noRedSpan">*</span></td>
				      <td><ex:userName id="${sysAnnouncement.creater}"/></td>
				      <td>创建日期：<span class="noRedSpan">*</span></td>
				      <td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${sysAnnouncement.createDate}"/></td>
				    </tr>
		            
		</table>
</fieldset>
<div class="saveDiv">
	<input id="btn_back" value="返回" type="button" icon="icon_back"/>
</div>
  </body>
</html:html>
						