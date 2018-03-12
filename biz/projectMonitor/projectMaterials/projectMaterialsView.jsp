<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>
<%@ include file="/commons/meta.jsp"%>
<ex:bundle/>
<html:html>
<head>
<title>工程资料信息管理</title>
<script src="${ctx}/scripts/public.js" type="text/javascript"></script>
<script language="javascript">
 $(document).ready(function(){
  $("#btn_back").click(function(){
       		location.href='projectMaterialsAction.do?method=list&station_id=${station.station_id}&ec_id=${param.ec_id}&ec_p=${param.ec_p}&ec_crd=${param.ec_crd}';   
	    	
       });
 })
</script>
</head>
 <body>

    <fieldset>
		<legend><strong>基本信息</strong></legend>
	    <table class="formTable"  align="center" cellpadding="3" cellspacing="0" >
	    <COLGROUP>
							<COL class="tdLeftTwo" />
							<COL class="tdRightTwo" />
							<COL class="tdLeftTwo" />
							<COL class="tdRightTwo" />
						</COLGROUP>
	    <tr>
	    	<td>线路:&nbsp</td>
	    	<td>${line.line_name}</td>
	    	<td>标段:&nbsp</td>
	    	<td>${segment.segment_name}</td>
	    </tr>
	    <tr>
	    	<td>车站/区间:&nbsp</td>
	    	<td>${station.station_name}</td>
	    	<td>工程资料类型:&nbsp</td>
	    	<td> <ex:dicDisplay dictIdentify="MaterialsType" dictValue="${projectMaterials.materials_type}"/>
							</td>
	    </tr>
	    <tr>
	    	<td>编制人:&nbsp</td>
	    	<td><ex:userName id="${projectMaterials.creator}"/></td>
	    	<td>编制日期:&nbsp</td>
	    	<td><fmt:formatDate value='${projectMaterials.create_date}' pattern='yyyy-MM-dd HH:mm:ss'/></td>
	    </tr>
	    <tr>
	    	<td>修改人:&nbsp</td>
	    	<td colspan="3"><ex:userName id="${projectMaterials.updateMan}"/></td>
	    </tr>
    </table>
 </fieldset>
 <c:if test="${station.station_type == 'S'}">
 <fieldset>
	<legend><strong>车站结构设计参数</strong></legend>
 	<table class="listTable" width="100%" align="center" border="0" cellpadding="0" cellspacing="1">
		<thead align="center">
			<tr>
				<th width='10%'>序号</th>
				<th width='25%'>项目</th>
				<th width='65%'>内容</th>
			</tr>
		</thead>
		<tr>
			<td>1</td>
			<td>车站层数</td>
			<td>${stationStructure.station_level_count}</td>
		</tr>
		<tr>
			<td>2</td>
			<td>车站跨数</td>
			<td>${stationStructure.station_step_count}</td>
		</tr>
		<tr>
			<td>3</td>
			<td>外包总长度</td>
			<td>${stationStructure.outer_package_lenght}</td>
		</tr>
		<tr>
			<td>4</td>
			<td>外包总宽度</td>
			<td>${stationStructure.outer_package_width}</td>
		</tr>
		<tr>
			<td>5</td>
			<td>总高</td>
			<td>${stationStructure.total_width}</td>
		</tr>
		<tr>
			<td>6</td>
			<td>主体结构型式</td>
			<td>${stationStructure.subject_struct_pattern}</td>
		</tr>
		<tr>
			<td>7</td>
			<td>围护结构形式</td>
			<td>${stationStructure.round_struct_pattern}</td>
		</tr>
		<tr>
			<td>8</td>
			<td>围护结构深度</td>
			<td>${stationStructure.round_struct_deep}</td>
		</tr>
		<tr>
			<td>9</td>
			<td>围护结构是否入岩</td>
			<td>${stationStructure.round_struct_isrock}</td>
		</tr>
		<tr>
			<td>10</td>
			<td>入土比</td>
			<td>${stationStructure.bury_proportion}</td>
		</tr>
		<tr>
			<td>11</td>
			<td>顶板埋深</td>
			<td>${stationStructure.roof_deeply}</td>
		</tr>
		<tr>
			<td>12</td>
			<td>底板埋深</td>
			<td>${stationStructure.bottom_deeply}</td>
		</tr>
		<tr>
			<td>13</td>
			<td>支撑形式</td>
			<td>${stationStructure.support_pattern}</td>
		</tr>
		<tr>
			<td>14</td>
			<td>端头井个数</td>
			<td>${stationStructure.head_well_count}</td>
		</tr>
		<tr>
			<td>15</td>
			<td>主动区加固</td>
			<td>${stationStructure.voluntarily_area_strong}</td>
		</tr>
		<tr>
			<td>16</td>
			<td>被动区加固</td>
			<td>${stationStructure.passive_area_strong}</td>
		</tr>
		<tr>
			<td>17</td>
			<td>总建筑面积</td>
			<td>${stationStructure.total_building_area}</td>
		</tr>
		<tr>
			<td>18</td>
			<td>主体建筑面积</td>
			<td>${stationStructure.main_building_area}</td>
		</tr>
		<tr>
			<td>19</td>
			<td>出入口个数</td>
			<td>${stationStructure.exits_enter_count}</td>
		</tr>
		<tr>
			<td>20</td>
			<td>消防疏散口个数</td>
			<td>${stationStructure.fire_evacuate_count}</td>
		</tr>
		<tr>
			<td>21</td>
			<td>人防等级</td>
			<td>${stationStructure.prevent_leave}</td>
		</tr>
		<tr>
			<td>22</td>
			<td>抗震设防烈度等级</td>
			<td>${stationStructure.earthquake_prevent_leave}</td>
		</tr>
		<tr>
			<td>23</td>
			<td>结构耐火等级</td>
			<td>${stationStructure.struct_fire_leave}</td>
		</tr>
		<tr>
			<td>24</td>
			<td>结构防化等级</td>
			<td>${stationStructure.struct_antichemical_leave}</td>
		</tr>
	</table>
	<c:if test="${stationStructure.attach_address1 != null}">
		<div align='left' style="width:98%;background-color:#F6F6F6;">
			<strong><font color="#6E9CC9" size='2'>图片附件信息：</font></strong>
				<c:if test="${stationStructure.attach_address1 != null}">
					 <a href="${ctx}/stationStructureAction.do?method=download&structure_id=${stationStructure.structure_id}&index=1">[${stationStructure.attach_name1}]</a>&nbsp;&nbsp;
				</c:if>
				<c:if test="${stationStructure.attach_address2 != null}">
					 <a href="${ctx}/stationStructureAction.do?method=download&structure_id=${stationStructure.structure_id}&index=2">[${stationStructure.attach_name2}]</a>&nbsp;&nbsp;
				</c:if>
				<c:if test="${stationStructure.attach_address3 != null}">
					 <a href="${ctx}/stationStructureAction.do?method=download&structure_id=${stationStructure.structure_id}&index=3">[${stationStructure.attach_name3}]</a>&nbsp;&nbsp;
				</c:if>
				<c:if test="${stationStructure.attach_address4 != null}">
					 <a href="${ctx}/stationStructureAction.do?method=download&structure_id=${stationStructure.structure_id}&index=4">[${stationStructure.attach_name4}]</a>&nbsp;&nbsp;
				</c:if>
		</div>
	</c:if>
	</fieldset>
 
 </c:if>
 <c:if test="${station.station_type == 'P'}">
 <fieldset>
	<legend><strong>区间结构设计参数</strong></legend>
	 <table class="listTable" width="100%" align="center" border="0" cellpadding="0" cellspacing="1">
		<thead align="center">
			<tr>
				<th width='20%'>序号</th>
				<th width='30%'>项目</th>
				<th width='50%'>内容</th>
			</tr>
		</thead>
		<tr>
			<td>1</td>
			<td>左线长度(m)</td>
			<td>${blockStructure.left_line_length}</td>
		</tr>
		<tr>
			<td>2</td>
			<td>左线起止里程</td>
			<td>${blockStructure.left_start_mileage}</td>
		</tr>
		<tr>
			<td>3</td>
			<td>左线平均坡度</td>
			<td>${blockStructure.left_average_slope}</td>
		</tr>
		<tr>
			<td>4</td>
			<td>左线最大坡度及里程</td>
			<td>${blockStructure.left_max_slope}</td>
		</tr>
		<tr>
			<td>5</td>
			<td>右线长度(m)</td>
			<td>${blockStructure.right_line_length}</td>
		</tr>
		<tr>
			<td>6</td>
			<td>右线起止里程</td>
			<td>${blockStructure.right_start_mileage}</td>
		</tr>
		<tr>
			<td>7</td>
			<td>右线平均坡度</td>
			<td>${blockStructure.right_average_slope}</td>
		</tr>
		<tr>
			<td>8</td>
			<td>右线最大坡度及里程</td>
			<td>${blockStructure.right_max_slope}</td>
		</tr>
		<tr>
			<td>9</td>
			<td>平均埋深(m)</td>
			<td>${blockStructure.average_bury_deep}</td>
		</tr>
		<tr>
			<td>10</td>
			<td>覆土厚度最大(m)</td>
			<td>${blockStructure.soil_max_deep}</td>
		</tr>
		<tr>
			<td>11</td>
			<td>覆土厚度最小(m)</td>
			<td>${blockStructure.soil_min_deep}</td>
		</tr>
		<tr>
			<td>12</td>
			<td>施工工法</td>
			<td>${blockStructure.construction_law}</td>
		</tr>
		<tr>
			<td>13</td>
			<td>隧道净空高度(m)</td>
			<td>${blockStructure.tunnel_clearance_height}</td>
		</tr>
		<tr>
			<td>14</td>
			<td>隧道中心线距离(m)</td>
			<td>${blockStructure.tunnel_center_distance}</td>
		</tr>
		<tr>
			<td>15</td>
			<td>隧道外沿宽度(m)</td>
			<td>${blockStructure.tunnel_outside_width}</td>
		</tr>
		<tr>
			<td>16</td>
			<td>覆跨比</td>
			<td>${blockStructure.cover_across_than}</td>
		</tr>
		<tr>
			<td>17</td>
			<td>高跨比</td>
			<td>${blockStructure.high_step_than}</td>
		</tr>
		<tr>
			<td>18</td>
			<td>竖井个数及位置</td>
			<td>${blockStructure.shaft_number_position}</td>
		</tr>
		<tr>
			<td>19</td>
			<td>隧道截面类型个数及尺寸</td>
			<td>${blockStructure.tunnel_sectional_size}</td>
		</tr>
	</table>
	<c:if test="${blockStructure.attach_address1 != null}">
	<div align='left' style="width:98%;background-color:#F6F6F6;">
		<strong><font color="#6E9CC9" size='2'>图片附件信息：</font></strong>
			<c:if test="${blockStructure.attach_address1 != null}">
				 <a href="${ctx}/blockStructureAction.do?method=download&block_id=${blockStructure.block_id}&index=1">[${blockStructure.attach_name1}]</a>&nbsp;&nbsp;
			</c:if>
			<c:if test="${blockStructure.attach_address2 != null}">
				<a href="${ctx}/blockStructureAction.do?method=download&block_id=${blockStructure.block_id}&index=2">[${blockStructure.attach_name2}]</a>&nbsp;&nbsp;
			</c:if>
			<c:if test="${blockStructure.attach_address3 != null}">
				 <a href="${ctx}/blockStructureAction.do?method=download&block_id=${blockStructure.block_id}&index=3">[${blockStructure.attach_name3}]</a>&nbsp;&nbsp;
			</c:if>
			<c:if test="${blockStructure.attach_address4 != null}">
				<a href="${ctx}/blockStructureAction.do?method=download&block_id=${blockStructure.block_id}&index=4">[${blockStructure.attach_name4}]</a>&nbsp;&nbsp;
			</c:if>
	</div>
	</c:if>
