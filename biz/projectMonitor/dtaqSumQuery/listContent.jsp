<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>
<html:form action="dtaqSumQueryAction">
<input type="hidden" name="method" value="segmentAnalysis">
<input type="hidden" name="organ_type" value="${param.organ_type }">
<script type="text/javascript" src="${ctx}/scripts/queryLines.js"></script>
<script>
jQuery(document).ready(function(){
 getLines('${param.line_id}','${param.qsectionId}');
})
function changeType(){
$("[name='method']").val($("[name='sumType']:checked").val());
}
</script>

<table class="queryTable" width="100%" cellpadding="0" cellspacing="0" border="0">
<tr>
			<td class="queryTitle">
				<span>预警信息汇总分析条件</span>
			</td>
		</tr>
<tr>
<td>
<table align="left">
<tr>
  <td width="60px" nowrap>线路</td>
  <td>
   <select style="width: 240px" id="qlineId" name="line_id" onchange="getSections(this.value,'')"></select>
   </td>
  <td>监测日期</td>
  <td>
<input name="startDate" value="${startDate}" onfocus="WdatePicker()"/>--<input name="endDate" value="${endDate}" onfocus="WdatePicker()"/>
   </td>
 </tr>
</table>
</td>
</tr>
</table>

<fieldset>
  <legend><strong>请选择分析方法</strong></legend>
<table class="searchTable" border="0" cellpadding="0" cellspacing="0">
<tr>

 <td width="20px"><input type="radio" onclick="changeType()"  name="sumType" value="segmentAnalysis" checked="checked" /></td>
  <td>按线路标段统计</td>
</tr>
<tr>
  <td>&nbsp;</td>
  <td>统计各个标段四种预警级别的数量，可显示所有监测类型的总预警数和各种类型单独的预警数</td>
</tr>
<tr>
  <td width="20px"><input  onclick="changeType()" type="radio"  name="sumType" value="typeAnalysis"/></td>
  <td>按监测类型统计</td>
</tr>
<tr>
  <td>&nbsp;</td>
  <td>统计各种预警级别下各个标段每种监测类型的预警数量，形成饼状图</td>
</tr>
</table>
</fieldset>
<br/>
<br/>
<div class="saveDiv">
<input type="submit" value="统计分析" class="button1" >
</div>
<br/>
</html:form>