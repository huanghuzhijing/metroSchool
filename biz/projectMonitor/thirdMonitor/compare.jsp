<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
<html:html>
<head>
<script type="text/javascript" src="${ctx}/scripts/json2.js"></script>
<script type="text/javascript" src="${ctx}/scripts/enterKey.js" ></script>
<script type="text/javascript" src="${ctx}/scripts/queryLines.js"></script>
<script type="text/javascript">
		$(document).ready(function(){
			
			//获取线路标段工点
		    getLines('${param.qlineId}','${param.qsectionId}');
		    getSections('${param.qlineId}','${param.qsectionId}');
		    getWokPoints('${param.qsectionId}','${param.qworkPointId}');
		     getTypes('${param.qworkPointId}','${param.type_id}');
			//控制按钮
			
			
		});
		
		
		
	</script>
</head>
<content tag="heading">测点对应关系查询</content>
<body >
	<table class="queryTable" >
		<tr>
			<td class="queryTitle">
				<span >查询条件</span>
			</td>
		</tr>
		<tr>
			<td>
				<html:form action="dtaqCheckpointAction.do?method=compare&organ_type=C">
					<table align="left">
						<tr>
								<td>线路：</td>
							    <td >
							    	<select id="qlineId" name="qlineId" onchange="getSections(this.value,'')"></select> &nbsp &nbsp
							    </td>
							   
							     <td>标段：</td>
							    <td><select id="qsectionId" name="qsectionId" onchange="getWokPoints(this.value,'')"></select> &nbsp  &nbsp
							    </td>
					 	
							    <td>车站/区间：</td>
							    <td><select id="qworkPointId" name="qworkPointId" onchange="getTypes(this.value,'')"></select> &nbsp  &nbsp
							    </td>
						 	
								   <td>类型：</td>
							    <td><select id="type_id" name="type_id"></select>
							    </td>
								<td align="right">
									<input type="submit" value="查询" icon="icon_query" />
								</td>
						</tr>
					</table>
				</html:form>
			</td>
		</tr>
	</table>
<fieldset>
  <legend><strong>测点对比信息</strong></legend>
  <table class="listTable" width="100%" align="center" border="0" cellpadding="0" cellspacing="1">
	
		<tr align="center" height="23">
			<th colspan="4" align="center">第三方</th>
  			<th colspan="4"align="center">施工方</th>
		</tr>
		<tr align="center" height="23">
			  <th align="center">监测部位</th>
			  <th align="center">测点编码</th>
			  <th align="center">测量仪器</th>
			  <th align="center">监测频率</th>
			  <th align="center">监测部位</th>
			  <th align="center">测点编码</th>
			  <th align="center">测量仪器</th>
			  <th align="center">监测频率</th>
		</tr>

		<c:forEach items="${vos}" var="vo">
			<tr  align="center" height="20">
			  <td>${vo.part1}</td>
			  <td>${vo.code1}</td>
			  <td>${vo.machine1}</td>
			  <td>${vo.frequnce1}</td>
			  <td>${vo.part2}</td>
			  <td>${vo.code2}</td>
			  <td>${vo.machine2}</td>
			  <td>${vo.frequnce2}</td>
			</tr>
		</c:forEach>
  </table>
</fieldset>


</body>

</html:html>
