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
	var errors = "";
	var focus = "";
	var type_kind = "${pointType.type_kind}";
	var abs_warning_value = jQuery("[name='abs_warning_value']").val();
	var point_code = jQuery("[name='point_code']").val();
	var point_mechine = jQuery("[name='point_mechine']").val();
	var part_id = jQuery("[name='part_id']").val();
	var check_frequency = jQuery("[name='check_frequency']").val();
	var check_state = jQuery("[name='check_state']").val();
	if(point_code == ""){
		errors += "测点编码 为必填项\n";
		focus += "point_code,";
	}
	if(part_id == ""){
		errors += "监测部位 为必填项\n";
		focus += "part_id,";
	}
	if(point_mechine == ""){
		errors += "测量仪器 为必填项\n";
		focus += "point_mechine,";
	}
	if(check_frequency == ""){
		errors += "监测频率 为必填项\n";
		focus += "check_frequency,";
	}
	
	if(type_kind  != '5'){
		var init_value = jQuery("[name='init_value']").val();
		var abs_critical_value = jQuery("[name='abs_critical_value']").val();
		var negative_abs_critical_value = jQuery("[name='negative_abs_critical_value']").val();
		var negative_abs_warning_value = jQuery("[name='negative_abs_warning_value']").val();
		var rel_critical_value = jQuery("[name='rel_critical_value']").val();
		var rel_warning_value = jQuery("[name='rel_warning_value']").val();
		var project_direction = jQuery("[name='project_direction']").val();
		if(init_value == ""){
			if(type_kind == "1"){
				errors += "初始高程 为必填项\n";
			}else if(type_kind == "2"){
				errors += "初始坐标/值 为必填项\n";
			}else if(type_kind == "3"){
				errors += "初始值 为必填项\n";
			}else if(type_kind == "4"){
				errors += "初始PN值 为必填项\n";
			}
			focus += "init_value,";
		}
		if(check_state == ""){
			errors += "是否正在监测 为必填项\n";
			focus += "check_state,"
		}
		if(abs_critical_value == ""){
			errors += "绝对临界值 为必填项\n";
			focus += "abs_critical_value,"
		}
		if(abs_warning_value == ""){
			errors += "绝对警戒值 为必填项\n";
			focus += "abs_warning_value,"
		}
		if(negative_abs_critical_value == ""){
			errors += "负绝对临界值 为必填项\n";
			focus += "negative_abs_critical_value,"
		}
		if(negative_abs_warning_value == ""){
			errors += "负绝对警戒值 为必填项\n";
			focus += "negative_abs_warning_value,"
		}
		if(rel_critical_value == ""){
			errors += "相对临界值 为必填项\n";
			focus += "rel_critical_value,"
		}
		if(rel_warning_value == ""){
			errors += "相对警戒值 为必填项\n";
			focus += "rel_warning_value,"
		}
		if(project_direction == ""){
			errors += "工程方向 为必填项\n";
			focus += "project_direction,"
		}
	}else{
		if(abs_warning_value == ""){
			errors += "最大振速峰值 为必填项\n";
			focus += "abs_warning_value,"
		}
		if(check_state == ""){
			errors += "是否正在监测 为必填项\n";
			focus += "check_state,"
		}
	}
	if(point_id != "" ){
		var update_reason = jQuery("[name='update_reason']").val();
		if(update_reason == ""){
			errors += "修改原因 为必填项\n";
			focus += "update_reason,"
		}
	}
	if(errors != ""){
		alert(errors);
		var focusStr = focus.split(",");
		jQuery("[name='"+focusStr[0]+"']").focus();
	}else{
 		submitForm("pointHistoryForm",false,true);
	}
}

function backToList() {
 	 location.href="${ctx}/dtaq/pointHistory.do?station_id=${station_id}&dtaqCheckpointHistoryList_page=${dtaqCheckpointHistoryList_page}&station_state=${station_state}&organ_type=${organ_type}&typeId=${typeId}&startDate=${startDate}&endDate=${endDate}&pointCode=${pointCode}";
}

function validatePointCode(field){
	var oldpoint_code = jQuery("[name='oldpoint_code']").val();
	var point_code = jQuery("[name='point_code']").val();
	var part_id = jQuery("[name='part_id']").val();
	if(point_code != "" && part_id != "" && point_code != oldpoint_code){
		var url = "${ctx}/dtaq/point.do?method=validatePointCode";
		var myajax = new Ajax.Request(url, {method:"post", parameters:"type_id=${pointType.type_id}&part_id="+part_id+"&point_code="+point_code+"&organ_type="+jQuery("[name='organ_type']").val()+"&field="+field, onComplete:responseList});
	}
}

