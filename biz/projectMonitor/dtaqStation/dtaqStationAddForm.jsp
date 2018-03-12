<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
<html:html>
<head>
	<script type="text/javascript" src="${ctx}/scripts/enterKey.js" ></script>
	<script type="text/javascript" src="${ctx}/scripts/validator.jsp"></script>
	<script src="${ctx}/scripts/newWatchpoint.js"></script>
	<script language="javascript" src="${ctx}/scripts/jquery-1.2.6.pack.js"></script>
	
	<style type="text/css">
		#allmap {width: 555px;;height:375px;overflow: hidden;margin:0;text-align: center;vertical-align: middle;}
		#l-map{height:100%;width:78%;float:left;border-right:2px solid #bcbcbc;}
		#r-result{height:100%;width:20%;float:left;}
	</style>
	<script type="text/javascript">
	var rule = "gif,jpg,jpeg,png,bmp";
	var img=null; 
	var xianzhiheight=2280;//限制尺寸的高度 
	var xianzhiwidth=2280;//限制尺寸的宽度
	 $(document).ready(function(){
	 	var station_type = jQuery("[name='station_type']") ;
		stationTypeChange(station_type.val()) ;
	 //保存
	 	$("#btn_save").click(function(){
	 		var station_type = jQuery("[name='station_type']").val();
	 		var section_type = jQuery("[name='section_type']").val() ;
			var properties=new Array(); 
			properties[0]=["station_name","车站/区间名称"];
			properties[1]=["station_type","车站/区间类型"];
			if(station_type == "P" && section_type == ""){
				properties[2]=["section_type","区间施工类型"];
			}
			properties[3]=["station_state","工点状态"];
			//properties[4]=["monitoring_status","监控状态"];
			properties[5]=["corpIds_3","第三方监测单位"];
			properties[6]=["build_plane","施工单位平面图"];
			properties[7]=["third_plane","第三方监测平面图"];
			saveValidateRequired("#btn_save",properties,"dtaqStationForm");
			}); 
		//返回		
		 $("#btn_back").click(function(){ 
			document.forms[0].action='dtaqStationAction.do?method=index&ec_p=${param.ec_p}&ec_id=${param.id}&ec_crd=${param.ec_crd}&qsegmentId=${param.qsegmentId}&flagPage=3'; 
	    	document.forms[0].submit();
	    });
	    //第三方监测单位清除
	    $("#btn_clear_3").click(function(){
			$("[name='corpIds_3']").val('');
			$("[name='corpNames_3']").val('');
		});
	});
	
	function validateCode(segment_code){//验证标段编码是否存在
		var segment_id = jQuery("[name='segment_id']").val();
		var old_code = jQuery("[name='old_code']").val();
		if(segment_code!=""){
			if(segment_id=="" || segment_code != old_code){//新增或者编码和原编码不一样
				$.ajax({
					   type: "POST",
					   url: "${ctx}/dtaqStationAction.do?method=validateSegmentCode",
					   data: "segment_code="+segment_code,
					   success: function(msg){
					   		 if(msg=="yes"){ 
					   		 		alert("已经存在该标段编号，请重新输入！");
					   		 		$("[name='segment_code']").val(""); 
									$("segment_code").focus();
					   		 }    
					   }
					});
			}	
		
		}
	}
	function stationTypeChange(value){
		if(value == 'P'){
			jQuery(".sectionTypeDiv").show() ;
		}else{
			jQuery(".sectionTypeDiv").hide() ;
		}
	}	
	//第三方监测单位赋值
	function setParamValue_3(corpIds_3,corpCodes_3,corpNames_3){
		if(corpIds_3!=""){
			$("[name='corpIds_3']").val(corpIds_3);
			$("[name='corpNames_3']").val(corpNames_3);
		}
	} 
	//验证上传图片的尺寸
	function validatePictureSize(object) { 
		if(img)img.removeNode(true); 
		img=document.createElement("img"); 
		img.style.position="absolute"; 
		img.style.visibility="hidden"; 
		document.body.insertAdjacentElement("beforeend",img); 
		img.src=object.value; 
		if(img.offsetHeight>xianzhiheight) { 
			alert("您选择的图片超过了上传限制的最大高度："+xianzhiheight); 
			object.outerHTML=object.outerHTML.replace(/value=\w/g,''); 
			return false; 
		} 
		if (img.offsetWidth>xianzhiwidth){ 
			alert("您选择的图片超过了上传限制的最大宽度："+xianzhiwidth); 
			object.outerHTML=object.outerHTML.replace(/value=\w/g,''); 
			return false; 
		} 
	} 
