<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<%@ include file="/commons/meta.jsp"%>
<ex:bundle />
<html:html>
<head>
<script src="${ctx}/scripts/public.js" type="text/javascript"></script>
<script type="text/javascript">
function closeWindow(){
	parent.art.dialog({id:'sendMail'}).close();
}

function submitToList(){
	var receiveperson = jQuery("[name='receiveperson']").val();
	var title = jQuery("[name='title']").val();
	var content = jQuery("[name='content']").val();
	var focus = "",errors="";
	var flag = validateRevice();
	if(flag == false){
		errors += "收件人 为必填项!\n";
		focus += "receiveperson,";
	}
	if(title == ""){
		errors += "标题 为必填项!\n";
		focus += "title,";
	}
	if(content == ""){
		errors += "内容 为必填项!\n";
		focus += "content,";
	}
	if(errors != ""){
		alert(errors);
		var focus_field = focus.substring(0,focus.indexOf(","));
		$(focus_field).focus();
		return;
	}else{
		var isUnion = jQuery("[name='isUnion']").val();
		var receives = "";
		if(isUnion == ""){
			receives = jQuery("[name='receiveperson']").val();
		}else{
			receives = setSelectEmps();
		}
		var url =  "${ctx}/sysMailboxSendAction.do?method=selectMailboxSend";
		$.ajax({
		type:"post",
		url: "${ctx}/sysMailboxSendAction.do?method=selectMailboxSend",
		data:"receiveperson="+receives+"&title="+jQuery("[name='title']").val()+"&isimport="+jQuery("[name='isimport']").val()+"&content="+jQuery("[name='content']").val()+"&sendForward=send",
		success:function(msg){
		responseSaveInfo(msg);
		}
		
		})
	}
}

function validateRevice(){
	var isUnion = jQuery("[name='isUnion']").val();
	if(isUnion != ""){
		var workEmpsChecks = document.getElementsByName("workEmpsCheck");
		var jlEmpsChecks = document.getElementsByName("jlEmpsCheck");
		var jcEmpsChecks = document.getElementsByName("jcEmpsCheck");
		var ownersEmpsChecks = document.getElementsByName("ownersEmpsCheck");
		var teamEmpsChecks = document.getElementsByName("teamEmpsCheck");
		if(workEmpsChecks != null){
			for(var i=0; i<workEmpsChecks.length; i++){
				if(workEmpsChecks[i].checked == true){
					return true;
				}
			}	
		}
		if(jlEmpsChecks != null){
			for(var i=0; i<jlEmpsChecks.length; i++){
				if(jlEmpsChecks[i].checked == true){
					return true;
				}
			}	
		}
		if(jcEmpsChecks != null){
			for(var i=0; i<jcEmpsChecks.length; i++){
				if(jcEmpsChecks[i].checked == true){
					return true;
				}
			}	
		}
		if(ownersEmpsChecks != null){
			for(var i=0; i<ownersEmpsChecks.length; i++){
				if(ownersEmpsChecks[i].checked == true){
					return true;
				}
			}	
		}
		if(teamEmpsChecks != null){
			for(var i=0; i<teamEmpsChecks.length; i++){
				if(teamEmpsChecks[i].checked == true){
					return true;
				}
			}	
		}
		return false;
	}else{
		return true;
	}
}

