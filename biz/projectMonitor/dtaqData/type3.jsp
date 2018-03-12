<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<script type="text/javascript">
function saveInfo() {
  var currValueEls = jQuery("[name='curr_change']");
  if(currValueEls.length > 0){
	  loadMessage("数据正在保存中，请稍候");
	  setDeletePointids();
	  submitForm("dtaqDataForm","save",false);
  }else{
  	alert("没有需要填报的内容，保存无效！");
  }
}

function setEmptyField(idx){
	jQuery("#warn_state_"+idx).val("");
    jQuery("#v_warn_state_"+idx).removeClass();
    jQuery("#total_change_"+idx).val("");
    jQuery("#v_total_change_"+idx).html("");
    jQuery("#curr_change_"+idx).val("");
    jQuery("#change_rate_"+idx).val("");
    jQuery("#v_change_rate_"+idx).html("");
    jQuery("#warn_memo_"+idx).val("");
}

function valueChanged(idx) {
  var valueEl = jQuery("#curr_value_"+idx);
  var curr_value = valueEl.val().trim();
   var hiddendata = jQuery("#hiddata_"+idx).val() ;
  var hdata = hiddendata.split("@");
   var operate_mode = jQuery("[name='operate_mode']").val();
  
  if(curr_value.length==0) {
   setEmptyField(idx);
  } else if(curr_value == " ") {
    setEmptyField(idx);
  }else if(isNaN(curr_value)){
  	setEmptyField(idx);
    alert("输入值不是合法数值。");
    valueEl.value = "";
    valueEl.focus();
  }else {
    var warn_state = 1; // 预警状态
    var abs_change_error = 0;
    var rel_change_error = 0;
    var abs_critical_value = parseFloat(hdata[8]) ;
    var abs_warning_value = parseFloat(hdata[9]) ;
    var negative_abs_critical_value = parseFloat(hdata[10]);
    var negative_abs_warning_value = parseFloat(hdata[11]);
    var rel_critical_value = parseFloat(hdata[12]);
    var rel_warning_value = parseFloat(hdata[13]);
    
    var prev_date =hdata[5].substring(0,10) ;
    var write_date = jQuery("[name='write_date']").val().substring(0,10);
    var d_curr_value = parseFloat(curr_value);
    var d_prev_total_value = parseFloat(jQuery("#prev_total_change_"+idx).val()) ;
    var d_init_value = parseFloat(hdata[4]) ;
    var days = 1;
    if(operate_mode == 'create'){
		days = DateDiff('d',parseDate(prev_date),parseDate(write_date));
    }else{
    	var point_prev_date = hdata[14].substring(0,10);
    	days = DateDiff('d',parseDate(point_prev_date),parseDate(prev_date));
    }
	if (days == 0){
		days = 1;
	}
	var change_rate = (d_curr_value/days).toFixed(2);
	var total_change = (d_curr_value + d_prev_total_value).toFixed(2);
	jQuery("#curr_change_"+idx).val("0.0");
	jQuery("#total_change_"+idx).val(total_change);
	jQuery("#v_total_change_"+idx).html(total_change);
	jQuery("#change_rate_"+idx).val(change_rate);
	jQuery("#v_change_rate_"+idx).html(change_rate);
	change_rate  = Math.abs(change_rate);
	//判断累计的绝对值状态
	if (total_change >= abs_warning_value) {
		abs_change_error = 3;
	}else if (total_change >= abs_critical_value) {
		abs_change_error = 2;
	}else if(total_change >= negative_abs_critical_value){
		abs_change_error = 1;
	}else if(total_change >= negative_abs_warning_value){
		abs_change_error = -2;
	}else if(total_change < negative_abs_warning_value){
		abs_change_error = -3;
	}
	//判断速率的相对值状态
	if(change_rate >= rel_warning_value){
		rel_change_error = 3;
	}else if(change_rate >= rel_critical_value){
		rel_change_error = 2;
	}else{
		rel_change_error = 1;
	}
	//红色报警状态
	if (abs_change_error == -3 || abs_change_error == 3) {
		warn_state = 4;
	}
	//黄色报警状态
	if ((rel_change_error == 3 && (abs_change_error == -2 || abs_change_error == 1 || abs_change_error == 2))
			||(rel_change_error == 2 && (abs_change_error == -2 || abs_change_error == 2))) {
		warn_state = 3;
	}
	//蓝色报警状态
	if((abs_change_error == 1 && rel_change_error == 2)
			||(rel_change_error == 1 && (abs_change_error == -2 || abs_change_error == 2))){
		warn_state = 2;
	}
	jQuery("#warn_state_"+idx).val(warn_state);
    jQuery("#v_warn_state_"+idx).removeClass().addClass("state"+warn_state);
	
	var memo = "无预警";
	//红色报警
	if(warn_state == 4){
		if(abs_change_error == -3){
			memo = "累计偏移量小于负绝对警戒值";
		}else if(abs_change_error == 3){
			memo = "累计偏移量大于等于正绝对警戒值";
		}
	}
	//黄色报警
	else if(warn_state == 3){
		if(rel_change_error == 3){
			if(abs_change_error == -2){
				memo = "累计偏移量大于等于负绝对警戒值小于负绝对临界值,且偏移速率大于等于相对警戒值";
			}else if(abs_change_error == 1){
				memo = "累计偏移量大于等于负绝对临界值小于正绝对临界值,且偏移速率大于等于相对警戒值";
			}else if(abs_change_error == 2){
				memo = "累计偏移量大于等于正绝对临界值小于正绝对警戒值,且偏移速率大于等于相对警戒值";
			}
		}else if(rel_change_error == 2){
			if(abs_change_error == -2){
				memo = "累计偏移量大于等于负绝对警戒值小于负绝对临界值,且偏移速率大于等于相对临界值小于相对警戒值";
			}else if(abs_change_error == 2){
				memo = "累计偏移量大于等于正绝对临界值小于正绝对警戒值,且偏移速率大于等于相对临界值小于相对警戒值";
			}
		}
	}
	//蓝色报警
	else if(warn_state == 2){
		if(rel_change_error == 2){
			if(abs_change_error == 1){
				memo =  "累计偏移量大于等于负绝对临界值小于正绝对临界值,且偏移速率大于等于相对临界值小于相对警戒值";
			}
		}
		else if(rel_change_error == 1){
			if(abs_change_error == -2){
				memo =  "累计偏移量大于等于负绝对警戒值小于负绝对临界值,且偏移速率小于相对临界值";
			}else if(abs_change_error == 2){
				memo =  "累计偏移量大于等于正绝对临界值小于正绝对警戒值,且偏移速率小于相对临界值";
			}
		}
	}
	jQuery("#warn_memo_"+idx).val(memo);
    jQuery("#tr_"+idx).attr("title", memo) ;
  }
}
</script>
<div class="tableRegion">
	<table border="0" cellpadding="0" cellspacing="0" width="100%">
		<tr>
			<td>
				<div class="grid">
					<table border="0" cellspacing="0" cellpadding="0"
						style="border-collapse: collapse;" id="contractInfoList" width="100%">
						<thead>
							<tr>
								<th width="10%">深度</th>
								<th width="20%">监测部位</th>
								<th width="10%">${dtaqTypeTitle.current_value_title}</th>
								<th width="10%">${dtaqTypeTitle.change_rate_title}</th>
								<th width="10%">${dtaqTypeTitle.total_change_title}</th>
								<th width="10%">预警状态</th>
								<c:if test="${operate_mode == 'edit'}">
									<th width="10%">图形操作</th>
								</c:if>
							</tr>
						</thead>
						<tbody>
							<c:set var="idx" value="0" />
							<c:forEach items="${points}" var="point">
								<tr id="tr_${idx}">
									<td align="center">${point.point_code}
										<input type="hidden" name="point_id" id="point_id_${idx}" value="${point.point_id}">
										<input type="hidden" name="import_value" id="import_value_${idx}" value="${point.import_value}">
										<input type="hidden" name="load_curr_value" id="load_curr_value_${idx}" value="${point.curr_value}">
										<input type="hidden" name="curr_change" id="curr_change_${idx}" value="">
										<input type="hidden" name="change_rate" id="change_rate_${idx}" value="${point.change_rate}">
										<input type="hidden" name="total_change" id="total_change_${idx}" value="${point.total_change}">
										<input type="hidden" name="prev_total_change" id="prev_total_change_${idx}" value="${point.total_change}">
										<input type="hidden" name="warn_state" id="warn_state_${idx}" value="${point.warn_state}">
										<input type="hidden" name="warn_memo" id="warn_memo_${idx}" value="${point.warn_memo}">
										<input type="hidden" name="hiddata" id="hiddata_${idx}" value="${point.point_id}@${point.point_code}@${point.partId.part_id}@${point.init_date}@${point.init_value}@${point.write_date}@${point.total_change}@${point.curr_value}@${point.abs_critical_value}@${point.abs_warning_value}@${point.negative_abs_critical_value}@${point.negative_abs_warning_value}@${point.rel_critical_value}@${point.rel_warning_value}@${point.prev_date}@${point.t_pre_curr_value}">
									</td>
									<td align="center">${point.partId.part_name}</td>
									<td align="center"><input type="text" name="curr_value" class="lineinput" id="curr_value_${idx}" value="" style="ime: disabled; width: 100%" onchange="valueChanged(${idx})"></td>
									<td align="center" id="v_change_rate_${idx}"></td>
									<td align="center" id="v_total_change_${idx}"></td>
									<td align="center" ><div id="v_warn_state_${idx}"></div></td>
									<c:if test="${operate_mode == 'edit'}">
										<td align="center"><input type="button"value="时序曲线" class="button1"onclick="showPartTimes(${info.type_id.type_kind},${point.partId.part_id})">
										</td>
									</c:if>
								</tr>
								<c:set var="idx" value="${idx+1}" />
							</c:forEach>
						</tbody>
					</table>
				</div>
			</td>
		</tr>
	</table>