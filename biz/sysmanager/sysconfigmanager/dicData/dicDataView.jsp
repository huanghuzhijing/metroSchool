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
       		document.forms[0].action='dataDictAction.do?method=list&ec_id=${param.ec_id}&ec_p=${param.ec_p}&ec_crd=${param.ec_crd}';   
	    	document.forms[0].submit();
       });
       //
	 });
</script>
</head>
<content tag="heading">
数据字典项
</content>
<body>
<fieldset >
	<html:form enctype="multipart/form-data" action="dataDictAction.do?method=list&ec_p=${param.pageIndex}" method="POST">
		<html:hidden property="data_id" value="${param.data_id}"/>
		<html:hidden property="dict_id" value="${dicid}"/>
		<html:hidden property="ec_id" value="${param.ec_id}"/>
		<html:hidden property="ec_p" value="${param.ec_p}"/>
		<html:hidden property="ec_crd" value="${param.ec_crd}"/>
		<!-- 查询条件 开始-->
		<input name="qdict_code" value="${param.qdict_code}" type="hidden" />
		<input name="qdata_name" value="${param.qdata_name}" type="hidden" />
		<input name="qdict_name" value="${param.qdict_name}" type="hidden" />
		<input name="qdiccode" value="${param.qdiccode}" type="hidden" />
		<input name="qdicname" value="${param.qdicname}" type="hidden" />
		<input name="qdisplay" value="${param.qdisplay}" type="hidden" />
		<input name="qdataname" value="${param.qdataname}" type="hidden" />
		<input name="qremark" value="${param.qremark}" type="hidden" />
		<!-- 查询条件 结束-->
	</html:form>
		<legend>[数据字典项-详细信息]</legend>

         <table class="titleTable">
         	<COLGROUP>
	           	<COL class="tdLeftTwo" />
				<COL class="tdRightTwo" />
				<COL class="tdLeftTwo" />
				<COL class="tdRightTwo" />
	          </COLGROUP>
          <tr>
             <td>字典项名称：<span class="noRedSpan">*</span></td>
             <td>${dataDictRecord.data_name}&nbsp;</td>
             <td>字典项值：<span class="noRedSpan">*</span></td>
             <td>${dataDictRecord.data_short_name}&nbsp;</td>
           </tr>
           <tr>
           	<td>
           		字典名称：<span class="noRedSpan">*</span>
           	</td>
           	<td colspan="3">
           		${dic.dict_name}&nbsp;
           	</td>
           </tr>
           <tr>
             <td>排序值：<span class="noRedSpan">*</span></td>
             <td colspan="3">${dataDictRecord.spell_code}&nbsp;</td>
           </tr>
           <tr>
             <td>备注：<span class="noRedSpan">*</span></td>
             <td colspan="3">${dataDictRecord.description}&nbsp;</td>
           </tr>
         </table>
	</fieldset>
		<div class="saveDiv">
			<input type="button" id="btn_back" value="<fmt:message key="button.back"/>" icon="icon_back"  />
		</div>
  </body>
</html>


