<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
<html:html>
<head>
<script type="text/javascript" src="${ctx}/scripts/json2.js"></script>
<script type="text/javascript" src="${ctx}/scripts/queryLines.js"></script>
<script type="text/javascript" src="${ctx}/scripts/commons.js"></script>
<link rel="StyleSheet" href="${ctx}/scripts/warnColor.css" type="text/css" />
<script type="text/javascript">
		jQuery(document).ready(function(){
			  getLines('${param.qlineId}','${param.qsectionId}');
			  getSections('${param.qlineId}','${param.qsectionId}');
			  getWokPoints('${param.qsectionId}','${param.qworkPointId}');
			  getTypes('${param.qworkPointId}','${param.type_id}');
			  
		});
		
		function query(){
			if(jQuery("[name='qlineId']").val().length==0) {
			    alert("请先选择线路");
			    return;
			  }
			  if(jQuery("[name='qsectionId']").val().length==0) {
			    alert("请先选择标段");
			    return;
			  }
			  if(jQuery("[name='qworkPointId']").val().length==0) {
			    alert("请先选择车站区间");
			    return;
			  }
			  if(jQuery("[name='type_id']").val().length==0) {
			    alert("请先选择监测类型");
			    return;
			  }
			 submitForm("dtaqDataInfoQueryForm",null,false);
		}
		
		//一般曲线（非测斜）
		function showComparePointTimes(point_id,info_id) {
				$.ajax({
					type: "POST",
					url: "${ctx}/dtaqDataInfoQueryAction.do?method=queryTimeKind",
					data: "info_id="+info_id,
					success: function(msg){
						if(msg != ""){
							var textStr = msg.split("@");
							var type_kind=textStr[0];
							var beginMonDate=textStr[1];
							var endDatePic=textStr[2];
							var sheight = screen.height;
							var swidth = screen.width;
							var url ="${ctx}/dtaqDataInfoQuery3Action.do?andomCode=abcdefghijklmnopqrstuvwxyz1234567890abcdefghijklmnopqrstuvwxyz1234567890abcdefghijklmnopqrstuvwxyz1234567890abcdefghijklmnopqrstuvwxyz1234567890abcdefghijklmnopqrstuvwxyz1234567890&method=showComparePointTimes&point_id="+point_id+"&type_kind="+type_kind+"&qstartDate="+beginMonDate+"&qendDate="+endDatePic+"&from=data";
							window.open(url,'','height='+sheight+',width='+swidth+',top=0,left=0,toolbar=no,menubar=no,scrollbars=yes, resizable=no,location=no, status=no,titlebar=no')
						}
						
					}
				});
				
		}
		//一般曲线（测斜）
		function showComparePointTimes3(point_id,info_id) {
				$.ajax({
					type: "POST",
					url: "${ctx}/dtaqDataInfoQueryAction.do?method=queryTimeKind3",
					data: "info_id="+info_id,
					success: function(msg){
						textStr = msg.split("@");
						var type_kind=textStr[0];
						var beginWeekDate=textStr[1];
						var endDatePic=textStr[2];
					
						var sheight = screen.height;
						var swidth = screen.width;
						var url ="${ctx}/dtaqDataInfoQuery3Action.do?andomCode=abcdefghijklmnopqrstuvwxyz1234567890abcdefghijklmnopqrstuvwxyz1234567890abcdefghijklmnopqrstuvwxyz1234567890abcdefghijklmnopqrstuvwxyz1234567890abcdefghijklmnopqrstuvwxyz1234567890&method=showComparePointTimes3&point_id="+point_id+"&type_kind="+type_kind+"&qstartDate="+beginWeekDate+"&qendDate="+endDatePic+"&from=data";
						window.open(url,'','height='+sheight+',width='+swidth+',top=0,left=0,toolbar=no,menubar=no,scrollbars=yes, resizable=no,location=no, status=no,titlebar=no')
					}
				});
		}
		
	</script>
</head>
<content tag="heading">
监测数据统计分析
</content>

<body >
	<table class="queryTable" >
		<tr>
			<td class="queryTitle">
				<span >查询条件</span>
			</td>
		</tr>
		<tr>
			<td>
				<html:form styleId="dtaqDataInfoQueryForm" action="dtaqDataInfoQueryAction.do?method=list&ec_p=${param.ec_p}&ec_id=${param.id}&ec_crd=${param.ec_crd}">
					<table align="left">
						<tr>
								<td>线路：</td>
							    <td >
							    	<select id="qlineId" name="qlineId" onchange="getSections(this.value,'')"></select> &nbsp &nbsp
							    </td>
							   
							     <td>标段：</td>
							    <td><select id="qsectionId" name="qsectionId" onchange="getWokPoints(this.value,'')"></select> &nbsp  &nbsp
							    </td>
					 	</tr>
					 	<tr>
							     <td>车站/区间：</td>
							    <td><select id="qworkPointId" name="qworkPointId" onchange="getTypes(this.value,'')"></select> &nbsp  &nbsp
							    </td>
						 	
								<td>监测类型：</td>
							    <td><select id="type_id" name="type_id"></select>
							    </td>
						</tr>
						<tr>
							<td>第三方/施工方：</td>
							<td>
								<html:select property="qorganType">
									<html:option value="T">第三方</html:option>
									<html:option value="O">施工方</html:option>
								</html:select>
							</td>
							<td>测点编码：</td>
							<td>
								<input type="text" name="qpointCode"  class="inputText" />
							</td>
						
						
						</tr>
						<tr>
						 		<td>填报时间：</td>
								<td>
									<input type="text"  name="qstartDate"  class="inputText" value="${qstartDate}"  onfocus="WdatePicker()" />--<input type="text"  name="qendDate"  class="inputText" value="${qendDate}" onfocus="WdatePicker()" />
								</td>
								
								<td align="right">
									<input type="button" value="查询" icon="icon_query" onclick="query()"/>
								</td>
								</tr>
					</table>
				</html:form>
			</td>
		</tr>
	</table>
	
		<c:if test="${type.type_kind==1}">
			<%@include file="typeList1.jsp"%>
		</c:if>
		<c:if test="${type.type_kind==2}">
			<%@include file="typeList2.jsp"%>
		</c:if>
		<c:if test="${type.type_kind==3}">
			<%@include file="typeList3.jsp"%>
		</c:if>
		<c:if test="${type.type_kind==4}">
			<%@include file="typeList4.jsp"%>
		</c:if>
		<c:if test="${type.type_kind==5}">
			<%@include file="typeList5.jsp"%>
		</c:if>
</body>
</html:html>