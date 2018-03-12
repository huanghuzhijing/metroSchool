<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>
<ex:bundle/>
<html:html>
<head>
<script src="<c:url value="/js/windowsJS.js"/>" type="text/javascript"></script>
<title>业务管理系统！</title>
<content tag="heading">
审核
</content>  
<script type="text/javascript">
function sign()
{
	ret = window.confirm("是否执行审核操作？");
	if(ret)
	{
		document.forms[0].submit();
	}
}

function rollback(objectid,oscurrentstepid,wfentryid,turnflag,peopleids)
{
	ret = window.confirm("是否执行撤回操作");
	if(ret)
	{
		document.forms[0].action="oscurrentstepAction.do?method=sign&peopleids="+peopleids+"&wfentryid="+wfentryid+"&objectid="+objectid+"&turnflag="+turnflag+"&oscurrentstepid="+oscurrentstepid+"&rollback=rollback";
		document.forms[0].submit();
	}
}
</script>
</head>
  <body>
  <html:form action="oscurrentstepAction.do?method=sign&peopleids=${param.peopleids}&wfentryid=${param.wfentryid }&objectid=${param.id}&osstepid=${osstepcontrols.stepid}&oscurrentstepid=${param.oscurrentstepid}&turnflag=${param.turnflag}&rollback=">
  		<fieldset>
	   		<legend><strong>验收审核</strong></legend>
			<div class="titleandlist">
			<p>验收审核</p>
		    <table width="100%" border="0" align="center" cellpadding="4" cellspacing="1" class="tableblue">
				<COLGROUP>
			    <COL class="tr03" width="10%" align="right">
			    <COL class="tr02" width="10%">
			    <COL class="tr03" align="right">
			    <COL class="tr02">
			    </COLGROUP>
			    <tr>
			    	<td colspan="2">审核意见</td>
			    	<td colspan="2" align="left">
			    	<html:textarea style="width:100%" property="opinion" rows="5" cols="60"></html:textarea>
			    	</td>
			    </tr>
			    <tr>
			    	<td>审核人</td>
			    	<td>
			    	<input class="lineinput" value="${tmpowner}"  readonly="readonly" />
			    	<html:hidden property="owner" value="${owner}"/>
			    	</td>
			    	<td>审核时间</td>
			    	<td>&nbsp;
			    	<html:text property="signdate" value="${signdate}" styleClass="lineinput" readonly="true"></html:text>
			    	</td>
			    </tr>
			</table>
			</div>
		</fieldset>
	   	<fieldset>
	   	<legend><strong>历史审核纪录</strong></legend>
			<div class="titleandlist">
			<p>历史审核纪录</p>
		    <table width="100%" border="0" align="center" cellpadding="4" cellspacing="1" class="tableblue">
				<COLGROUP>
			    <COL class="tr03" width="10%" align="right">
			    <COL class="tr02" width="10%">
			    <COL class="tr03" align="right">
			    <COL class="tr02">
			    </COLGROUP>
			    <logic:iterate id="oshistorystep" name="oshistorysteps">
			    	<tr>
			    		<td colspan="2">审核意见</td>
			    		<td colspan="2" align="left">
			    		<textarea style="width:100%" rows="5" cols="75" readonly="readonly">${oshistorystep.opinion }</textarea>
			    		</td>
			   	 	<tr>
			   	 	<tr>
				    	<td>审核人</td>
				    	<td>
				    	<ex:userName id="${oshistorystep.owner}" />
				    	</td>
				    	<td>审核时间</td>
				    	<td>&nbsp;
				    	<input class="lineinput" value="${oshistorystep.signdate}"  readonly="readonly" />
					    </td>
				    </tr>
			    </logic:iterate>
		    </table>
		    </div>
		</fieldset>
	   	
	   	<html:hidden property="wfentryid"/>
	   	<html:hidden property="stepid"/>
	   	<table align="center">
		<tr>
	    	<td colspan="4" align="center">
	    	<logic:present name="osstepcontrols">
	    	<c:if test="${osstepcontrols.viewaddress != '' && osstepcontrols.viewaddress != null}">
	    	<input type="button"  class="button1" property="null"  onclick="location.href='${osstepcontrols.viewaddress}&oscurrentstepid=${param.oscurrentstepid }&wfentryid=${param.wfentryid}&turnflag=${param.turnflag}&objectid=${param.objectid }'" value="<fmt:message key="button.detail"/>" />
	    	</c:if>
	    	<c:if test="${osstepcontrols.signaddress != '' && osstepcontrols.signaddress != null}">
	    	<input type="button"  class="button1" property="null"   onclick="location.href='${osstepcontrols.signaddress}&oscurrentstepid=${param.oscurrentstepid }&wfentryid=${param.wfentryid}&turnflag=${param.turnflag}&objectid=${param.objectid }'" value="<fmt:message key="button.reapproveDetail"/>" />
	    	</c:if>
	    	</logic:present>
	    	<input type="button"  class="button1" onclick="sign();"  name="sub" value="<fmt:message key="label.approvePass"/>"/>
	    	<c:if test="${osstepcontrols.attr2 == 1}">
	    		<input type="button"  class="button1" onclick="rollback('${param.id}','${param.oscurrentstepid}','${param.wfentryid }','${param.turnflag }','${param.peopleids }');" value="<fmt:message key="label.approveReject"/>" property="rol"/>
	    	</c:if>
	    	<input type="button" value="<fmt:message key="button.back"/>" onclick="history.back(-1);" class="button1">
	    	</td>
	    </tr>
	    </table>
	   	<div align="center">
	   	</div>
	   	</html:form>
  </body>
</html:html>
