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
			 document.forms[0].action='eTourConditionAction.do?method=engineerList'; 
			    document.forms[0].submit();
	    }); 

		 $("[type='radio']").change(function(){
			 $("[name='"+this.name+"Value']").val($("input[name='"+this.name+"']:checked")[0].nextSibling.nodeValue.replace(/^(\s|\u00A0)+/,'').replace(/(\s|\u00A0)+$/,''));
	    });

$("[type='radio']").click(function(){
	     	 
	     	 var checkValue=$("input[name='"+this.name+"']:checked").val();
	     	 var checkOldValue=$("[name='"+this.name+"Old']").val();
	     	 if($("[name='"+this.name+"Old']").val()==$("input[name='"+this.name+"']:checked").val()){
	     	 		$("[name='"+this.name+"']").removeAttr("checked");
	     	 		$("[name='"+this.name+"Old']").val('');	  
	     	 		$("[name='"+this.name+"Value']").val('');	   	 		
	     	 }else{
	     	 	$("[name='"+this.name+"Old']").val(checkValue);	     	 
	     	 }     	
	     });
	}); 
	//监测项目缺失
	function showText(id,value){
		if(value=='1'){
		$("."+id).hide()
		$("[name='"+id+"Temp']").val("");
		}else{
		$("."+id).show()
	}
	}
	//管片错台
	function showText1(id,value){
		if(value=='1'){
		$("."+id).hide()
		$("[name='"+id+"Temp']").val("");
		}else{
		$("."+id).show()
	}
	}
	//渗透水
    function showText2(id,value){
		if(value=='2'){
		$("."+id).hide()
		$("[name='"+id+"Temp']").val("");
		}else{
		$("."+id).show()
	}
	}
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

<html:hidden property="pieceSituation1Value" />
<html:hidden property="pieceSituation1TempValue" />
<html:hidden property="pieceSituation3Value" />
<html:hidden property="pieceSituation4Value" />
<html:hidden property="pieceSituation5Value" />
<html:hidden property="pieceSituation6Value" />
<html:hidden property="pieceSituation7Value" />
<html:hidden property="pieceSituation9Value" />
<html:hidden property="conditionResult2Value" />
<html:hidden property="conditionResult9Value" />
<html:hidden property="safetyResult1Value" />
<html:hidden property="safetyResult2Value" />
<html:hidden property="safetyResult3Value" />
<html:hidden property="safetyResult4Value" />
<html:hidden property="safetyResult5Value" />
<html:hidden property="safetyResult6Value" />
<html:hidden property="safetyResult7Value" />
<html:hidden property="monitorResult1Value" />
<html:hidden property="monitorResult3Value" />
<html:hidden property="monitorResult5Value" />

