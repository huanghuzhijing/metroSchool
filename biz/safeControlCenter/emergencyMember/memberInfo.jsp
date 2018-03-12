<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>
<ex:bundle/>
<html>
<head>
<script type="text/javascript">
<!--
	function selectMember(obj){
		var ret = new Array(2);
		var member = obj.value;
		var memberId = member.split(",")[0];
	   	var memberName = member.split(",")[1];
	   	ret[0] = memberId;
	   	ret[1] = memberName;
	   	parent.document.getElementById('personId').value = ret[0];
		parent.document.getElementById('personName').value = ret[1];
		parent.sSuc('b1');
	   	//parent.returnValue = ret;
   		//parent.close();
	}
//-->
</script>
</head>
<base target="_self">
<body>

<form action="${ctx}/emergencyMemberAction.do?method=chooseMember" method="post">
	<table width="100%" border="0" align="center" cellpadding="2" cellspacing="0" >
		<tr>
			<td align="right">人员姓名&nbsp;&nbsp;</td>
			<td><input type="text" name="personName" size="20"/></td>
			<td><input type="submit" name="search" class="button" value="查询"/></td>
		</tr>
	</table>
</form>
<ec:table items="memberInfos" var="memberInfo" tableId="memberList"
			action="${ctx}/emergencyMemberAction.do">
	<ec:row>
		<ec:column property="rowcount" cell="rowCount" sortable="false" title="序号" width="50"/>
		<ec:column property="null" sortable="false" title="选择">
			<input type="radio" id="member" name="member" value="${memberInfo.id},${memberInfo.name}" onClick="selectMember(this)">
		</ec:column>
		<ec:column property="name" title="人员姓名" width="140"/>
	</ec:row>
</ec:table>
</body>
</html>