</fieldset>
 </c:if>
 <fieldset>
	<legend><strong>工程地质基本参数</strong></legend>
	<table class="listTable" width="100%" align="center" border="0" cellpadding="0" cellspacing="1">
		<thead align="center">
			<tr>
				<th width='10%'>序号</th>
				<th width='20%'>项目</th>
				<th width='70%'>内容</th>
			</tr>
		</thead>
		<tr>
			<td>1</td>
			<td>地表高程范围</td>
			<td><html:textarea property="ground_altitude_range" value="${projectGeology.ground_altitude_range}" rows="6" cols="80" readonly="true" /></td>
		</tr>
		<tr>
			<td>2</td>
			<td>原始地貌</td>
			<td><html:textarea property="primitive_ground" value="${projectGeology.primitive_ground}" rows="6" cols="80" readonly="true" /></td>
		</tr>
		<tr>
			<td>3</td>
			<td>不良地质情况</td>
			<td><html:textarea property="bad_geological_situation" value="${projectGeology.bad_geological_situation}" rows="6" cols="80" readonly="true" /></td>
		</tr>
		<tr>
			<td>4</td>
			<td>特殊土情况</td>
			<td><html:textarea property="special_soil_situation" value="${projectGeology.special_soil_situation}" rows="6" cols="80" readonly="true" /></td>
		</tr>
		<tr>
			<td>5</td>
			<td>上层滞水情况</td>
			<td><html:textarea property="stagnat_water_situation" value="${projectGeology.stagnat_water_situation}" rows="6" cols="80" readonly="true" /></td>
		</tr>
		<tr>
			<td>6</td>
			<td>承压水情况</td>
			<td><html:textarea property="artesian_water_situation" value="${projectGeology.artesian_water_situation}" rows="6" cols="80" readonly="true" /></td>
		</tr>
		<tr>
			<td>7</td>
			<td>基岩裂隙水情况</td>
			<td><html:textarea property="crevice_water_situation" value="${projectGeology.crevice_water_situation}" rows="6" cols="80" readonly="true" /></td>
		</tr>
		<tr>
			<td>8</td>
			<td>岩溶水情况</td>
			<td><html:textarea property="karst_water_situation" value="${projectGeology.karst_water_situation}" rows="6" cols="80" readonly="true" /></td>
		</tr>
		<tr>
			<td>9</td>
			<td>水腐蚀性</td>
			<td><html:textarea property="water_corrosivity" value="${projectGeology.water_corrosivity}" rows="6" cols="80" readonly="true" /></td>
		</tr>
	</table>
	<c:if test="${projectGeology.attach_address1 != null}">
	<div align='left' style="width:98%;background-color:#F6F6F6;">
		<strong><font color="#6E9CC9" size='2'>图片附件信息：</font></strong>
			<c:if test="${projectGeology.attach_address1 != null}">
				<a href="${ctx}/projectGeologyAction.do?method=download&geology_id=${projectGeology.geology_id}&index=1">[${projectGeology.attach_name1}]</a>&nbsp;&nbsp;
			</c:if>
			<c:if test="${projectGeology.attach_address2 != null}">
				<a href="${ctx}/projectGeologyAction.do?method=download&geology_id=${projectGeology.geology_id}&index=2">[${projectGeology.attach_name2}]</a>&nbsp;&nbsp;
			</c:if>
			<c:if test="${projectGeology.attach_address3 != null}">
				<a href="${ctx}/projectGeologyAction.do?method=download&geology_id=${projectGeology.geology_id}&index=3">[${projectGeology.attach_name3}]</a>&nbsp;&nbsp;
			</c:if>
			<c:if test="${projectGeology.attach_address4 != null}">
				<a href="${ctx}/projectGeologyAction.do?method=download&geology_id=${projectGeology.geology_id}&index=4">[${projectGeology.attach_name4}]</a>&nbsp;&nbsp;
			</c:if>
	</div>
	</c:if>