function responseList(selRequest){
	var resulttext = selRequest.responseText;
	if(resulttext != null && resulttext != ""){
		var splitStr = resulttext.split(",");
		var resText = splitStr[0];
		var field = splitStr[1];
		if(resText == "no"){
			if(field == "part_id"){
				alert("${texts['dtaq.point.part_id.msg']}");
				jQuery("[name='part_id'] option:eq(0)").attr("selected","selected") ;
				jQuery("[name='part_id']").focus();
			}else if(field == "point_code"){
				alert("${texts['dtaq.point.point_code.msg']}");
				jQuery("[name='point_code']").val("") ;
				jQuery("[name='point_code']").focus();
			}
		}
	}
}

function setComparePoint(point_id) {
  jQuery("#compare_point").val(point_id);
  if(point_id != ""){
  	  jQuery("#ownerMap").attr("src","${ctx}/dtaq/point.do?method=viewMap&point_id="+point_id+"&__skip__") ;
  }
}

/*鼠标定图*/
var graphUrl1="";
<c:if test="${isthird == 'Y'}">
graphUrl1="${third_img}";
</c:if>
<c:if test="${isthird != 'Y'}">
graphUrl1="${work_img}";
</c:if>
/*
var wp=null;
function init(){
	   //初始化	 
	   wp=new NewWatchPoint({
	   name:"wp",//实例名
	   target:$("wp_chartBody"),//显示区DIV ID
	   xName:"pointx",//X轴表单名
	   yName:"pointy",//Y轴表单名
	   wbsidName:"point_id",//绑定主键ID
	   ctx:"${ctx}",//基本路径
	   radius:5,//图层半径,
	   allowSelected:0,
	   baseHeight:217,//调节与上边距
	   graphUrl:graphUrl1,//地理底图
	   vars:"dataCallWay=1&id="+jQuery("[name='point_id']").val()+"&enable=true&isCurrent=true",//传入参数用于指定FLASH要显示哪个点
	   VIEWMODE:3//测点编辑视图模式
	   });
	   //添加数据
	   var id=jQuery("[name='point_id']").val();	   
	  var xyList="${xyList}";
	  var tmp=jQuery("[name='pointx']").val()+":"+jQuery("[name='pointy']").val();
	  if(xyList==""){
		  xyList=tmp;
	  }
	  else
	      xyList=tmp+","+xyList;
	 // alert(xyList);
	  wp.paint();//画出框架
	  wp.addAndShowData(xyList);//加载并显示数据
	  //alert('监测点部位管理');	   
   }
*/		
</script>
</head>
<body>
<html:form action="/dtaq/pointHistory">
  <input type="hidden" name="method" value="save">
  <html:hidden property="line_id" />
  <html:hidden property="segment_id" />
  <html:hidden property="station_id" />
  <html:hidden property="station_state" />
  <html:hidden property="type_id" />
  <html:hidden property="typeId" value="${typeId}" />
  <html:hidden property="pointCode" value="${pointCode}" />
  <html:hidden property="startDate" value="${startDate}"/>
  <html:hidden property="endDate" value="${endDate}"/>
  <html:hidden property="dtaqCheckpointHistoryList_page" value="${dtaqCheckpointHistoryList_page}"/>
  <html:hidden property="hihstory_id" />
  <html:hidden property="point_id" />
  <html:hidden property="organ_type"/>
  <html:hidden property="isthird"/>
  <html:hidden property="map_name"/>
	<html:hidden property="map_filename"/>
  <html:hidden property="compare_point" styleId="compare_point"/>
	<html:hidden property="pointx" />
	<html:hidden property="pointy" />
	
	<html:hidden property="info_id" />
	<html:hidden property="curr_value" />
	<html:hidden property="curr_change" />
	<html:hidden property="change_rate" />
	<html:hidden property="total_change" />
	<html:hidden property="warn_state" />
	<html:hidden property="warn_memo" />
	<html:hidden property="write_date" />
	<html:hidden property="prev_date" />
   <table   class="form_table" bordercolorlight="#DDDDE0" bordercolordark="#ffffff" width="100%" border="1" align="center" cellpadding="3" cellspacing="0">
    <COLGROUP>
		<COL class="tr03" align="right" width="15%">
		<COL class="tr02" width="35%">
		<COL class="tr03" align="right" width="15%">
		<COL class="tr02" width="35%">
	</COLGROUP>
    <tr>
      <td><fmt:message key="dtaq.point.point_code" /><font color="red">*</font></td>
      <td><html:text property="point_code" value="${dtaqCheckpoint.point_code}" styleClass="text" maxlength="50" onblur="validatePointCode('point_code')"/>
      	<html:hidden property="oldpoint_code" value="${dtaqCheckpoint.point_code}"/>
      </td>
       <td><fmt:message key="dtaq.point.part_id" /><font color="red">*</font></td>
      <td>
      	<html:select property="part_id" value="${dtaqCheckpoint.part.part_id}" onchange="validatePointCode('part_id')">
      		<html:option value=""><fmt:message key="dtaq.common.select.option"/></html:option>
      		<html:optionsCollection name="partList" value="part_id" label="part_name"/>
      	</html:select>
      </td>
    </tr>
    <tr>
      <td><fmt:message key="dtaq.point.point_mechine" /><font color="red">*</font></td>
      <td><html:text property="point_mechine" value="${dtaqCheckpoint.point_mechine}" styleClass="text" maxlength="50" size="40"/></td>
      <td><fmt:message key="dtaq.point.check_frequency" /><font color="red">*</font></td>
      <td><ex:numberInput property="check_frequency" type="float" maxlength="12"/></td>
    </tr>
    <tr>
      <c:if test="${pointType.type_kind != '5'}">
	      <td>
		      <c:if test="${pointType.type_kind == '1'}"><fmt:message key="dtaq.point.init_value1" /><font color="red">*</font></c:if>
		      <c:if test="${pointType.type_kind == '2'}"><fmt:message key="dtaq.point.init_value2" /><font color="red">*</font></c:if>
		      <c:if test="${pointType.type_kind == '3'}"><fmt:message key="dtaq.point.init_value3" /><font color="red">*</font></c:if>
		      <c:if test="${pointType.type_kind == '4'}"><fmt:message key="dtaq.point.init_value4" /><font color="red">*</font></c:if>
		      
	      </td>
	      <td><ex:numberInput property="init_value" type="float" maxlength="12"/>
	      	<c:if test="${pointType.type_kind != '4'}"><font color="blue">(单位：m)</font></c:if>
	      	<c:if test="${pointType.type_kind == '4'}"><font color="blue">(单位：kn)</font></c:if>
	      </td>
      </c:if>
      <c:if test="${pointType.type_kind == '5'}">
       		<td><fmt:message key="dtaq.pointType.type_value_5"/><font color="red">*</font></td>
		      <td><html:text property="abs_warning_value" styleClass="text"  readonly="true"/>
			      <font color="blue">(单位：cm/s)</font>
		      </td>
       </c:if>
       <td><fmt:message key="dtaq.point.check_state" /><font color="red">*</font></td>
      <td>
      	<html:select property="check_state" value="${dtaqCheckpoint.check_state}">
      		<html:option value=""><fmt:message key="dtaq.common.select.option"/></html:option>
      		<html:option value="Y"><fmt:message key="dtaq.common.ok"/></html:option>
      		<html:option value="N"><fmt:message key="dtaq.common.cancel"/></html:option>
      	</html:select>
      </td>
    </tr>
    <c:if test="${pointType.type_kind != '5'}">
	    <tr>
	      <td><fmt:message key="dtaq.point.abs_critical_value"/><font color="red">*</font></td>
	      <td>
	      <ex:numberInput property="abs_critical_value" style="float" maxlength="12"/>
	     	<c:if test="${pointType.type_kind != '4'}"><font color="blue">(单位：mm)</font></c:if>
	      	<c:if test="${pointType.type_kind == '4'}"><font color="blue">(绝对警戒值*80%,单位：kn)</font></c:if>
	      </td>
	      <td><fmt:message key="dtaq.point.abs_warning_value"/><font color="red">*</font></td>
	      <td>
	      	<ex:numberInput property="abs_warning_value" style="float" maxlength="12"/>
		      <c:if test="${pointType.type_kind != '4'}"><font color="blue">(单位：mm)</font></c:if>
		      	<c:if test="${pointType.type_kind == '4'}"><font color="blue">(单位：kn)</font></c:if>
	      </td>
	    </tr>
		    <tr>
		      <td><fmt:message key="dtaq.point.negative_abs_critical_value"/><font color="red">*</font></td>
		      <td>
		      <ex:numberInput property="negative_abs_critical_value" style="float" maxlength="12"/>
		      <c:if test="${pointType.type_kind != '4'}"><font color="blue">(单位：mm)</font></c:if>
	      		<c:if test="${pointType.type_kind == '4'}"><font color="blue">(单位：kn)</font></c:if>
		      </td>
		      <td><fmt:message key="dtaq.point.negative_abs_warning_value"/><font color="red">*</font></td>
		      <td>
		      <ex:numberInput property="negative_abs_warning_value" style="float" maxlength="12"/>
					 <c:if test="${pointType.type_kind != '4'}"><font color="blue">(单位：mm)</font></c:if>
	      			<c:if test="${pointType.type_kind == '4'}"><font color="blue">(单位：kn)</font></c:if>
				</td>
		    </tr>
	    <tr>
	      <td><fmt:message key="dtaq.point.rel_critical_value"/><font color="red">*</font></td>
	      <td>
	      <ex:numberInput property="rel_critical_value" style="float" maxlength="12"/>
	      		<c:if test="${pointType.type_kind != '4'}"><font color="blue">(单位：mm/d)</font></c:if>
	      		<c:if test="${pointType.type_kind == '4'}"><font color="blue">(单位：kn/d)</font></c:if>
	      </td>
	      <td><fmt:message key="dtaq.point.rel_warning_value"/><font color="red">*</font></td>
	      <td>
	      	<ex:numberInput property="rel_warning_value" style="float" maxlength="12"/>
	      		<c:if test="${pointType.type_kind != '4'}"><font color="blue">(单位：mm/d)</font></c:if>
	      			<c:if test="${pointType.type_kind == '4'}"><font color="blue">(单位：kn/d)</font></c:if>
	      </td>
	    </tr>
	    <tr>
	      <td><fmt:message key="dtaq.point.project_direction" /><font color="red">*</font></td>
	      <td colspan="3"><html:text property="project_direction" value="${dtaqCheckpoint.project_direction}" styleClass="text" size="70" maxlength="100" /><font color="blue">(示例：+隆起-下沉)</font></td>
	    </tr>
    </c:if>
   	<tr>
    	<td><fmt:message key="dtaq.point.update_reason"/><font color="red">*</font></td>
    	<td colspan="3">
    		<ex:dictSelect property="update_reason" type="UpdatePointReason"/>
    	</td>
    </tr>
    <tr>
    	<td><fmt:message key="dtaq.common.remark"/></td>
    	<td colspan="3">
    		<html:textarea property="remark" styleId="remark" value="${dtaqCheckpoint.remark}" cols="80" rows="8" onblur="checkTextarea('remark',4000)" onkeydown="textCounter('remark','spanSummary',4000)" onkeyup="textCounter('remark','spanSummary',4000)"/>
	      <span id="spanSummary" class="req" style="display:inline"><fmt:message key="dtaq.common.textarea.msg"/></span>
    	</td>
    </tr>
  <c:if test="${isthird=='Y'}">
    <tr>
	    <td colspan="4">
			<c:if test="${comparePoint==null}">
				 <iframe frameborder="0" scrolling="auto" marginheight="0" marginwidth="0" width="100%" height="180px"
				  src="${ctx}/dtaq/pointHistory.do?method=doCompare&isthird=${isthird}&line_id=${line_id}&segment_id=${segment_id}&station_id=${station_id}&type_id=${pointType.type_id}&__skip__"></iframe>
			</c:if>
			<c:if test="${comparePoint!=null}">
				 <iframe frameborder="0" scrolling="auto" marginheight="0" marginwidth="0" width="100%" height="180px"
				  src="${ctx}/dtaq/pointHistory.do?method=doCompare&isthird=${isthird}&line_id=${line_id}&segment_id=${segment_id}&station_id=${station_id}&type_id=${pointType.type_id}&part_id=${comparePoint.part.part_id}&point_id=${comparePoint.point_id}&__skip__"></iframe>
			</c:if>
	    </td>
    </tr>
    </c:if>
     <tr bgcolor="#E3EDF6">
         <td align="center" colspan="4">
	        <input type="button" class="saveButton" value="${texts['button.save']}" onClick="saveInfo()">&nbsp;&nbsp;
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
<table>
<%--    <tr>--%>
<%--    	<td ><div id="wp_chartBody" class='wp_chartBodyDiv'></div></td>--%>
<%--    </tr>--%>
</table>
</body>
</html>