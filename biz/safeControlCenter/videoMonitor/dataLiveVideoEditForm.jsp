<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
<html:html>
<head>
<link rel="stylesheet" type="text/css" href="${ctx}/scripts/jMyCarousel/carousel_css/example1.css" />
<style type="text/css">
	.sendDiv{display:none;position:absolute;width:300px; height:200px;border:1px solid #ccc;background-color:#dcf5fc;padding:5px;margin-left:50px;}
	.bottomDiv img{cursor:hand ; width:280px;height:150px;margin-left:1px;}
	.newTitle{background-color:#e0ecff;color:#15428b;font-weight:bold;text-align:left;padding-left:20px;height:20px;line-height:20px;border-bottom:1px solid #b2d4ee;margin-bottom:10px;}
	.index_other{background:url('${ctx}/images/index_other.png') no-repeat #e0ecff;}
	dt{cursor:pointer ;}
</style>
<script type="text/javascript" src="${ctx}/scripts/json2.js"></script>

<script src="${ctx}/scripts/uploadify/swfobject.js" type="text/javascript"></script>
<script src="${ctx}/scripts/uploadify/jquery.uploadify.v2.1.0.js" type="text/javascript"></script>
<link href="${ctx}/scripts/uploadify/uploadify.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${ctx}/scripts/queryLines.js"></script>
	<script type="text/javascript">
	 $(document).ready(function(){
	 
	 	getLines('${dataLiveVideo.line_id.line_id}','${dataLiveVideo.segment_id.segment_id}');
        getSections('${dataLiveVideo.line_id.line_id}','${dataLiveVideo.segment_id.segment_id}');
        getWokPoints('${dataLiveVideo.segment_id.segment_id}','${dataLiveVideo.station_id.station_id}');
	 
		 	var i=0; //上传
		 	var ctx=location.href;
			ctx=ctx.substr(0,ctx.lastIndexOf("/"));
	        jQuery("#fileupload").uploadify({
	            /*注意前面需要书写path的代码*/ 
	            'uploader'       : '${ctx}/scripts/uploadify/uploadify.swf',
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
	   
	   jQuery('#attach_name0').val(""); 
	   jQuery('#attach_name1').val(""); 
	   jQuery('#attach_name2').val(""); 
	   jQuery('#attach_name3').val(""); 
	   jQuery('#attach_name4').val(""); 
	   jQuery('#attach_name5').val(""); 
	   jQuery('#attach_name6').val(""); 
	   jQuery('#attach_name7').val(""); 
	   jQuery('#attach_name8').val(""); 
	   
	   jQuery('#attach_address0').val(""); 
	   jQuery('#attach_address1').val(""); 
	   jQuery('#attach_address2').val(""); 
	   jQuery('#attach_address3').val(""); 
	   jQuery('#attach_address4').val(""); 
	   jQuery('#attach_address5').val(""); 
	   jQuery('#attach_address6').val(""); 
	   jQuery('#attach_address7').val(""); 
	   jQuery('#attach_address8').val(""); 
	   
	}
	
	function pop(id){ 
		jQuery("#"+id).toggle();
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
<html:hidden property="ec_p" />
<html:hidden property="id" />
<html:hidden property="ec_id" value="${param.id}"/>

<html:hidden property="qlineId" />
<html:hidden property="qsectionId" />
<html:hidden property="qworkPointId" />
<html:hidden property="qstartDate" />
<html:hidden property="qendDate" />
		
<input type="hidden" id="attach_name0" name="attach_name0" value="${dataLiveVideo.attach_name}"/>
<input type="hidden" id="attach_name1" name="attach_name1" value="${dataLiveVideo.attach_name1}"/>	
<input type="hidden" id="attach_name2" name="attach_name2" value="${dataLiveVideo.attach_name2}"/>
<input type="hidden" id="attach_name3" name="attach_name3" value="${dataLiveVideo.attach_name3}"/>
<input type="hidden" id="attach_name4" name="attach_name4" value="${dataLiveVideo.attach_name4}"/>
<input type="hidden" id="attach_name5" name="attach_name5" value="${dataLiveVideo.attach_name5}"/>
<input type="hidden" id="attach_name6" name="attach_name6" value="${dataLiveVideo.attach_name6}"/>
<input type="hidden" id="attach_name7" name="attach_name7" value="${dataLiveVideo.attach_name7}"/>
<input type="hidden" id="attach_name8" name="attach_name8" value="${dataLiveVideo.attach_name8}"/>

<input type="hidden" id="attach_address0" name="attach_address0" value="${dataLiveVideo.attach_address}"/>	
<input type="hidden" id="attach_address1" name="attach_address1" value="${dataLiveVideo.attach_address1}"/>
<input type="hidden" id="attach_address2" name="attach_address2" value="${dataLiveVideo.attach_address2}"/>
<input type="hidden" id="attach_address3" name="attach_address3" value="${dataLiveVideo.attach_address3}"/>
<input type="hidden" id="attach_address4" name="attach_address4" value="${dataLiveVideo.attach_address4}"/>
<input type="hidden" id="attach_address5" name="attach_address5" value="${dataLiveVideo.attach_address5}"/>
<input type="hidden" id="attach_address6" name="attach_address6" value="${dataLiveVideo.attach_address6}"/>
<input type="hidden" id="attach_address7" name="attach_address7" value="${dataLiveVideo.attach_address7}"/>
<input type="hidden" id="attach_address8" name="attach_address8" value="${dataLiveVideo.attach_address8}"/>


		
<!--<html:hidden property="attach_name" />-->
<!--<html:hidden property="attach_address" />-->
<!--<html:hidden property="attach_name0"  />-->
<!--<html:hidden property="attach_address0" />-->
<!--<html:hidden property="attach_name1" />-->
<!--<html:hidden property="attach_address1" />-->
<!--<html:hidden property="attach_name2" />-->
<!--<html:hidden property="attach_address2" />-->
<!--<html:hidden property="attach_name3" />-->
<!--<html:hidden property="attach_address3" />-->
<!--<html:hidden property="attach_name4" />-->
<!--<html:hidden property="attach_address4" />-->
<!--<html:hidden property="attach_name5" />-->
<!--<html:hidden property="attach_address5" />-->
<!--<html:hidden property="attach_name6" />-->
<!--<html:hidden property="attach_address6" />-->
<!--<html:hidden property="attach_name7" />-->
<!--<html:hidden property="attach_address7" />-->
<!--<html:hidden property="attach_name8" />-->
<!--<html:hidden property="attach_address8" />-->
<fieldset>
<legend>现场视频监控室-编辑</legend>
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
             <select id="qworkPointId" name="workPointIdtemp" onchange="reValue()"></select>
             </td>
     </tr>
      <c:if test="${dataLiveVideo.id != null && dataLiveVideo.attach_name != null}">
		     <tr >
		      <td>上传附件1：<span class="redSpan">*</span></td>
		      <td>
		      		<div  onmouseover="pop('temMsgDiv0')" onmouseout="pop('temMsgDiv0')" style="float:left; text-align:left;">
						<dl>
							<dt>[${dataLiveVideo.attach_name}]</dt>
					        <dd id="temMsgDiv0" class="sendDiv">
					            <img src="${ctx}/dataLiveVideoAction.do?method=download&id=${dataLiveVideo.id}&fileType=0" width="300" height="200" />
					        </dd>
						</dl>
					</div>	
			</td>
		   </tr>
      </c:if>
	<c:if test="${dataLiveVideo.id != null && dataLiveVideo.attach_name1 != null}">
    	<tr>
      	<td>上传附件2：<span class="redSpan">*</span></td>
      	<td>
      		<div  onmouseover="pop('temMsgDiv1')" onmouseout="pop('temMsgDiv1')" style="float:left; text-align:left;">
				<dl>
					<dt>[${dataLiveVideo.attach_name1}]</dt>
			        <dd id="temMsgDiv1" class="sendDiv">
			            <img src="${ctx}/dataLiveVideoAction.do?method=download&id=${dataLiveVideo.id}&fileType=1" width="300" height="200" />
			        </dd>
				</dl>
			</div>	
      	</td>
    </tr>
    </c:if>
    <c:if test="${dataLiveVideo.id != null && dataLiveVideo.attach_name2 != null}">
	  	<tr>
	      <td>上传附件3：<span class="redSpan">*</span></td>
	      <td>
	      		<div  onmouseover="pop('temMsgDiv2')" onmouseout="pop('temMsgDiv2')" style="float:left; text-align:left;">
					<dl>
						<dt>[${dataLiveVideo.attach_name2}]</dt>
				        <dd id="temMsgDiv2" class="sendDiv">
				            <img src="${ctx}/dataLiveVideoAction.do?method=download&id=${dataLiveVideo.id}&fileType=2" width="300" height="200" />
				        </dd>
					</dl>
				</div>	
	      </td>
	    </tr>
   	</c:if>
   	<c:if test="${dataLiveVideo.id != null && dataLiveVideo.attach_name3 != null}">
	    <tr>
	      <td>上传附件4：<span class="redSpan">*</span></td>
	      <td>
		    
	      		<div  onmouseover="pop('temMsgDiv3')" onmouseout="pop('temMsgDiv3')" style="float:left; text-align:left;">
					<dl>
						<dt>[${dataLiveVideo.attach_name3}]</dt>
				        <dd id="temMsgDiv3" class="sendDiv">
				            <img src="${ctx}/dataLiveVideoAction.do?method=download&id=${dataLiveVideo.id}&fileType=3" width="300" height="200" />
				        </dd>
					</dl>
				</div>	
	      </td>
	    </tr>
    </c:if>
     <c:if test="${dataLiveVideo.id != null && dataLiveVideo.attach_name4 != null}">
	    <tr>
	      <td>上传附件5：<span class="redSpan">*</span></td>
	      <td>
	      		<div  onmouseover="pop('temMsgDiv4')" onmouseout="pop('temMsgDiv4')" style="float:left; text-align:left;">
					<dl>
						<dt>[${dataLiveVideo.attach_name4}]</dt>
				        <dd id="temMsgDiv4" class="sendDiv">
				            <img src="${ctx}/dataLiveVideoAction.do?method=download&id=${dataLiveVideo.id}&fileType=4" width="300" height="200" />
				        </dd>
					</dl>
				</div>	
	      </td>
	    </tr>
	</c:if>
	 <c:if test="${dataLiveVideo.id != null && dataLiveVideo.attach_name5 != null}">
	    <tr>
	      <td>上传附件6：<span class="redSpan">*</span></td>
	      <td>
	      		<div  onmouseover="pop('temMsgDiv5')" onmouseout="pop('temMsgDiv5')" style="float:left; text-align:left;">
					<dl>
						<dt>[${dataLiveVideo.attach_name5}]</dt>
				        <dd id="temMsgDiv5" class="sendDiv">
				            <img src="${ctx}/dataLiveVideoAction.do?method=download&id=${dataLiveVideo.id}&fileType=5" width="300" height="200" />
				        </dd>
					</dl>
				</div>	
	      </td>
	    </tr>
	  </c:if>
	   <c:if test="${dataLiveVideo.id != null && dataLiveVideo.attach_name6 != null}">
		    <tr>
		      <td>上传附件7：<span class="redSpan">*</span></td>
		      <td>
			     
		      		<div  onmouseover="pop('temMsgDiv6')" onmouseout="pop('temMsgDiv6')" style="float:left; text-align:left;">
						<dl>
							<dt>[${dataLiveVideo.attach_name6}]</dt>
					        <dd id="temMsgDiv6" class="sendDiv">
					            <img src="${ctx}/dataLiveVideoAction.do?method=download&id=${dataLiveVideo.id}&fileType=6" width="300" height="200" />
					        </dd>
						</dl>
					</div>	
		      </td>
		    </tr>
	</c:if>
 	<c:if test="${dataLiveVideo.id != null && dataLiveVideo.attach_name7 != null}">
	    <tr>
	      <td>上传附件8：<span class="redSpan">*</span></td>
	      <td>
	      		<div  onmouseover="pop('temMsgDiv7')" onmouseout="pop('temMsgDiv7')" style="float:left; text-align:left;">
					<dl>
						<dt>[${dataLiveVideo.attach_name7}]</dt>
				        <dd id="temMsgDiv7" class="sendDiv">
				            <img src="${ctx}/dataLiveVideoAction.do?method=download&id=${dataLiveVideo.id}&fileType=7" width="300" height="200" />
				        </dd>
					</dl>
				</div>	
	      </td>
	    </tr>
	</c:if>
	<c:if test="${dataLiveVideo.id != null && dataLiveVideo.attach_name8 != null}">
	    <tr>
	      <td>上传附件9：<span class="redSpan">*</span></td>
	      <td>
	      		<div  onmouseover="pop('temMsgDiv8')" onmouseout="pop('temMsgDiv8')" style="float:left; text-align:left;">
					<dl>
						<dt>[${dataLiveVideo.attach_name8}]</dt>
				        <dd id="temMsgDiv8" class="sendDiv">
				            <img src="${ctx}/dataLiveVideoAction.do?method=download&id=${dataLiveVideo.id}&fileType=8" width="300" height="200" />
				        </dd>
					</dl>
				</div>	
	      </td>
	    </tr>
     </c:if>
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
			<input type="text" id="recoder_date" name="recoder_date" class="form_input" value='<fmt:formatDate pattern="yyyy-MM-dd" value="${dataLiveVideo.recoder_date}"/>' onfocus="WdatePicker()" onchange="reValue()"/>
		</td>
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
			<input id="btn_save" value="确  定" type="button" icon="icon_save"/>
			<input id="btn_back" value="返  回" type="button" icon="icon_back"/>
		</div>
	</html:form>
	</body>
</html:html>
