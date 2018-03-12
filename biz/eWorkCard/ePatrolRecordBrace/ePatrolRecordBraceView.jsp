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
			saveValidateRequired("#btn_save",properties,"ePatrolRecordBraceForm");
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
<content tag="heading">武汉地铁工程高架施工安全风险巡视记录表</content>
<body>

<html:form action="ePatrolRecordBraceAction.do" styleClass="form" method="POST" styleId="ePatrolRecordBraceForm" enctype="multipart/form-data">
<input type="hidden" name="method" value="save">
<html:hidden property="conditionIdTemp" value="${condition.id}"/>
<html:hidden property="id" />
		
	<table class="listTables" bordercolorlight="#DDDDE0" bordercolordark="#ffffff" width="100%"  border="2" align="center" cellpadding="3" cellspacing="0">
 <tr >
    <th height="52" style="font-size:18px" colspan="6" class="STYLE2" ><div align="center">武汉地铁工程高架施工安全风险巡视记录表</div></th>
  </tr>
  <tr>
    <th width="272" height="35">工点名称：</th>
    <td width="260">${ePatrolRecordBrace.stationId.station_name}</td>
    <th width="279">天气：</th>
    <td width="251">${ePatrolRecordBrace.weather}</td>
    <th width="282">巡视时间：</th>
    <td width="275"> <fmt:formatDate value="${ePatrolRecordBrace.tourDate}" pattern="yyyy-MM-dd"/></td>
  </tr>
  <tr>
    <th height="37" colspan="6"><div align="center">工点进度说明</div></th>
  </tr>
  <tr>
    <td height="70" colspan="6">${ePatrolRecordBrace.progressNotes}</td>
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
    <td height="85" colspan="2">${ePatrolRecordBrace.pointSolve}</td>
    <td colspan="2">${ePatrolRecordBrace.implementation}</td>
    <td colspan="2">${ePatrolRecordBrace.newProblem}</td>
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
    <th rowspan="2">支护体系</th>
    <th height="34" colspan="2">承台基坑开挖成型质量，钢板柱围护情况</th>
    <td colspan="2">
    	<ex:dicDisplay dictIdentify="GoodOrBad" dictValue="${ePatrolRecordBrace.supportResult1}"/><br>
    	<ex:dicDisplay dictIdentify="DeformationCondition" dictValue="${ePatrolRecordBrace.supportResult1Temp}"/>
    </td>
    <td rowspan="2">${ePatrolRecordBrace.supportRemark}</td>
  </tr>
  <tr>
    <th height="34" colspan="2">桩基坑洞临边维护规范、及时性</th>
    <td colspan="2">
    	<ex:dicDisplay dictIdentify="StandardTimely" dictValue="${ePatrolRecordBrace.supportResult2}"/>
    </td>
    
  </tr>
  <tr>
    <th rowspan="6">支撑架体系</th>
    <th height="34" colspan="2">主体外防护脚手架搭设规范，及时性，变形情况</th>
    <td colspan="2">
    	<ex:dicDisplay dictIdentify="StandardTimely" dictValue="${ePatrolRecordBrace.braceResult1}"/><br>
    	<ex:dicDisplay dictIdentify="DeformationCondition" dictValue="${ePatrolRecordBrace.braceResult1Temp}"/>
    </td>
    <td rowspan="6">${ePatrolRecordBrace.braceRemark}</td>
  </tr>
  <tr>
    <th height="34" colspan="2">满堂支撑架架设规范防护及时性，变形情况</th>
    <td colspan="2">
    	<ex:dicDisplay dictIdentify="StandardTimely" dictValue="${ePatrolRecordBrace.braceResult2}"/><br>
    	<ex:dicDisplay dictIdentify="DeformationCondition" dictValue="${ePatrolRecordBrace.braceResult2Temp}"/>
    </td>
    
  </tr>
  <tr>
    <th height="34" colspan="2">满堂支撑架地基承载情况</th>
    <td colspan="2">
   
     <ex:dicDisplay dictIdentify="SoftFoundation" dictValue="${ePatrolRecordBrace.braceResult3}"/><br>
     <c:if test="${ePatrolRecordBrace.braceResult3Temp1!=null}">
    底托悬空:<ex:dicDisplay dictIdentify="YesOrNo" dictValue="${ePatrolRecordBrace.braceResult3Temp1}"/><br>
    </c:if>
    <c:if test="${ePatrolRecordBrace.braceResult3Temp2!=null}">
    架体底部高差:<ex:dicDisplay dictIdentify="YesOrNo" dictValue="${ePatrolRecordBrace.braceResult3Temp2}"/>
    </c:if>	
    </td>
    
  </tr><tr>
    <th height="34" colspan="2">承载支撑体系是否符合评估方案，搭设部位属于有效支撑</th>
    <td colspan="2">
    	<ex:dicDisplay dictIdentify="IfMeetDemand" dictValue="${ePatrolRecordBrace.braceResult4}"/><br>
    	<ex:dicDisplay dictIdentify="Effective" dictValue="${ePatrolRecordBrace.braceResult4Temp}"/>
    </td>
    
  </tr><tr>
    <th height="34" colspan="2">赝架中间受力承台下沉情况</th>
    <td colspan="2">
    	<ex:dicDisplay dictIdentify="SinkCondition" dictValue="${ePatrolRecordBrace.braceResult5}"/>
    </td>
    
  </tr><tr>
    <th height="34" colspan="2">支撑体系杆件情况，挂篮情况，支撑体系杆件衔接情况</th>
    <td colspan="2">
    	<ex:dicDisplay dictIdentify="RustCondtion" dictValue="${ePatrolRecordBrace.braceResult6}"/><br>
    	<ex:dicDisplay dictIdentify="DeformationCondition" dictValue="${ePatrolRecordBrace.braceResult6Temp1}"/><br>
    	<c:if test="${ePatrolRecordBrace.braceResult6Temp2!=null}">
    	杆件衔接:<ex:dicDisplay dictIdentify="Effective" dictValue="${ePatrolRecordBrace.braceResult6Temp2}"/>
    	</c:if>
    </td>
    
  </tr>
  <tr>
    <th rowspan="2">模板体系</th>
    <th height="34" colspan="2">模板架设是否符合方案</th>
    <td colspan="2">
    	<ex:dicDisplay dictIdentify="IfMeetDemand" dictValue="${ePatrolRecordBrace.modelResult1}"/><br>
    	<ex:dicDisplay dictIdentify="Effective" dictValue="${ePatrolRecordBrace.modelResult1Temp}"/>
    </td>
    <td rowspan="2">${ePatrolRecordBrace.modelRemark}</td>
  </tr>
  <tr>
    <th height="34" colspan="2">模板稳定性情况，倾斜情况，螺栓（对拉螺杆）连接情况</th>
    <td colspan="2">
    	<ex:dicDisplay dictIdentify="IfStable" dictValue="${ePatrolRecordBrace.modelResult2}"/><br>
    	<c:if test="${ePatrolRecordBrace.modelResult2Temp1!=null}">
    	倾斜情况:<ex:dicDisplay dictIdentify="YesOrNo" dictValue="${ePatrolRecordBrace.modelResult2Temp1}"/><br>
    	</c:if>
    	<c:if test="${ePatrolRecordBrace.modelResult2Temp2!=null}">
    	连接状态:<ex:dicDisplay dictIdentify="Effective" dictValue="${ePatrolRecordBrace.modelResult2Temp2}"/>
    	</c:if>
    </td>
    
  </tr>
  <tr>
    <th rowspan="8">施工工况</th>
    <th height="36" colspan="2">基坑排水设施运转情况</th>
    <td colspan="2">
		<ex:dicDisplay dictIdentify="NormalOrNot" dictValue="${ePatrolRecordBrace.conditionResult1}"  />
	</td>
    <td rowspan="8">
		${ePatrolRecordBrace.conditionRemark}
	</td>
  </tr>
  <tr>
    <th height="34" colspan="2">基坑开挖情况</th>
    <td colspan="2">
    <ex:dicDisplay dictIdentify="MeetDemand" dictValue="${ePatrolRecordBrace.conditionResult2}"  />
		
    </td>
  </tr>
  <tr>
    <th height="36" colspan="2">基坑周边地面堆载情况</th>
    <td colspan="2">
		 <ex:dicDisplay dictIdentify="YesOrNo" dictValue="${ePatrolRecordBrace.conditionResult3}"  />
	</td>
  </tr>
  <tr>
    <th height="35" colspan="2">主体结构施工时各工序规范操作，跟紧进度</th>
    <td colspan="2">
    	 <ex:dicDisplay dictIdentify="Standard" dictValue="${ePatrolRecordBrace.conditionResult4}"  /><br> 
    	 <ex:dicDisplay dictIdentify="FollowOrNot" dictValue="${ePatrolRecordBrace.conditionResult4Temp}"  />
    </td>
  </tr>
  <tr>
    <th height="36" colspan="2">特殊天气施工情况</th>
    <td colspan="2">
    	${ePatrolRecordBrace.conditionResult5}
    </td>
  </tr>
  <tr>
    <th height="35" colspan="2">吊装作业情况</th>
    <td colspan="2">
    	<ex:dicDisplay dictIdentify="Standard" dictValue="${ePatrolRecordBrace.conditionResult6}"  />
    </td>
  </tr>
  <tr>
    <th height="35" colspan="2">其他机械设备的运行情况</th>
    <td colspan="2">
    	<ex:dicDisplay dictIdentify="NormalOrNot" dictValue="${ePatrolRecordBrace.conditionResult7}" />
    </td>
  </tr>
  <tr>
    <th height="35" colspan="2">施工工序是否满足规范要求</th>
    <td colspan="2">
    	<ex:dicDisplay dictIdentify="MeetDemand" dictValue="${ePatrolRecordBrace.conditionResult8}"/>
    </td>
  </tr>
  
  <tr>
    <th rowspan="11">安全文明施工</th>
    <th height="36" colspan="2">承台，桩基，高空作业临边防护施做是否及时规范</th>
    <td colspan="2">
		<ex:dicDisplay dictIdentify="StandardTimely" dictValue="${ePatrolRecordBrace.safetyResult1}"  />
	</td>
    <td rowspan="11">
		${ePatrolRecordBrace.safetyRemark}
	</td>
  </tr>
  <tr>
    <th height="34" colspan="2">用电是否混乱</th>
    <td colspan="2">
		<ex:dicDisplay dictIdentify="YesNo" dictValue="${ePatrolRecordBrace.safetyResult2}"/>
    </td>
  </tr>
  <tr>
    <th height="36" colspan="2">现场有无消防器材</th>
    <td colspan="2">
		<ex:dicDisplay dictIdentify="YesOrNo" dictValue="${ePatrolRecordBrace.safetyResult3}"/>
	</td>
  </tr>
  <tr>
    <th height="35" colspan="2">有无安全通道</th>
    <td colspan="2">
    	<ex:dicDisplay dictIdentify="YesOrNo" dictValue="${ePatrolRecordBrace.safetyResult4}"/>
    </td>
  </tr>
  <tr>
    <th height="36" colspan="2">现场通风照明情况</th>
    <td colspan="2">
    	<ex:dicDisplay dictIdentify="GoodOrBad" dictValue="${ePatrolRecordBrace.safetyResult5}"/>
    </td>
  </tr>
  <tr>
    <th height="35" colspan="2">材料堆放规范性</th>
    <td colspan="2">
    	<ex:dicDisplay dictIdentify="Standard" dictValue="${ePatrolRecordBrace.safetyResult6}"/>
    </td>
  </tr>
  <tr>
    <th height="35" colspan="2">现场积水积泥</th>
    <td colspan="2">
    	<ex:dicDisplay dictIdentify="YesOrNo" dictValue="${ePatrolRecordBrace.safetyResult7}" />
    </td>
  </tr>
  <tr>
    <th height="35" colspan="2">现场封闭管理情况</th>
    <td colspan="2">
    	<ex:dicDisplay dictIdentify="SealOff" dictValue="${ePatrolRecordBrace.safetyResult8}" />
    </td>
  </tr>
  <tr>
    <th height="35" colspan="2">高空作业防护情况</th>
    <td colspan="2">
    	<ex:dicDisplay dictIdentify="StandardReasonable" dictValue="${ePatrolRecordBrace.safetyResult9}" />
    </td>
  </tr>
  <tr>
    <th height="35" colspan="2">防护密目网挂设规范，及时性</th>
    <td colspan="2">
    	<ex:dicDisplay dictIdentify="Standard" dictValue="${ePatrolRecordBrace.safetyResult10}" /><br>
    	<ex:dicDisplay dictIdentify="Timely" dictValue="${ePatrolRecordBrace.safetyResult10Temp}" />
    </td>
  </tr>
  <tr>
    <th height="35" colspan="2">高空落物防护情况</th>
    <td colspan="2">
    	<ex:dicDisplay dictIdentify="Standard" dictValue="${ePatrolRecordBrace.safetyResult11}" /><br>
    	<ex:dicDisplay dictIdentify="Timely" dictValue="${ePatrolRecordBrace.safetyResult11Temp}" />
    </td>
  </tr>
  <tr>
    <th rowspan="5">监测情况</th>
    <th height="36" colspan="2">监测项目是否齐全</th>
    <td colspan="2">
		<ex:dicDisplay dictIdentify="YesNo" dictValue="${ePatrolRecordBrace.pressureMonitorResult1}" />
		<c:if test="${ePatrolRecordBrace.pressureMonitorResult1Temp!=null}">
		;缺失项:${ePatrolRecordBrace.pressureMonitorResult1Temp}
		</c:if>
	</td>
    <td rowspan="5">
		${ePatrolRecordBrace.pressureMonitorRemark}
	</td>
  </tr>
  <tr>
    <th height="34" colspan="2">今日监测损坏情况</th>
    <td colspan="2">
		${ePatrolRecordBrace.pressureMonitorResult2}
    </td>
  </tr>
  <tr>
    <th height="36" colspan="2">监测布设情况</th>
    <td colspan="2">
		<ex:dicDisplay dictIdentify="Standard" dictValue="${ePatrolRecordBrace.pressureMonitorResult3}"/>
	</td>
  </tr>
  <tr>
    <th height="35" colspan="2">变形部位与施工面位置关系</th>
    <td colspan="2">
    	${ePatrolRecordBrace.pressureMonitorResult4}
    </td>
  </tr>
  <tr>
    <th height="36" colspan="2">变形监测数据变化趋势</th>
    <td colspan="2">
    	<ex:dicDisplay dictIdentify="ShapeVariationTrend" dictValue="${ePatrolRecordBrace.pressureMonitorResult5}"/>
    </td>
  </tr>
  <tr>
    <th rowspan="4">重大环境风险源跟踪情况</th>
    <th height="36" colspan="2">非压力管线情况</th>
    <td colspan="2">
		${ePatrolRecordBrace.riskTrackResult1}
	</td>
    <td rowspan="4">
		${ePatrolRecordBrace.riskTrackRemark}
	</td>
  </tr>
  <tr>
    <th height="34" colspan="2">压力管线情况（给水管）</th>
    <td colspan="2">
		${ePatrolRecordBrace.riskTrackResult2}
    </td>
  </tr>
  <tr>
    <th height="36" colspan="2">压力管线情况（燃气管）</th>
    <td colspan="2">
		${ePatrolRecordBrace.riskTrackResult3}
	</td>
  </tr>
  <tr>
    <th height="35" colspan="2">邻近施工情况</th>
    <td colspan="2">
    	${ePatrolRecordBrace.riskTrackResult4}
    </td>
  </tr>
  
  <tr>
    <th height="35">特殊工序情况说明</th>
    <td colspan="5">${ePatrolRecordBrace.specialProgress}</td>
  </tr>
  <tr>
    <th height="39" colspan="3">现场巡视照片存放路径</th>
    <td colspan="3">${ePatrolRecordBrace.picPath}</td>
  </tr>
  <tr>
    <th height="37">现场工程师签名：</th>
    <td colspan="2">${ePatrolRecordBrace.engineerSignature}</td>
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
