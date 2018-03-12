<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
<html:html>
<head>
<script type="text/javascript">
	 $(document).ready(function(){
	 	//保存
	 	if('${ePatrolRecordBrace.pressureMonitorResult1}'==2){
	 		$(".pressureMonitorResult1").show()
	 	}
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
	     	 		$("[name='"+this.name+"']:checked").removeAttr("checked");
	     	 		$("[name='"+this.name+"Old']").val('');	
	     	 		$("[name='"+this.name+"Old']").attr("name",this.name);	
	     	 		$("[name='"+this.name+"Value']").val('');	
	     	 }else{
	     	 		$("."+this.name+"Old").attr("name",this.name+"Old");	
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
<html:hidden property="conditionIdTemp" value="${ePatrolRecordBrace.conditionId.id}"/>
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
<%--<html:hidden property="braceResult3Temp4Value" />             --%>
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

<input type="hidden" class="supportResult1Old"  name="supportResult1Old" value="${ePatrolRecordBrace.supportResult1}"/>
<input type="hidden" class="supportResult1TempOld" name="supportResult1TempOld" value="${ePatrolRecordBrace.supportResult1Temp}"/>              
<input type="hidden" class="supportResult2Old" name="supportResult2Old" value="${ePatrolRecordBrace.supportResult2}"/>                 
<input type="hidden" class="braceResult1Old" name="braceResult1Old" value="${ePatrolRecordBrace.braceResult1}"/>              
<input type="hidden" class="braceResult1TempOld" name="braceResult1TempOld" value="${ePatrolRecordBrace.braceResult1Temp}"/>               
<input type="hidden" class="braceResult2Old" name="braceResult2Old" value="${ePatrolRecordBrace.braceResult2}"/>                 
<input type="hidden" class="braceResult2TempOld" name="braceResult2TempOld" value="${ePatrolRecordBrace.braceResult2Temp}"/>              
<input type="hidden" class="braceResult3Old" name="braceResult3Old" value="${ePatrolRecordBrace.braceResult3}"/>                  
<input type="hidden" class="braceResult3Temp1Old" name="braceResult3Temp1Old" value="${ePatrolRecordBrace.braceResult3Temp1}"/>             
<input type="hidden" class="braceResult3Temp2Old" name="braceResult3Temp2Old" value="${ePatrolRecordBrace.braceResult3Temp2}"/>             
<input type="hidden" class="braceResult3Temp3Old" name="braceResult3Temp3Old" value="${ePatrolRecordBrace.braceResult3Temp3}"/>              
<%--<input type="hidden" class="braceResult3Temp4Old" name="braceResult3Temp4Old" value="${ePatrolRecordBrace.braceResult3Temp4}"/>             --%>
<input type="hidden" class="braceResult4Old" name="braceResult4Old" value="${ePatrolRecordBrace.braceResult4}"/>                   
<input type="hidden" class="braceResult4TempOld" name="braceResult4TempOld" value="${ePatrolRecordBrace.braceResult4Temp}"/>               
<input type="hidden" class="braceResult5Old" name="braceResult5Old" value="${ePatrolRecordBrace.braceResult5}"/>                   
<input type="hidden" class="braceResult6Old" name="braceResult6Old" value="${ePatrolRecordBrace.braceResult6}"/>                 
<input type="hidden" class="braceResult6Temp1Old" name="braceResult6Temp1Old" value="${ePatrolRecordBrace.braceResult6Temp1}"/>              
<input type="hidden" class="braceResult6Temp2Old" name="braceResult6Temp2Old" value="${ePatrolRecordBrace.braceResult6Temp2}"/>              
<input type="hidden" class="modelResult1Old" name="modelResult1Old" value="${ePatrolRecordBrace.modelResult1}"/>                  
<input type="hidden" class="modelResult1TempOld" name="modelResult1TempOld" value="${ePatrolRecordBrace.modelResult1Temp}"/>            
<input type="hidden" class="modelResult2Old" name="modelResult2Old" value="${ePatrolRecordBrace.modelResult2}"/>                  
<input type="hidden" class="modelResult2Temp1Old" name="modelResult2Temp1Old" value="${ePatrolRecordBrace.modelResult2Temp1}"/>             
<input type="hidden" class="modelResult2Temp2Old" name="modelResult2Temp2Old" value="${ePatrolRecordBrace.modelResult2Temp2}"/>             
<input type="hidden" class="conditionResult1Old" name="conditionResult1Old" value="${ePatrolRecordBrace.conditionResult1}"/>              
<input type="hidden" class="conditionResult2Old" name="conditionResult2Old" value="${ePatrolRecordBrace.conditionResult2}"/>               
<input type="hidden" class="conditionResult3Old" name="conditionResult3Old" value="${ePatrolRecordBrace.conditionResult3}"/>                
<input type="hidden" class="conditionResult4Old" name="conditionResult4Old" value="${ePatrolRecordBrace.conditionResult4}"/>               
<input type="hidden" class="conditionResult4TempOld" name="conditionResult4TempOld" value="${ePatrolRecordBrace.conditionResult4Temp}"/>           
<input type="hidden" class="conditionResult6Old" name="conditionResult6Old" value="${ePatrolRecordBrace.conditionResult6}"/>               
<input type="hidden" class="conditionResult7Old" name="conditionResult7Old" value="${ePatrolRecordBrace.conditionResult7}"/>              
<input type="hidden" class="conditionResult8Old" name="conditionResult8Old" value="${ePatrolRecordBrace.conditionResult8}"/>               
<input type="hidden" class="safetyResult1Old" name="safetyResult1Old" value="${ePatrolRecordBrace.safetyResult1}"/>                  
<input type="hidden" class="safetyResult2Old" name="safetyResult2Old" value="${ePatrolRecordBrace.safetyResult2}"/>                  
<input type="hidden" class="safetyResult3Old" name="safetyResult3Old" value="${ePatrolRecordBrace.safetyResult3}"/>                 
<input type="hidden" class="safetyResult4Old" name="safetyResult4Old" value="${ePatrolRecordBrace.safetyResult4}"/>                 
<input type="hidden" class="safetyResult5Old" name="safetyResult5Old" value="${ePatrolRecordBrace.safetyResult5}"/>                  
<input type="hidden" class="safetyResult6Old" name="safetyResult6Old" value="${ePatrolRecordBrace.safetyResult6}"/>                 
<input type="hidden" class="safetyResult7Old" name="safetyResult7Old" value="${ePatrolRecordBrace.safetyResult7}"/>                 
<input type="hidden" class="safetyResult8Old" name="safetyResult8Old" value="${ePatrolRecordBrace.safetyResult8}"/>                   
<input type="hidden" class="safetyResult9Old" name="safetyResult9Old" value="${ePatrolRecordBrace.safetyResult9}"/>                 
<input type="hidden" class="safetyResult10Old" name="safetyResult10Old" value="${ePatrolRecordBrace.safetyResult10}"/>                 
<input type="hidden" class="safetyResult10TempOld" name="safetyResult10TempOld" value="${ePatrolRecordBrace.safetyResult10Temp}"/>            
<input type="hidden" class="safetyResult11Old" name="safetyResult11Old" value="${ePatrolRecordBrace.safetyResult11}"/>                
<input type="hidden" class="safetyResult11TempOld" name="safetyResult11TempOld" value="${ePatrolRecordBrace.safetyResult11Temp}"/>              
<input type="hidden" class="pressureMonitorResult1Old" name="pressureMonitorResult1Old" value="${ePatrolRecordBrace.pressureMonitorResult1}"/>         
<input type="hidden" class="pressureMonitorResult3Old" name="pressureMonitorResult3Old" value="${ePatrolRecordBrace.pressureMonitorResult3}"/>       
<input type="hidden" class="pressureMonitorResult5Old" name="pressureMonitorResult5Old" value="${ePatrolRecordBrace.pressureMonitorResult5}"/> 
		
	<table class="listTables" bordercolorlight="#DDDDE0" bordercolordark="#ffffff" width="100%"  border="2" align="center" cellpadding="3" cellspacing="0">
 <tr >
    <th height="52" style="font-size:18px" colspan="6" class="STYLE2" ><div align="center">武汉地铁工程高架施工安全风险巡视记录表</div></th>
  </tr>
  <tr>
    <th width="272" height="35">工点名称：</th>
    <td width="260">${ePatrolRecordBrace.stationId.station_name}</td>
    <th width="279">天气：</th>
    <td width="251"><html:text property="weather" styleClass="inputText" maxlength="100" size="50" /></td>
    <th width="282">巡视时间：</th>
    <td width="275"> <fmt:formatDate value="${ePatrolRecordBrace.tourDate}" pattern="yyyy-MM-dd"/></td>
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
    <td height="85" colspan="2"><html:textarea property="pointSolve" /></td>
    <td colspan="2"><html:textarea property="implementation" /></td>
    <td colspan="2"><html:textarea property="newProblem" /></td>
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
    <td rowspan="2"><html:textarea property="supportRemark" style="height:300px"/></td>
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
    <td rowspan="6"><html:textarea property="braceRemark" style="height:300px"/></td>
  </tr>
  <tr>
    <th height="34" colspan="2">满堂支撑架架设规范防护及时性，变形情况</th>
    <td colspan="2">

    	

    	<ex:dictRadio type="StandardTimely" property="braceResult2"/><br/>

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
    <td rowspan="2"><html:textarea property="modelRemark" style="height:300px"/></td>
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
		<html:textarea property="conditionRemark" style="height:300px"/>
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
    	<html:text property="conditionResult5"  styleClass="inputText" maxlength="100" size="50" />
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
		<html:textarea property="safetyRemark" style="height:300px"/>
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
   		 缺失项:<html:text property="pressureMonitorResult1Temp" styleClass="inputText" maxlength="100" size="30" />
   </div>
   </td>
    <td rowspan="5">
		<html:textarea property="pressureMonitorRemark" style="height:300px"/>
	</td>
  </tr>
  <tr>
    <th height="34" colspan="2">今日监测损坏情况</th>
    <td colspan="2">
		<html:text property="pressureMonitorResult2" styleClass="inputText" maxlength="100" size="50" />
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
    	<html:text property="pressureMonitorResult4"  styleClass="inputText" maxlength="100" size="50" />
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
		<html:text property="riskTrackResult1" styleClass="inputText" maxlength="100" size="50" />
	</td>
    <td rowspan="4">
		<html:textarea property="riskTrackRemark" style="height:300px"/>
	</td>
  </tr>
  <tr>
    <th height="34" colspan="2">压力管线情况（给水管）</th>
    <td colspan="2">
		<html:text property="riskTrackResult2" styleClass="inputText" maxlength="100" size="50" />
    </td>
  </tr>
  <tr>
    <th height="36" colspan="2">压力管线情况（燃气管）</th>
    <td colspan="2">
		<html:text  property="riskTrackResult3"  styleClass="inputText" maxlength="100" size="50" />
	</td>
  </tr>
  <tr>
    <th height="35" colspan="2">邻近施工情况</th>
    <td colspan="2">
    	<html:text  property="riskTrackResult4"  styleClass="inputText" maxlength="100" size="50" />
    </td>
  </tr>
  
  <tr>
    <th height="35">特殊工序情况说明</th>
    <td colspan="5"><html:textarea property="specialProgress"/></td>
  </tr>
  <tr>
    <th height="39" colspan="3">现场巡视照片存放路径</th>
    <td colspan="3"><html:text property="picPath" styleClass="inputText" maxlength="100" size="50" /></td>
  </tr>
  <tr>
    <th height="37">现场工程师签名：</th>

    <td colspan="2"><input name="engineerSignature" value="${ePatrolRecordBrace.engineerSignature}" readonly="readonly"  /></td>

    

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