</fieldset>
<fieldset>
	<legend><strong>地层岩性性能表</strong></legend>
	<table class="listTable" id="tableObj" width="100%" align="center" border="0" cellpadding="0" cellspacing="1">
			<thead align="center">
				<tr>
					<th width='10%'>地层代号</th>
							<th width='15%' ><font color="#50A2E6">地层名称</font></th>
							<th width='10%'>颜色</th>
							<th width='10%'>状态</th>
							<th width='25%'>特征描述</th>
							<th width='10%'>层厚</th>
							<th width='12%'>渗透性</th>
							
				</tr>
			</thead>
			<c:forEach items="${stratumRocks}" var="stratumRock">
				<tr align="center">
					<td>
						<html:text property="stratum_code" value="${stratumRock.stratum_code}" styleClass="text" size="9" readonly="true"/>
					</td>
					<td><html:text property="stratum_name" value="${stratumRock.stratum_name}" styleClass="text"  size="15" readonly="true"/></td>
					<td><html:text property="color" value="${stratumRock.color}" styleClass="text"  size="9" readonly="true"/></td>
					<td><html:text property="state" value="${stratumRock.state}" styleClass="text" size="9"  readonly="true"/></td>
					<td><html:text property="feature_description" value="${stratumRock.feature_description}" styleClass="text" size="30" readonly="true"/></td>
					<td><html:text property="layer_thick" value="${stratumRock.layer_thick}" styleClass="text"  size="9" readonly="true"/></td>
					<td><html:text property="permeability" value="${stratumRock.permeability}" styleClass="text"  size="11" readonly="true"/></td>
				</tr>
			</c:forEach>
		</table>
		<c:if test="${projectMaterials.stratumRock_attach_address1 != null}">
		<div align='left' style="width:98%;background-color:#F6F6F6;">
			<strong><font color="#6E9CC9" size='2'>图片附件信息：</font></strong>
				<c:if test="${projectMaterials.stratumRock_attach_address1 != null}">
					<a href="${ctx}/stratumRockAction.do?method=download&materials_id=${projectMaterials.materials_id}&index=1">[${projectMaterials.stratumRock_attach_name1}]</a>&nbsp;&nbsp;
				</c:if>
				<c:if test="${projectMaterials.stratumRock_attach_address2 != null}">
					<a href="${ctx}/stratumRockAction.do?method=download&materials_id=${projectMaterials.materials_id}&index=2">[${projectMaterials.stratumRock_attach_name2}]</a>&nbsp;&nbsp;
				</c:if>
				<c:if test="${projectMaterials.stratumRock_attach_address3 != null}">
					<a href="${ctx}/stratumRockAction.do?method=download&materials_id=${projectMaterials.materials_id}&index=3">[${projectMaterials.stratumRock_attach_name3}]</a>&nbsp;&nbsp;
				</c:if>
				<c:if test="${projectMaterials.stratumRock_attach_address4 != null}">
					<a href="${ctx}/stratumRockAction.do?method=download&materials_id=${projectMaterials.materials_id}&index=4">[${projectMaterials.stratumRock_attach_name4}]</a>&nbsp;&nbsp;
				</c:if>
		</div>
		</c:if>
