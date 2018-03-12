<%@ page contentType="text/html;charset=UTF-8"%>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
<meta http-equiv="Cache-Control" content="no-store"/>
<meta http-equiv="Pragma" content="no-cache"/>
<meta http-equiv="Expires" content="0"/>
<%--<meta http-equiv="x-ua-compatible" content="ie=7" />--%>
<!--css -->
<%--<link href="<c:url value="/styles/main.css"/>" type="text/css" rel="stylesheet">--%>
<link href="<c:url value="/styles/default.css"/>" type="text/css" rel="stylesheet">
<link href="<c:url value="/styles/blue.css"/>" type="text/css" rel="stylesheet">
<link type="text/css" href="${ctx}/scripts/artDialog2.1.1/skin/default.css" rel="stylesheet"  />
<!--js -->
<script src="<c:url value="/scripts/jquery-1.2.6.js"/>" type="text/javascript"></script>
<script type="text/javascript" src="${ctx}/scripts/artDialog2.1.1/artDialog.js"></script>
<script language="javascript" type="text/javascript" src="${ctx}/scripts/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="${ctx}/scripts/public.js"></script>	
<script type="text/javascript" src="${ctx}/scripts/checkform.js"></script>	


<script type="text/javascript" src="${ctx}/scripts/queryCheckpoints.js"></script>

<script type="text/javascript">
		$(document).ready(function(){
			
			alert('${param.part_id}');
			//获取线路标段工点
		    getTypes('${param.type_id}','${param.part_id}');
		    getParts('${param.type_id}','${param.part_id}','${param.station_id }');
			 getCodes('${param.part_id}','');
		});
		function segmentChanged(){
		alert($("select[name='qlineId']").val());
		alert($("select[name='qsectionId']").val());
		alert($("select[name='qworkPointId']").val());
		}
	
		//刷新
		
	</script>



	<table class="queryTable" >
		<tr>
			<td class="queryTitle">
				<span >查询条件</span>
			</td>
		</tr>
		<tr>
			<td>
					<table align="left">
						<tr>
								<td>对应施工方测点类型：</td>
							    <td>
							    	<select id="qlineId" name="qlineId" onchange="getParts(this.value,'','${param.station_id }')" ></select>
							    </td>
							    <td>对应施工方测点部位：</td>
							    <td>
							    	<select id="qsectionId" name="qsectionId" onchange="getCodes(this.value,'')" ></select>
							    </td>
							     <td>对应施工方测点编码：</td>
							    <td><select id="qworkPointId" name="qworkPointId" onchange="segmentChanged()"></select>
							    </td>
					 	</tr>
					 	
		
					</table>
			</td>
			
		</tr>
		
	</table>
				 
				 


