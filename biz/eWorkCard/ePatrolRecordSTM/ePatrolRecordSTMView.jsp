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
			saveValidateRequired("#btn_save",properties,"ePatrolRecordSTMForm");
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
<content tag="heading">武汉地铁工程盾构法隧道施工安全风险巡视记录表</content>
<body>

<html:form action="ePatrolRecordSTMAction.do" styleClass="form" method="POST" styleId="ePatrolRecordSTMForm" enctype="multipart/form-data">
<input type="hidden" name="method" value="save">
<html:hidden property="conditionIdTemp" value="${condition.id}"/>
<html:hidden property="id" />
		
	<table class="listTables" bordercolorlight="#DDDDE0" bordercolordark="#ffffff" width="100%"  border="1" align="center" cellpadding="3" cellspacing="0">
  <tr >
    <th height="52" colspan="7" style="font-size:18px" class="STYLE2" ><div align="center">武汉地铁工程盾构法隧道施工安全风险巡视记录表</div></th>
  </tr>
  <tr>
    <th height="35" colspan="2">工点名称：</th>
    <td width="217">${ePatrolRecordSTM.stationId.station_name}</td>
    <th width="218">天气：</th>
    <td width="197">${ePatrolRecordSTM.weather}</td>
    <th width="221">巡视时间：</th>
    <td width="318"> <fmt:formatDate value="${ePatrolRecordSTM.tourDate}" pattern="yyyy-MM-dd"/></td>
  </tr>
  <tr>
    <th height="37" colspan="7"><div align="center">工点进度说明</div></th>
  </tr>
  <tr>
    <td height="70" colspan="7">${ePatrolRecordSTM.progressNotes}</td>
  </tr>
  <tr>
    <th height="37" colspan="7"><div align="center">安全风险巡视计划及落实表</div></th>
  </tr>
  <tr>
    <th height="27" colspan="3"><div align="center">计划巡视重点及拟解决问题</div></th>
    <th colspan="2"><div align="center">巡视综合落实情况 </div></th>
    <th colspan="2"><div align="center">新发现问题</div></th>
  </tr>
  <tr>
    <td height="85" colspan="3">${ePatrolRecordSTM.pointSolve}</td>
    <td colspan="2">${ePatrolRecordSTM.implementation}</td>
    <td colspan="2">${ePatrolRecordSTM.newProblem}</td>
  </tr>
  <tr>
    <th height="35" colspan="7"><div align="center">安全风险巡视评估表</div></th>
  </tr>
  <tr>
    <th height="56" colspan="2">巡视项目</th>
    <th colspan="2">巡视内容</th>
    <th colspan="2">巡视评估结果</th>
    <th>备注</th>
  </tr>
  <tr>
    <th width="47" rowspan="9">管片</th>
    <th width="93" rowspan="2">管片进场情况</th>
    <th height="40" colspan="2">管片进场情况</th>
    <td colspan="2">
    <c:if test="${ePatrolRecordSTM.pieceSituation1!=null}">
    	破损:<ex:dicDisplay dictIdentify="YesOrNo" dictValue="${ePatrolRecordSTM.pieceSituation1}"/><br>
    	</c:if>
    	<c:if test="${ePatrolRecordSTM.pieceSituation1Temp!=null}">
    	生产日期:<ex:dicDisplay dictIdentify="YesOrNo" dictValue="${ePatrolRecordSTM.pieceSituation1Temp}"/>
    	</c:if>
    </td>
