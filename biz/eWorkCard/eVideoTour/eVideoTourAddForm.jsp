<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
<html:html>
<head>
<%@ include file="/commons/meta.jsp"  %>
	<script type="text/javascript">
	   $(document).ready(function(){

			$("#btn_save").click(function(){
				var properties=new Array(); 
				properties[0]=["videoTourEngineer","视频监控巡视工程师"];
				properties[1]=["videoTourDate","巡查日期"];
				saveValidateRequired("#btn_save",properties,"eVideoTourForm");
			}); 
			//
			$("#btn_back").click(function(){ 
				location.href='eVideoTourAction.do?method=list&ec_crd=${param.ec_crd}';
				 parent.art.dialog({id:'commonDialog1'}).close();
			}); 
		});
	</script>
</head>

<body>
	<html:form enctype="multipart/form-data" action="eVideoTourAction.do" method="POST">
		<input name="method" value="save" type="hidden" />
		<html:hidden property="ec_crd" />
		<c:if test="${param.id !=null}">
		<html:hidden property="id" />
		<html:hidden property="ec_id" value="${param.id}"/>
		<html:hidden property="ec_p" />
		</c:if>
		<html:hidden property="ec_crd" />
		<html:hidden property="flagPage"  value="${param.flagPage}"/>
		<html:hidden property="videoTourDate"  value="${videoTourDate}"/>
		<fieldset >
			<legend>视频巡查计划</legend>
			<table class="formTable" >
					<COLGROUP>
						<COL class="tdLeftTwo" />
						<COL class="tdRightTwo" />
						<COL class="tdLeftTwo" />
						<COL class="tdRightTwo" />
					</COLGROUP>
					<tr>
						
						<td>
							视频监控巡视工程师：<span class="redSpan">*</span>
						</td>
						<td>
							<html:text property="videoTourEngineer" styleClass="inputText" maxlength="100" size="30" value="${object.videoTourEngineer}"/>
						</td>
						</tr>
						<tr>
						<td>
							巡查日期：<span class="redSpan">*</span>
						</td>
						<td>
						${videoTourDate}
						</td>
					</tr>
			</table>
		</fieldset>
		<div class="saveDiv">
			<input id="btn_save" value="${texts['button.save']}" type="button" icon="icon_save"/>
			<input id="btn_back" value="关闭" type="button" icon="icon_back"/>
		</div>
	</html:form>
</body>
</html:html>
