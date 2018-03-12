<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ include file="/commons/taglibs.jsp" %>
<ex:bundle/>
<html>
<head>
<script type="text/javascript">
	$(document).ready(function(){
		//返回
       $("#btn_back").click(function(){
       		document.forms[0].action='dataDictAction.do?method=list&ec_id=${dataDict.dict_id}&ec_p=${param.ec_p}&ec_crd=${param.ec_crd}';   
	    	document.forms[0].submit(); 
       });
	 });
</script>
</head>
<content tag="heading">
数据字典
</content>
<body>
<html:form enctype="multipart/form-data" action="dataDictAction.do?method=list&ec_p=${param.ec_p}&ec_id=${dataDict.dict_id}" method="POST">
		<!-- 查询条件 开始-->
		<input name="qdict_code" value="${param.qdict_code}" type="hidden" />
		<input name="id" value="${dataDict.dict_id}" type="hidden"/>
		<input name="qdict_name" value="${param.qdict_name}" type="hidden" />
		<input name="qdisplay" value="${param.qdisplay}" type="hidden" />
		<input name="qdataname" value="${param.qdataname}" type="hidden" />
		<input name="qremark" value="${param.qremark}" type="hidden" />
		<!-- 查询条件 结束-->
	</html:form>
<fieldset >
		<legend>[数据字典-详细信息]</legend>

         <table class="titleTable">
	         <COLGROUP>
	           	<COL class="tdLeftTwo" />
				<COL class="tdRightTwo" />
				<COL class="tdLeftTwo" />
				<COL class="tdRightTwo" />
	          </COLGROUP>
          <tr>
             <td>字典编码：<span class="noRedSpan">*</span></td>
             <td>${dataDict.dict_code}&nbsp;</td>
             <td>字典名称：<span class="noRedSpan">*</span></td>
             <td>${dataDict.dict_name}&nbsp;</td>
           </tr>
           <tr>
           	<td>
           		描述：<span class="noRedSpan">*</span>
           	</td>
           	<td colspan="3">
           		${dataDict.description}&nbsp;
           	</td>
           </tr>
           
           
         </table>
	</fieldset>
		<div class="saveDiv">
			<input type="button" icon="icon_back"  id="btn_back" value="<fmt:message key="button.back"/>" />
		</div>
  </body>
</html>