</fieldset>
<fieldset>
	<legend><strong>周边地下管线信息</strong></legend>
	<table class="listTable" id="tableObj" width="100%" align="center" border="0" cellpadding="0" cellspacing="1">
		<thead align="center">
			<tr>
				<th width='5%'>序号</th>
							<th width='5%'>类型</th>
							<th width='5%' bgcolor="#50A2E6">名称</th>
							<th width='5%'>埋设年代</th>
							<th width='5%'>铺设方法</th>
							<th width='5%'>基础垫层情况</th>
							<th width='5%'>材质</th>
							<th width='5%'>接头类型</th>
							<th width='5%'>横断面形状</th>
							<th width='5%'>横断面直径mm</th>
							<th width='5%'>壁管厚度mm</th>
							<th width='5%'>管线埋深</th>
							<th width='5%'>最短水平距离</th>
							<th width='5%'>管线与结构位置关系</th>
							<th width='5%'>压力大小</th>
							<th width='5%'>所处地层类型</th>
							<th width='5%'>处理方式</th>
			</tr>
		</thead>
		<c:set value="0" var="index"></c:set>
		<c:forEach items="${undergroundPipelines}" var="undergroundPipeline">
			<c:set value="${index+1}" var="index"></c:set>
			<tr align="center">
				<td>${index}</td>
				<td><html:text property="type" value="${undergroundPipeline.type}" styleClass="text" size="3" readonly="true"/></td>
				<td><html:text property="name" value="${undergroundPipeline.name}" styleClass="text" size="3"  readonly="true"/></td>
				<td><html:text property="bury_times" value="${undergroundPipeline.bury_times}" styleClass="text" size="3"  readonly="true"/></td>
				<td><html:text property="lay_method" value="${undergroundPipeline.lay_method}" styleClass="text" size="3"  readonly="true"/></td>
				<td><html:text property="basic_layer_situations" value="${undergroundPipeline.basic_layer_situations}" styleClass="text" size="3"  readonly="true"/></td>
				<td><html:text property="material" value="${undergroundPipeline.material}" styleClass="text" size="3"  readonly="true"/></td>
				<td><html:text property="connect_type" value="${undergroundPipeline.connect_type}" styleClass="text" size="3"  readonly="true"/></td>
				<td><html:text property="cross_section_form" value="${undergroundPipeline.cross_section_form}" styleClass="text" size="3" readonly="true" /></td>
				<td><html:text property="cross_section_diameter" value="${undergroundPipeline.cross_section_diameter}" styleClass="text" size="3"  maxlength="18" readonly="true"/></td>
				<td><html:text property="wall_thickness" value="${undergroundPipeline.wall_thickness}" styleClass="text" size="3"  maxlength="18" readonly="true"/></td>
				<td><html:text property="pipeline_buried_deep" value="${undergroundPipeline.pipeline_buried_deep}" styleClass="text" size="3"  maxlength="18" readonly="true"/></td>
				<td><html:text property="min_horizontal_distance" value="${undergroundPipeline.min_horizontal_distance}" styleClass="text" size="3"  maxlength="18" readonly="true"/></td>
				<td><html:text property="pipeline_structural_relation" value="${undergroundPipeline.pipeline_structural_relation}" styleClass="text" size="5"  readonly="true"/></td>
				<td><html:text property="pressure_size" value="${undergroundPipeline.pressure_size}" styleClass="text" size="3"  maxlength="18" readonly="true"/></td>
				<td><html:text property="stratum_type" value="${undergroundPipeline.stratum_type}" styleClass="text" size="3"  readonly="true"/></td>
				<td><html:text property="handle_way" value="${undergroundPipeline.handle_way}" styleClass="text" size="3"  readonly="true"/></td>
			</tr>
		</c:forEach>
	</table>
	<c:if test="${projectMaterials.underLine_attach_address1 != null}">
	<div align='left' style="width:98%;background-color:#F6F6F6;">
		<strong><font color="#6E9CC9" size='2'>图片附件信息：</font></strong>
			<c:if test="${projectMaterials.underLine_attach_address1 != null}">
				<a href="${ctx}/undergroundPipelineAction.do?method=download&materials_id=${projectMaterials.materials_id}&index=1">[${projectMaterials.underLine_attach_name1}]</a>&nbsp;&nbsp;
			</c:if>
			<c:if test="${projectMaterials.underLine_attach_address2 != null}">
				<a href="${ctx}/undergroundPipelineAction.do?method=download&materials_id=${projectMaterials.materials_id}&index=2">[${projectMaterials.underLine_attach_name2}]</a>&nbsp;&nbsp;
			</c:if>
			<c:if test="${projectMaterials.underLine_attach_address3 != null}">
				<a href="${ctx}/undergroundPipelineAction.do?method=download&materials_id=${projectMaterials.materials_id}&index=3">[${projectMaterials.underLine_attach_name3}]</a>&nbsp;&nbsp;
			</c:if>
			<c:if test="${projectMaterials.underLine_attach_address4 != null}">
				<a href="${ctx}/undergroundPipelineAction.do?method=download&materials_id=${projectMaterials.materials_id}&index=4">[${projectMaterials.underLine_attach_name4}]</a>&nbsp;&nbsp;
			</c:if>
	</div>
	</c:if>
