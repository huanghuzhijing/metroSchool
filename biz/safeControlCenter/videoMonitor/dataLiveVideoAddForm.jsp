<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
<html:html>
<head>
<script type="text/javascript" src="${ctx}/scripts/json2.js"></script>

<script src="${ctx}/scripts/uploadify/swfobject.js" type="text/javascript"></script>
<script src="${ctx}/scripts/uploadify/jquery.uploadify.v2.1.0.js" type="text/javascript"></script>
<link href="${ctx}/scripts/uploadify/uploadify.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${ctx}/scripts/queryLines.js"></script>
<script type="text/javascript">
	 $(document).ready(function(){
	 		//工地线路初始化
		    getLines('');
		 	getSections('','');
		    getWokPoints('','');
		    
		 	var i=0; //上传
		 	var ctx=location.href;
			ctx=ctx.substr(0,ctx.lastIndexOf("/"));
	        jQuery("#fileupload").uploadify({
	            /*注意前面需要书写path的代码*/ 
	            'uploader'       : ctx+'/scripts/uploadify/uploadify.swf',
	            'script'         : 'servlet/UploadFYNew', 
	            'cancelImg'      : '${ctx}/scripts/uploadify/cancel.png', 
	            'queueID'        : 'fileQueue', 
	            'fileDataName'   : 'fileupload', 
	            'auto'           : false, 
	            'folder'    	 : '/uploadsqm',  
	            'multi'          : true, //是否支持多文件上传 
	            
	             'buttonImg'      :ctx+'/scripts/uploadify/btn.jpg', 
	            'buttonText'     : '  ', //按钮上的文字 
	            'simUploadLimit' : 9, //一次同步上传的文件数目 
	            'sizeLimit'      : 512000, //设置单个文件大小限制 
	            'queueSizeLimit' : 9, //队列中同时存在的文件个数限制 
	            'fileDesc'       : '支持格式:rar/rmvb.', //如果配置了以下的'fileExt'属性，那么这个属性是必须的 
	            'fileExt'        : '*.gif;*.jpg;*.jpeg;*.png;*.bmp',//允许的格式   
	        	onComplete: function (event, queueID, fileObj, response, data) { 
	        		jQuery("[name='attach_name"+i+"']").val(fileObj.name);
	        		jQuery("[name='attach_address"+i+"']").val(response);
	        		i = i+1;
					jQuery('<li></li>').appendTo('.files').text("文件:" + fileObj.name + "上传成功!"); 
				}, onError: function(event, queueID, fileObj) { 
	         		alert("文件:" + fileObj.name + "上传失败");
	         		jQuery("[name='attach_name"+i+"']").val("");
	        		jQuery("[name='attach_address"+i+"']").val("");
	         
	   			},onCancel: function(event, queueID, fileObj){ 
	   				alert("取消了" + fileObj.name);
	   			}
	        }); 
	 //保存
	 	$("#btn_save").click(function(){
	 	 $.ajax({
				   type: "POST",
				   url: "${ctx}/dataLiveVideoAction.do?method=validate",	
				   data:"recoder_date="+jQuery("[name='recoder_date']").val()+"&qworkPointId="+jQuery("[name='workPointIdtemp']").val(),
				   success: function(msg){
						 if(msg=="no"){
							 alert('该车站或区间在当前填报日期下的现场视频已存在，请您重新选择');
							
						 }else{
						 var properties=new Array(); 
							properties[0]=["lineIdtemp","线路"];
							properties[1]=["sectionIdtemp","标段"];
							properties[2]=["workPointIdtemp","工点"];
							properties[3]=["recoder_date","填报日期"];
							saveValidateRequired("#btn_save",properties,"dataLiveVideoForm");
						 }
					}
				});
			
			}); 
		//返回		
		 $("#btn_back").click(function(){ 
			document.forms[0].action='dataLiveVideoAction.do?method=list&ec_p=${param.ec_p}&ec_id=${param.id}&ec_crd=${param.ec_crd}'; 
	    	document.forms[0].submit();
	    }); 
	}); 
	
	function uploadifyUpload(){ 
	   jQuery('#fileupload').uploadifyUpload(); 
	}
	function reValue(){

	 $.ajax({
				   type: "POST",
				   url: "${ctx}/dataLiveVideoAction.do?method=validate",	
				   data:"recoder_date="+jQuery("[name='recoder_date']").val()+"&qworkPointId="+jQuery("[name='workPointIdtemp']").val(),
				   success: function(msg){
						 if(msg=="no"){
							 alert('该车站或区间在当前填报日期下的现场视频已存在，请您重新选择');
							
						 }
					}
				}); 
				
	}

