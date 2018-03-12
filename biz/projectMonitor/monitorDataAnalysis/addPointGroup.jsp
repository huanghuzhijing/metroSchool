<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>
<ex:bundle/>
<html:html>
<head>
	<%@ include file="/commons/meta.jsp"%>
<script type="text/javascript">
function windowClose(){
	parent.art.dialog({id:"commonDialog1"}).close();
}

function save() {
  if(jQuery("[name='group_name']").val()=="") {
    alert("请输入测点组名称");
    return;
  }else{
		$.ajax({
			type: "POST",
			url: "${ctx}/checkpointPictureAction.do?method=savePointGroup",
			data: "type_ids="+jQuery("[name='type_ids']").val()+"&point_ids="+jQuery("[name='point_ids']").val()+"&station_id="+jQuery("[name='station_id']").val()+"&group_name="+jQuery("[name='group_name']").val()+"&memo="+jQuery("[name='memo']").val(),
			success: function(msg){
				responseGroupList(msg);
			}
		});
  
  //	var url = "${ctx}/checkpointPictureAction.do?method=savePointGroup";
	//var myajax = new Ajax.Request(url, {method:"post", parameters:"type_ids="+jQuery("[name='type_ids']").val()+"&point_ids="+jQuery("[name='point_ids']").val()+"&station_id="+jQuery("[name='station_id']").val()+"&group_name="+jQuery("[name='group_name']").val()+"&memo="+jQuery("[name='memo']").val(), onComplete:responseGroupList});
  }
}

function responseGroupList(selResponse){
	if(selResponse == "yes"){
		alert("保存测点组成功");
		parent.stationGroupChanage('${station_id}');
		windowClose();
	}else{
		alert("保存测点组失败");
	}
}
</script>
</head>

<body>
<fieldset>
<legend>选择测点信息</legend>  
 <table width="100%" border="0" cellspacing="0" cellpadding="0">
	   <tr><td>
	   	<table class="listTable" id="fileTable" >
	   		<thead>
			<tr align="center" height="25" id="trSite">
			  <th width="10%">测点编码</th>
			  <th width="10%">监测部位</th>
			  <th width="10%">初始值</th>
			  <th width="10%">绝对临界值</th>
			  <th width="10%">绝对警戒值</th>
			  <th width="15%">负绝对临界值</th>
			  <th width="15%">负绝对警戒值</th>
			  <th width="10%">相对临界值</th>
			  <th width="10%">相对警戒值</th>
			</tr>
			</thead>
			<c:forEach items="${points}" var="point">
				<tr align="center" height="20" bgcolor="#C6DFF7">
					<td>${point.point_code}</td>
					<td>${point.partId.part_name}</td>
					<td>${point.init_value}</td>
					<td>${point.abs_critical_value}</td>
					<td>${point.abs_warning_value}</td>
					<td>${point.negative_abs_critical_value}</td>
					<td>${point.negative_abs_warning_value}</td>
					<td>${point.rel_critical_value}</td>
					<td>${point.rel_warning_value}</td>
				</tr>
			</c:forEach>
		</table>
		</td>
	</tr>
	</table>
	</fieldset>
	<fieldset>
<legend>测点组信息</legend>  
			<html:form action="checkpointPictureAction.do">
				<html:hidden property="method" value="savePointGroup"/>
				<html:hidden property="line_id" value="${line_id}"/>
				<html:hidden property="segment_id" value="${segment_id}"/>
				<html:hidden property="type_id" value="${type_id}"/>
				<html:hidden property="part_id" value="${part_id}"/>
				<html:hidden property="point_id" value="${point_id}"/>
				<html:hidden property="organ_type" value="${organ_type}"/>
				
				<html:hidden property="station_id" value="${station_id}"/>
				<html:hidden property="type_ids" value="${type_ids}"/>
				<html:hidden property="point_ids" value="${point_ids}"/>
				 <table class="formTable"  width="98%" >
				    <COLGROUP>
						<COL class="tr03" align="right" width="20%">
						<COL class="tr02" width="30%">
						<COL class="tr03" align="right" width="20%">
						<COL class="tr02" width="30%">
					</COLGROUP>
					
					<tr>
						<td>创建人：</td>
						<td><ex:employeeName id="${userName}" /></td>
						<td>创建日期：</td>
						<td>${currentDate}</td>
					</tr>
					<tr>
						<td>测点组名称：<span class="redSpan">*</span></td>
						<td>
							<html:text property="group_name" styleClass="text" size="40"/>
						</td>
					</tr>
					<tr>
						<td>备注：</td>
						<td colspan="3">
						 <html:textarea property="memo" />
						</td>
					</tr>
					<tr>
           				<td align="center" colspan="4">
           				 <input type="button" class="button1" value="保存" onclick="save()" icon="icon_save">&nbsp;&nbsp;
<!--							<html:button value="保存" property="btnSave" styleClass="saveButton"  onclick="save()" />-->
							<input value="返回" type="button" class="backButton" onclick="windowClose()" icon="icon_back">
						</td>
					</tr>
				</table>
			</html:form>
		</td>
	</tr>
  </table>			
</fieldset>
</body>
</html:html>