function setSelectEmps(){
	var empids = "";
	var workEmpsChecks = document.getElementsByName("workEmpsCheck");
	var jlEmpsChecks = document.getElementsByName("jlEmpsCheck");
	var jcEmpsChecks = document.getElementsByName("jcEmpsCheck");
	var ownersEmpsChecks = document.getElementsByName("ownersEmpsCheck");
	var teamEmpsChecks = document.getElementsByName("teamEmpsCheck");
	if(workEmpsChecks != null){
		for(var i=0; i<workEmpsChecks.length; i++){
			if(workEmpsChecks[i].checked == true){
				empids += ","+workEmpsChecks[i].value;
			}
		}	
	}
	if(jlEmpsChecks != null){
		for(var i=0; i<jlEmpsChecks.length; i++){
			if(jlEmpsChecks[i].checked == true){
				empids += ","+jlEmpsChecks[i].value;
			}
		}	
	}
	if(jcEmpsChecks != null){
		for(var i=0; i<jcEmpsChecks.length; i++){
			if(jcEmpsChecks[i].checked == true){
				empids += ","+jcEmpsChecks[i].value;
			}
		}	
	}
	if(ownersEmpsChecks != null){
		for(var i=0; i<ownersEmpsChecks.length; i++){
			if(ownersEmpsChecks[i].checked == true){
				empids += ","+ownersEmpsChecks[i].value;
			}
		}	
	}
	if(teamEmpsChecks != null){
		for(var i=0; i<teamEmpsChecks.length; i++){
			if(teamEmpsChecks[i].checked == true){
				empids += ","+teamEmpsChecks[i].value;
			}
		}	
	}
	if(empids != ""){
		empids = empids.substring(1);
	}
	return empids;
}

function responseSaveInfo(selResponse){
	var text = selResponse;
	parent.closeMailBox(text);
}


function selectEmpType(type){
	var workEmpsChecks = document.getElementsByName("workEmpsCheck");
	var jlEmpsChecks = document.getElementsByName("jlEmpsCheck");
	var jcEmpsChecks = document.getElementsByName("jcEmpsCheck");
	var ownersEmpsChecks = document.getElementsByName("ownersEmpsCheck");
	var teamEmpsChecks = document.getElementsByName("teamEmpsCheck");
	if(type == "all"){
		if(workEmpsChecks != null){
			for(var i=0; i<workEmpsChecks.length; i++){
				workEmpsChecks[i].checked = true;
			}	
		}
		if(jlEmpsChecks != null){
			for(var i=0; i<jlEmpsChecks.length; i++){
				jlEmpsChecks[i].checked = true;
			}	
		}
		if(jcEmpsChecks != null){
			for(var i=0; i<jcEmpsChecks.length; i++){
				jcEmpsChecks[i].checked = true;
			}	
		}
		if(ownersEmpsChecks != null){
			for(var i=0; i<ownersEmpsChecks.length; i++){
				ownersEmpsChecks[i].checked = true;
			}	
		}
		if(teamEmpsChecks != null){
			for(var i=0; i<teamEmpsChecks.length; i++){
				teamEmpsChecks[i].checked = true;
			}	
		}
	}else if(type == "none"){
		if(workEmpsChecks != null){
			for(var i=0; i<workEmpsChecks.length; i++){
				workEmpsChecks[i].checked = false;
			}	
		}
		if(jlEmpsChecks != null){
			for(var i=0; i<jlEmpsChecks.length; i++){
				jlEmpsChecks[i].checked = false;
			}	
		}
		if(jcEmpsChecks != null){
			for(var i=0; i<jcEmpsChecks.length; i++){
				jcEmpsChecks[i].checked = false;
			}	
		}
		if(ownersEmpsChecks != null){
			for(var i=0; i<ownersEmpsChecks.length; i++){
				ownersEmpsChecks[i].checked = false;
			}	
		}
		if(teamEmpsChecks != null){
			for(var i=0; i<teamEmpsChecks.length; i++){
				teamEmpsChecks[i].checked = false;
			}	
		}
	}
}

