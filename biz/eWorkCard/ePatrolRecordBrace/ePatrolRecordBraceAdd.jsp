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
<content tag="heading">武汉地铁工程高架施工安全风险巡视记录表</content>
<body>

<html:form action="ePatrolRecordBraceAction.do" styleClass="form" method="POST" styleId="ePatrolRecordBraceForm" enctype="multipart/form-data">
<input type="hidden" name="method" value="save">
<html:hidden property="conditionIdTemp" value="${condition.id}"/>
<html:hidden property="id" />


<html:hidden property="supportResult1Value" />
<html:hidden property="supportResult1TempValue" />              
<html:hidden property="supportResult2Value" />                 
<html:hidden property="braceResult1Value" />              
<html:hidden property="braceResult1TempValue" />               
<html:hidden property="braceResult2Value" />                 
<html:hidden property="braceResult2TempValue" />              
<html:hidden property="braceResult3Value" />                  
<html:hidden property="braceResult3Temp1Value" />             
<html:hidden property="braceResult3Temp2Value" />             
<html:hidden property="braceResult3Temp3Value" />              
<html:hidden property="braceResult3Temp4Value" />             
<html:hidden property="braceResult4Value" />                   
<html:hidden property="braceResult4TempValue" />               
<html:hidden property="braceResult5Value" />                   
<html:hidden property="braceResult6Value" />                 
<html:hidden property="braceResult6Temp1Value" />              
<html:hidden property="braceResult6Temp2Value" />              
<html:hidden property="modelResult1Value" />                  
<html:hidden property="modelResult1TempValue" />            
<html:hidden property="modelResult2Value" />                  
<html:hidden property="modelResult2Temp1Value" />             
<html:hidden property="modelResult2Temp2Value" />             
<html:hidden property="conditionResult1Value" />              
<html:hidden property="conditionResult2Value" />               
<html:hidden property="conditionResult3Value" />                
<html:hidden property="conditionResult4Value" />               
<html:hidden property="conditionResult4TempValue" />           
<html:hidden property="conditionResult6Value" />               
<html:hidden property="conditionResult7Value" />              
<html:hidden property="conditionResult8Value" />               
<html:hidden property="safetyResult1Value" />                  
<html:hidden property="safetyResult2Value" />                  
<html:hidden property="safetyResult3Value" />                 
<html:hidden property="safetyResult4Value" />                 
<html:hidden property="safetyResult5Value" />                  
<html:hidden property="safetyResult6Value" />                 
<html:hidden property="safetyResult7Value" />                 
<html:hidden property="safetyResult8Value" />                   
<html:hidden property="safetyResult9Value" />                 
<html:hidden property="safetyResult10Value" />                 
<html:hidden property="safetyResult10TempValue" />            
<html:hidden property="safetyResult11Value" />                
<html:hidden property="safetyResult11TempValue" />              
<html:hidden property="pressureMonitorResult1Value" />         
<html:hidden property="pressureMonitorResult3Value" />       
<html:hidden property="pressureMonitorResult5Value" />       

