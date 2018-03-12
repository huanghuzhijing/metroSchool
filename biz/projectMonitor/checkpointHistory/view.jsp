<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle/>
<html>
<head>
<title><fmt:message key="dtaq.dtaqCheckpointHistory.title"/></title>
<content tag="heading"><fmt:message key="dtaq.dtaqCheckpointHistory.title"/></content>
<script src="<c:url value="/scripts/public.js"/>" type="text/javascript"></script>
<script src="${ctx}/scripts/flex_pub.js"></script>
<script src="${ctx}/scripts/newWatchpoint.js"></script>

<script  type="text/javascript" language=javascript>
//必须搭配prototype1.16版本
</script>
<script language="javascript">
function saveInfo() {
	var point_id = jQuery("[name='point_id']").val();
	var flag = true;
	var type_kind = "${pointType.type_kind}";
	var init_value = jQuery("[name='init_value']").val();
	if(init_value == ""){
		if(type_kind == "1"){
			alert("初始高程不能为空！");
		}else if(type_kind == "2"){
			alert("初始坐标/值不能为空！");
		}else if(type_kind == "3"){
			alert("初始值不能为空！");
		}else if(type_kind == "4"){
			alert("初始PN值不能为空！");
		}
		flag = false;
	}
	if(point_id != "" ){
		var update_reason = jQuery("[name='update_reason']").val();
		if(update_reason == ""){
			alert("${texts['dtaq.point.update_reason.msg']}");
			jQuery("[name='update_reason']").focus();
			flag =  false;
		}
	}
	if(flag){
 		 submitForm("pointHistoryForm",false,true);
	}
}

function backToList() {
 	 location.href="${ctx}/dtaq/pointHistory.do?station_id=${station_id}&dtaqCheckpointHistoryList_page=${dtaqCheckpointHistoryList_page}&station_state=${station_state}&organ_type=${organ_type}&typeId=${typeId}&startDate=${startDate}&endDate=${endDate}&pointCode=${pointCode}";
}

