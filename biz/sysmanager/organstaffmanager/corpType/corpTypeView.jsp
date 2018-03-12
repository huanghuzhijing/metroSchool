<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>
<ex:bundle/>
<html>
<head>

<script type="text/javascript">
	jQuery(document).ready(function(){
		//返回
       jQuery("#btn_back").click(function(){
       		history.back(-1);
       });
	 });
</script>
</head>
<content tag="heading">
参建单位类型管理-详细信息
</content>
<body>
<fieldset >
	<legend>参建单位类型-详细信息</legend>
         <table class="titleTable">
	         <COLGROUP>
	           	<COL class="tdLeftTwo" />
				<COL class="tdRightTwo" />
				<COL class="tdLeftTwo" />
				<COL class="tdRightTwo" />
	          </COLGROUP>
          <tr>
             <td>参建单位类型编码：<span class="noRedSpan">*</span></td>
             <td>${corpType.typecode}&nbsp;</td>
             <td>参建单位类型名称：<span class="noRedSpan">*</span></td>
             <td>${corpType.typename}&nbsp;</td>
          </tr>
           <tr>
             <td>排序：<span class="noRedSpan">*</span></td>
             <td>${corpType.orderno}&nbsp;</td>
             <td>参建单位类型标识：<span class="noRedSpan">*</span></td>
             <td>${corpType.corptype}&nbsp;</td>
           </tr>
           <tr>
	             <td>
	             	登记人：<span class="noRedSpan">*</span>
	             </td>
	             <td>
	             	<ex:empName id="${corpType.recorder}"/>&nbsp;
	             </td>
	             <td>
	             	登记日期：<span class="noRedSpan">*</span>
	             </td>
	             <td>
	             	<fmt:formatDate value="${corpType.recorddate}"/>&nbsp;
	             </td>
           </tr>
           <tr>
	             <td>
	             	修改人：<span class="noRedSpan">*</span>
	             </td>
	             <td>
	             	<ex:empName id="${corpType.updateman}"/>&nbsp;
	             </td>
	             <td>
	             	修改日期：<span class="noRedSpan">*</span>
	             </td>
	             <td >
	             	<fmt:formatDate value="${corpType.updatedate}" />&nbsp;
	             </td>
           </tr>
      </table>
</fieldset>
		<div class="saveDiv">
			<input type="button" icon="icon_back" id="btn_back" value="<fmt:message key="button.back"/>"  />
		</div>
  </body>
</html>