<html:hidden property="pieceSituation1Old" />
<html:hidden property="pieceSituation1TempOld" />
<html:hidden property="pieceSituation3Old" />
<html:hidden property="pieceSituation4Old" />
<html:hidden property="pieceSituation5Old" />
<html:hidden property="pieceSituation6Old" />
<html:hidden property="pieceSituation7Old" />
<html:hidden property="pieceSituation9Old" />
<html:hidden property="conditionResult2Old" />
<html:hidden property="conditionResult9Old" />
<html:hidden property="safetyResult1Old" />
<html:hidden property="safetyResult2Old" />
<html:hidden property="safetyResult3Old" />
<html:hidden property="safetyResult4Old" />
<html:hidden property="safetyResult5Old" />
<html:hidden property="safetyResult6Old" />
<html:hidden property="safetyResult7Old" />
<html:hidden property="monitorResult1Old" />
<html:hidden property="monitorResult3Old" />
<html:hidden property="monitorResult5Old" />

		
	<table class="listTables" bordercolorlight="#DDDDE0" bordercolordark="#ffffff" width="100%"  border="1" align="center" cellpadding="3" cellspacing="0">
  <tr >
    <th height="52" colspan="7" style="font-size:18px" class="STYLE2" ><div align="center">武汉地铁工程盾构法隧道施工安全风险巡视记录表</div></th>
  </tr>
  <tr>
    <th height="35" colspan="2">工点名称：</th>
    <td width="217">${condition.stationId.station_name}</td>
    <th width="218">天气：</th>
    <td width="197"><html:text property="weather" value="${ePatrolRecordSTMPre.weather}" styleClass="inputText" maxlength="100" size="30" /></td>
    <th width="221">巡视时间：</th>
    <td width="318"> <fmt:formatDate value="${condition.tourDate}" pattern="yyyy-MM-dd"/></td>
  </tr>
  <tr>
    <th height="37" colspan="7"><div align="center">工点进度说明</div></th>
  </tr>
  <tr>
    <td height="70" colspan="7"><html:textarea property="progressNotes" value="${ePatrolRecordSTMPre.progressNotes}"/></td>
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
    <td height="85" colspan="3"><html:textarea property="pointSolve" value="${ePatrolRecordSTMPre.pointSolve}"/></td>
    <td colspan="2"><html:textarea property="implementation" value="${ePatrolRecordSTMPre.implementation}"/></td>
    <td colspan="2"><html:textarea property="newProblem" value="${ePatrolRecordSTMPre.newProblem}"/></td>
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
    	破损:<ex:dictRadio type="YesOrNo" property="pieceSituation1"/><br><span></span>
    	生产日期:<ex:dictRadio type="YesOrNo" property="pieceSituation1Temp"/>
    </td>
    <td rowspan="9"><html:textarea property="pieceRemark" value="${ePatrolRecordSTMPre.pieceRemark}" style="height:300px"/></td>
  </tr>
  <tr>
    <th height="34" colspan="2">管片存放情况</th>
    <td colspan="2">
    	<html:text property="pieceSituation2" value="${ePatrolRecordSTMPre.pieceSituation2}" styleClass="inputText" maxlength="100" size="30" />
    </td>
  </tr>
  <tr>
    <th width="93" rowspan="2">管片运输</th>
    <th height="36" colspan="2">吊装情况 </th>
    <td colspan="2">
    	<ex:dictRadio type="Standard" property="pieceSituation3"/>
    </td>
  </tr>
  <tr>
    <th height="33" colspan="2">运输情况</th>
    <td colspan="2">
		<ex:dictRadio type="Standard" property="pieceSituation4"/>    
    </td>
  </tr>
  <tr>
    <th width="93" rowspan="5">拼装情况</th>
    <th height="34" colspan="2">管片密封条情况</th>
    <td colspan="2">
    	<ex:dictRadio type="TubeSealCondition" property="pieceSituation5"/>
    </td>
  </tr>
  <tr>
    <th height="34" colspan="2">管片错台(径向环向状况)</th>
    <td colspan="2">
		<ex:dictRadio type="TubeWrongStation" property="pieceSituation6" onclick="showText1(this.name,this.value)"/><br><span></span>
		<div class="pieceSituation6" style="display: none">
		环数:<html:text property="pieceSituation6Temp" value="${ePatrolRecordSTMPre.pieceSituation6Temp}" styleClass="inputText" maxlength="100" size="30" />
		</div>
		 </td>
  </tr>
  <tr>
    <th height="35" colspan="2">管片裂缝,缺角,掉块情况</th>
    <td colspan="2">
    	<ex:dictRadio type="YesOrNo" property="pieceSituation7"/>
    </td>
  </tr>
  <tr>
    <th height="33" colspan="2">管片拼装外形状况 </th>
    <td colspan="2">
    	<html:text property="pieceSituation8" value="${ePatrolRecordSTMPre.pieceSituation8}" styleClass="inputText" maxlength="100" size="30" />
    </td>
  </tr>
  <tr>
    <th height="33" colspan="2">渗漏水情况 </th>
    <td colspan="2">
    	<ex:dictRadio type="YesOrNo" property="pieceSituation9" onclick="showText2(this.name,this.value)"/><br><span></span>
    	<div class="pieceSituation9" style="display: none;">
    	环数:<html:text property="pieceSituation9Temp" value="${ePatrolRecordSTMPre.pieceSituation9Temp}" styleClass="inputText" maxlength="100" size="30" />
    	</div>
    	 </td>
  </tr>
  <tr>
    <th colspan="2" rowspan="11">施工工况</th>
    <th height="36" colspan="2">始发情况</th>
    <td colspan="2">
		<html:text property="conditionResult1" value="${ePatrolRecordSTMPre.conditionResult1}" styleClass="inputText" maxlength="100" size="30" />
	</td>
    <td rowspan="11">
		<html:textarea property="conditionRemark" value="${ePatrolRecordSTMPre.conditionRemark}"  style="height:300px"/>
	</td>
  </tr>
  <tr>
    <th height="34" colspan="2">线间距情况</th>
    <td colspan="2">
		<ex:dictRadio type="LineSpacing" property="conditionResult2"/>
    </td>
  </tr>
  <tr>
    <th height="36" colspan="2">覆土情况</th>
    <td colspan="2">
		<html:text property="conditionResult3" value="${ePatrolRecordSTMPre.conditionResult3}" styleClass="inputText" maxlength="100" size="30" />
	</td>
  </tr>
  <tr>
    <th height="35" colspan="2">盾构姿态控制情况</th>
    <td colspan="2">
    	<html:text property="conditionResult4" value="${ePatrolRecordSTMPre.conditionResult4}" styleClass="inputText" maxlength="100" size="30" />
    </td>
  </tr>
  <tr>
    <th height="36" colspan="2">盾构推进速度情况</th>
    <td colspan="2">
    	<html:text property="conditionResult5" value="${ePatrolRecordSTMPre.conditionResult5}" styleClass="inputText" maxlength="100" size="30" />
    </td>
  </tr>
  <tr>
    <th height="35" colspan="2">盾构穿越地层情况</th>
    <td colspan="2">
    	<html:text property="conditionResult6" value="${ePatrolRecordSTMPre.conditionResult6}" styleClass="inputText" maxlength="100" size="30" />
    </td>
  </tr>
  <tr>
    <th height="35" colspan="2">同步注浆情况</th>
    <td colspan="2">
    	<html:text property="conditionResult7" value="${ePatrolRecordSTMPre.conditionResult7}" styleClass="inputText" maxlength="100" size="30" />
    </td>
  </tr>
  <tr>
    <th height="35" colspan="2">盾构掘进综合状况描述</th>
    <td colspan="2">
    	<html:text property="conditionResult8" value="${ePatrolRecordSTMPre.conditionResult8}" styleClass="inputText" maxlength="100" size="30" />
    </td>
  </tr>
  <tr>
    <th height="33" colspan="2">二次注浆情况</th>
    <td colspan="2">
    	<ex:dictRadio type="YesOrNo" property="conditionResult9"/>
    </td>
  </tr>
  <tr>
    <th height="35" colspan="2">接收情况</th>
    <td colspan="2">
    	<html:text property="conditionResult10" value="${ePatrolRecordSTMPre.conditionResult10}" styleClass="inputText" maxlength="100" size="30" />
    </td>
  </tr>
  <tr>
    <th height="35" colspan="2">联络通道施工情况</th>
    <td colspan="2">
    	<html:text property="conditionResult11" value="${ePatrolRecordSTMPre.conditionResult11}" styleClass="inputText" maxlength="100" size="30" />
    </td>
  </tr>
  <tr>
    <th colspan="2" rowspan="7">安全文明施工</th>
    <th height="35" colspan="2">隧道内是否积水积泥</th>
    <td colspan="2"><ex:dictRadio type="YesNo" property="safetyResult1"/></td>
    <td rowspan="7"><html:textarea property="safetyRemark" value="${ePatrolRecordSTMPre.safetyRemark}"  style="height:300px"/></td>
  </tr>
  <tr>
    <th height="34" colspan="2">轨道高差,线距是否满足要求</th>
    <td colspan="2"><ex:dictRadio type="YesNo" property="safetyResult2"/></td>
  </tr>
  <tr>
    <th height="36" colspan="2">照明,通风是否到位</th>
    <td colspan="2"><ex:dictRadio type="YesNo" property="safetyResult3"/></td>
  </tr>
  <tr>
    <th height="35" colspan="2">不良气体报警装置是否有效</th>
    <td colspan="2"><ex:dictRadio type="YesNo" property="safetyResult4"/></td>
  </tr>
  <tr>
    <th height="33" colspan="2">消防应急物资是否到位</th>
    <td colspan="2"><ex:dictRadio type="YesNo" property="safetyResult5"/></td>
  </tr>
  <tr>
    <th height="34" colspan="2">走道板及防护是否到位</th>
    <td colspan="2"><ex:dictRadio type="YesNo" property="safetyResult6"/></td>
  </tr>
  <tr>
    <th height="34" colspan="2">用电安全是否满足规范要求</th>
    <td colspan="2"><ex:dictRadio type="YesNo" property="safetyResult7"/></td>
  </tr>
  
  <tr>
    <th colspan="2" rowspan="5">监测情况</th>
    <th height="34" colspan="2">监测项目是否齐全</th>
    <td colspan="2"><ex:dictRadio type="YesNo" property="monitorResult1" onclick="showText(this.name,this.value)"/><br><span></span>
   <div class="monitorResult1" style="display: none">
   		 缺失项:<html:text property="monitorResult1Temp" value="${ePatrolRecordSTMPre.monitorResult1Temp}" styleClass="inputText" maxlength="100" size="30" />
   </div>
   </td>
    <td rowspan="4"><html:textarea property="monitorRemark1" value="${ePatrolRecordSTMPre.monitorRemark1}"  style="height:300px"/></td>
  </tr>
  <tr>
    <th height="34" colspan="2">今日监测点损坏情况</th>
    <td colspan="2"><html:text property="monitorResult2" value="${ePatrolRecordSTMPre.monitorResult2}" styleClass="inputText" maxlength="100" size="30" /></td>
  </tr>
  <tr>
    <th height="35" colspan="2">监测点布设情况</th>
    <td colspan="2"><ex:dictRadio type="Standard" property="monitorResult3"/></td>
  </tr>
  <tr>
    <th height="35" colspan="2">超限数据与施工面位置关系</th>
    <td colspan="2"><html:text property="monitorResult4" value="${ePatrolRecordSTMPre.monitorResult4}" styleClass="inputText" maxlength="100" size="30" /></td>
  </tr>
  <tr>
    <th height="33" colspan="2">超限监测数据变化趋势</th>
    <td colspan="2"><ex:dictRadio type="VariationTrend" property="monitorResult5"/></td>
    <td><html:textarea property="monitorRemark2" value="${ePatrolRecordSTMPre.monitorRemark2}"/></td>
  </tr>
  <tr>
    <th colspan="2" rowspan="7">重大环境风险源跟踪情况</th>
    <th height="34" colspan="2">非压力管线情况</th>
    <td colspan="2"><html:text property="riskTrackResult1" value="${ePatrolRecordSTMPre.riskTrackResult1}" styleClass="inputText" maxlength="100" size="30" /></td>
    <td rowspan="7"><html:textarea property="riskTrackRemark" value="${ePatrolRecordSTMPre.riskTrackRemark}" style="height:300px"/></td>
  </tr>
  <tr>
    <th height="36" colspan="2">压力管线情况（给水管）</th>
    <td colspan="2"><html:text property="riskTrackResult2" value="${ePatrolRecordSTMPre.riskTrackResult2}" styleClass="inputText" maxlength="100" size="30" /></td>
  </tr>
  <tr>
    <th height="34" colspan="2">压力管线情况（燃气管）</th>
    <td colspan="2"><html:text property="riskTrackResult3" value="${ePatrolRecordSTMPre.riskTrackResult3}" styleClass="inputText" maxlength="100" size="30" /></td>
  </tr>
  <tr>
    <th height="35" colspan="2">穿越建（构）筑物情况</th>
    <td colspan="2"><html:text property="riskTrackResult4" value="${ePatrolRecordSTMPre.riskTrackResult4}" styleClass="inputText" maxlength="100" size="30" /></td>
  </tr>
  <tr>
    <th height="36" colspan="2">穿越道路（地面)情况</th>
    <td colspan="2"><html:text property="riskTrackResult5" value="${ePatrolRecordSTMPre.riskTrackResult5}" styleClass="inputText" maxlength="100" size="30" /></td>
  </tr>
  <tr>
    <th height="34" colspan="2">穿越河流,湖泊情况</th>
    <td colspan="2"><html:text property="riskTrackResult6" value="${ePatrolRecordSTMPre.riskTrackResult6}" styleClass="inputText" maxlength="100" size="30" /></td>
  </tr>
   <tr>
    <th height="34" colspan="2">邻近施工情况</th>
    <td colspan="2"><html:text property="riskTrackResult7" value="${ePatrolRecordSTMPre.riskTrackResult7}" styleClass="inputText" maxlength="100" size="30" /></td>
  </tr>
   <tr>
    <th height="35">特殊工序情况说明</th>
    <td colspan="5">
    	<html:textarea property="specialProgress" value="${ePatrolRecordSTMPre.specialProgress}"/>
    </td>
  </tr>
  <tr>
    <th height="39" colspan="4">现场巡视照片存放路径</th>
    <td colspan="3"><html:text property="picPath" value="${ePatrolRecordSTMPre.picPath}" styleClass="inputText" maxlength="100" size="30" /></td>
  </tr>
  <tr>
    <th height="37" colspan="2">现场工程师签名：</th>
    <td colspan="2"><input name="engineerSignature" value="${condition.tourEngineer}" readonly="readonly"  /></td>
    <th>审定人意见及签名：</th>
    <td colspan="2">&nbsp;</td>
  </tr>
</table>
<!-- 附件增加 -->
		<%@ include file="/commons/uploadFiles.jsp"%>
		<div class="saveDiv">
			<input id="btn_save" value="确  定" type="button" icon="icon_save" onchange="reValue()"/>
			<input id="btn_back" value="返  回" type="button" icon="icon_back"/>
		</div>
	</html:form>
	</body>
</html:html>
