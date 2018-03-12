<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
 <fieldset>
 <legend>测点信息</legend>
 <table  class="formTable"  >
    <COLGROUP>
		<COL class="tdLeftTwo">
		<COL class="tdRightTwo">
		<COL class="tdLeftTwo">
		<COL class="tdRightTwo">
	</COLGROUP>
    <tr>
      <td>测点编码：</td>
      <td>${point.point_code}
      </td>
       <td>监测部位：</td>
      <td>
      	${point.partId.part_name}
      </td>
    </tr>
    <tr>
      <td>监测仪器：</td>
      <td>${point.point_mechine}</td>
      <td>监测频率：</td>
      <td>${point.check_frequency}</td>
    </tr>
    <tr>
      <td>初始值：</td>
      <td>${point.init_value}<font class="unit_font">(单位：m)</font></td>
       <td>是否正在检测：</td>
      <td>
      	<html:select property="check_state" value="${point.check_state}">
      		<html:option value="">请选择</html:option>
      		<html:option value="Y">是</html:option>
      		<html:option value="N">否</html:option>
      	</html:select>
      </td>
    </tr>
    <tr>
      <td>绝对临界值：</td>
      <td>${point.abs_critical_value}<font class="unit_font">(单位：mm)</font></td>
      <td>绝对警戒值：</td>
      <td>${point.abs_warning_value}<font class="unit_font">(单位：mm)</font></td>
    </tr>
    <tr>
      <td>负绝对临界值：</td>
      <td>${point.negative_abs_critical_value}<font class="unit_font">(单位：mm)</font></td>
      <td>负绝对警戒值：</td>
      <td>${point.negative_abs_warning_value}<font class="unit_font">(单位：mm)</font></td>
    </tr>
    <tr>
      <td>相对临界值：</td>
      <td>${point.rel_critical_value}<font class="unit_font">(单位：mm/d)</font></td>
      <td>相对警戒值：</td>
      <td>${point.rel_warning_value}<font class="unit_font">(单位：mm/d)</font></td>
    </tr>
    <tr>
      <td>工程方向：</td>
      <td colspan="3">${point.project_direction}<font class="unit_font">(示例：+隆起-下沉)</font></td>
    </tr>
    <tr>
	<td>监测日期：</td>
  	<td colspan="3">
  		<fmt:formatDate value="${point.write_date}"  pattern="yyyy-MM-dd hh"/>
   	</td>
	</tr>
    <tr>
    	<td>备注：</td>
    	<td colspan="3">${point.remark}
    	</td>
    </tr>
    <c:if test="${point.organ_type eq 'Y'}">
    <tr>
	    <td colspan="4">
			<c:if test="${param.organ_type =='T'}">
		  <iframe frameborder="0" scrolling="auto" marginheight="0" marginwidth="0" width="100%" height="180px"
				  src="dtaqCheckpointAction.do?method=doCompare&organ_type=${param.organ_type}&__skip__&station_id=${param.station_id}&qlineId=${param.qlineId}&segment_id=${param.segment_id}&type_id=${param.type_id}&__skip__"></iframe>
		</c:if>
	    </td>
    </tr>
    </c:if>
  </table>
 </fieldset>