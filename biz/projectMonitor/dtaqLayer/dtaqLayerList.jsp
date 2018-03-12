<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
<html:html>
<head>
<%@ include file="/commons/meta.jsp"%>
<style type="text/css">
	.titleDiv{ color:#50A2E6;font-size:13px;font-weight: bold ;padding-left:10px; }
	.defbtn{ display:none ; }
	.editTd{ text-align:center ; padding-left:10px; }
	.defTd{ text-align:center ; }
</style>
<script src="<c:url value="/scripts/public.js"/>" type="text/javascript"></script>
<script type="text/javascript">
	var aids = new Array() ;
	var dids = new Array() ;
	function saveInfo(){
		jQuery(".listTable tbody tr").each(function(){
			var checkbox = jQuery(this).find("[name='layer_id']") ;
			
			if(checkbox.attr("checked") && checkbox.val() == ""){
				aids.push(checkbox.attr("data_id")) ;
			}
			if(checkbox.attr("checked") == "" && checkbox.val() != ""){
				dids.push(checkbox.val()) ;
			}
		}) ;
		$.ajax({
			   type: "POST",
			   url: "${ctx}/dtaqLayerAction.do?method=ajaxSave",
			   data: "station_id=${station.station_id}&aids="+aids.join(",")+"&dids="+dids.join(","),
			   
			   success: function(msg){
			     	if(msg == "yes"){
			     		alert("保存成功！") ;
			     		parent.art.dialog({id:'commonDialog1'}).close() ;
			     	}else{
			     		alert("保存失败！") ;
			     	}
			   }
		});
	}
</script>
</head>
<body>
	<fieldset>
<!--		<legend>-->
<!--			<strong>分层<fmt:message key="dtaq.common.list_field" />-->
<!--			</strong>-->
<!--		</legend>-->
		<table class="commonTable" width="100%" border="0" cellspacing="0"
			cellpadding="0">
			<tr>
				<td>
					<div class="promptDiv">
					工点信息：<span class="keyInfoSpan">${station.segment_id.line_id.line_name} - ${station.segment_id.segment_name } - ${station.station_name}</span>
					</div>
<!--					<div class="titleDiv">${station.segment_id.segment_name } &nbsp; ${station.station_name}</div>-->
				</td>
			</tr>
		</table>
		
		<table class="listTable" id="tableObj" width="100%" align="center" border="1" cellpadding="1" cellspacing="0">
		<thead align="center">
				<tr>
					<c:if test="${param.mode == null}">
					<th>选择</th>
					</c:if>
					<th>层次名称</th>
					<th>层厚</th>
				</tr>
		</thead>
			<tbody>
				<c:forEach items="${dtaqLayerVos}" var="dtaqLayerVo">
					<tr align="center">
						<c:if test="${param.mode == null}"><td><input type="checkbox" name="layer_id" <c:if test="${dtaqLayerVo.layer_id != null}">checked="checked"</c:if> data_id="${dtaqLayerVo.data_id}" value="${dtaqLayerVo.layer_id}"  /></td>
						</c:if>
						<td>${dtaqLayerVo.short_name}</td>
						<td>${dtaqLayerVo.description}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<c:if test="${param.mode == null}">
		<div align="center"><input type="button" value="保存" icon="icon_save" onclick="saveInfo()"/></div>
		</c:if>
	</fieldset>
</body>
</html:html>