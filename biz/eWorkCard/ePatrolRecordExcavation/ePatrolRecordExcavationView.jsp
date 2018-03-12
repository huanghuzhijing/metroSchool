<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
<html:html>
<head>
<script type="text/javascript">
	 $(document).ready(function(){
	 	//保存
	 	$("#btn_save").click(function(){
			var properties=new Array(); 
			saveValidateRequired("#btn_save",properties,"ePatrolRecordExcavationForm");
		}); 
		//返回		
		$("#btn_back").click(function(){ 
			}); 
	}); 
	

</script>
<style type="text/css">
.listTables{  /*列表页面 子列表显示区-table*/
	background-color:#f1f1f1 ;
	
	width:100%;
	border:1px solid #C0C0C0;
 	border-spacing:0;
 	border-collapse:collapse;
	
}

.listTables thead{
	background-color:#f1f1f1 ;
}
.listTables th{
	background: #DFF0F9 repeat-x;
	font-size:12px;
	color: #313131;
	text-align:center ;
	letter-spacing: 2px;
	vertical-align:middle ;
	border: 1px bold ;
}

.listTables tr {
	background-color:#FFFFFF;
	
	event: expression(
	onmouseover =   function() { 
     this . style . backgroundColor =   '#fdecae'
    }
    ,
    onmouseout  = function () {
    this .style.backgroundColor = ''
	}
    )
}
.listTables td{
	font: 13px  Verdana, Arial, Helvetica, sans-serif;
    /*background-color:#FFFFFF;*/
	color:#515151 ;
	text-align: center ;
	border: 1px solid #DCDCDC;
	cursor: hand;
	border-top: 0;
}
.listTables table.z-btn td,#tableReceive_table table.z-btn td{
	border:0px solid white;
}


</style>
</head>
<content tag="heading">武汉地铁工程暗挖法施工安全风险巡视记录表</content>
<body>