<td rowspan="9">${ePatrolRecordSTM.pieceRemark}</td>
  </tr>
  <tr>
    <th height="34" colspan="2">管片存放情况</th>
    <td colspan="2">
    	${ePatrolRecordSTM.pieceSituation2}
    </td>
  </tr>
  <tr>
    <th width="93" rowspan="2">管片运输</th>
    <th height="36" colspan="2">吊装情况 </th>
    <td colspan="2">
    	<ex:dicDisplay dictIdentify="Standard" dictValue="${ePatrolRecordSTM.pieceSituation3}"/>
    </td>
  </tr>
  <tr>
    <th height="33" colspan="2">运输情况</th>
    <td colspan="2">
		<ex:dicDisplay dictIdentify="Standard" dictValue="${ePatrolRecordSTM.pieceSituation4}"/>    
    </td>
  </tr>
  <tr>
    <th width="93" rowspan="5">拼装情况</th>
    <th height="34" colspan="2">管片密封条情况</th>
    <td colspan="2">
    	<ex:dicDisplay dictIdentify="TubeSealCondition" dictValue="${ePatrolRecordSTM.pieceSituation5}"/>
    </td>
  </tr>
  <tr>
    <th height="34" colspan="2">管片错台(径向环向状况)</th>
    <td colspan="2">
		<ex:dicDisplay dictIdentify="TubeWrongStation" dictValue="${ePatrolRecordSTM.pieceSituation6}"/>
		<c:if test="${ePatrolRecordSTM.pieceSituation6Temp!=null}">
		;环数:${ePatrolRecordSTM.pieceSituation6Temp}
		</c:if>
    </td>
  </tr>
  <tr>
    <th height="35" colspan="2">管片裂缝,缺角,掉块情况</th>
    <td colspan="2">
    	<ex:dicDisplay dictIdentify="YesOrNo" dictValue="${ePatrolRecordSTM.pieceSituation7}"/>
    </td>
  </tr>
  <tr>
    <th height="33" colspan="2">管片拼装外形状况 </th>
    <td colspan="2">
    	${ePatrolRecordSTM.pieceSituation8}
    </td>
  </tr>
  <tr>
    <th height="33" colspan="2">渗漏水情况 </th>
    <td colspan="2">
    	<ex:dicDisplay dictIdentify="YesOrNo" dictValue="${ePatrolRecordSTM.pieceSituation9}"/>
    	<c:if test="${ePatrolRecordSTM.pieceSituation9Temp!=null}">
    	;环数:${ePatrolRecordSTM.pieceSituation9Temp}
    	</c:if>
    </td>
  </tr>
  <tr>
    <th colspan="2" rowspan="11">施工工况</th>
    <th height="36" colspan="2">始发情况</th>
    <td colspan="2">
		${ePatrolRecordSTM.conditionResult1}
	</td>
    <td rowspan="11">
		${ePatrolRecordSTM.conditionRemark}
	</td>
  </tr>
  <tr>
    <th height="34" colspan="2">线间距情况</th>
    <td colspan="2">
		<ex:dicDisplay dictIdentify="LineSpacing" dictValue="${ePatrolRecordSTM.conditionResult2}"/>
    </td>
  </tr>
  <tr>
    <th height="36" colspan="2">覆土情况</th>
    <td colspan="2">
		${ePatrolRecordSTM.conditionResult3}
	</td>
  </tr>
  <tr>
    <th height="35" colspan="2">盾构姿态控制情况</th>
    <td colspan="2">
    	${ePatrolRecordSTM.conditionResult4}
    </td>
  </tr>
  <tr>
    <th height="36" colspan="2">盾构推进速度情况</th>
    <td colspan="2">
    	${ePatrolRecordSTM.conditionResult5}
    </td>
  </tr>
  <tr>
    <th height="35" colspan="2">盾构穿越地层情况</th>
    <td colspan="2">
    	${ePatrolRecordSTM.conditionResult6}
    </td>
  </tr>
  <tr>
    <th height="35" colspan="2">同步注浆情况</th>
    <td colspan="2">
    	${ePatrolRecordSTM.conditionResult7}
    </td>
  </tr>
  <tr>
    <th height="35" colspan="2">盾构掘进综合状况描述</th>
    <td colspan="2">
    	${ePatrolRecordSTM.conditionResult8}
    </td>
  </tr>
  <tr>
    <th height="33" colspan="2">二次注浆情况</th>
    <td colspan="2">
    	<ex:dicDisplay dictIdentify="YesOrNo" dictValue="${ePatrolRecordSTM.conditionResult9}"/>
    </td>
  </tr>
  <tr>
    <th height="35" colspan="2">接收情况</th>
    <td colspan="2">
    	${ePatrolRecordSTM.conditionResult10}
    </td>
  </tr>
  <tr>
    <th height="35" colspan="2">联络通道施工情况</th>
    <td colspan="2">
    	${ePatrolRecordSTM.conditionResult11}
    </td>
  </tr>
  <tr>
    <th colspan="2" rowspan="7">安全文明施工</th>
    <th height="35" colspan="2">隧道内是否积水积泥</th>
    <td colspan="2"><ex:dicDisplay dictIdentify="YesNo" dictValue="${ePatrolRecordSTM.safetyResult1}"/></td>
    <td rowspan="7">${ePatrolRecordSTM.safetyRemark}</td>
  </tr>
  <tr>
    <th height="34" colspan="2">轨道高差,线距是否满足要求</th>
    <td colspan="2"><ex:dicDisplay dictIdentify="YesNo" dictValue="${ePatrolRecordSTM.safetyResult2}"/></td>
  </tr>
  <tr>
    <th height="36" colspan="2">照明,通风是否到位</th>
    <td colspan="2"><ex:dicDisplay dictIdentify="YesNo" dictValue="${ePatrolRecordSTM.safetyResult3}"/></td>
  </tr>
  <tr>
    <th height="35" colspan="2">不良气体报警装置是否有效</th>
    <td colspan="2"><ex:dicDisplay dictIdentify="YesNo" dictValue="${ePatrolRecordSTM.safetyResult4}"/></td>
  </tr>
  <tr>
    <th height="33" colspan="2">消防应急物资是否到位</th>
    <td colspan="2"><ex:dicDisplay dictIdentify="YesNo" dictValue="${ePatrolRecordSTM.safetyResult5}"/></td>
  </tr>
  <tr>
    <th height="34" colspan="2">走道板及防护是否到位</th>
    <td colspan="2"><ex:dicDisplay dictIdentify="YesNo" dictValue="${ePatrolRecordSTM.safetyResult6}"/></td>
  </tr>
  <tr>
    <th height="34" colspan="2">用电安全是否满足规范要求</th>
    <td colspan="2"><ex:dicDisplay dictIdentify="YesNo" dictValue="${ePatrolRecordSTM.safetyResult7}"/></td>
  </tr>
  
  <tr>
    <th colspan="2" rowspan="5">监测情况</th>
    <th height="34" colspan="2">监测项目是否齐全</th>
    <td colspan="2">
    <ex:dicDisplay dictIdentify="YesNo" dictValue="${ePatrolRecordSTM.monitorResult1}"/>
    <c:if test="${ePatrolRecordSTM.monitorResult1Temp!=null}">
    ;缺失项:${ePatrolRecordSTM.monitorResult1Temp}
    </c:if>
    </td>
    <td rowspan="4">${ePatrolRecordSTM.monitorRemark1}</td>
  </tr>
  <tr>
    <th height="34" colspan="2">今日监测点损坏情况</th>
    <td colspan="2">${ePatrolRecordSTM.monitorResult2}</td>
  </tr>
  <tr>
    <th height="35" colspan="2">监测点布设情况</th>
    <td colspan="2"><ex:dicDisplay dictIdentify="Standard" dictValue="${ePatrolRecordSTM.monitorResult3}"/></td>
  </tr>
  <tr>
    <th height="35" colspan="2">超限数据与施工面位置关系</th>
    <td colspan="2">${ePatrolRecordSTM.monitorResult4}</td>
  </tr>
  <tr>
    <th height="33" colspan="2">超限监测数据变化趋势</th>
    <td colspan="2"><ex:dicDisplay dictIdentify="VariationTrend" dictValue="${ePatrolRecordSTM.monitorResult5}"/></td>
    <td>${ePatrolRecordSTM.monitorRemark2}</td>
  </tr>
  <tr>
    <th colspan="2" rowspan="7">重大环境风险源跟踪情况</th>
    <th height="34" colspan="2">非压力管线情况</th>
    <td colspan="2">${ePatrolRecordSTM.riskTrackResult1}</td>
    <td rowspan="7">${ePatrolRecordSTM.riskTrackRemark}</td>
  </tr>
  <tr>
    <th height="36" colspan="2">压力管线情况（给水管）</th>
    <td colspan="2">${ePatrolRecordSTM.riskTrackResult2}</td>
  </tr>
  <tr>
    <th height="34" colspan="2">压力管线情况（燃气管）</th>
    <td colspan="2">${ePatrolRecordSTM.riskTrackResult3}</td>
  </tr>
  <tr>
    <th height="35" colspan="2">穿越建（构）筑物情况</th>
    <td colspan="2">${ePatrolRecordSTM.riskTrackResult4}</td>
  </tr>
  <tr>
    <th height="36" colspan="2">穿越道路（地面)情况</th>
    <td colspan="2">${ePatrolRecordSTM.riskTrackResult5}</td>
  </tr>
  <tr>
    <th height="34" colspan="2">穿越河流,湖泊情况</th>
    <td colspan="2">${ePatrolRecordSTM.riskTrackResult6}</td>
  </tr>
   <tr>
    <th height="34" colspan="2">邻近施工情况</th>
    <td colspan="2">${ePatrolRecordSTM.riskTrackResult7}</td>
  </tr>
  <tr>
    <th height="35" colspan="2">特殊工序情况说明</th>
    <td colspan="5">${ePatrolRecordSTM.specialProgress}</td>
  </tr>
  <tr>
    <th height="39" colspan="4">现场巡视照片存放路径</th>
    <td colspan="3">${ePatrolRecordSTM.picPath}</td>
  </tr>
  <tr>
    <th height="37" colspan="2">现场工程师签名：</th>
    <td colspan="2">${ePatrolRecordSTM.engineerSignature}</td>
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
