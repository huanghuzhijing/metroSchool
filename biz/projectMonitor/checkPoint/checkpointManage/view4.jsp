<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
 <table  class="form_table" bordercolorlight="#DDDDE0" bordercolordark="#ffffff" width="100%" border="1" align="center" cellpadding="3" cellspacing="0">
    <COLGROUP>
		<COL class="tr03" align="right" width="15%">
		<COL class="tr02" width="35%">
		<COL class="tr03" align="right" width="15%">
		<COL class="tr02" width="35%">
	</COLGROUP>
    <tr>
      <td><fmt:message key="dtaq.point.point_code" /></td>
      <td>${point.point_code}
      </td>
       <td><fmt:message key="dtaq.point.part_id" /></td>
      <td>${point.part.part_name}
      </td>
    </tr>
    <tr>
      <td><fmt:message key="dtaq.point.point_mechine" /></td>
      <td>${point.point_mechine}</td>
      <td><fmt:message key="dtaq.point.check_frequency" /></td>
      <td>${point.check_frequency}</td>
    </tr>
    <tr>
      <td><fmt:message key="dtaq.point.init_value4" /></td>
      <td>${point.init_value}<font class="unit_font">(单位：kn)</font></td>
       <td><fmt:message key="dtaq.point.check_state" /></td>
      <td>
      	<html:select property="check_state"  value="${point.check_state}">
      		<html:option value=""><fmt:message key="dtaq.common.select.option"/></html:option>
      		<html:option value="Y"><fmt:message key="dtaq.common.ok"/></html:option>
      		<html:option value="N"><fmt:message key="dtaq.common.cancel"/></html:option>
      	</html:select>
      </td>
    </tr>
    <tr>
      <td><fmt:message key="dtaq.point.abs_critical_value"/></td>
      <td>${point.abs_critical_value}<font class="unit_font">(值为:绝对警戒值*80%,单位：kn)</font></td>
      <td><fmt:message key="dtaq.point.abs_warning_value" /></td>
      <td>${point.abs_warning_value}<font class="unit_font">(单位：kn)</font></td>
    </tr>
    <tr>
      <td><fmt:message key="dtaq.point.negative_abs_critical_value"/></td>
      <td>${point.negative_abs_critical_value}<font class="unit_font">(单位：kn)</font></td>
      <td><fmt:message key="dtaq.point.negative_abs_warning_value"/></td>
      <td>${point.negative_abs_warning_value}<font class="unit_font">(单位：kn)</font></td>
    </tr>
    <tr>
      <td><fmt:message key="dtaq.point.rel_critical_value"/></td>
      <td>${point.rel_critical_value}<font class="unit_font">(单位：kn/d)</font></td>
      <td><fmt:message key="dtaq.point.rel_warning_value"/></td>
      <td>${point.rel_warning_value}<font class="unit_font">(单位：kn/d)</font></td>
    </tr>
    <tr>
      <td><fmt:message key="dtaq.point.project_direction" /></td>
      <td colspan="3">${point.project_direction}<font class="unit_font">(示例：+隆起-下沉)</font></td>
    </tr>
    <tr>
	<td><ex:label key="dtaq.data.monitoring_date"/><font color="red">*</font></td>
  	<td colspan="3">
    	<fmt:formatDate value="${point.write_date}"  pattern="yyyy-MM-dd hh"/>
   	</td>
	</tr>
    <c:if test="${point.point_id != null}">
    	<tr>
    	<td><fmt:message key="dtaq.point.update_reason"/></td>
    	<td colspan="3">
    		<ex:dictSelect property="update_reason" type="UpdatePointReason"/>
    	</td>
    </tr>
    </c:if>
    <c:if test="${isthird=='Y'}">
    <tr>
	    <td colspan="4">
			<c:if test="${comparePoint==null}">
				 <iframe frameborder="0" scrolling="auto" marginheight="0" marginwidth="0" width="100%" height="180px"
				  src="${ctx}/dtaq/autoCheckpointMgmt.do?method=doCompare&isthird=${isthird}&line_id=${line_id}&segment_id=${segment_id}&station_id=${station_id}&type_id=${type_id}&__skip__"></iframe>
			</c:if>
			<c:if test="${comparePoint!=null}">
				 <iframe frameborder="0" scrolling="auto" marginheight="0" marginwidth="0" width="100%" height="180px"
				  src="${ctx}/dtaq/autoCheckpointMgmt.do?method=doCompare&isthird=${isthird}&line_id=${line_id}&segment_id=${segment_id}&station_id=${station_id}&type_id=${type_id}&part_id=${comparePoint.part.part_id}&point_id=${comparePoint.point_id}&__skip__"></iframe>
			</c:if>
	    </td>
    </tr>
    </c:if>
  </table>