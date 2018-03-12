<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
<html:html>
<head>
	<%@ include file="/commons/meta.jsp"%>
	<script type="text/javascript" src="${ctx}/scripts/enterKey.js" ></script>
	<script type="text/javascript" src="${ctx}/scripts/publicFunction.js"></script>
	<style type="text/css">
		.personTable{width:98% ;background-color:#dddde0 ;margin:5px;border:none ;}
		.tmpRow{background-color: #F8F5F4;}
		.personTable span{color:#4C78A6;margin-left:5px;}
		.titleRow{background-color:#e1f0f8;color:#43484a;}
		.imgDiv{border:2px solid #60aeda;background-color:#dddde0;padding:5px;}
		.sendDiv{display:none;position:absolute;width:300px; height:200px;border:1px solid #ccc;background-color:#dcf5fc;padding:5px;margin-left:50px;}
	</style>
	<script type="text/javascript">
	jQuery(document).ready(function(){
		$("#btn_back").click(function(){
		    document.forms[0].action='dtaqStationAction.do?method=list&ec_p=${param.ec_p}&ec_id=${param.station_id}&ec_crd=${param.ec_crd}&qsegmentId=${param.qsegmentId}';
			document.forms[0].submit();
		}) ;
		
		var bulid = "${ctx}/dtaqStationAction.do?method=download&station_id=${dtaqStation.station_id}&download_type=build_plane" ;
		initShowDiv("build","imgDiv01",bulid,400,300,"imgDiv","img") ;
		var third = "${ctx}/dtaqStationAction.do?method=download&station_id=${dtaqStation.station_id}&download_type=third_plane" ;
		initShowDiv("third","imgDiv02",third,400,300,"imgDiv","iframe") ;
	})
	function pop(id){ 
		jQuery("#"+id).toggle();
	}
</script>
</head>
<body>
<html:form enctype="multipart/form-data" action="dtaqStationAction.do" method="POST">
		<!--查询定位 开始-->
		<html:hidden property="ec_crd" />
		<html:hidden property="ec_id" value="${param.station_id}"/>
		<html:hidden property="ec_p" />
		<html:hidden property="station_id" />
		<!--查询定位 结束-->
</html:form>
<fieldset>
	<legend>车站/区间信息-详细</legend>
				<table class="titleTable">
					<COLGROUP>
						<COL class="tdLeftTwo" />
						<COL class="tdRightTwo" />
						<COL class="tdLeftTwo" />
						<COL class="tdRightTwo" />
					</COLGROUP>	
					<tr>
						<td>
							车站/区间名称：<span class="noRedSpan">*</span>
						</td>
						<td>
							${dtaqStation.station_name}
						</td>
					</tr>
					<tr>	
						<td>
							车站/区间类型：<span class="noRedSpan">*</span>
						</td>
						<td>
							<ex:dicDisplay dictIdentify="StationType" dictValue="${dtaqStation.station_type}"/>
						</td>
						<td>
							施工类型：<span class="noRedSpan">*</span>
						</td>
						<td>
							<ex:dicDisplay dictIdentify="SectionType" dictValue="${dtaqStation.section_type}"/>
						</td>
					</tr>
					<tr>
						<td>
							车站/区间编码：<span class="noRedSpan">*</span>
						</td>
						<td>
							${dtaqStation.station_code}<font color="#50A2E6" size="2">(示例说明:01015002,'01'表示线路流水号即一号线,'015'表示标段流水号即15标,'002'表示车站/区间流水号)</font>
						</td>
					</tr>
					<tr>	
						<td>
							工点状态：<span class="noRedSpan">*</span>
						</td>
						<td >
							<ex:dicDisplay dictIdentify="ProjectState" dictValue="${dtaqStation.station_state}"/>
						</td>
						<td>
							监控状态：<span class="noRedSpan">*</span>
						</td>
						<td >
							<ex:dicDisplay dictIdentify="MonitorStatus" dictValue="${dtaqStation.monitoring_status}"/>
						</td>
					</tr>
					<tr>
						<td>
							第三方监测单位：<span class="noRedSpan">*</span>
						</td>
						<td >
							${eorgjcName}
						</td>
						<td>
							是否巡视：<span class="noRedSpan">*</span>
						</td>
						<td >
							<ex:dicDisplay dictIdentify="YesNo" dictValue="${dtaqStation.ifPatrol}"/>
						</td>
					</tr>
					<tr>
						<td>
							监测数据修改权限：<span class="noRedSpan">*</span>
						</td>
						<td >
							<ex:dicDisplay dictIdentify="UpdateData" dictValue="${dtaqStation.update_data}"/>
						</td>
					</tr>
					<tr>
						<td>
							监测数据删除权限：<span class="noRedSpan">*</span>
						</td>
						<td >
							<ex:dicDisplay dictIdentify="UpdateData" dictValue="${dtaqStation.delete_data}"/>
						</td>
					</tr>
					<tr>
						<td>
							计划工期：<span class="noRedSpan">*</span>
						</td>
						<td>
							${dtaqStation.projectTime}
						</td>
						<td>
							造价：<span class="noRedSpan">*</span>
						</td>
						<td>
							${dtaqStation.cost}
						</td>
					</tr>
					<tr>
						<td>
							施工单位平面图：<span class="noRedSpan">*</span>
						</td>
						 <td colspan="3">
						      <c:if test="${dtaqStation.station_id ne null && dtaqStation.build_plane_address ne null}">
						      	<div  onmouseover="pop('imgDivBuild')" onmouseout="pop('imgDivBuild')" style="float:left; text-align:left;">
									<dl>
										<dt>[${dtaqStation.build_plane_name}]</dt>
								        <dd id="imgDivBuild" class="sendDiv">
								            <img src="${ctx}/dtaqStationAction.do?method=download&station_id=${dtaqStation.station_id}&download_type=build_plane" width="300" height="200" />
								        </dd>
									</dl>
								</div>	
						      </c:if>
					      </td>
					 </tr>
					<tr>
						<td>
							第三方监测平面图：<span class="noRedSpan">*</span>
						</td>
						<td colspan="3">
						      <c:if test="${dtaqStation.station_id ne null && dtaqStation.third_plane_address ne null}">
						      <div  onmouseover="pop('imgDivThird')" onmouseout="pop('imgDivThird')" style="float:left; text-align:left;">
									<dl>
										<dt>[${dtaqStation.third_plane_name}]</dt>
								        <dd id="imgDivThird" class="sendDiv">
								            <img src="${ctx}/dtaqStationAction.do?method=download&station_id=${dtaqStation.station_id}&download_type=third_plane" width="300" height="200" />
								        </dd>
									</dl>
								</div>	
						      </c:if>
					     </td>
					</tr>
					<tr>
			             <td>工程概况：<span class="noRedSpan">*</span></td>
			             <td colspan="3">${dtaqStation.moment}</td>
		            </tr>
		</table>
</fieldset>
<fieldset>
  	<legend>相关人员信息</legend>
  	<table align="center" cellpadding="1" cellspacing="1" class="tableblue personTable">
		<COLGROUP>
			<COL class="titleRow" align="right" width="20%">
			<COL class="tmpRow" width="80%">
		</COLGROUP>
  		<c:if test="${workEmps != null}">
  			<tr height="20">
  				<td align="center">施工单位</td>
  				<td>
  				<c:forEach items="${workEmps}" var="employeesg">
  					<span>${employeesg.employee_name}</span>
  				</c:forEach>
	  			</td>
  			</tr>
  		</c:if>
  		<c:if test="${jlEmps != null}">
  			<tr height="20">
  			<td align="center">监理单位</td>
  			<td>
  				<c:forEach items="${jlEmps}" var="employeesg">
  					<span>${employeesg.employee_name}</span>
  				</c:forEach>
  			</td>
  			</tr>
  		</c:if>
  		<c:if test="${jcEmps != null}">
  			<tr height="20">
  				<td align="center">监测单位</td>
  				<td>
  				<c:forEach items="${jcEmps}" var="employeesg">
  					<span>${employeesg.employee_name}</span>
  				</c:forEach>
  				</td>
  			</tr>
  		</c:if>
  		<c:if test="${manageStationEmps != null}">
  			<tr height="20">
  				<td align="center">业主代表</td>
  				<td>
  				<c:forEach items="${manageStationEmps}" var="employeesg">
  					<span>${employeesg.employee_name}</span>
  				</c:forEach>
  				</td>
  			</tr>
  		</c:if>
  		<c:if test="${teamEmps != null}">
  			<tr height="20">
  				<td align="center">华科预警单位</td>
  				<td>
  				<c:forEach items="${teamEmps}" var="employeesg">
  					<span>${employeesg.employee_name}</span>
  				</c:forEach>
  				</td>
  			</tr>
  		</c:if>
  		<tr>
			<td colspan="4" align="center">
		  		<%@ include file="station_extend.jsp"%>
			</td>
		</tr>
  	</table>
  	
  </fieldset>
<div class="saveDiv">
	<input id="btn_back" value="返回" type="button" icon="icon_back"/>
</div>
  </body>
</html:html>
						