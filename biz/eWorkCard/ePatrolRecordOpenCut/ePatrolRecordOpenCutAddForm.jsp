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
			saveValidateRequired("#btn_save",properties,"ePatrolRecordOpenCutForm");
		}); 
		//返回		
		 $("#btn_back").click(function(){ 
			document.forms[0].action='eTourConditionAction.do?method=engineerList'; 
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
<content tag="heading">武汉地铁工程明挖法基坑施工安全风险巡视记录表</content>
<body>

<html:form action="ePatrolRecordOpenCutAction.do" styleClass="form" method="POST" styleId="ePatrolRecordOpenCutForm" enctype="multipart/form-data">
<input type="hidden" name="method" value="save">
<html:hidden property="conditionIdTemp" value="${condition.id}"/>
<html:hidden property="id"/>

<html:hidden property="supportResult1Old" />  
<html:hidden property="supportResult2Old" />  
<html:hidden property="supportResult3Old" />  				 
<html:hidden property="supportResult4Old" />  				
<html:hidden property="supportResult4TempOld" />  			   
<html:hidden property="supportResult5Old" />  				
<html:hidden property="supportResult6Old" />  			
<html:hidden property="supportResult7Old" />  				
<html:hidden property="supportResult8Old" />  				
<html:hidden property="conditionResult3Old" />  			
<html:hidden property="conditionResult4Old" />  			
<html:hidden property="conditionResult5Old" />  			
<html:hidden property="conditionResult6Old" />  				
<html:hidden property="conditionResult6TempOld" />  			
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
<html:hidden property="safetyResult8Old" />  					
<html:hidden property="monitorResult1Old" />  			
<html:hidden property="monitorResult3Old" />  			  
<html:hidden property="monitorResult5Old" />	  


<html:hidden property="supportResult1Value" />  
<html:hidden property="supportResult2Value" />  
<html:hidden property="supportResult3Value" />  				 
<html:hidden property="supportResult4Value" />  				
<html:hidden property="supportResult4TempValue" />  			   
<html:hidden property="supportResult5Value" />  				
<html:hidden property="supportResult6Value" />  			
<html:hidden property="supportResult7Value" />  				
<html:hidden property="supportResult8Value" />  				
<html:hidden property="conditionResult3Value" />  			
<html:hidden property="conditionResult4Value" />  			
<html:hidden property="conditionResult5Value" />  			
<html:hidden property="conditionResult6Value" />  				
<html:hidden property="conditionResult6TempValue" />  			
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
<html:hidden property="safetyResult8Value" />  					
<html:hidden property="monitorResult1Value" />  			
<html:hidden property="monitorResult3Value" />  			  
<html:hidden property="monitorResult5Value" />

		
	<table class="listTables" bordercolorlight="#DDDDE0" bordercolordark="#ffffff" width="100%"  border="1" align="center" cellpadding="3" cellspacing="0">
 <tr >
    <th height="52" colspan="6" style="font-size: 18px" class="STYLE2" ><div align="center">武汉地铁工程明挖法基坑施工安全风险巡视记录表</div></th>
  </tr>
  <tr>
    <th width="272" height="35">工点名称：</th>
    <td width="260">
    	${condition.stationId.station_name}
    </td>
    <th width="279">天气：</th>
    <td width="251"><html:text property="weather" styleClass="inputText" maxlength="100" size="30" value="${ePatrolRecordOpenCutPre.weather}"/></td>
    <th width="282">巡视时间：</th>
    <td width="275"> <fmt:formatDate value="${condition.tourDate}" pattern="yyyy-MM-dd"/></td>
  </tr>
  <tr>
    <th height="37" colspan="6"><div align="center">工点进度说明</div></th>
  </tr>
  <tr>
    <td height="70" colspan="6"><html:textarea property="progressNotes" value="${ePatrolRecordOpenCutPre.progressNotes}"/></td>
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
    <td height="85" colspan="2"><html:textarea property="pointSolve" value="${ePatrolRecordOpenCutPre.pointSolve}"/></td>
    <td colspan="2"><html:textarea property="implementation" value="${ePatrolRecordOpenCutPre.implementation}"/></td>
    <td colspan="2"><html:textarea property="newProblem" value="${ePatrolRecordOpenCutPre.newProblem}"/></td>
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
    	<ex:dictRadio type="GoodOrBad" property="supportResult1"/>
    </td>
    <td><html:textarea property="supportRemark1" value="${ePatrolRecordOpenCutPre.supportRemark1}"/></td>
  </tr>
  <tr>
    <th height="34" colspan="2">混凝土支撑、钢支撑架设及时性</th>
    <td colspan="2">
    	<ex:dictRadio type="Timely" property="supportResult2"/>
    </td>
    <td rowspan="7"><html:textarea property="supportRemark2" style="height:300px" value="${ePatrolRecordOpenCutPre.supportRemark2}"/></td>
  </tr>
  <tr>
    <th height="36" colspan="2">冠梁、支撑、围檩变形、裂缝情况 </th>
    <td colspan="2">
    	<ex:dictRadio type="DeformationCondition" property="supportResult3"/>
    </td>
  </tr>
  <tr>
    <th height="33" colspan="2">支撑、围檩安装规范性、网喷及时性</th>
    <td colspan="2">
		<ex:dictRadio type="Standard" property="supportResult4"/><br>
		<ex:dictRadio type="Timely" property="supportResult4Temp"/>    
    </td>
  </tr>
  <tr>
    <th height="34" colspan="2">格构柱变形情况</th>
    <td colspan="2">
    	<ex:dictRadio type="DeformationCondition" property="supportResult5"/>
    </td>
  </tr>
  <tr>
    <th height="34" colspan="2">围护结构是否有渗漏</th>
    <td colspan="2">
		<ex:dictRadio type="Leakage" property="supportResult6"/>
    </td>
  </tr>
  <tr>
    <th height="35" colspan="2">墙后土体有无沉陷、裂缝及滑移</th>
    <td colspan="2">
    	<ex:dictRadio type="YesOrNo" property="supportResult7"/>
    </td>
  </tr>
  <tr>
    <th height="33" colspan="2">基坑有无涌土、流砂、管涌情况 </th>
    <td colspan="2">
    	<ex:dictRadio type="YesOrNo" property="supportResult8"/>
    </td>
  </tr>
  <tr>
    <th rowspan="10">施工工况</th>
    <th height="36" colspan="2">基坑地质情况</th>
    <td colspan="2">
		<html:text property="conditionResult1" styleClass="inputText" maxlength="100" size="30" value="${ePatrolRecordOpenCutPre.conditionResult1}"/>
	</td>
    <td rowspan="10">
		<html:textarea property="conditionRemark" style="height:300px" value="${ePatrolRecordOpenCutPre.conditionRemark}"/>
	</td>
  </tr>
  <tr>
    <th height="34" colspan="2">基坑水文情况</th>
    <td colspan="2">
		<html:text property="conditionResult2" styleClass="inputText" maxlength="100" size="30" value="${ePatrolRecordOpenCutPre.conditionResult2}"/>
    </td>
  </tr>
  <tr>
    <th height="36" colspan="2">基坑降水设施运转情况</th>
    <td colspan="2">
		<ex:dictRadio type="NormalOrNot" property="conditionResult3"/>
	</td>
  </tr>
  <tr>
    <th height="35" colspan="2">基坑开挖分段、分层放坡施工</th>
    <td colspan="2">
    	<ex:dictRadio type="MeetDemand" property="conditionResult4"/>
    </td>
  </tr>
  <tr>
    <th height="36" colspan="2">基坑周边地面堆载情况</th>
    <td colspan="2">
    	<ex:dictRadio type="YesOrNo" property="conditionResult5"/>
    </td>
  </tr>
  <tr>
    <th height="35" colspan="2">主体结构施工时脚手架搭设规范性、主体结构施工是否跟紧开挖面</th>
    <td colspan="2">
    	<ex:dictRadio type="Standard" property="conditionResult6"/><br>
    	<ex:dictRadio type="FollowOrNot" property="conditionResult6Temp"/>
    </td>
  </tr>
  <tr>
    <th height="35" colspan="2">特殊天气施工情况</th>
    <td colspan="2">
    	<html:text property="conditionResult7" styleClass="inputText" maxlength="100" size="30" value="${ePatrolRecordOpenCutPre.conditionResult7}"/>
    </td>
  </tr>
  <tr>
    <th height="35" colspan="2">吊装作业情况</th>
    <td colspan="2">
    	<ex:dictRadio type="Standard" property="conditionResult8"/>
    </td>
  </tr>
  <tr>
    <th height="33" colspan="2">其它机械设备的运行情况</th>
    <td colspan="2">
    	<ex:dictRadio type="NormalOrNot" property="conditionResult9"/>
    </td>
  </tr>
  <tr>
    <th height="35" colspan="2">施工工序是否满足规范要求</th>
    <td colspan="2">
    	<ex:dictRadio type="MeetDemand" property="conditionResult10"/>
    </td>
  </tr>
  <tr>
    <th rowspan="8">安全文明施工</th>
    <th height="35" colspan="2">临边防护施做是否及时</th>
    <td colspan="2">
    	<ex:dictRadio type="Timely" property="safetyResult1"/>
    </td>
    <td rowspan="8">
		<html:textarea property="safetyRemark" style="height:300px" value="${ePatrolRecordOpenCutPre.safetyRemark}"/>
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
    <th height="33" colspan="2">现场通风照明情况</th>
    <td colspan="2">
		<ex:dictRadio type="GoodOrBad" property="safetyResult5"/>
    </td>
  </tr>
  <tr>
    <th height="34" colspan="2">材料堆放规范性</th>
    <td colspan="2">
		<ex:dictRadio type="Standard" property="safetyResult6"/>
    </td>
  </tr>
  <tr>
    <th height="34" colspan="2">现场积水积泥</th>
    <td colspan="2">
    	<ex:dictRadio type="YesOrNo" property="safetyResult7"/>
    </td>
  </tr>
  <tr>
    <th height="35" colspan="2">现场封闭情况管理</th>
    <td colspan="2">
    	<ex:dictRadio type="SealOff" property="safetyResult8"/>
    </td>
  </tr>
  <tr>
    <th rowspan="5">监测情况</th>
    <th height="34" colspan="2">监测项目是否齐全</th>
    <td colspan="2"><ex:dictRadio type="YesNo" property="monitorResult1" onclick="showText(this.name,this.value)"/><br><span></span>
    <div class="monitorResult1" style="display: none">
   		 缺失项:<html:text property="monitorResult1Temp" styleClass="inputText" maxlength="100" size="30" value="${ePatrolRecordOpenCutPre.monitorResult1Temp}"/>
   </div>
   </td>
    <td rowspan="5">
    	<html:textarea property="monitorRemark" style="height:300px" value="${ePatrolRecordOpenCutPre.monitorRemark}"/>
    </td>
  </tr>
  <tr>
    <th height="34" colspan="2">今日监测点损坏情况</th>
    <td colspan="2">
    	<html:text property="monitorResult2" styleClass="inputText" maxlength="100" size="30" value="${ePatrolRecordOpenCutPre.monitorResult2}"/>
    </td>
  </tr>
  <tr>
    <th height="35" colspan="2">监测点布设情况</th>
    <td colspan="2">
    	<ex:dictRadio type="Standard" property="monitorResult3"/>
    </td>
  </tr>
  <tr>
    <th height="35" colspan="2">超限数据与施工面位置关系</th>
    <td colspan="2">
    	<html:text property="monitorResult4" styleClass="inputText" maxlength="100" size="30" value="${ePatrolRecordOpenCutPre.monitorResult4}"/>
    </td>
  </tr>
  <tr>
    <th height="33" colspan="2">超限监测数据变化趋势</th>
    <td colspan="2">
    	<ex:dictRadio type="VariationTrend" property="monitorResult5"/>
    </td>
  </tr>
  <tr>
    <th rowspan="6">重大环境风险源跟踪情况</th>
    <th height="34" colspan="2">非压力管线情况</th>
    <td colspan="2">
    	<html:text property="riskTrackResult1" styleClass="inputText" maxlength="100" size="30" value="${ePatrolRecordOpenCutPre.riskTrackResult1}"/>
    </td>
    <td rowspan="6">
    	<html:textarea property="riskTrackRemark" style="height:300px" value="${ePatrolRecordOpenCutPre.riskTrackRemark}"/>
    </td>
  </tr>
  <tr>
    <th height="36" colspan="2">压力管线情况（给水管）</th>
    <td colspan="2">
    	<html:text property="riskTrackResult2" styleClass="inputText" maxlength="100" size="30" value="${ePatrolRecordOpenCutPre.riskTrackResult2}"/>
    </td>
  </tr>
  <tr>
    <th height="34" colspan="2">压力管线情况（燃气管）</th>
    <td colspan="2">
    	<html:text property="riskTrackResult3" styleClass="inputText" maxlength="100" size="30" value="${ePatrolRecordOpenCutPre.riskTrackResult3}"/>
    </td>
  </tr>
  <tr>
    <th height="35" colspan="2">周边建（构）筑物变形情况</th>
    <td colspan="2">
    	<html:text property="riskTrackResult4" styleClass="inputText" maxlength="100" size="30" value="${ePatrolRecordOpenCutPre.riskTrackResult4}"/>
    </td>
  </tr>
  <tr>
    <th height="36" colspan="2">周边道路（地面）变形、裂缝</th>
    <td colspan="2">
    	<html:text property="riskTrackResult5" styleClass="inputText" maxlength="100" size="30" value="${ePatrolRecordOpenCutPre.riskTrackResult5}"/>
    </td>
  </tr>
  <tr>
    <th height="34" colspan="2">邻近施工情况</th>
    <td colspan="2">
    	<html:text property="riskTrackResult6" styleClass="inputText" maxlength="100" size="30" value="${ePatrolRecordOpenCutPre.riskTrackResult6}"/>
    </td>
  </tr>
  <tr>
    <th height="35">特殊工序情况说明</th>
    <td colspan="5">
    	<html:textarea property="specialProgress" value="${ePatrolRecordOpenCutPre.specialProgress}"/>
    </td>
  </tr>
  <tr>
    <th height="39" colspan="3">现场巡视照片存放路径</th>
    <td colspan="3">
    	<html:text property="picPath" styleClass="inputText" maxlength="100" size="30" value="${ePatrolRecordOpenCutPre.picPath}"/>
    </td>
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
