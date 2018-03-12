<%@ page contentType="text/html;charset=UTF-8" %>
<script type="text/javascript">
function saveInfo() {
  var currValueEls = jQuery("[name='total_change']");
  if(currValueEls.length > 0){
  	 var errors = "" ;
  	 
  	 var tableObjTr = jQuery("#contractInfoList tbody tr") ;
  	 tableObjTr.each(function(i)){
  	 	var curr_value = jQuery(this).find("td:eq(2) input").val().Trim();
  	 	var curr_change = jQuery(this).find("td:eq(3) input").val().Trim();
  	 	var change_rate = jQuery(this).find("td:eq(4) input").val().Trim();
  	 	var total_change = jQuery(this).find("td:eq(5) input").val().Trim();
  	 	if(curr_value !="" || curr_change !="" || change_rate != "" || total_change != ""){
  	 		if(curr_value == "" || curr_change == "" || change_rate == "" || total_change == ""){
  	 			errors += "第"+(i+1)+"行 存在为空的必填项!\n";
  	 		}
  	 	}
  	 }
  	 var err = "爆心距(m)/最大装药量(kg)/振速峰值(cm/s)/地震波频率(hz)为必填项\n" ;
  	 if(errors != ""){
  	 	alert(err+errors);
  	 }else{
	  loadMessage("数据正在保存中，请稍候");
	  submitForm("dataEditForm","save",false);
  	 }

  }
}

String.prototype.Trim = function(){ 
	return this.replace(/(^\s*)|(\s*$)/g, ""); 
}


function validateValue(object) {
  var value = object.value.trim();
 if(isNaN(value)){
    alert("输入值不是合法数值。");
    object.value = "";
    object.focus();
  }
}

function valueChanged(idx) {
  var valueEl = jQuery("#total_change_"+idx);
  var total_change = valueEl.value.trim();
  if(total_change.length==0) {
    jQuery("#warn_state_"+idx).val("");
    jQuery("#v_warn_state_"+idx).removeClass();
    jQuery("#warn_memo_"+idx).val("");
  } else if(total_change == "") {
   	jQuery("#warn_state_"+idx).val("");
    jQuery("#v_warn_state_"+idx).removeClass();
    jQuery("#warn_memo_"+idx).val("");
  }else if(isNaN(total_change)){
  	jQuery("#warn_state_"+idx).val("");
    jQuery("#v_warn_state_"+idx).removeClass();
    jQuery("#warn_memo_"+idx).val("");
    alert("输入值不是合法的数值。");
    valueEl.val("");
    valueEl.focus();
  }
  else {
   	var warn_state = 1; // 预警状态
    var abs_warning_value = parseFloat(jQuery("#abs_warning_value_"+idx).val());
    var d_total_change = parseFloat(total_change);
    if(d_total_change >= abs_warning_value){
    	warn_state = 4;
    }
	//判断累计的绝对值状态
	jQuery("#warn_state_"+idx).val(warn_state);
    jQuery("#v_warn_state_"+idx).val("state"+warn_state);
	var memo = "无预警";
	//红色报警
	if(warn_state == 4){
		memo = "质点振速峰值超过最大振速峰值";
	}
	jQuery("#warn_memo_"+idx).val(memo);
    jQuery("#tr_"+idx).attr("title", memo);
  }
}
</script>
  <div class="tableRegion">
<table border="0"  cellpadding="0"  cellspacing="0">
<tr>
<td><div class="grid">
<table id="contractInfoList" border="0" cellspacing="0" cellpadding="0" style="border-collapse: collapse;">
<thead>
  <tr>
    <th class="tableHeader" style="border:1px solid #D9E8FB;"  onmouseover="this.className='tableHeaderSort';"  onmouseout="this.className='tableHeader';"  width="10%">测点编码</th>
    <c:if test="${dataInfoView == null }" >
    	<th class="tableHeader" style="border:1px solid #D9E8FB;"  onmouseover="this.className='tableHeaderSort';"  onmouseout="this.className='tableHeader';"  width="10%">监测部位</th>
    </c:if>
    <th class="tableHeader" style="border:1px solid #D9E8FB;" onmouseover="this.className='tableHeaderSort';"  onmouseout="this.className='tableHeader';"  width="10%">爆心距(m)</th>
    <th class="tableHeader" style="border:1px solid #D9E8FB;" onmouseover="this.className='tableHeaderSort';"  onmouseout="this.className='tableHeader';"  width="10%">最大装药量(kg)</th>
    <th class="tableHeader" style="border:1px solid #D9E8FB;" onmouseover="this.className='tableHeaderSort';"  onmouseout="this.className='tableHeader';"  width="10%">振速峰值(cm/s)</th>
    <th class="tableHeader" style="border:1px solid #D9E8FB;" onmouseover="this.className='tableHeaderSort';"  onmouseout="this.className='tableHeader';"  width="10%">地震波频率(hz)</th>
    <th class="tableHeader" style="border:1px solid #D9E8FB;" onmouseover="this.className='tableHeaderSort';"  onmouseout="this.className='tableHeader';"  width="10%">预警状态</th>
    <th class="tableHeader" style="border:1px solid #D9E8FB;" onmouseover="this.className='tableHeaderSort';"  onmouseout="this.className='tableHeader';"  width="10%">预警原因</th>
    <c:if test="${mode!='create'}"><th class="tableHeader" style="border:1px solid #D9E8FB;" onmouseover="this.className='tableHeaderSort';"  onmouseout="this.className='tableHeader';"  width="10%">图形操作</th></c:if>
  </tr>
 </thead>
  <tbody>