/*鼠标定图*/
var graphUrl1="";
<c:if test="${isthird == 'Y'}">
graphUrl1="${third_img}";
</c:if>
<c:if test="${isthird != 'Y'}">
graphUrl1="${work_img}";
</c:if>
</script>
</head>
<body>
<html:form action="/dtaq/pointHistory">
  <input type="hidden" name="method" value="save">
  <html:hidden property="line_id" />
  <html:hidden property="segment_id" />
  <html:hidden property="station_id" />
  <html:hidden property="type_id" />
  <html:hidden property="point_id" />
  <html:hidden property="station_state" />
  <html:hidden property="organ_type"/>
  <html:hidden property="isthird"/>
  <html:hidden property="map_name"/>
	<html:hidden property="map_filename"/>
  <html:hidden property="compare_point" styleId="compare_point"/>
	<html:hidden property="pointx" />
	<html:hidden property="pointy" />  
   <table   class="form_table" bordercolorlight="#DDDDE0" bordercolordark="#ffffff" width="100%" border="1" align="center" cellpadding="3" cellspacing="0">
    <COLGROUP>
		<COL class="tr03" align="right" width="15%">
		<COL class="tr02" width="35%">
		<COL class="tr03" align="right" width="15%">
		<COL class="tr02" width="35%">
	</COLGROUP>
    <tr>
      <td><ex:label key="dtaq.point.point_code" /></td>
      <td>${pointHistory.point_code}</td>
       <td><ex:label key="dtaq.point.part_id" /></td>
      <td>${pointHistory.part.part_name}</td>
    </tr>
    <tr>
      <td><ex:label key="dtaq.point.point_mechine" /></td>
      <td>${pointHistory.point_mechine}</td>
      <td><ex:label key="dtaq.point.check_frequency" /></td>
      <td>${pointHistory.check_frequency}</td>
    </tr>
    <tr>
    <c:if test="${pointType.type_kind != '5'}">
	      <td>
		      <c:if test="${pointType.type_kind == '1'}"><fmt:message key="dtaq.point.init_value1" /><font color="red">*</font></c:if>
		      <c:if test="${pointType.type_kind == '2'}"><fmt:message key="dtaq.point.init_value2" /><font color="red">*</font></c:if>
		      <c:if test="${pointType.type_kind == '3'}"><fmt:message key="dtaq.point.init_value3" /><font color="red">*</font></c:if>
		      <c:if test="${pointType.type_kind == '4'}"><fmt:message key="dtaq.point.init_value4" /><font color="red">*</font></c:if>
		      
	      </td>
	      <td>
	      	
		      <html:text property="init_value" value="${pointHistory.init_value}" styleClass="text" readonly="true" />
		      	<c:if test="${pointType.type_kind != '4'}"><font color="blue">(单位：m)</font></c:if>
		      	<c:if test="${pointType.type_kind == '4'}"><font color="blue">(单位：kn)</font></c:if>
	      </td>
      </c:if>
      <c:if test="${pointType.type_kind == '5'}">
      		 <td><fmt:message key="dtaq.pointType.type_value_5" /></td>
      		<td>
	      		<html:text property="abs_warning_value" value="${pointHistory.abs_warning_value}" styleClass="text" readonly="true" />
				<font color="blue">(单位：cm/s)</font>
			</td>
      </c:if>
       <td><ex:label key="dtaq.point.check_state" /></td>
      <td>
      		<c:if test="${pointHistory.check_state == 'Y'}">是</c:if>
      		<c:if test="${pointHistory.check_state == 'N'}">否</c:if>
      </td>
    </tr>
    <c:if test="${pointType.type_kind != '5'}">
	    <tr>
	      <td><ex:label key="dtaq.point.abs_critical_value"/></td>
	      <td>
	      <html:text property="abs_critical_value" value="${pointHistory.abs_critical_value}" styleClass="text" readonly="true" />
	     	<c:if test="${pointType.type_kind != '4'}"><font color="blue">(单位：mm)</font></c:if>
	      	<c:if test="${pointType.type_kind == '4'}"><font color="blue">(绝对警戒值*80%,单位：kn)</font></c:if>
	      </td>
	      <td><ex:label key="dtaq.point.abs_warning_value"/></td>
	      <td>
	      	<html:text property="abs_warning_value" value="${pointHistory.abs_warning_value}" styleClass="text" readonly="true" />
		      <c:if test="${pointType.type_kind != '4'}"><font color="blue">(单位：mm)</font></c:if>
		      	<c:if test="${pointType.type_kind == '4'}"><font color="blue">(单位：kn)</font></c:if>
	      </td>
	    </tr>
		    <tr>
		      <td><ex:label key="dtaq.point.negative_abs_critical_value"/></td>
		      <td>
		      <html:text property="negative_abs_critical_value" value="${pointHistory.negative_abs_critical_value}" styleClass="text" readonly="true" />
		      <c:if test="${pointType.type_kind != '4'}"><font color="blue">(单位：mm)</font></c:if>
	      		<c:if test="${pointType.type_kind == '4'}"><font color="blue">(单位：kn)</font></c:if>
		      </td>
		      <td><ex:label key="dtaq.point.negative_abs_warning_value"/></td>
		      <td>
		      <html:text property="negative_abs_warning_value" value="${pointHistory.negative_abs_warning_value}" styleClass="text" readonly="true" />
					 <c:if test="${pointType.type_kind != '4'}"><font color="blue">(单位：mm)</font></c:if>
	      			<c:if test="${pointType.type_kind == '4'}"><font color="blue">(单位：kn)</font></c:if>
				</td>
		    </tr>
	    <tr>
	      <td><ex:label key="dtaq.point.rel_critical_value"/></td>
	      <td>
	      <html:text property="rel_critical_value" value="${pointHistory.rel_critical_value}" styleClass="text" readonly="true" />
	      		<c:if test="${pointType.type_kind != '4'}"><font color="blue">(单位：mm/d)</font></c:if>
	      		<c:if test="${pointType.type_kind == '4'}"><font color="blue">(单位：kn/d)</font></c:if>
	      </td>
	      <td><ex:label key="dtaq.point.rel_warning_value"/></td>
	      <td>
	      	<html:text property="rel_warning_value" value="${pointHistory.rel_warning_value}" styleClass="text" readonly="true" />
	      		<c:if test="${pointType.type_kind != '4'}"><font color="blue">(单位：mm/d)</font></c:if>
	      			<c:if test="${pointType.type_kind == '4'}"><font color="blue">(单位：kn/d)</font></c:if>
	      </td>
	    </tr>
	    <tr>
	      <td><ex:label key="dtaq.point.project_direction" /></td>
	      <td colspan="3">${dtaqCheckpoint.project_direction}</td>
	    	
	    </tr>
    </c:if>
    <tr>
    	<td><fmt:message key="dtaq.point.update_reason"/></td>
	    <td colspan="3"><ex:dictDisplayEl type="UpdatePointReason" value="${pointHistory.update_reason}"/></td>
    </tr>
    <tr>
    	<td><fmt:message key="dtaq.common.remark"/></td>
    	<td colspan="3">
    		<html:textarea property="remark" value="${pointHistory.remark}" cols="80" rows="8" readonly="true" />
    	</td>
    </tr>
     <tr bgcolor="#E3EDF6">
         <td align="center" colspan="4">
    		<input type="button" class="backButton" value="${texts['button.back']}" onClick="backToList()">
        </td>
     </tr>
   <c:if test="${isthird=='Y'}">
    <c:if test="${onUsePointType != null}">
	    <tr>
		    <td colspan="4">
				<table width="100%" border="0" cellpadding="0" cellspacing="0">
					<tr>
						<c:if test="${onUsePointType.thirdaddress != null}">
							<td width="50%" align="center"><fmt:message key="dtaq.point.thirdaddress.msg"/></td>
						</c:if>
						<c:if test="${onUsePointType.workaddress != null}">
							<td width="50%" align="center"><fmt:message key="dtaq.point.workaddress.msg"/></td>
						</c:if>
					</tr>
					<tr>
						<c:if test="${onUsePointType.thirdaddress != null}">
							<td width="50%" align="center">
								<img id="thirdMap" alt="${texts['dtaq.point.thirdaddress.msg']}" src="${ctx}/dtaq/point.do?method=viewMap&id=${onUsePointType.id}&isthird=Y&__skip__" border="0">
							</td>
						</c:if>
						<c:if test="${onUsePointType.workaddress != null}">
							<td width="50%" align="center">
								<img id="ownerMap" alt="${texts['dtaq.point.workaddress.msg']}" src="${ctx}/dtaq/point.do?method=viewMap&id=${onUsePointType.id}&isthird=N&__skip__" border="0">
							</td>
						</c:if>
					</tr>
				</table>
			</td>
		</tr>
	</c:if>
</c:if>
  </table>
</html:form>
</body>
</html>