<html:hidden property="supportResult1Old"/>
<html:hidden property="supportResult1TempOld" />              
<html:hidden property="supportResult2Old" />                 
<html:hidden property="braceResult1Old" />              
<html:hidden property="braceResult1TempOld" />               
<html:hidden property="braceResult2Old" />                 
<html:hidden property="braceResult2TempOld" />              
<html:hidden property="braceResult3Old" />                  
<html:hidden property="braceResult3Temp1Old" />             
<html:hidden property="braceResult3Temp2Old" />             
<html:hidden property="braceResult3Temp3Old" />              
<html:hidden property="braceResult3Temp4Old" />             
<html:hidden property="braceResult4Old" />                   
<html:hidden property="braceResult4TempOld" />               
<html:hidden property="braceResult5Old" />                   
<html:hidden property="braceResult6Old" />                 
<html:hidden property="braceResult6Temp1Old" />              
<html:hidden property="braceResult6Temp2Old" />              
<html:hidden property="modelResult1Old" />                  
<html:hidden property="modelResult1TempOld" />            
<html:hidden property="modelResult2Old" />                  
<html:hidden property="modelResult2Temp1Old" />             
<html:hidden property="modelResult2Temp2Old" />             
<html:hidden property="conditionResult1Old" />              
<html:hidden property="conditionResult2Old" />               
<html:hidden property="conditionResult3Old" />                
<html:hidden property="conditionResult4Old" />               
<html:hidden property="conditionResult4TempOld" />           
<html:hidden property="conditionResult6Old" />               
<html:hidden property="conditionResult7Old" />              
<html:hidden property="conditionResult8Old" />               
<html:hidden property="safetyResult1Old" />                  
<html:hidden property="safetyResult2Old" />                  
<html:hidden property="safetyResult3Old" />                 
<html:hidden property="safetyResult4Old" />                 
<html:hidden property="safetyResult5Old" />                  
<html:hidden property="safetyResult6Old" />                 
<html:hidden property="safetyResult7Old" />                 
<html:hidden property="safetyResult8Old" />                   
<html:hidden property="safetyResult9Old" />                 
<html:hidden property="safetyResult10Old" />                 
<html:hidden property="safetyResult10TempOld" />            
<html:hidden property="safetyResult11Old" />                
<html:hidden property="safetyResult11TempOld" />              
<html:hidden property="pressureMonitorResult1Old" />         
<html:hidden property="pressureMonitorResult3Old" />       
<html:hidden property="pressureMonitorResult5Old" />
		

	<table class="listTables" bordercolorlight="#DDDDE0" bordercolordark="#ffffff" width="100%"  border="2" align="center" cellpadding="3" cellspacing="0">
 <tr >
    <th height="52" style="font-size:18px" colspan="6" class="STYLE2" ><div align="center">武汉地铁工程高架施工安全风险巡视记录表</div></th>
  </tr>
  <tr>
    <th width="272" height="35">工点名称：</th>
    <td width="260">${condition.stationId.station_name}</td>
    <th width="279">天气：</th>
    <td width="251"><html:text property="weather" value="${ePatrolRecordBracePre.weather}" styleClass="inputText" maxlength="100" size="50" /></td>
    <th width="282">巡视时间：</th>
    <td width="275"> <fmt:formatDate value="${condition.tourDate}" pattern="yyyy-MM-dd"/></td>
  </tr>
  <tr>
    <th height="37" colspan="6"><div align="center">工点进度说明</div></th>
  </tr>
  <tr>
    <td height="70" colspan="6"><html:textarea property="progressNotes" value="${ePatrolRecordBracePre.progressNotes}"/></td>
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
    <td height="85" colspan="2"><html:textarea property="pointSolve" value="${ePatrolRecordBracePre.pointSolve}"/></td>
    <td colspan="2"><html:textarea property="implementation" value="${ePatrolRecordBracePre.implementation}"/></td>
    <td colspan="2"><html:textarea property="newProblem" value="${ePatrolRecordBracePre.newProblem}"/></td>
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

    	<ex:dictRadio type="GoodOrBad" property="supportResult1"/><br>

    	

    	<ex:dictRadio type="DeformationCondition" property="supportResult1Temp"/>
    </td>
    <td rowspan="2"><html:textarea property="supportRemark" value="${ePatrolRecordBracePre.supportRemark}" style="height:300px"/></td>
  </tr>
  <tr>
    <th height="34" colspan="2">桩基坑洞临边维护规范、及时性</th>
    <td colspan="2">
    	<ex:dictRadio type="StandardTimely" property="supportResult2"/>
    </td>
    
  </tr>
  <tr>
    <th rowspan="6">支撑架体系</th>
    <th height="34" colspan="2">主体外防护脚手架搭设规范，及时性，变形情况</th>
    <td colspan="2">

    	<ex:dictRadio type="StandardTimely" property="braceResult1"/><br>

    	

    	<ex:dictRadio type="DeformationCondition" property="braceResult1Temp"/>
    </td>
    <td rowspan="6"><html:textarea property="braceRemark" value="${ePatrolRecordBracePre.braceRemark}" style="height:300px"/></td>
  </tr>
  <tr>
    <th height="34" colspan="2">满堂支撑架架设规范防护及时性，变形情况</th>
    <td colspan="2">

    	<ex:dictRadio type="StandardTimely" property="braceResult2"/><br>

    	

    	<ex:dictRadio type="DeformationCondition" property="braceResult2Temp"/>
    </td>
    
  </tr>
  <tr>
    <th height="34" colspan="2">满堂支撑架地基承载情况</th>
    <td colspan="2">

     <ex:dictRadio type="SoftFoundation" property="braceResult3"/><br><span></span>
     底托悬空:<ex:dictRadio type="YesOrNo" property="braceResult3Temp1"/><br><span></span>
     架体底部高差:<ex:dictRadio type="YesOrNo" property="braceResult3Temp2"/>
    	

    
    	

    </td>
    
  </tr><tr>
    <th height="34" colspan="2">承载支撑体系是否符合评估方案，搭设部位属于有效支撑</th>
    <td colspan="2">
    	<ex:dictRadio type="IfMeetDemand" property="braceResult4"/><br>
    	<ex:dictRadio type="Effective" property="braceResult4Temp"/>
    </td>
    
  </tr><tr>
    <th height="34" colspan="2">赝架中间受力承台下沉情况</th>
    <td colspan="2">
    	<ex:dictRadio type="SinkCondition" property="braceResult5"/>
    </td>
    
  </tr><tr>
    <th height="34" colspan="2">支撑体系杆件情况，挂篮情况，支撑体系杆件衔接情况</th>
    <td colspan="2">

    	<ex:dictRadio type="RustCondtion" property="braceResult6"/><br>
    	<ex:dictRadio type="DeformationCondition" property="braceResult6Temp1"/><br><span></span>
    	杆件衔接:<ex:dictRadio type="Effective" property="braceResult6Temp2"/>

    	

    	
    </td>
    
  </tr>
  <tr>
    <th rowspan="2">模板体系</th>
    <th height="34" colspan="2">模板架设是否符合方案</th>
    <td colspan="2">

    	<ex:dictRadio type="IfMeetDemand" property="modelResult1"/><br>

    	

    	<ex:dictRadio type="Effective" property="modelResult1Temp"/>
    </td>
    <td rowspan="2"><html:textarea property="modelRemark" value="${ePatrolRecordBracePre.modelRemark}" style="height:300px"/></td>
  </tr>
  <tr>
    <th height="34" colspan="2">模板稳定性情况，倾斜情况，螺栓（对拉螺杆）连接情况</th>
    <td colspan="2">

    	<ex:dictRadio type="IfStable" property="modelResult2"/><br><span></span>
    	倾斜情况:<ex:dictRadio type="YesOrNo" property="modelResult2Temp1"/><br><span></span>
    	连接状态:<ex:dictRadio type="Effective" property="modelResult2Temp2"/>

    	

    </td>
    
  </tr>
  <tr>
    <th rowspan="8">施工工况</th>
    <th height="36" colspan="2">基坑排水设施运转情况</th>
    <td colspan="2">
		<ex:dictRadio type="NormalOrNot" property="conditionResult1"  />
	</td>
    <td rowspan="8">
		<html:textarea property="conditionRemark" value="${ePatrolRecordBracePre.conditionRemark}" style="height:300px"/>
	</td>
  </tr>
  <tr>
    <th height="34" colspan="2">基坑开挖情况</th>
    <td colspan="2">
    <ex:dictRadio type="MeetDemand" property="conditionResult2"  />
		
    </td>
  </tr>
  <tr>
    <th height="36" colspan="2">基坑周边地面堆载情况</th>
    <td colspan="2">
		 <ex:dictRadio type="YesOrNo" property="conditionResult3"  />
	</td>
  </tr>
  <tr>
    <th height="35" colspan="2">主体结构施工时各工序规范操作，跟紧进度</th>
    <td colspan="2">

    	 <ex:dictRadio type="Standard" property="conditionResult4"  /><br> 
    	 <ex:dictRadio type="FollowOrNot" property="conditionResult4Temp"  />

    	 

    </td>
  </tr>
  <tr>
    <th height="36" colspan="2">特殊天气施工情况</th>
    <td colspan="2">
    	<html:text property="conditionResult5" value="${ePatrolRecordBracePre.conditionResult5}"  styleClass="inputText" maxlength="100" size="50" />
    </td>
  </tr>
  <tr>
    <th height="35" colspan="2">吊装作业情况</th>
    <td colspan="2">
    	<ex:dictRadio type="Standard" property="conditionResult6"  />
    </td>
  </tr>
  <tr>
    <th height="35" colspan="2">其他机械设备的运行情况</th>
    <td colspan="2">
    	<ex:dictRadio type="NormalOrNot" property="conditionResult7" />
    </td>
  </tr>
  <tr>
    <th height="35" colspan="2">施工工序是否满足规范要求</th>
    <td colspan="2">
    	<ex:dictRadio type="MeetDemand" property="conditionResult8"/>
    </td>
  </tr>
  
  <tr>
    <th rowspan="11">安全文明施工</th>
    <th height="36" colspan="2">承台，桩基，高空作业临边防护施做是否及时规范</th>
    <td colspan="2">
		<ex:dictRadio type="StandardTimely" property="safetyResult1"  />
	</td>
    <td rowspan="11">
		<html:textarea property="safetyRemark" value="${ePatrolRecordBracePre.safetyRemark}" style="height:300px"/>
	</td>
  </tr>
  <tr>
    <th height="34" colspan="2">用电是否混乱</th>
    <td colspan="2">
		<ex:dictRadio type="YesNo" property="safetyResult2"/>
    </td>
  </tr>
  <tr>
    <th height="36" colspan="2">现场有无消防器材</th>
    <td colspan="2">
		<ex:dictRadio type="YesOrNo" property="safetyResult3"/>
	</td>
  </tr>
  <tr>
    <th height="35" colspan="2">有无安全通道</th>
    <td colspan="2">
    	<ex:dictRadio type="YesOrNo" property="safetyResult4"/>
    </td>
  </tr>
  <tr>
    <th height="36" colspan="2">现场通风照明情况</th>
    <td colspan="2">
    	<ex:dictRadio type="GoodOrBad" property="safetyResult5"/>
    </td>
  </tr>
  <tr>
    <th height="35" colspan="2">材料堆放规范性</th>
    <td colspan="2">
    	<ex:dictRadio type="Standard" property="safetyResult6"/>
    </td>
  </tr>
  <tr>
    <th height="35" colspan="2">现场积水积泥</th>
    <td colspan="2">
    	<ex:dictRadio type="YesOrNo" property="safetyResult7" />
    </td>
  </tr>
  <tr>
    <th height="35" colspan="2">现场封闭管理情况</th>
    <td colspan="2">
    	<ex:dictRadio type="SealOff" property="safetyResult8" />
    </td>
  </tr>
  <tr>
    <th height="35" colspan="2">高空作业防护情况</th>
    <td colspan="2">
    	<ex:dictRadio type="StandardReasonable" property="safetyResult9" />
    </td>
  </tr>
  <tr>
    <th height="35" colspan="2">防护密目网挂设规范，及时性</th>
    <td colspan="2">

    	<ex:dictRadio type="Standard" property="safetyResult10" /><br>

    	

    	<ex:dictRadio type="Timely" property="safetyResult10Temp" />
    </td>
  </tr>
  <tr>
    <th height="35" colspan="2">高空落物防护情况</th>
    <td colspan="2">

    	<ex:dictRadio type="Standard" property="safetyResult11" /><br>

    	

    	<ex:dictRadio type="Timely" property="safetyResult11Temp" />
    </td>
  </tr>
  <tr>
    <th rowspan="5">监测情况</th>
    <th height="36" colspan="2">监测项目是否齐全</th>
    <td colspan="2"><ex:dictRadio type="YesNo" property="pressureMonitorResult1" onclick="showText(this.name,this.value)"/><br><span></span>
    <div class="pressureMonitorResult1" style="display: none">
   		 缺失项:<html:text property="pressureMonitorResult1Temp" value="${ePatrolRecordBracePre.pressureMonitorResult1Temp}" styleClass="inputText" maxlength="100" size="30" />
   </div>
   </td>
    <td rowspan="5">
		<html:textarea property="pressureMonitorRemark" value="${ePatrolRecordBracePre.pressureMonitorRemark}" style="height:300px"/>
	</td>
  </tr>
  <tr>
    <th height="34" colspan="2">今日监测损坏情况</th>
    <td colspan="2">
		<html:text property="pressureMonitorResult2" value="${ePatrolRecordBracePre.pressureMonitorResult2}" styleClass="inputText" maxlength="100" size="50" />
    </td>
  </tr>
  <tr>
    <th height="36" colspan="2">监测布设情况</th>
    <td colspan="2">
		<ex:dictRadio type="Standard" property="pressureMonitorResult3"/>
	</td>
  </tr>
  <tr>
    <th height="35" colspan="2">变形部位与施工面位置关系</th>
    <td colspan="2">
    	<html:text property="pressureMonitorResult4" value="${ePatrolRecordBracePre.pressureMonitorResult4}"  styleClass="inputText" maxlength="100" size="50" />
    </td>
  </tr>
  <tr>
    <th height="36" colspan="2">变形监测数据变化趋势</th>
    <td colspan="2">
    	<ex:dictRadio type="ShapeVariationTrend" property="pressureMonitorResult5"/>
    </td>
  </tr>
  <tr>
    <th rowspan="4">重大环境风险源跟踪情况</th>
    <th height="36" colspan="2">非压力管线情况</th>
    <td colspan="2">
		<html:text property="riskTrackResult1" value="${ePatrolRecordBracePre.riskTrackResult1}" styleClass="inputText" maxlength="100" size="50" />
	</td>
    <td rowspan="4">
		<html:textarea property="riskTrackRemark" value="${ePatrolRecordBracePre.riskTrackRemark}" style="height:300px"/>
	</td>
  </tr>
  <tr>
    <th height="34" colspan="2">压力管线情况（给水管）</th>
    <td colspan="2">
		<html:text property="riskTrackResult2" value="${ePatrolRecordBracePre.riskTrackResult2}" styleClass="inputText" maxlength="100" size="50" />
    </td>
  </tr>
  <tr>
    <th height="36" colspan="2">压力管线情况（燃气管）</th>
    <td colspan="2">
		<html:text  property="riskTrackResult3" value="${ePatrolRecordBracePre.riskTrackResult3}"  styleClass="inputText" maxlength="100" size="50" />
	</td>
  </tr>
  <tr>
    <th height="35" colspan="2">邻近施工情况</th>
    <td colspan="2">
    	<html:text  property="riskTrackResult4" value="${ePatrolRecordBracePre.riskTrackResult4}" styleClass="inputText" maxlength="100" size="50" />
    </td>
  </tr>
  
  <tr>
    <th height="35">特殊工序情况说明</th>
    <td colspan="5"><html:textarea property="specialProgress" value="${ePatrolRecordBracePre.specialProgress}"/></td>
  </tr>
  <tr>
    <th height="39" colspan="3">现场巡视照片存放路径</th>
    <td colspan="3"><html:text property="picPath" value="${ePatrolRecordBracePre.picPath}" styleClass="inputText" maxlength="100" size="50" /></td>
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