<c:set var="idx" value="0"/>
<c:forEach items="${datas}" var="data">
<tr id="tr_${idx}">
  <td style="border:1px solid #D9E8FB;">
	  <input type="hidden" name="data_id" id="data_id_${idx}" value="${data.data_id}">
	  <input type="hidden" name="part_ids" id="part_id_${idx}" value="${data.part_id.part_id}">
	  <input type="hidden" name="point_id" id="point_id_${idx}" value="${data.point_id.point_id}">
	  <input type="hidden" name="point_code" id="point_code_${idx}" value="${data.point_code}">
	<%--  <input type="hidden" name="point_distance" id="point_distance_${idx}" value="${data.point_distance}">--%>
	  <input type="hidden" name="init_value" id="init_value_${idx}" value="${data.init_value}">
	  <input type="hidden" name="init_date" id="init_date_${idx}" value="${data.init_date}">
	  <input type="hidden" name="prev_value" id="prev_value_${idx}" value="${data.prev_value}">
	  <input type="hidden" name="prev_date" id="prev_date_${idx}" value="${data.prev_date}">
	  <input type="hidden" name="prev_total_value" id="prev_total_value_${idx}" value="${data.prev_total_value}">
	  <input type="hidden" name="warn_state" id="warn_state_${idx}" value="${data.warn_state}">
	  <input type="hidden" name="abs_critical_value" id="abs_critical_value_${idx}" value="${data.abs_critical_value}">
	  <input type="hidden" name="abs_warning_value" id="abs_warning_value_${idx}" value="${data.abs_warning_value}">
	  <input type="hidden" name="negative_abs_critical_value" id="negative_abs_critical_value_${idx}" value="${data.negative_abs_critical_value}">
	  <input type="hidden" name="negative_abs_warning_value" id="negative_abs_warning_value_${idx}" value="${data.negative_abs_warning_value}">
	  <input type="hidden" name="rel_critical_value" id="rel_critical_value_${idx}" value="${data.rel_critical_value}">
	  <input type="hidden" name="rel_warning_value" id="rel_warning_value_${idx}" value="${data.rel_warning_value}">
    ${data.point_code}
  </td>
  <c:if test="${dataInfoView == null }" >
  	<td align="center" style="border:1px solid #D9E8FB;">${data.partName}</td>
  </c:if>
  <td align="center" style="border:1px solid #D9E8FB;">
		 <c:if test="${dataInfoView != null }" >
		  	${data.curr_value}
		</c:if>
		<c:if test="${dataInfoView == null }" >
	  		<input type="text" class="lineinput" onchange="validateValue(this)" name="curr_value" id="curr_value_${idx}" value="${data.curr_value}" style="ime:disabled;width:100%">
	  	</c:if>
   </td>
  <td align="center" style="border:1px solid #D9E8FB;">
  		 <c:if test="${dataInfoView != null }" >
		  	${data.curr_change}
		</c:if>
		<c:if test="${dataInfoView == null }" >
	  		<input type="text" class="lineinput" onchange="validateValue(this)" name="curr_change" id="curr_change_${idx}" value="${data.curr_change}" style="ime:disabled;width:100%">
	  	</c:if>
  </td>
  <td align="center" style="border:1px solid #D9E8FB;">
  		 <c:if test="${dataInfoView != null }" >
		  	${data.total_change}
		</c:if>
		<c:if test="${dataInfoView == null }" >
	  		<input type="text" class="lineinput" name="total_change" id="total_change_${idx}" value="${data.total_change}" style="ime:disabled;width:100%" onchange="valueChanged(${idx})">
	  	</c:if>
  </td>
  <td align="center" style="border:1px solid #D9E8FB;">
	  <c:if test="${dataInfoView != null }" >
		  	${data.change_rate}
		</c:if>
		<c:if test="${dataInfoView == null }" >
	  		<input type="text" class="lineinput" onchange="validateValue(this)" name="change_rate" id="change_rate_${idx}" value="${data.change_rate}" style="ime:disabled;width:100%">
	  	</c:if>
  </td>
  <td align="center" style="border:1px solid #D9E8FB;"><div id="v_warn_state_${idx}" class="state${data.warn_state}"></div></td>
  <td align="center" style="border:1px solid #D9E8FB;">
  		<input type="text" class="lineinput" readonly="readonly" name="warn_memo" id="warn_memo_${idx}" value="${data.warn_memo}" style="width:100%">
  </td>
<c:if test="${mode!='create'}">
  <td align="center" style="border:1px solid #D9E8FB;">
  <c:if test="${viewTotal == null}">
  <input type="button" value="时序曲线" class="button1" onclick="showPointTimes(${data.point_id})">
</c:if>
<c:if test="${viewTotal != null}">
  <input type="button" value="时序曲线" class="button1" onclick="showComparePointTimes(${data.point_id})">
</c:if>
  </td>
</c:if>
</tr>
<c:set var="idx" value="${idx+1}"/>
</c:forEach>
  </tbody>
</table>
</div>
</td>
</tr>
</table>