</script>
<title>
	<content tag="heading"> 地铁线路基本信息</content>  
</title>
</head>
<body>

<html:form action="dtaqStationAction.do" styleClass="form" method="POST" styleId="dtaqStationForm" enctype="multipart/form-data">
<input type="hidden" name="method" value="save">
<input type="hidden" name="segmentId" value="${param.qsegmentId}">
<html:hidden property="old_code" value="${dtaqStation.station_code}" />
<html:hidden property="ec_crd" />
<html:hidden property="qsegmentId" value="${param.qsegmentId}"/>
<html:hidden property="station_id" />
<html:hidden property="ec_p" />
<fieldset>
<legend>地铁车站/区间-新增</legend>
<table class="formTable">
	<COLGROUP >
		<COL class="tdLeftTwo" />
		<COL class="tdRightTwo" />
		<COL class="tdLeftTwo" />
		<COL class="tdRightTwo" />
	</COLGROUP>
	
	<tr>
		<td>
			车站/区间名称：<span class="redSpan">*</span>
		</td>
		<td>
			<html:text property="station_name" styleClass="inputText" maxlength="100" size="30" />
		</td>
	</tr>
	<tr>
		<td>
			车站/区间类型：<span class="redSpan">*</span>
		</td>
		<td>
			<ex:dictSelect property="station_type" type="StationType" onchange="stationTypeChange(this.value)" />
		</td>
		<td class="sectionTypeDiv">
			施工类型：<span class="redSpan">*</span>
		</td>
		<td class="sectionTypeDiv">
			<ex:dictSelect property="section_type" type="SectionType"  />
		</td>
	</tr>
	<tr>
		<td>
			车站/区间编码：<span class="redSpan">*</span>
		</td>
		<td>
			<ex:numberInput property="station_code" styleClass="inputText" maxlength="100" size="15" onchange="validateCode(this.value)"/><font color="#50A2E6" size="2">(示例说明:01015002,'01'表示线路流水号即一号线,'015'表示标段流水号即15标,'002'表示车站/区间流水号)</font>
		</td>
	</tr>
	<tr>
		<td>
			工点状态：<span class="redSpan">*</span>
		</td>
		<td>
			<ex:dictSelect property="station_state" type="ProjectState"  />
		</td>
		<td>
			监控状态：<span class="noRedSpan">*</span>
		</td>
		<td>
			<ex:dictSelect property="monitoring_status" type="MonitorStatus"  showSelect="false"/>
		</td>
	</tr>
	<tr>
		<td>
			第三方监测单位：<span class="redSpan">*</span>
		</td>
		<td > 
			<div style="float:left">
			<html:hidden property="corpIds_3" />
			<html:text property="corpNames_3" styleClass="inputText"  size="70" readonly="true"/>
		    </div>
		     <div style="float:left">
		     <%@ include file="/biz/common/sysPlug/selectOrgans/corpSelects_3.jsp" %>
		    </div>
		    <div  style="float:left">
			<input id="btn_clear_3" value="清除选项" type="button" class="btn_clear_3" >
		    </div>
		</td>
		<td>
			是否巡视：<span class="noRedSpan">*</span>
		</td>
		<td>
			<ex:dictSelect property="ifPatrol" type="YesNo" />
		</td>
	</tr>
	<tr>
		<td>
			监测数据修改权限：<span class="noRedSpan">*</span>
		</td>
		<td>
			<ex:dictSelect property="update_data" type="UpdateData"  /><font color="#50A2E6" size="2">备注：监测数据编制模块的过时数据是否可重新编辑</font>
		</td>
	</tr>
	<tr>
		<td>
			监测数据删除权限：<span class="noRedSpan">*</span>
		</td>
		<td>
			<ex:dictSelect property="delete_data" type="UpdateData"  /><font color="#50A2E6" size="2">备注：监测数据编制模块的过时数据是否可删除</font>
		</td>
	</tr>
	<tr>
		<td>
			计划工期：<span class="noRedSpan">*</span>
		</td>
		<td>
			<html:text property="projectTime" styleClass="inputText" maxlength="100" size="30" />
		</td>
		<td>
			造价：<span class="noRedSpan">*</span>
		</td>
		<td>
			<html:text property="cost" styleClass="inputText" maxlength="100" size="30" />
		</td>
	</tr>
	<tr>
		<td>
			施工单位平面图：<span class="redSpan">*</span>
		</td>
		<td colspan="3"><html:file property="build_plane" size="30" styleClass="text" onchange="validatePictureSize(this)"/><font color="#50A2E6" size="2">(文件格式：gif,jpg,jpeg,png,bmp;大小：2280*2280以内)</font>
		</td>
	</tr>
	<tr>
		<td>
			第三方监测平面图：<span class="redSpan">*</span>
		</td>
		<td colspan="3"><html:file property="third_plane" size="30" styleClass="text" onchange="validatePictureSize(this)"/><font color="#50A2E6" size="2">(文件格式：gif,jpg,jpeg,png,bmp;大小：2280*2280以内)</font>
		</td>
	</tr>
