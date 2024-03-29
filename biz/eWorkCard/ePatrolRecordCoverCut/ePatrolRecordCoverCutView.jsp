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
			saveValidateRequired("#btn_save",properties,"ePatrolRecordCoverCutForm");
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
<content tag="heading">武汉地铁工程盖挖法基坑施工安全风险巡视记录表</content>
<body>

<html:form action="ePatrolRecordCoverCutAction.do" styleClass="form" method="POST" styleId="ePatrolRecordCoverCutForm" enctype="multipart/form-data">
<input type="hidden" name="method" value="save">
<html:hidden property="conditionIdTemp" value="${condition.id}"/>
<html:hidden property="id" />
		
	<table class="listTables" bordercolorlight="#DDDDE0" bordercolordark="#ffffff" width="100%"  border="1" align="center" cellpadding="3" cellspacing="0">
 <tr >
    <th height="52" colspan="6" style="font-size:18px" class="STYLE2" ><div align="center">武汉地铁工程盖挖法基坑施工安全风险巡视记录表</div></th>
  </tr>
  <tr>
    <th width="272" height="35">工点名称：</th>
    <td width="260">${ePatrolRecordCoverCut.stationId.station_name}</td>
    <th width="279">天气：</th>
    <td width="251">${ePatrolRecordCoverCut.weather}</td>
    <th width="282">巡视时间：</th>
    <td width="275"> <fmt:formatDate value="${ePatrolRecordCoverCut.tourDate}" pattern="yyyy-MM-dd"/></td>
  </tr>
  <tr>
    <th height="37" colspan="6"><div align="center">工点进度说明</div></th>
  </tr>
  <tr>
    <td height="70" colspan="6">${ePatrolRecordCoverCut.progressNotes}</td>
  </tr>
  <tr>
    <th height="37" colspan="6"><div align="center">安全风险巡视计划及落实表</div></th>
  </tr>
  <tr>
    <td height="27" colspan="2"><div align="center">计划巡视重点及拟解决问题</div></td>
    <th colspan="2"><div align="center">巡视综合落实情况 </div></th>
    <th colspan="2"><div align="center">新发现问题</div></th>
  </tr>
  <tr>
    <td height="85" colspan="2">${ePatrolRecordCoverCut.pointSolve}</td>
    <td colspan="2">${ePatrolRecordCoverCut.implementation}</td>
    <td colspan="2">${ePatrolRecordCoverCut.newProblem}</td>
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
    <th rowspan="8">支护体系</th>
    <th height="34" colspan="2">支护结构成槽质量及浇注成型质量</th>
    <td colspan="2">
    	<ex:dicDisplay dictIdentify="GoodOrBad" dictValue="${ePatrolRecordCoverCut.supportResult1}"/>
    </td>
     <td>${ePatrolRecordCoverCut.supportRemark1}</td>
  </tr>
  <tr>
    <th height="34" colspan="2">混凝土支撑、钢支撑架设及时性</th>
    <td colspan="2">
    	<ex:dicDisplay dictIdentify="Timely" dictValue="${ePatrolRecordCoverCut.supportResult2}"/>
    </td>
    <td rowspan="7">${ePatrolRecordCoverCut.supportRemark2}</td>
  </tr>
  <tr>
    <th height="36" colspan="2">冠梁、支撑、围檩变形、裂缝情况 </th>
    <td colspan="2">
    	<ex:dicDisplay dictIdentify="DeformationCondition" dictValue="${ePatrolRecordCoverCut.supportResult3}"/>
    </td>
  </tr>
  <tr>
    <th height="33" colspan="2">支撑、围檩安装规范性、网喷及时性</th>
    <td colspan="2">
		<ex:dicDisplay dictIdentify="Standard" dictValue="${ePatrolRecordCoverCut.supportResult4}"/><br>
		<ex:dicDisplay dictIdentify="Timely" dictValue="${ePatrolRecordCoverCut.supportResult4Temp}"/>    
    </td>
  </tr>
  <tr>
    <th height="34" colspan="2">格构柱变形情况</th>
    <td colspan="2">
    	<ex:dicDisplay dictIdentify="DeformationCondition" dictValue="${ePatrolRecordCoverCut.supportResult5}"/>
    </td>
  </tr>
  <tr>
    <th height="34" colspan="2">围护结构是否有渗漏</th>
    <td colspan="2">
		<ex:dicDisplay dictIdentify="Leakage" dictValue="${ePatrolRecordCoverCut.supportResult6}"/>
    </td>
  </tr>
  <tr>
    <th height="35" colspan="2">墙后土体有无沉陷、裂缝及滑移</th>
    <td colspan="2">
    	<ex:dicDisplay dictIdentify="YesOrNo" dictValue="${ePatrolRecordCoverCut.supportResult7}"/>
    </td>
  </tr>
  <tr>
    <th height="33" colspan="2">基坑有无涌土、流砂、管涌情况 </th>
    <td colspan="2">
    	<ex:dicDisplay dictIdentify="YesOrNo" dictValue="${ePatrolRecordCoverCut.supportResult8}"/>
    </td>
  </tr>
  <tr>
    <th rowspan="10">施工工况</th>
    <th height="36" colspan="2">基坑地质情况</th>
    <td colspan="2">
			${ePatrolRecordCoverCut.conditionResult1}
	</td>
    <td rowspan="10">
		${ePatrolRecordCoverCut.conditionRemark}
	</td>
  </tr>
  <tr>
    <th height="34" colspan="2">基坑水文情况</th>
    <td colspan="2">
		${ePatrolRecordCoverCut.conditionResult2}
    </td>
  </tr>
  <tr>
    <th height="36" colspan="2">基坑降水设施运转情况</th>
    <td colspan="2">
		<ex:dicDisplay dictIdentify="NormalOrNot" dictValue="${ePatrolRecordCoverCut.conditionResult3}"/>
	</td>
  </tr>
  <tr>
    <th height="35" colspan="2">基坑开挖分段、分层放坡施工、开挖时间</th>
    <td colspan="2">
    	<ex:dicDisplay dictIdentify="MeetDemand" dictValue="${ePatrolRecordCoverCut.conditionResult4}"/>
    </td>
  </tr>
  <tr>
    <th height="36" colspan="2">基坑周边地面堆载情况</th>
    <td colspan="2">
    	<ex:dicDisplay dictIdentify="YesOrNo" dictValue="${ePatrolRecordCoverCut.conditionResult5}"/>
    </td>
  </tr>
  <tr>
    <th height="35" colspan="2">主体结构施工时脚手架搭设规范性、主体结构施工是否跟紧开挖面</th>
    <td colspan="2">
    	<ex:dicDisplay dictIdentify="Standard" dictValue="${ePatrolRecordCoverCut.conditionResult6}"/><br>
    	<ex:dicDisplay dictIdentify="FollowOrNot" dictValue="${ePatrolRecordCoverCut.conditionResult6Temp}"/>
    </td>
  </tr>
  <tr>
    <th height="35" colspan="2">特殊天气施工情况</th>
    <td colspan="2">
    	${ePatrolRecordCoverCut.conditionResult7}
    </td>
  </tr>
  <tr>
    <th height="35" colspan="2">吊装作业情况</th>
    <td colspan="2">
    	<ex:dicDisplay dictIdentify="Standard" dictValue="${ePatrolRecordCoverCut.conditionResult8}"/>
    </td>
  </tr>
  <tr>
    <th height="33" colspan="2">其它机械设备的运行情况</th>
    <td colspan="2">
    	<ex:dicDisplay dictIdentify="NormalOrNot" dictValue="${ePatrolRecordCoverCut.conditionResult9}"/>
    </td>
  </tr>
  <tr>
    <th height="35" colspan="2">施工工序是否满足规范要求</th>
    <td colspan="2">
    	<ex:dicDisplay dictIdentify="MeetDemand" dictValue="${ePatrolRecordCoverCut.conditionResult10}"/>
    </td>
  </tr>
  <tr>
    <th rowspan="8">安全文明施工</th>
    <th height="35" colspan="2">临边防护施做是否及时</th>
    <td colspan="2"><ex:dicDisplay dictIdentify="Timely" dictValue="${ePatrolRecordCoverCut.safetyResult1}"/> </td>
    <td rowspan="8">${ePatrolRecordCoverCut.safetyRemark}</td>
   </tr>
  <tr>
    <th height="34" colspan="2">用电是否混乱</th>
    <td colspan="2"><ex:dicDisplay dictIdentify="YesNo" dictValue="${ePatrolRecordCoverCut.safetyResult2}"/></td>
  </tr>
  <tr>
    <th height="36" colspan="2">现场有无消防器材</th>
    <td colspan="2"><ex:dicDisplay dictIdentify="YesOrNo" dictValue="${ePatrolRecordCoverCut.safetyResult3}"/></td>
  </tr>
  <tr>
    <th height="35" colspan="2">有无安全通道</th>
    <td colspan="2"><ex:dicDisplay dictIdentify="YesOrNo" dictValue="${ePatrolRecordCoverCut.safetyResult4}"/></td>
  </tr>
  <tr>
    <th height="33" colspan="2">现场通风照明情况</th>
    <td colspan="2"><ex:dicDisplay dictIdentify="GoodOrBad" dictValue="${ePatrolRecordCoverCut.safetyResult5}"/></td>
  </tr>
  <tr>
    <th height="34" colspan="2">材料堆放规范性</th>
    <td colspan="2"><ex:dicDisplay dictIdentify="Standard" dictValue="${ePatrolRecordCoverCut.safetyResult6}"/></td>
  </tr>
  <tr>
    <th height="34" colspan="2">现场积水积泥</th>
    <td colspan="2"><ex:dicDisplay dictIdentify="YesOrNo" dictValue="${ePatrolRecordCoverCut.safetyResult7}"/></td>
  </tr>
  <tr>
    <th height="35" colspan="2">现场封闭情况管理</th>
    <td colspan="2"><ex:dicDisplay dictIdentify="SealOff" dictValue="${ePatrolRecordCoverCut.safetyResult8}"/></td>
  </tr>
  <tr>
    <th rowspan="5">监测情况</th>
    <th height="34" colspan="2">监测项目是否齐全</th>
    <td colspan="2">
    <ex:dicDisplay dictIdentify="YesNo" dictValue="${ePatrolRecordCoverCut.monitorResult1}"/>
    <c:if test="${ePatrolRecordCoverCut.monitorResult1Temp!=null}">
    ;缺失项:${ePatrolRecordCoverCut.monitorResult1Temp}
    </c:if>
    </td>
   <td rowspan="5">${ePatrolRecordCoverCut.monitorRemark}</td>
 </tr>
  <tr>
    <th height="34" colspan="2">今日监测点损坏情况</th>
  <td colspan="2">${ePatrolRecordCoverCut.monitorResult2}</td>
 </tr>
  <tr>
    <th height="35" colspan="2">监测点布设情况</th>
    <td colspan="2"><ex:dicDisplay dictIdentify="Standard" dictValue="${ePatrolRecordCoverCut.monitorResult3}"/></td>
  </tr>
  <tr>
    <th height="35" colspan="2">超限数据与施工面位置关系</th>
    <td colspan="2">${ePatrolRecordCoverCut.monitorResult4}</td>
  </tr>
  <tr>
    <th height="33" colspan="2">超限监测数据变化趋势</th>
    <td colspan="2"><ex:dicDisplay dictIdentify="VariationTrend" dictValue="${ePatrolRecordCoverCut.monitorResult5}"/></td>
  </tr>
  <tr>
    <th rowspan="6">重大环境风险源跟踪情况</th>
    <th height="34" colspan="2">非压力管线情况</th>
    <td colspan="2">${ePatrolRecordCoverCut.riskTrackResult1}</td>
    <td rowspan="6">${ePatrolRecordCoverCut.riskTrackRemark}</td>
  </tr>
  <tr>
    <th height="36" colspan="2">压力管线情况（给水管）</th>
     <td colspan="2">${ePatrolRecordCoverCut.riskTrackResult2}</td>
  </tr>
  <tr>
    <th height="34" colspan="2">压力管线情况（燃气管）</th>
   <td colspan="2">${ePatrolRecordCoverCut.riskTrackResult3}</td>
   </tr>
  <tr>
    <th height="35" colspan="2">周边建（构）筑物变形情况</th>
   <td colspan="2">${ePatrolRecordCoverCut.riskTrackResult4}</td>
    </tr>
  <tr>
    <th height="36" colspan="2">周边道路（地面）变形、裂缝</th>
    <td colspan="2">${ePatrolRecordCoverCut.riskTrackResult5}</td>
  </tr>
  <tr>
    <th height="34" colspan="2">邻近施工情况</th>
    <td colspan="2">${ePatrolRecordCoverCut.riskTrackResult6}</td>
   </tr>
  <tr>
    <th height="35">特殊工序情况说明</th>
     <td colspan="5">${ePatrolRecordCoverCut.specialProgress}</td>
   </tr>
  <tr>
    <th height="39" colspan="3">现场巡视照片存放路径</th>
    <td colspan="3">${ePatrolRecordCoverCut.picPath}</td>
    </tr>
  <tr>
    <th height="37">现场工程师签名：</th>
    <td colspan="2">${ePatrolRecordCoverCut.engineerSignature}</td>
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
