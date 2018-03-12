<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
<html:html>
<head>
	<script type="text/javascript">
		//
	   $(document).ready(function(){
			//
			 $("#sta2").hide();
        $("#sta1").hide();
			$("#btn_save").click(function(){
				var properties=new Array(); 
				properties[0]=["name","名称"];
				properties[1]=["fileName_","上传附件"];
				properties[2]=["type","类型"];
				properties[3]=["recoder_date","填报日期"];
				 var type=$("[name='type']").val();
				 if(type=='1'){
				 properties[4]=["station_id","车站/区间"];
				 }
				saveValidateRequired("#btn_save",properties,"dtaqRiskPatrolForm");
			}); 
			//
			$("#btn_back").click(function(){   
	    		location.href="${ctx}/dtaqRiskPatrolAction.do?method=list";
			});  
				$("#btn_check").click(function(){ 
			    var url ="dtaqRiskPatrolAction.do?method=stationTree";
			  	art.dialog({id:'commonDialog1',title:'工点选择', iframe:url, width:'800', height:'400',top:'30'});
			});  
		});
		function fileSelect(){
		  $("[name='fileName_']").val( $("#fileAddr_").val().substring($("#fileAddr_").val().lastIndexOf("\\")+1,$("#fileAddr_").val().lastIndexOf(".")));
		}
		
		function fileClear(){
			 $("#fileName_").val("");
			 $("#fileAddr_").val("");
		}
		function showUploadDialogAndRefresh(URL,tWidth,tHeight)
{
	dlgFeatures = "dialogWidth:" + tWidth + "px;dialogHeight:" + tHeight +"px;resizable:yes;center:yes;";
	//window.open(URL,"",dlgFeatures);
	//window.location.reload();
	//window.open (URL, "newwindow", "width="+(window.screen.availWidth-10)+",height="+(window.screen.availHeight-30)+ ",top=0,left=0, toolbar=no, menubar=no, scrollbars=no, resizable=yes, location=no, status=no")
		var url = URL;
		art.dialog({id:'newwindow',title:'文件上传', iframe:url, width:'500', height:'250',top:'50%'}) ;	
}   
   function selectPatrolType(value){
       var ss=value;
       if(ss=='1'){
        $("#sta1").show();
        $("#sta2").show();
       }else{
        $("#sta2").hide();
        $("#sta1").hide();
       }
    }
	</script>
</head>
<content tag="heading">
	工程安全报告室
</content>
<body>
	<html:form enctype="multipart/form-data" action="dtaqRiskPatrolAction.do" method="POST">
		<input name="method" value="save" type="hidden" />
		<html:hidden property="id" />
		<!--查询定位 开始-->
		<html:hidden property="ec_p" />
		<html:hidden property="ec_crd" />
		<!--查询定位 结束-->
		<fieldset >
			<legend>工程安全报告室-编辑</legend>
			<table class="formTable" >
					<COLGROUP>
							<COL class="tdLeftTwo" />
			                <COL class="tdRightTwo" />
			                <COL class="tdLeftTwo" />
			                <COL class="tdRightTwo" />
					</COLGROUP>
					<tr>
						<td>
						  名称：<span class="redSpan">*</span>
						</td>
						<td >
							<html:text property="name"  styleClass="inputText" maxlength="100"/>
						</td>
					</tr>
				
					<tr>
						<td>
							文件名：<span class="redSpan">*</span>
						</td>
						<td >
							<input type="text" id="fileName_" name="fileName_" class="inputText"  size="30"/>
							<input type="button" icon="icon_currWeek" onclick="javascript:showUploadDialogAndRefresh('contentSelectAction.do?method=uploadFile&flag=1&mainTableName=${maintable}',900,700);" style="width: 76px; height: 65px; cursor:pointer" value="单附件上传" alt="进入文件上传页面" />
							<input type="button" icon="icon_delete" onclick="fileClear(this)" style="width: 76px; height: 65px; cursor:pointer" value="清空"/>
			
						</td>
						<td style="display:none">
							文件地址：<span class="noRedSpan">*</span>
						</td>
						<td style="display:none">
							<input type="text" id="fileAddr_" name="fileAddr_" class="inputText" readonly="readonly" size="30"/>
<%--							<input id="fileAddr_" class="inputText" type="file" onchange="fileSelect(this)" name="fileAddr_" size="30"/>--%>
						</td>
					</tr>
					<tr>
						<td>
						   类型：<span class="redSpan">*</span>
						</td>
						<td >
						<ex:dictSelect property="type" type="RiskPatrolType" onchange="selectPatrolType(this.value)"/>
						</td>
						<td id="sta1">
						  车站/区间：<span class="redSpan">*</span>
						</td>
						<td id="sta2">
						<html:hidden property="station_id" />
						<input type="text" name="station_name" style="width:200px;" />
						<input id="btn_check" value="选择" type="button" icon="icon_save"/>
						</td>
						
					</tr>
					<tr>
						<td>
							填报人：<span class="noRedSpan">*</span>
						</td>
						<td >
							<html:text property="recoder" styleClass="inputText" value="${oper}" maxlength="100" ></html:text>
						</td>
						<td>
							填报日期：<span class="redSpan">*</span>
						</td>
						<td >
							<c:set var="recoder_date"><fmt:formatDate value="${dtaqRiskPatrol.recoder_date}" pattern="yyyy-MM-dd HH:mm"/></c:set>
							<html:text property="recoder_date" value="${now_date}" styleClass="inputText"  onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})"/>
						</td>
					</tr>
					
			</table>
		</fieldset>
		
		<div class="saveDiv">
			<input id="btn_save" value="确  定" type="button" icon="icon_save"/>
			<input id="btn_back" value="${texts['button.back']}" type="button" icon="icon_back"/>
		</div>
	</html:form>
</body>
</html:html>