</script>
</head>
<body>
<html:form action="sysMailboxSendAction.do" method="POST" styleClass="form">
	<html:hidden property="method" value="selectMailboxSend"/>
	<html:hidden property="sendType" value="send"/>
	<html:hidden property="receiveperson" value="${empid}" />
	<html:hidden property="isUnion" value="${isUnion}" />
	<table class="form_table" bordercolorlight="#DDDDE0" bordercolordark="#ffffff" width="100%" border="1" align="center" cellpadding="3" cellspacing="0" >
		<COLGROUP>
			<COL class="tr03" align="right" width="20%">
			<COL class="tr02" width="30%">
			<COL class="tr03" align="right" width="20%">
			<COL class="tr02" width="30%">
		</COLGROUP>
		
	    <tr>
			<td>发送人：<span class="noRedSpan">*</span></td>
			<td><ex:employeeName id="${userinfo.empId}"/></td>
			<td>发送时间：<span class="noRedSpan">*</span></td>
			<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${currentDate}" /></td>
		</tr>
	    
		<tr>
			<td>是否重要信件：<span class="noRedSpan">*</span></td>
			<td colspan="3">
				<html:select property="isimport">
					<html:option value="0">一般</html:option>
					<html:option value="1">重要</html:option>
				</html:select>
			</td>
		</tr>
		<c:if test="${isUnion == null}">
			<tr>
				<td>收信人:<font color="red">*</font></td>
				<td colspan="3" id="oneTd"><ex:employeeName id="${empid}"/></td>
			</tr>
		</c:if>
		<c:if test="${isUnion != null}">
			<tr>
				<td>相关人员选择：<span class="noRedSpan">*</span></td>
				<td colspan="3">
					<input type="button" class="button1" value="全 选" onclick="selectEmpType('all')">&nbsp;&nbsp;
					<input type="button" class="button1" value="全不选" onclick="selectEmpType('none')">
				</td>
			</tr>
			<c:if test="${workEmps != null}">
				<tr>
					<td>施工单位：<span class="noRedSpan">*</span></td>
					<td colspan="3">
						<c:forEach items="${workEmps}" var="employee">
							<html:checkbox property="workEmpsCheck" value="${employee.employee_id}">${employee.employee_name}</html:checkbox>
						</c:forEach>&nbsp;
					</td>
				</tr>
			</c:if>
			<c:if test="${jlEmps != null}">
				<tr>
					<td>监理单位：<span class="noRedSpan">*</span></td>
					<td colspan="3">
						<c:forEach items="${jlEmps}" var="employee">
							<html:checkbox property="jlEmpsCheck" value="${employee.employee_id}">${employee.employee_name}</html:checkbox>
						</c:forEach>&nbsp;
					</td>
				</tr>
			</c:if>
			<c:if test="${jcEmps != null}">
				<tr>
					<td>检测单位：<span class="noRedSpan">*</span></td>
					<td colspan="3">
						<c:forEach items="${jcEmps}" var="employee">
							<html:checkbox property="jcEmpsCheck" value="${employee.employee_id}">${employee.employee_name}</html:checkbox>
						</c:forEach>&nbsp;
					</td>
				</tr>
			</c:if>
			<c:if test="${ownersEmps != null}">
				<tr>
					<td>业主代表：<span class="noRedSpan">*</span></td>
					<td colspan="3">
						<c:forEach items="${ownersEmps}" var="employee">
							<html:checkbox property="ownersEmpsCheck" value="${employee.employee_id}">${employee.employee_name}</html:checkbox>
						</c:forEach>&nbsp;
					</td>
				</tr>
			</c:if>
			<c:if test="${teamEmps != null}">
				<tr>
					<td>华科预警单位：<span class="noRedSpan">*</span></td>
					<td colspan="3">
						<c:forEach items="${teamEmps}" var="employee">
							<html:checkbox property="teamEmpsCheck" value="${employee.employee_id}">${employee.employee_name}</html:checkbox>
						</c:forEach>&nbsp;
					</td>
				</tr>
			</c:if>
		</c:if>
		<tr>
	    	<td>标题:<font color="red">*</font></td>
			<td colspan="3"><html:text property="title" size="75" styleClass="text" maxlength="100" /></td>
		</tr>
		<tr>
			<td>内容:<font color="red">*</font></td>
		    <td colspan="3"><html:textarea property="content" cols="60" rows="7" /></td>
	    </tr>
	</table>
	<div align="center">
		<input type="button" class="button1" value="发&nbsp;&nbsp送" onclick="submitToList()">&nbsp;&nbsp;
		<input type="button" class="button1" value="${texts['button.close']}" onclick="closeWindow()">
	</div>
</html:form>
</body>
</html:html>