</fieldset>
<fieldset>
	<legend><strong>周边建筑物资料信息</strong></legend>
	<table class="listTable" id="tableObj" width="100%" align="center" border="0" cellpadding="0" cellspacing="1">
		<thead align="center">
			<tr>
				<th width='6%'>序号</th>
							<th width='8%' bgcolor="#50A2E6">名称</th>
							<th width='8%'>高度</th>
							<th width='8%'>层数</th>
							<th width='8%'>结构形式</th>
							<th width='8%'>用途</th>
							<th width='8%'>基础类型</th>
							<th width='8%'>基础深度</th>
							<th width='8%'>地下室情况</th>
							<th width='8%'>最短水平距离(m)</th>
							<th width='10%'>相对位置关系</th>
							<th width='8%'>保护标准</th>
			</tr>
		</thead>
		<c:set value="0" var="index"></c:set>
		<c:forEach items="${peripheralBuildings}" var="peripheralBuilding">
			<c:set value="${index+1}" var="index"></c:set>
			<tr align="center">
				<td>${index}</td>
				<td><html:text property="name" value="${peripheralBuilding.name}" styleClass="text" size="5" readonly="true"/></td>
				<td><html:text property="height" value="${peripheralBuilding.height}" styleClass="text" size="5"  maxlength="18" readonly="true"/></td>
				<td><html:text property="layer_count" value="${peripheralBuilding.layer_count}" styleClass="text" size="5" maxlength="18" readonly="true"/></td>
				<td><html:text property="structural_form" value="${peripheralBuilding.structural_form}" styleClass="text" size="5" readonly="true" /></td>
				<td><html:text property="use" value="${peripheralBuilding.use}" styleClass="text" size="5" readonly="true" /></td>
				<td><html:text property="basic_type" value="${peripheralBuilding.basic_type}" styleClass="text" size="5"  readonly="true"/></td>
				<td><html:text property="basic_deep" value="${peripheralBuilding.basic_deep}" styleClass="text" size="5" maxlength="18" readonly="true" /></td>
				<td><html:text property="basement_situation" value="${peripheralBuilding.basement_situation}" styleClass="text" size="5" readonly="true" /></td>
				<td><html:text property="min_horizontal_distance" value="${peripheralBuilding.min_horizontal_distance}" styleClass="text" size="5" maxlength="18" readonly="true"/></td>
				<td><html:text property="rel_position_relation" value="${peripheralBuilding.rel_position_relation}" styleClass="text" size="9"  readonly="true"/></td>
				<td><html:text property="protect_standard" value="${peripheralBuilding.protect_standard}" styleClass="text" size="6"  readonly="true"/></td>
			</tr>
		</c:forEach>
	</table>
	<c:if test="${projectMaterials.aroundBuilding_attach_address1 != null}">
	<div align='left' style="width:98%;background-color:#F6F6F6;">
		<strong><font color="#6E9CC9" size='2'>图片附件信息：</font></strong>
			<c:if test="${projectMaterials.aroundBuilding_attach_address1 != null}">
				<a href="${ctx}/peripheralBuildingAction.do?method=download&materials_id=${projectMaterials.materials_id}&index=1">[${projectMaterials.aroundBuilding_attach_name1}]</a>&nbsp;&nbsp;
			</c:if>
			<c:if test="${projectMaterials.aroundBuilding_attach_address2 != null}">
				<a href="${ctx}/peripheralBuildingAction.do?method=download&materials_id=${projectMaterials.materials_id}&index=2">[${projectMaterials.aroundBuilding_attach_name2}]</a>&nbsp;&nbsp;
			</c:if>
			<c:if test="${projectMaterials.aroundBuilding_attach_address3 != null}">
				<a href="${ctx}/peripheralBuildingAction.do?method=download&materials_id=${projectMaterials.materials_id}&index=3">[${projectMaterials.aroundBuilding_attach_name3}]</a>&nbsp;&nbsp;
			</c:if>
			<c:if test="${projectMaterials.aroundBuilding_attach_address4 != null}">
				<a href="${ctx}/peripheralBuildingAction.do?method=download&materials_id=${projectMaterials.materials_id}&index=4">[${projectMaterials.aroundBuilding_attach_name4}]</a>&nbsp;&nbsp;
			</c:if>
	</div>
	</c:if>
</fieldset>
    <div align="center">
		<input type="button"  id="btn_back" value="${texts['button.back']}"  class="backButton">
    </div>
 </body>
</html:html>