<!--	<tr>-->
<!--	      <td>-->
<!--	      	车站/区间位置：<span class="noRedSpan">*</span>-->
<!--	      </td>-->
<!--	      <td colspan="3">-->
<!--	      	<html:text property="latLongItude" readonly="true" styleClass="text" maxlength="100" size="80" />-->
<!--	      	<input type="button" class="button1" value="清除" onclick="itudeClear();">-->
<!--	      </td>-->
<!--	    </tr>-->
	<tr>
	      <td>
	      	工程概况：<span class="noRedSpan">*</span>
	      </td>
	      <td colspan="3"><html:textarea property="moment" cols="80" rows="8" /></td>
	</tr>
<!--		<tr>-->
<!--	      <td>-->
<!--	      	(车站/区间)站点位置&nbsp;&nbsp;&nbsp;-->
<!--	      </td>-->
<!--	      <td>-->
<!--		      <div style="float:left">-->
<!--		      	<html:text property="coordinates" readonly="true" styleClass="text" maxlength="100" size="50" />-->
<!--		      </div>-->
<!--		      <div>-->
<!--		      	<input type="button" id="btn_clear_station" class="btn_clear_5" value="清除" >-->
<!--		      </div>-->
<!--	      </td>-->
<!--	   </tr>-->
<!--		<tr>-->
<!--	      <td>-->
<!--	      	(车站/区间)标注位置&nbsp;&nbsp;&nbsp;-->
<!--	      </td>-->
<!--	      <td>-->
<!--		      <div style="float:left">-->
<!--		      	<html:text property="pointsInfo"  styleClass="text" maxlength="100" size="40" />-->
<!--		      </div>-->
<!--		      <div>-->
<!--		      	<input type="button" id="btn_refresh" class="btn_clear_5" value="刷新标注位置" >-->
<!--		      </div>-->
<!--	      </td>-->
<!--	 </tr>-->
</table>
</fieldset>
	
<!--		<c:if test="${param.tabFlag==1}"><c:set var="tabstate1" value="true"></c:set></c:if>-->
<!--	    <c:if test="${param.tabFlag==2}"><c:set var="tabstate2" value="true"></c:set></c:if>-->
<!--		<ex:tab id="dockjTab" width="100%">-->
<!--		 -->
<!--			<ex:tabItem name="lab1"  url="dtaqStationAction.do?method=create&tabFlag=1&qsegmentId=${param.qsegmentId}" selected="${tabstate1}" label="老系统描点" >-->
<!--				<c:if test="${param.tabFlag == '1'}">-->
<!--					<%@ include file="/biz/projectMonitor/dtaqStation/drawPicPiontOld.jsp" %>-->
<!--				</c:if>-->
<!--			   </ex:tabItem>-->
<!--		   <ex:tabItem name="lab2"  url="dtaqStationAction.do?method=create&tabFlag=2&qsegmentId=${param.qsegmentId}" label="新系统描点" selected="${tabstate2}">-->
<!--		   	<c:if test="${param.tabFlag == '2'}">-->
<!--		   			-->
<!--					<%@ include file="/biz/projectMonitor/dtaqStation/drawPicPiontNew.jsp" %>-->
<!--		   	-->
<!--			</c:if>-->
<!--		   </ex:tabItem>-->
<!--		</ex:tab>-->
	
		<div class="saveDiv">
				<input id="btn_save" value="确  定" type="button" icon="icon_save"/>
				<input id="btn_back" value="返  回" type="button" icon="icon_back"/>
		</div>
	</html:form>
	</body>
</html:html>
