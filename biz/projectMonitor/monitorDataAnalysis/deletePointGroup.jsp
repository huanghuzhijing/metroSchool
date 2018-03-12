<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>
<ex:bundle/>
<html:html>
<head>
<%@ include file="/commons/meta.jsp"%>
<script type="text/javascript">
function initCont() {
	jQuery.each(jQuery(".memo"),function(index,item){
		var obj = jQuery(item);
		obj.attr("title",obj.html());
		if(obj.html().lengthCheck()>20){
			obj.html(substr(obj.html(),20)+'...');
		}
	});
}

function windowClose(){
	parent.art.dialog({id:"commonDialog1"}).close();
}

function deleteGroup(){
	var checkGroups = jQuery("[name='groupCheck']");
	var group_ids = "";
	
	checkGroups.each(function(){
		if(jQuery(this).attr("checked")){
			group_ids += "," + jQuery(this).val();
		}
	}) ;
	if(group_ids != ""){
		jQuery("[name='group_ids']").val(group_ids.substring(1)) ;
		
		$.ajax({
			type: "POST",
			url: "${ctx}/checkpointPictureAction.do?method=deleteGroup",
			data: "group_ids="+jQuery("[name='group_ids']").val(),
			success: function(msg){
				responseGroupList(msg);
			}
		});
		
		//var url = "${ctx}/checkpointPictureAction.do?method=deleteGroup";
		//var myajax = new Ajax.Request(url, {method:"post", parameters:"group_ids="+jQuery("[name='group_ids']").val(), onComplete:responseGroupList});
	}else{
		alert("没有选择任何测点组信息，删除无效！");
	}
}

function responseGroupList(selResponse){
	if(selResponse == "yes"){
		alert("删除测点组成功");
		parent.stationGroupChanage('${station_id}');
		windowClose();
	}else{
		alert("删除测点组失败");
	}
}
</script>
</head>

<body>
<fieldset>
  <legend>测点组信息</legend>
 <table width="100%" border="0" cellspacing="0" cellpadding="0">
	 <tr><td>
	   <div align="right">
	  	 <input type="button" class="button1" value="${texts['button.delete']}" onclick="deleteGroup()" icon="icon_delete">&nbsp;&nbsp;
	  	 <input type="button" class="button1" value="${texts['button.back']}" onclick="windowClose()" icon="icon_back">
	   </div>
	   </td></tr>
	   <tr><td>
	   <html:form action="checkpointPictureAction.do">
		   <html:hidden property="method" value="deleteGroup"/>
		   <html:hidden property="group_ids"/>
		   <html:hidden property="line_id" value="${line_id}"/>
			<html:hidden property="segment_id" value="${segment_id}"/>
			<html:hidden property="type_id" value="${type_id}"/>
			<html:hidden property="part_id" value="${part_id}"/>
			<html:hidden property="point_id" value="${point_id}"/>
			<html:hidden property="organ_type" value="${organ_type}"/>
			<html:hidden property="station_id" value="${station_id}"/>
	   	<table id="fileTable" class="listTable" >
	   		<thead>
			<tr align="center"  height="25" id="trSite" >
			  <th width="15%">组名称</th>
			  <th width="15%">所属工点</th>
			  <th width="15%">创建人</th>
			  <th width="15%">创建部门</th>
			  <th width="15%">创建日期</th>
			  <th width="19%">备注</th>
			  <th width="6%">选择</th>
			</tr>
			<c:forEach items="${pointGroups}" var="group">
				<tr align="center" height="20" >
					<td>${group.group_name}</td>
					<td>
						${group.station_id.station_name}
					</td>
					<td><ex:employeeName id="${group.creater}" /></td>
					<td>${group.create_dept}</td>
					<td><fmt:formatDate value="${group.create_date}" pattern="yyyy-MM-dd"/></td>
					<td class="memo">${group.memo}</td>
					<td><html:checkbox property="groupCheck" value="${group.group_id}" /></td>
				</tr>
			</c:forEach>
		</table>
		</html:form>
		</td>
	</tr>
  </table>			
</fieldset>
</body>
</html:html>