</script>
</head>
<content tag="heading">现场视频监控室</content>
<body>

<html:form action="dataLiveVideoAction.do" styleClass="form" method="POST" styleId="dataLiveVideoForm" enctype="multipart/form-data">
<input type="hidden" name="method" value="save">
<html:hidden property="ec_crd" />
<html:hidden property="id" />

<html:hidden property="attach_name" />
<html:hidden property="attach_address" />
<html:hidden property="attach_name0"  />
<html:hidden property="attach_address0" />
<html:hidden property="attach_name1" />
<html:hidden property="attach_address1" />
<html:hidden property="attach_name2" />
<html:hidden property="attach_address2" />
<html:hidden property="attach_name3" />
<html:hidden property="attach_address3" />
<html:hidden property="attach_name4" />
<html:hidden property="attach_address4" />
<html:hidden property="attach_name5" />
<html:hidden property="attach_address5" />
<html:hidden property="attach_name6" />
<html:hidden property="attach_address6" />
<html:hidden property="attach_name7" />
<html:hidden property="attach_address7" />
<html:hidden property="attach_name8" />
<html:hidden property="attach_address8" />
		
<fieldset>
<legend>现场视频监控室-新增</legend>
<table class="formTable">
	<COLGROUP >
		<COL class="tdLeftTwo" />
		<COL class="tdRightTwo" />
		<COL class="tdLeftTwo" />
		<COL class="tdRightTwo" />
	</COLGROUP>
	  <tr>
          	<td>线路：<span class="redSpan">*</span></td>
          	<td colspan="3">
			  <select id="qlineId" name="lineIdtemp" onchange="getSections(this.value,'')"></select>
			 </td>
		</tr>
       <tr>
             <td>标段：<span class="redSpan">*</span></td>
             <td>
             <select id="qsectionId" name="sectionIdtemp" onchange="getWokPoints(this.value,'')"></select>
			 </td>
	  </tr>
       <tr>
              <td>工点：<span class="redSpan">*</span></td>
             <td>
             <select id="qworkPointId" name="workPointIdtemp" onchange=reValue()></select>
             </td>
     </tr>
	<tr>
		<td>
			上传附件：<span class="redSpan">*</span>
		</td>
		<td colspan="3">
			<input type="file" name="fileupload" id="fileupload" />
			<font color="orange">(备注：至少上传2张图片，图片个数不允许超过9个，图片格式为：gif,jpg,jpeg,png,bmp，单张图片的大小不要超过500K。)</font>
			<div id="fileQueue"></div>
			<input type="button"  value="开始上传"  icon="icon_currWeek" onClick="uploadifyUpload()"/>
			
			<a href="javascript:jQuery('#fileupload').uploadifyClearQueue();"><input type="button"  value="取消所有上传"  icon="icon-pkg"/></a>
			<ol class=files></ol>
		</td>
	</tr>
	<tr>
		<td>
			填报日期：<span class="redSpan">*</span>
		</td>
		<td >
			<html:text property="recoder_date" styleClass="inputText"  onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})" onchange="reValue()" value="${now_date}"/>
		</td>
	</tr>
	<tr>
		<td>
			摘要：<span class="noRedSpan">*</span>
		</td>
		<td colspan="3">
			<html:textarea property="memo"  />
		</td>
	</tr>	
</table>
</fieldset>
		<div class="saveDiv">
			<input id="btn_save" value="确  定" type="button" icon="icon_save" onchange="reValue()"/>
			<input id="btn_back" value="返  回" type="button" icon="icon_back"/>
		</div>
	</html:form>
	</body>
</html:html>