<html:form action="ePatrolRecordExcavationAction.do" styleClass="form" method="POST" styleId="ePatrolRecordExcavationForm" enctype="multipart/form-data">
		
	<table class="listTables" bordercolorlight="#DDDDE0" bordercolordark="#ffffff" width="100%"  border="2" align="center" cellpadding="3" cellspacing="0">
 <tr >
    <th height="52" style="font-size:18px" colspan="6" class="STYLE2" ><div align="center">武汉地铁工程暗挖法施工安全风险巡视记录表</div></th>
  </tr>
  <tr>
    <th width="272" height="35">工点名称：</th>
    <td width="260">${ePatrolRecordExcavation.stationId.station_name}</td>
    <th width="279">天气：</th>
    <td width="251">${ePatrolRecordExcavation.weather}</td>
    <th width="282">巡视时间：</th>
    <td width="275"> <fmt:formatDate value="${ePatrolRecordExcavation.tourDate}" pattern="yyyy-MM-dd"/></td>
  </tr>
  <tr>
    <th height="37" colspan="6"><div align="center">工点进度说明</div></th>
  </tr>
  <tr>
    <td height="70" colspan="6"><html:textarea property="progressNotes" /></td>
  </tr>
  <tr>
    <th height="37" colspan="6"><div align="center">安全风险巡视计划及落实表</div></th>
  </tr>
  <tr>
    <th height="27" colspan="2"><div align="center">计划巡视重点及拟解决问题</div></th>
    <th colspan="2"><div align="center">巡视综合落实情况 </div></th>
    <th colspan="2"><div align="center">新发现问题</div></th>
  </tr>
  <tr>
    <td height="85" colspan="2">${ePatrolRecordExcavation.pointSolve}</td>
    <td colspan="2">${ePatrolRecordExcavation.implementation}</td>
    <td colspan="2">${ePatrolRecordExcavation.newProblem}</td>
  </tr>
  <tr>
    <th height="35" colspan="6"><div align="center">安全风险巡视评估表</div></th>
  </tr>
  <tr>
    <th height="36">巡视项目</th>
    <th colspan="2">巡视内容</th>
    <th colspan="2">巡视评估结果</th>
    <th>备注</th>
  </tr>
  <tr>
    <th rowspan="9">开挖面情况</th>
    <th height="34" colspan="2">超前地质预报开展情况</th>
    <td colspan="2">
    
    	<ex:dicDisplay dictIdentify="YesOrNo" dictValue="${ePatrolRecordExcavation.excavationFaceResult1}"/>
    </td>
    <td rowspan="9">${ePatrolRecordExcavation.excavationFaceRemark}</td>
  </tr>
  <tr>
    <th height="34" colspan="2">开挖面地质情况</th>
    <td colspan="2">${ePatrolRecordExcavation.excavationFaceResult2}
    </td>
    
  </tr>
  <tr>
    <th height="36" colspan="2">地下水类型</th>
    <td colspan="2">
    ${ePatrolRecordExcavation.excavationFaceResult3}
    </td>
  </tr>
  <tr>
    <th height="33" colspan="2">掌子面渗透水情况</th>
    <td colspan="2">
		${ePatrolRecordExcavation.excavationFaceResult4}
    </td>
  </tr>
  <tr>
    <th height="34" colspan="2">掌子面及其附近塌方预兆</th>
    <td colspan="2">
    	<ex:dicDisplay dictIdentify="YesOrNo" dictValue="${ePatrolRecordExcavation.excavationFaceResult5}"/>
    </td>
  </tr>
  <tr>
    <th height="34" colspan="2">开挖进尺</th>
    <td colspan="2">
		<ex:dicDisplay dictIdentify="IfMeetDemand" dictValue="${ePatrolRecordExcavation.excavationFaceResult6}"/>
    </td>
  </tr>
  <tr>
    <th height="35" colspan="2">核心土留置情况</th>
    <td colspan="2">
    	<ex:dicDisplay dictIdentify="IfMeetDemand" dictValue="${ePatrolRecordExcavation.excavationFaceResult7}"/>
    </td>
  </tr>
  <tr>
    <th height="33" colspan="2">上下台阶距离</th>
    <td colspan="2">
    	<ex:dicDisplay dictIdentify="IfMeetDemand" dictValue="${ePatrolRecordExcavation.excavationFaceResult8}"/>
    </td>
    </tr>
  <tr>
    <th height="33" colspan="2">爆破施工</th>
    <td colspan="2">
    	<ex:dicDisplay dictIdentify="YesOrNo" dictValue="${ePatrolRecordExcavation.excavationFaceResult9}"/>
    </td>
  </tr>
  <tr>
    <th rowspan="7">支护体系</th>
    <th height="34" colspan="2">超前支护施作及时性</th>
    <td colspan="2">
    	<ex:dicDisplay dictIdentify="Timely" dictValue="${ePatrolRecordExcavation.supportResult1}"/>
    </td>
    <td rowspan="7">${ePatrolRecordExcavation.supportRemark}</td>
  </tr>
  <tr>
    <th height="34" colspan="2">初支护施及时性</th>
    <td colspan="2">
    	<ex:dicDisplay dictIdentify="Timely" dictValue="${ePatrolRecordExcavation.supportResult2}"/>
    </td>
    
  </tr>
  <tr>
    <th height="36" colspan="2">初支成型质量 </th>
    <td colspan="2">
    	<ex:dicDisplay dictIdentify="GoodOrBad" dictValue="${ePatrolRecordExcavation.supportResult3}"/>
    </td>
  </tr>
  <tr>
    <th height="33" colspan="2">隧道拱部及洞身变形</th>
    <td colspan="2">
		<ex:dicDisplay dictIdentify="DeformationCondition" dictValue="${ePatrolRecordExcavation.supportResult4}"/>   
    </td>
  </tr>
  <tr>
    <th height="34" colspan="2">临时抑拱架设及变形情况</th>
    <td colspan="2">
    ${ePatrolRecordExcavation.supportResult5}
    </td>
  </tr>
  <tr>
    <th height="34" colspan="2">拱部及边墙初衬开裂、脱落</th>
    <td colspan="2">
		<ex:dicDisplay dictIdentify="YesOrNo" dictValue="${ePatrolRecordExcavation.supportResult6}"/>
    </td>
  </tr>
  <tr>
    <th height="34" colspan="2">二衬裂缝、渗水</th>
    <td colspan="2">
		<ex:dicDisplay dictIdentify="YesOrNo" dictValue="${ePatrolRecordExcavation.supportResult7}"/>
    </td>
  </tr>
  <tr>
    <th rowspan="10">施工工况</th>
    <th height="36" colspan="2">线间距情况</th>
    <td colspan="2">
		<ex:dicDisplay dictIdentify="LineSpacing" dictValue="${ePatrolRecordExcavation.conditionResult1}"  />
	</td>
    <td rowspan="10">
		${ePatrolRecordExcavation.conditionRemark}
	</td>
  </tr>
  <tr>
    <th height="34" colspan="2">覆土情况</th>
    <td colspan="2">
     ${ePatrolRecordExcavation.conditionResult2}
    </td>
  </tr>
  <tr>
    <th height="36" colspan="2">马头门破除情况</th>
    <td colspan="2">
    ${ePatrolRecordExcavation.conditionResult3}
	</td>
  </tr>
  <tr>
    <th height="35" colspan="2">洞身开挖情况</th>
    <td colspan="2">
    	 ${ePatrolRecordExcavation.conditionResult4}
    </td>
  </tr>
  <tr>
    <th height="36" colspan="2">初支渗透水情况</th>
    <td colspan="2">
    	<ex:dicDisplay dictIdentify="Leakage" dictValue="${ePatrolRecordExcavation.conditionResult5}"/>
    </td>
  </tr>
  <tr>
    <th height="35" colspan="2">地表降水、地层处理情况</th>
    <td colspan="2">
    	 ${ePatrolRecordExcavation.conditionResult6}
    </td>
  </tr>
  <tr>
    <th height="35" colspan="2">竖井及洞身周边地面堆载情况</th>
    <td colspan="2">
    	<ex:dicDisplay dictIdentify="YesOrNo" dictValue="${ePatrolRecordExcavation.conditionResult7}" />
    </td>
  </tr>
  <tr>
    <th height="35" colspan="2">相邻隧道掌子面之间的距离</th>
    <td colspan="2">
    	<ex:dicDisplay dictIdentify="IfMeetDemand" dictValue="${ePatrolRecordExcavation.conditionResult8}"/>
    </td>
  </tr>
  <tr>
    <th height="33" colspan="2">吊装作业情况</th>
    <td colspan="2">
    	<ex:dicDisplay dictIdentify="Standard" dictValue="${ePatrolRecordExcavation.conditionResult9}"/>
    </td>
  </tr>
  <tr>
    <th height="35" colspan="2">其他机械设备情况</th>
    <td colspan="2">
    	<ex:dicDisplay dictIdentify="NormalOrNot" dictValue="${ePatrolRecordExcavation.conditionResult10}"/>
    </td>
  </tr>
  <tr>
    <th rowspan="7">安全文明施工</th>
    <th height="36" colspan="2">隧道内通风照明情况</th>
    <td colspan="2">
		<ex:dicDisplay dictIdentify="GoodOrBad" dictValue="${ePatrolRecordExcavation.safetyResult1}"  />
	</td>
    <td rowspan="7">
		${ePatrolRecordExcavation.safetyRemark}
	</td>
  </tr>
  <tr>
    <th height="34" colspan="2">隧道内积水积泥情况</th>
    <td colspan="2">
		<ex:dicDisplay dictIdentify="YesOrNo" dictValue="${ePatrolRecordExcavation.safetyResult2}"/>
    </td>
  </tr>
  <tr>
    <th height="36" colspan="2">空气质量、粉尘情况</th>
    <td colspan="2">
		<ex:dicDisplay dictIdentify="GoodOrBad" dictValue="${ePatrolRecordExcavation.safetyResult3}"/>
	</td>
  </tr>
  <tr>
    <th height="35" colspan="2">现场有无消防器材</th>
    <td colspan="2">
    	<ex:dicDisplay dictIdentify="YesOrNo" dictValue="${ePatrolRecordExcavation.safetyResult4}"/>
    </td>
  </tr>
  <tr>
    <th height="36" colspan="2">隧道内运输状况</th>
    <td colspan="2">
    	<ex:dicDisplay dictIdentify="GoodOrBad" dictValue="${ePatrolRecordExcavation.safetyResult5}"/>
    </td>
  </tr>
  <tr>
    <th height="35" colspan="2">用电是否混乱</th>
    <td colspan="2">
    	<ex:dicDisplay dictIdentify="YesNo" dictValue="${ePatrolRecordExcavation.safetyResult6}"/>
    </td>
  </tr>
  <tr>
    <th height="35" colspan="2">安全通道设置</th>
    <td colspan="2">
    	<ex:dicDisplay dictIdentify="YesNo" dictValue="${ePatrolRecordExcavation.safetyResult7}" />
    </td>
  </tr>
  
  <tr>
    <th rowspan="5">监测情况</th>
    <th height="36" colspan="2">监测项目是否齐全</th>
    <td colspan="2">
		<ex:dicDisplay dictIdentify="YesNo" dictValue="${ePatrolRecordExcavation.monitorResult1}" />
		<c:if test="${ePatrolRecordExcavation.monitorResult1Temp!=null}">
		;缺失项:${ePatrolRecordExcavation.monitorResult1Temp}
		</c:if>
	</td>
    <td rowspan="5">
		${ePatrolRecordExcavation.monitorRemark}
	</td>
  </tr>
  <tr>
    <th height="34" colspan="2">今日监测点损坏情况</th>
    <td colspan="2">
    ${ePatrolRecordExcavation.monitorResult2}
    </td>
  </tr>
  <tr>
    <th height="36" colspan="2">监测点布设情况</th>
    <td colspan="2">
		<ex:dicDisplay dictIdentify="Standard" dictValue="${ePatrolRecordExcavation.monitorResult3}"/>
	</td>
  </tr>
  <tr>
    <th height="35" colspan="2">超限数据与施工面位置关系</th>
    <td colspan="2">
    	${ePatrolRecordExcavation.monitorResult4}
    </td>
  </tr>
  <tr>
    <th height="36" colspan="2">超限监测数据变化趋势</th>
    <td colspan="2">
    	<ex:dicDisplay dictIdentify="VariationTrend" dictValue="${ePatrolRecordExcavation.monitorResult5}"/>
    </td>
  </tr>
  <tr>
    <th rowspan="6">重大环境风险源跟踪情况</th>
    <th height="36" colspan="2">非压力管线情况</th>
    <td colspan="2">
    ${ePatrolRecordExcavation.riskTrackResult1}
	</td>
    <td rowspan="6">${ePatrolRecordExcavation.riskTrackRemark}
	</td>
  </tr>
  <tr>
    <th height="34" colspan="2">压力管线情况（给水管）</th>
    <td colspan="2">
		 ${ePatrolRecordExcavation.riskTrackResult2}
    </td>
  </tr>
  <tr>
    <th height="36" colspan="2">压力管线情况（燃气管）</th>
    <td colspan="2">
		 ${ePatrolRecordExcavation.riskTrackResult3}
	</td>
  </tr>
  <tr>
    <th height="35" colspan="2">周边建（构）筑物变形情况</th>
    <td colspan="2">
    	 ${ePatrolRecordExcavation.riskTrackResult4}
    </td>
  </tr>
  <tr>
    <th height="36" colspan="2">周边道路（地面）变形、裂缝</th>
    <td colspan="2">
    	 ${ePatrolRecordExcavation.riskTrackResult5}
    </td>
  </tr>
  <tr>
    <th height="35" colspan="2">邻近施工情况</th>
    <td colspan="2">
    	 ${ePatrolRecordExcavation.riskTrackResult6}
  </tr>
  
  <tr>
    <th height="35">特殊工序情况说明</th>
    <td colspan="5">${ePatrolRecordExcavation.specialProgress}</td>
  </tr>
  <tr>
    <th height="39" colspan="3">现场巡视照片存放路径</th>
    <td colspan="3"> ${ePatrolRecordExcavation.picPath}</td>
  </tr>
  <tr>
    <th height="37">现场工程师签名：</th>
    <td colspan="2">${ePatrolRecordExcavation.engineerSignature}</td>
    <th>审定人意见及签名：</th>
    <td colspan="2">&nbsp;</td>
  </tr>
</table>
<!-- 附件查看 -->
<%@ include file="/commons/showFiles.jsp"%>
		<div class="saveDiv">
			<input id="btn_back" value="返  回" type="button" icon="icon_back"/>
		</div>
	</html:form>
	</body>
</html:html>
