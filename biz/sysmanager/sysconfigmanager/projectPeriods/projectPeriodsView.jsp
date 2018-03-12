<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ include file="/commons/taglibs.jsp" %>
<ex:bundle/>
<html>
<head>

</head>
<script type="text/javascript">
	jQuery(document).ready(function(){
		//返回
       jQuery("#btn_back").click(function(){
       		history.back(-1);
       });
	 });
</script>
<content tag="heading">
项目周期设置
</content>
<body>
<fieldset >
		<legend>[项目周期设置-详细信息]</legend>

         <table class="titleTable">
	         <COLGROUP>
	           	<COL class="tdLeftTwo" />
				<COL class="tdRightTwo" />
				<COL class="tdLeftTwo" />
				<COL class="tdRightTwo" />
	          </COLGROUP>
          <tr>
             <td>项目周期编号：<span class="noRedSpan">*</span></td>
             <td>${projectPeriods.periodscode}&nbsp;</td>
             <td>项目周期名称：<span class="noRedSpan">*</span></td>
             <td>${projectPeriods.periodsname}&nbsp;</td>
           </tr>
           <tr>
           	<td>
           		有效状态：<span class="noRedSpan">*</span>
           	</td>
           	<td colspan="3">
           		<c:if test="${projectPeriods.validstate==0}">有效</c:if>&nbsp;
           		<c:if test="${projectPeriods.validstate==1}">无效</c:if>
           	</td>
           </tr>
           <tr>
             <td>登记人：<span class="noRedSpan">*</span></td>
             <td><ex:userName id="${projectPeriods.recorder}"/>&nbsp;</td>
             <td>登记日期：<span class="noRedSpan">*</span></td>
             <td><fmt:formatDate value="${projectPeriods.recorddate}" pattern="yyyy-MM-dd"/>&nbsp;</td>
           </tr>
           <tr>
            
             <td>修改人：<span class="noRedSpan">*</span></td>
             <td><ex:userName id="${projectPeriods.updateman}"/>&nbsp;</td>
             <td>修改日期：<span class="noRedSpan">*</span></td>
             <td colspan="3"><fmt:formatDate value="${projectPeriods.updatedate}" pattern="yyyy-MM-dd"/>&nbsp;</td>
           </tr>
         </table>
	</fieldset>
		<div class="saveDiv">
			<input type="button" id="btn_back" value="<fmt:message key="button.back"/>" icon="icon_back" />
		</div>
  </body>
</html>


