
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<%@ taglib uri="/WEB-INF/jbpm.tld" prefix="jbpm" %>
<ex:bundle />
<html:html>
<head>
	<script src="${ctx}/scripts/public.js" type="text/javascript"></script>
	<script type="text/javascript">
	//
  	$(document).ready(function(){
  		//
		$("#btn_back").click(function(){
		    history.back(-1);
		}) 
		//
	}); 
	</script>
</head>
<content tag="heading">
	当前所处节点
</content>
<body >
	<fieldset>
			<legend>
				当前所处节点
			</legend>
			<table class="formTable">
          <tr>
			<td>
				  <jbpm:processimageToken token="${tokenId}"/>
			</td>
		</tr>
		</table>
</body>
</html:html>
