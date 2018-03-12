<%@ page contentType="text/html;charset=UTF-8"  %>
<%@ include file="/commons/taglibs.jsp" %>
<%@ include file="/commons/meta.jsp" %>

<ex:bundle/>
<html:html>
<head>
<link rel="StyleSheet" href="${ctx}/scripts/warnColor.css" type="text/css" />
<style type="text/css">
	.dataTitle{font-weight:bold;display:block;float:left;color:orange}
	.stateDiv{width: 40px;display:block;float:left;height:15px;}
	.stateMemo{float:left;display:block;margin-right:5px;}
	
</style>
<script src="<c:url value="/scripts/public.js"/>" type="text/javascript"></script>
<script type="text/javascript" src="${ctx}/scripts/dtree/dtree.js"></script>
<script type="text/javascript">
//期上加上天数月数年数周数的运算
//(参数一：输入的时间类型("d"要加的天数、"w"要加的周数,"m"要加的月数,"y"要加的年数))
//(参数二：输入的时间值)
//原有的日期值（类型：YYYY-MM-DD）
function DateAdd(strInterval, NumDay, dtDate) {
	var dtTmp = new Date(dtDate);
	if (isNaN(dtTmp)) {
		dtTmp = new Date();
	}
	switch (strInterval) {
	  case "s":
		dtTmp = new Date(Date.parse(dtTmp) + (1000 * parseInt(NumDay)));
		break;
	  case "n":
		dtTmp = new Date(Date.parse(dtTmp) + (60000 * parseInt(NumDay)));
		break;
	  case "h":
		dtTmp = new Date(Date.parse(dtTmp) + (3600000 * parseInt(NumDay)));
		break;
	  case "d":
		dtTmp = new Date(Date.parse(dtTmp) + (86400000 * parseInt(NumDay)));
		break;
	  case "w":
		dtTmp = new Date(Date.parse(dtTmp) + ((86400000 * 7) * parseInt(NumDay)));
		break;
	  case "m":
		dtTmp = new Date(dtTmp.getFullYear(), (dtTmp.getMonth()) + parseInt(NumDay), dtTmp.getDate(), dtTmp.getHours(), dtTmp.getMinutes(), dtTmp.getSeconds());
		break;
	  case "y":
		   //alert(dtTmp.getFullYear());
		dtTmp = new Date(dtTmp.getFullYear() + parseInt(NumDay), dtTmp.getMonth(), dtTmp.getDate(), dtTmp.getHours(), dtTmp.getMinutes(), dtTmp.getSeconds());
		   //alert(dtTmp);
		break;
	}
	var mStr = new String(dtTmp.getMonth() + 1);
	var dStr = new String(dtTmp.getDate());
	if (mStr.length == 1) {
		mStr = "0" + mStr;
	}
	if (dStr.length == 1) {
		dStr = "0" + dStr;
	}
	return dtTmp.getFullYear() + "-" + mStr + "-" + dStr;
}

function init(){
	var writeDate = document.getElementsByName("writeDateHid");
	var checkFrequency = document.getElementsByName("checkFrequencyHid");
	var ageDivs = document.getElementsByName("write_status");
	var current_date = "${current_date}";
	var write_date = "";
	for(var i=0; i<writeDate.length; i++){
		if(writeDate[i].value != "" && checkFrequency[i].value != "" && !isNaN(checkFrequency[i].value)){
			write_date = writeDate[i].value;
			write_date = write_date.replace("-","/").replace("-","/");
	    	var cluatDate = DateAdd("d",parseInt(checkFrequency[i].value),write_date);
	    	if(cluatDate >=  current_date){
	    		ageDivs[i].className="dataState1";
	    	}else{
	    		ageDivs[i].className="dataState0";
	    	}
		}
	}
}


function windowClose(){
	if(parent.sSuc){
		parent.sSuc("b1");
	}
}
</script>
</head>
<body onload="init()">
<table  class="listTable" border="0" cellpadding="0" cellspacing="0" height="100%" width="100%">
<tr>
	<td align="right" style="vertical-align: top; width: 20%;"><%@include file="reportPointStatusTree.jsp" %></td>
	<td valign="top">
		<c:if test="${pointTypeTitle == null}">
			<div align="center"><font color="#EA6822" size="2"><strong>提示：请您先点击右边树型结构的监测类型！</strong></font></div>
		</c:if>
 	<fieldset>
		<legend><fmt:message key="dtaq.common.list_field"/></legend>
		 <table class="listTable" style="width:100%;">
		 	<tr>
		 		<td align="left">
		 			<c:if test="${pointTypeTitle != null}">
		 				<font color="orange"><strong> 监测类型：${pointTypeTitle.type_name}</strong></font>
		 			</c:if>
		 		</td>
			 	<td>
			 		<div style="float:right;">
						<span class="dataTitle" >监测数据填报情况：</span>
						<span class="dataState1 stateDiv" ></span><span class="stateMemo">&nbsp;及时&nbsp;&nbsp; </span>
						<span class="dataState0 stateDiv"></span><span class="stateMemo" >&nbsp;不及时&nbsp;&nbsp; </span>
					</div>
				</td>
			</tr>
		<c:if test="${type_kind == '1' || type_kind == '2'}">
		<ec:table items="dtaqCheckpoints" var="point" action="dtaqCheckpointAction.do?method=viewDataReport"
	title="" width="100%"  sortable="false" rowsDisplayed="10"
	imagePath="${ctx}/styles/extremecomponents/images/*.gif" locale="zh_CN" 
	retrieveRowsCallback="limit" filterRowsCallback="limit" sortRowsCallback="limit">
  	<ec:row highlightRow="true"  >
				<ec:column property="point_code" title="测点编码" width="80px" />
				<ec:column property="point.partId" sortable="false" title="检测部位" width="100px">${point.partId.part_name}</ec:column>
				<ec:column property="curr_value" title="${pointTypeTitle.current_value_title}" width="80px" />
				<ec:column property="curr_change" title="${pointTypeTitle.current_change_title}" width="80px" />
				<ec:column property="change_rate" title="${pointTypeTitle.change_rate_title}" width="80px" />
				<ec:column property="total_change" title="${pointTypeTitle.total_change_title}" width="80px" />
				<ec:column property="check_frequency" title="监测频率" width="80px" />
				<ec:column property="write_date" title="最近填报日期" width="100px">
					<div><fmt:formatDate pattern="yyyy-MM-dd HH" value="${point.write_date}" /></div>
				</ec:column>
				<ec:column property="null" sortable="false" title="填报情况" width="80px">
					<div id="write_status" style="width: 40px;display:block;float:left;height:15px;"></div>
			  		<input type="hidden" id="writeDateHid" value='<fmt:formatDate value="${point.write_date}" pattern="yyyy-MM-dd"/>'/>
				</ec:column>
				</ec:row>
				</ec:table>
		</c:if>
		
		</table>
	</fieldset>
	</td>
</tr>
</table>
</body>
</html:html>