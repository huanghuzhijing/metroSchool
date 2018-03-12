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
			document.forms[0].action='eTourConditionAction.do?method=engineerList&ec_p=${param.ec_p}&ec_id=${param.id}&ec_crd=${param.ec_crd}'; 
	    	document.forms[0].submit();
	    }); 
	     $("[type='radio']").change(function(){
	   		$("[name='"+this.name+"Value']").val($("input[name='"+this.name+"']:checked")[0].nextSibling.nodeValue.replace(/^(\s|\u00A0)+/,'').replace(/(\s|\u00A0)+$/,''));
	   })
	     
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
	function showText(id,value){
		if(value=='1'){
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
<content tag="heading">武汉地铁工程暗挖法施工安全风险巡视记录表</content>
<body>

<html:form action="ePatrolRecordExcavationAction.do" styleClass="form" method="POST" styleId="ePatrolRecordExcavationForm" enctype="multipart/form-data">
<input type="hidden" name="method" value="save">
<html:hidden property="conditionIdTemp" value="${condition.id}"/>
<html:hidden property="id" />
<html:hidden property="excavationFaceResult1Value" />   
 <html:hidden property="excavationFaceResult5Value" />     
 <html:hidden property="excavationFaceResult6Value" />      
 <html:hidden property="excavationFaceResult7Value" />     
 <html:hidden property="excavationFaceResult8Value" />     
 <html:hidden property="excavationFaceResult9Value" />   
 <html:hidden property="supportResult1Value" />        
 <html:hidden property="supportResult2Value" />         
 <html:hidden property="supportResult3Value" />         
 <html:hidden property="supportResult4Value" />           
 <html:hidden property="supportResult6Value" />            
 <html:hidden property="supportResult7Value" />             
 <html:hidden property="conditionResult1Value" />         
 <html:hidden property="conditionResult5Value" />           
 <html:hidden property="conditionResult7Value" />           
 <html:hidden property="conditionResult8Value" />           
 <html:hidden property="conditionResult9Value" />            
 <html:hidden property="conditionResult10Value" />
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
 
 <html:hidden property="excavationFaceResult1Old" />   
 <html:hidden property="excavationFaceResult5Old" />     
 <html:hidden property="excavationFaceResult6Old" />      
 <html:hidden property="excavationFaceResult7Old" />     
 <html:hidden property="excavationFaceResult8Old" />     
 <html:hidden property="excavationFaceResult9Old" />   
 <html:hidden property="supportResult1Old" />        
 <html:hidden property="supportResult2Old" />         
 <html:hidden property="supportResult3Old" />         
 <html:hidden property="supportResult4Old" />           
 <html:hidden property="supportResult6Old" />            
 <html:hidden property="supportResult7Old" />             
 <html:hidden property="conditionResult1Old" />         
 <html:hidden property="conditionResult5Old" />           
 <html:hidden property="conditionResult7Old" />           
 <html:hidden property="conditionResult8Old" />           
 <html:hidden property="conditionResult9Old" />            
 <html:hidden property="conditionResult10Old" />
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
		
	<table class="listTables" bordercolorlight="#DDDDE0" bordercolordark="#ffffff" width="100%"  border="2" align="center" cellpadding="3" cellspacing="0">
 <tr >
    <th height="52" style="font-size:18px" colspan="6" class="STYLE2" ><div align="center">武汉地铁工程暗挖法施工安全风险巡视记录表</div></th>
  </tr>
  <tr>
    <th width="272" height="35">工点名称：</th>
    <td width="260">${condition.stationId.station_name}</td>
    <th width="279">天气：</th>
    <td width="251"><html:text property="weather" value="${ePatrolRecordExcavationPre.weather}" styleClass="inputText" maxlength="100" size="50" /></td>
    <th width="282">巡视时间：</th>
    <td width="275"> <fmt:formatDate value="${condition.tourDate}" pattern="yyyy-MM-dd"/></td>
  </tr>
  <tr>
    <th height="37" colspan="6"><div align="center">工点进度说明</div></th>
  </tr>
  <tr>
    <td height="70" colspan="6"><html:textarea property="progressNotes"  value="${ePatrolRecordExcavationPre.progressNotes}"/></td>
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
    <td height="85" colspan="2"><html:textarea property="pointSolve" value="${ePatrolRecordExcavationPre.pointSolve}"/></td>
    <td colspan="2"><html:textarea property="implementation" value="${ePatrolRecordExcavationPre.implementation}"/></td>
    <td colspan="2"><html:textarea property="newProblem" value="${ePatrolRecordExcavationPre.newProblem}"/></td>
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
    	<ex:dictRadio type="YesOrNo" property="excavationFaceResult1"/>
    </td>
    <td rowspan="9"><html:textarea property="excavationFaceRemark" value="${ePatrolRecordExcavationPre.excavationFaceRemark}"  style="height:300px"/></td>
  </tr>
  <tr>
    <th height="34" colspan="2">开挖面地质情况</th>
    <td colspan="2">
    	<html:text  property="excavationFaceResult2" value="${ePatrolRecordExcavationPre.excavationFaceResult2}" styleClass="inputText" maxlength="100" size="50" />
    </td>
    
  </tr>
  <tr>
    <th height="36" colspan="2">地下水类型</th>
    <td colspan="2">
    	<html:text property="excavationFaceResult3" value="${ePatrolRecordExcavationPre.excavationFaceResult3}"  styleClass="inputText" maxlength="100" size="50" />
    </td>
  </tr>
  <tr>
    <th height="33" colspan="2">掌子面渗透水情况</th>
    <td colspan="2">
		<html:text property="excavationFaceResult4" value="${ePatrolRecordExcavationPre.excavationFaceResult4}"  styleClass="inputText" maxlength="100" size="50" />
    </td>
  </tr>
  <tr>
    <th height="34" colspan="2">掌子面及其附近塌方预兆</th>
    <td colspan="2">
    	<ex:dictRadio type="YesOrNo" property="excavationFaceResult5"/>
    </td>
  </tr>
  <tr>
    <th height="34" colspan="2">开挖进尺</th>
    <td colspan="2">
		<ex:dictRadio type="IfMeetDemand" property="excavationFaceResult6"/>
    </td>
  </tr>
  <tr>
    <th height="35" colspan="2">核心土留置情况</th>
    <td colspan="2">
    	<ex:dictRadio type="IfMeetDemand" property="excavationFaceResult7"/>
    </td>
  </tr>
  <tr>
    <th height="33" colspan="2">上下台阶距离</th>
    <td colspan="2">
    	<ex:dictRadio type="IfMeetDemand" property="excavationFaceResult8"/>
    </td>
    </tr>
  <tr>
    <th height="33" colspan="2">爆破施工</th>
    <td colspan="2">
    	<ex:dictRadio type="YesOrNo" property="excavationFaceResult9"/>
    </td>
  </tr>
  <tr>
    <th rowspan="7">支护体系</th>
    <th height="34" colspan="2">超前支护施作及时性</th>
    <td colspan="2">
    	<ex:dictRadio type="Timely" property="supportResult1"/>
    </td>
    <td rowspan="7"><html:textarea property="supportRemark" value="${ePatrolRecordExcavationPre.supportRemark}" style="height:300px"/></td>
  </tr>
  <tr>
    <th height="34" colspan="2">初支护施及时性</th>
    <td colspan="2">
    	<ex:dictRadio type="Timely" property="supportResult2"/>
    </td>
    
  </tr>
  <tr>
    <th height="36" colspan="2">初支成型质量 </th>
    <td colspan="2">
    	<ex:dictRadio type="GoodOrBad" property="supportResult3"/>
    </td>
  </tr>
  <tr>
    <th height="33" colspan="2">隧道拱部及洞身变形</th>
    <td colspan="2">
		<ex:dictRadio type="DeformationCondition" property="supportResult4"/>   
    </td>
  </tr>
  <tr>
    <th height="34" colspan="2">临时抑拱架设及变形情况</th>
    <td colspan="2">
    	<html:text property="supportResult5" value="${ePatrolRecordExcavationPre.supportResult5}"  styleClass="inputText" maxlength="100" size="50" />
    </td>
  </tr>
  <tr>
    <th height="34" colspan="2">拱部及边墙初衬开裂、脱落</th>
    <td colspan="2">
		<ex:dictRadio type="YesOrNo" property="supportResult6"/>
    </td>
  </tr>
  <tr>
    <th height="34" colspan="2">二衬裂缝、渗水</th>
    <td colspan="2">
		<ex:dictRadio type="YesOrNo" property="supportResult7"/>
    </td>
  </tr>
  <tr>
    <th rowspan="10">施工工况</th>
    <th height="36" colspan="2">线间距情况</th>
    <td colspan="2">
		<ex:dictRadio type="LineSpacing" property="conditionResult1"  />
	</td>
    <td rowspan="10">
		<html:textarea property="conditionRemark" value="${ePatrolRecordExcavationPre.conditionRemark}" style="height:300px"/>
	</td>
  </tr>
  <tr>
    <th height="34" colspan="2">覆土情况</th>
    <td colspan="2">
		<html:text property="conditionResult2" value="${ePatrolRecordExcavationPre.conditionResult2}" styleClass="inputText" maxlength="100" size="50" />
    </td>
  </tr>
  <tr>
    <th height="36" colspan="2">马头门破除情况</th>
    <td colspan="2">
		<html:text property="conditionResult3" value="${ePatrolRecordExcavationPre.conditionResult3}"  styleClass="inputText" maxlength="100" size="50" />
	</td>
  </tr>
  <tr>
    <th height="35" colspan="2">洞身开挖情况</th>
    <td colspan="2">
    	<html:text property="conditionResult4" value="${ePatrolRecordExcavationPre.conditionResult4}"  styleClass="inputText" maxlength="100" size="50" />
    </td>
  </tr>
  <tr>
    <th height="36" colspan="2">初支渗透水情况</th>
    <td colspan="2">
    	<ex:dictRadio type="Leakage" property="conditionResult5"/>
    </td>
  </tr>
  <tr>
    <th height="35" colspan="2">地表降水、地层处理情况</th>
    <td colspan="2">
    	<html:text property="conditionResult6" value="${ePatrolRecordExcavationPre.conditionResult6}"  styleClass="inputText" maxlength="100" size="50" />
    </td>
  </tr>
  <tr>
    <th height="35" colspan="2">竖井及洞身周边地面堆载情况</th>
    <td colspan="2">
    	<ex:dictRadio type="YesOrNo" property="conditionResult7" />
    </td>
  </tr>
  <tr>
    <th height="35" colspan="2">相邻隧道掌子面之间的距离</th>
    <td colspan="2">
    	<ex:dictRadio type="IfMeetDemand" property="conditionResult8"/>
    </td>
  </tr>
  <tr>
    <th height="33" colspan="2">吊装作业情况</th>
    <td colspan="2">
    	<ex:dictRadio type="Standard" property="conditionResult9"/>
    </td>
  </tr>
  <tr>
    <th height="35" colspan="2">其他机械设备情况</th>
    <td colspan="2">
    	<ex:dictRadio type="NormalOrNot" property="conditionResult10"/>
    </td>
  </tr>
  <tr>
    <th rowspan="7">安全文明施工</th>
    <th height="36" colspan="2">隧道内通风照明情况</th>
    <td colspan="2">
		<ex:dictRadio type="GoodOrBad" property="safetyResult1"  />
	</td>
    <td rowspan="7">
		<html:textarea property="safetyRemark" value="${ePatrolRecordExcavationPre.safetyRemark}"  style="height:300px"/>
	</td>
  </tr>
  <tr>
    <th height="34" colspan="2">隧道内积水积泥情况</th>
    <td colspan="2">
		<ex:dictRadio type="YesOrNo" property="safetyResult2"/>
    </td>
  </tr>
  <tr>
    <th height="36" colspan="2">空气质量、粉尘情况</th>
    <td colspan="2">
		<ex:dictRadio type="GoodOrBad" property="safetyResult3"/>
	</td>
  </tr>
  <tr>
    <th height="35" colspan="2">现场有无消防器材</th>
    <td colspan="2">
    	<ex:dictRadio type="YesOrNo" property="safetyResult4"/>
    </td>
  </tr>
  <tr>
    <th height="36" colspan="2">隧道内运输状况</th>
    <td colspan="2">
    	<ex:dictRadio type="GoodOrBad" property="safetyResult5"/>
    </td>
  </tr>
  <tr>
    <th height="35" colspan="2">用电是否混乱</th>
    <td colspan="2">
    	<ex:dictRadio type="YesNo" property="safetyResult6"/>
    </td>
  </tr>
  <tr>
    <th height="35" colspan="2">安全通道设置</th>
    <td colspan="2">
    	<ex:dictRadio type="YesNo" property="safetyResult7" />
    </td>
  </tr>
  
  <tr>
    <th rowspan="5">监测情况</th>
    <th height="36" colspan="2">监测项目是否齐全</th>
    <td colspan="2"><ex:dictRadio type="YesNo" property="monitorResult1" onclick="showText(this.name,this.value)"/><br><span></span>
    <div class="monitorResult1" style="display: none">
   		 缺失项:<html:text property="monitorResult1Temp" value="${ePatrolRecordExcavationPre.monitorResult1Temp}" styleClass="inputText" maxlength="100" size="30" />
   </div>
   </td>
    <td rowspan="5">
		<html:textarea property="monitorRemark" value="${ePatrolRecordExcavationPre.monitorRemark}" style="height:300px"/>
	</td>
  </tr>
  <tr>
    <th height="34" colspan="2">今日监测点损坏情况</th>
    <td colspan="2">
		<html:text property="monitorResult2" value="${ePatrolRecordExcavationPre.monitorResult2}" styleClass="inputText" maxlength="100" size="50" />
    </td>
  </tr>
  <tr>
    <th height="36" colspan="2">监测点布设情况</th>
    <td colspan="2">
		<ex:dictRadio type="Standard" property="monitorResult3"/>
	</td>
  </tr>
  <tr>
    <th height="35" colspan="2">超限数据与施工面位置关系</th>
    <td colspan="2">
    	<html:text property="monitorResult4" value="${ePatrolRecordExcavationPre.monitorResult4}"  styleClass="inputText" maxlength="100" size="50" />
    </td>
  </tr>
  <tr>
    <th height="36" colspan="2">超限监测数据变化趋势</th>
    <td colspan="2">
    	<ex:dictRadio type="VariationTrend" property="monitorResult5"/>
    </td>
  </tr>
  <tr>
    <th rowspan="6">重大环境风险源跟踪情况</th>
    <th height="36" colspan="2">非压力管线情况</th>
    <td colspan="2">
		<html:text property="riskTrackResult1" value="${ePatrolRecordExcavationPre.riskTrackResult1}" styleClass="inputText" maxlength="100" size="50" />
	</td>
    <td rowspan="6">
		<html:textarea property="riskTrackRemark" value="${ePatrolRecordExcavationPre.riskTrackRemark}" style="height:300px"/>
	</td>
  </tr>
  <tr>
    <th height="34" colspan="2">压力管线情况（给水管）</th>
    <td colspan="2">
		<html:text property="riskTrackResult2" value="${ePatrolRecordExcavationPre.riskTrackResult2}" styleClass="inputText" maxlength="100" size="50" />
    </td>
  </tr>
  <tr>
    <th height="36" colspan="2">压力管线情况（燃气管）</th>
    <td colspan="2">
		<html:text  property="riskTrackResult3" value="${ePatrolRecordExcavationPre.riskTrackResult3}" styleClass="inputText" maxlength="100" size="50" />
	</td>
  </tr>
  <tr>
    <th height="35" colspan="2">周边建（构）筑物变形情况</th>
    <td colspan="2">
    	<html:text  property="riskTrackResult4" value="${ePatrolRecordExcavationPre.riskTrackResult4}"  styleClass="inputText" maxlength="100" size="50" />
    </td>
  </tr>
  <tr>
    <th height="36" colspan="2">周边道路（地面）变形、裂缝</th>
    <td colspan="2">
    	<html:text  property="riskTrackResult5" value="${ePatrolRecordExcavationPre.riskTrackResult5}"  styleClass="inputText" maxlength="100" size="50" />
    </td>
  </tr>
  <tr>
    <th height="35" colspan="2">邻近施工情况</th>
    <td colspan="2">
    	<html:text property="riskTrackResult6" value="${ePatrolRecordExcavationPre.riskTrackResult6}"  styleClass="inputText" maxlength="100" size="50" />
  </tr>
  
  <tr>
    <th height="35">特殊工序情况说明</th>
    <td colspan="5"><html:textarea property="specialProgress" value="${ePatrolRecordExcavationPre.specialProgress}"/></td>
  </tr>
  <tr>
    <th height="39" colspan="3">现场巡视照片存放路径</th>
    <td colspan="3"><html:text property="picPath" value="${ePatrolRecordExcavationPre.picPath}" styleClass="inputText" maxlength="100" size="50" /></td>
  </tr>
  <tr>
    <th height="37">现场工程师签名：</th>
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
