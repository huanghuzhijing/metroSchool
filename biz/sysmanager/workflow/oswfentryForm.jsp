<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
<html:html>
<head>
	<title>业务管理系统！</title>
	<content tag="heading">
	工作流创建


	</content>
	<script type="text/javascript">
function checkName(obj)
{
    var url = "${ctx}/oswfentryAction.do?method=checkname&name="+encodeURI(encodeURI(obj.value));
    	 $.ajax({
						   type: "POST",
						   url: url,		
						   success: function(msg){
						   	   if(msg == "<font size=2 color='red'>工作流标识已存在!</font>")
								  {
								  		$("sub").disabled='disabled';
								  }
								  else{
								  	$("sub").disabled='';
								  }
 								 $("divname").innerHTML = msg;
						   }
					});
}


function onsub()
{
	var showname = document.getElementById("showname").value;
	var name = document.getElementById("name").value;
	if(showname=='')
	{
		alert('*工作流名称 为空');
		return false;
	}
	else
	{
		if(name=='')
		{
			alert('*工作流标识 为空');
			return false;
		}
		else
		{
			document.forms[0].submit();
		 	return true;
		}
	}
}

function oninit(flagid)
{
	if(flagid!=null && flagid!='')
	{
		document.getElementById("name").readOnly='true';
	}
}
</script>
<body onload="oninit('${param.id}');">
	<html:form action="oswfentryAction.do" method="POST" styleClass="form">
		<input type="hidden" name="method" value="save" />
		<html:hidden property="id" />
		<fieldset>
			<legend>
				基本信息
			</legend>
					<table class="formTable">
						<COLGROUP>
							<COL class="tdLeftTwo" />
							<COL class="tdRightTwo" />
							<COL class="tdLeftTwo" />
							<COL class="tdRightTwo" />
						</COLGROUP>
						<tr>
							<td>
								工作流名称：&nbsp;&nbsp;
							</td>
							<td>
								<html:text property="showname" styleClass="inputText"
									 />
							</td>
							<td>
								工作流状态：&nbsp;&nbsp;
							</td>
							<td>
								<html:select property="state">
									<html:option value="1">开启</html:option>
									<html:option value="2">关闭</html:option>
								</html:select>
							</td>
						</tr>
						<tr>
							<td>
								工作流标识：&nbsp;&nbsp;
							</td>
							<td colspan="3">
								<html:text property="name" onchange="checkName(this);"
									styleClass="inputText"  />

								<div id="divname"></div>
							</td>

						</tr>
					</table>
	</fieldset>
	</html:form>
		<div align="center" class="sbDiv">
			<input type="button" class="button1" name="sub" onclick="onsub();"
				value="<fmt:message key="button.save"/>" />
			<input type="button" value="<fmt:message key="button.back"/>"
				onclick="history.back(-1);" class="button1">
		</div>
</body>
</html:html>
