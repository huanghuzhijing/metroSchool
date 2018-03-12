<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
<html:html>
<head>
<%@ include file="/commons/meta.jsp"%>
	<script type="text/javascript">
		$(document).ready(function(){
			//
			$("#btn_save").click(function(){ 
				document.forms[0].submit();
			}); 
			//
			$("#btn_close").click(function(){ 
				parent.art.dialog({id:'commonDialog1'}).close();
			}); 
			//
		});
	</script>
</head>
<body >
	<html:form enctype="multipart/form-data" action="prjCorpUserJoinAction.do?method=saveEditEmpForConstr" method="POST">
		<input name="prjcfgid" value="${prjcfgid}"  type="hidden"/>
			<fieldset >
		<legend>参建人员信息-编辑</legend>
					<table class="formTable" >
					    <COLGROUP>
							<COL class="tdLeftOne" />
							<COL class="tdRightOne" />
						</COLGROUP>
						  <tr>
						    <td >姓&nbsp;&nbsp;&nbsp;&nbsp;名：<span class="noRedSpan">*</span></td>
						    <td >
								<html:text property="null" value="${empname}" styleClass="showText"  maxlength="100" size="48" />
							</td>
						  </tr>
						  <tr>
						    <td >职&nbsp;&nbsp;&nbsp;&nbsp;务：<span class="noRedSpan">*</span></td>
						    <td >
						    	<html:text property="officename" value="${officename}" styleClass="inputText" maxlength="100" size="48"/>
							</td>
						  </tr>
					</table>
</fieldset>
		<div class="inputInfoDiv">
			<span class="inputShowLeft">填&nbsp;&nbsp;报&nbsp;&nbsp;人：${userinfo.empName} </span>
			<span class="inputShowRight"> 填报日期：${now_date}</span>
		</div>

			<div  class="saveDiv">
				<input id="btn_save" type="button"  icon="icon_save"  value="${texts['button.save']}" />
				<input id="btn_close" type="button"  icon="icon_close"  value="${texts['button.close']}" />
			</div>

	</html:form>
</body>
</html:html>
