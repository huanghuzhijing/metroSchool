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
<script src="${ctx}/scripts/jMyCarousel/jMyCarousel.js" type="text/javascript"></script>
<script src="${ctx}/scripts/jMyCarousel/jquery.mousewheel.js" type="text/javascript"></script>
<script type="text/javascript">
jQuery(document).ready(function(){
		
		$("#btn_back").click(function(){
		    document.forms[0].action='dataLiveVideoAction.do?method=list&ec_p=${param.ec_p}&ec_id=${param.id}&ec_crd=${param.ec_crd}';
			document.forms[0].submit();
		});
		jQuery(".jMyCarousel").jMyCarousel({
		        visible: '100%'
		});
	})
	function pop(id){ 
		jQuery("#"+id).toggle();
	}

</script>
</head>
<content tag="heading">现场视频监控室</content>
<body>
<html:form enctype="multipart/form-data" action="dataLiveVideoAction.do" method="POST">
		<html:hidden property="qlineId" />
		<html:hidden property="qsectionId" />
		<html:hidden property="qworkPointId" />
		<html:hidden property="qstartDate" />
		<html:hidden property="qendDate" />
		
		<html:hidden property="ec_crd" />
		<html:hidden property="ec_id" value="${param.id}"/>
		<html:hidden property="ec_p" />
		<html:hidden property="id" />
</html:form>
<fieldset>
	<legend>现场视频监控室-详细</legend>
				<table class="titleTable">
					<COLGROUP>
						<COL class="tdLeftTwo" />
						<COL class="tdRightTwo" />
						<COL class="tdLeftTwo" />
						<COL class="tdRightTwo" />
					</COLGROUP>		
					 <tr>
						<td>线路：<span class="noRedSpan">*</span></td>
						<td colspan="3">
							${dataLiveVideo.line_id.line_name}
						</td>
					</tr>
       				<tr>
						<td>标段：<span class="noRedSpan">*</span></td>
						<td>
							${dataLiveVideo.segment_id.segment_name}
						</td>
					</tr>
					<tr>
						 <td>工点：<span class="noRedSpan">*</span></td>
						<td>
							${dataLiveVideo.station_id.station_name}
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
						        <c:if test="${dataLiveVideo.oldOrNew == 1}">
						            <img src="${ctx}/dataLiveVideoAction.do?method=download&id=${dataLiveVideo.id}&fileType=0" width="300" height="200" />
						       	</c:if>
						       	<c:if test="${dataLiveVideo.oldOrNew != 1}">
						            <li><img src="${picUrl}" width="300" height="200"/></li>
						       	</c:if>
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
				            <c:if test="${dataLiveVideo.oldOrNew == 1}">
						            <img src="${ctx}/dataLiveVideoAction.do?method=download&id=${dataLiveVideo.id}&fileType=1" width="300" height="200" />
						       	</c:if>
						       	<c:if test="${dataLiveVideo.oldOrNew != 1}">
						            <li><img src="${picUrl1}" width="300" height="200"/></li>
						       </c:if>
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
					              <c:if test="${dataLiveVideo.oldOrNew == 1}">
						            <img src="${ctx}/dataLiveVideoAction.do?method=download&id=${dataLiveVideo.id}&fileType=2" width="300" height="200" />
						       	</c:if>
						       	<c:if test="${dataLiveVideo.oldOrNew != 1}">
						            <li><img src="${picUrl2}" width="300" height="200"/></li>
						       	</c:if>
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
					             <c:if test="${dataLiveVideo.oldOrNew == 1}">
						            <img src="${ctx}/dataLiveVideoAction.do?method=download&id=${dataLiveVideo.id}&fileType=3" width="300" height="200" />
						       	</c:if>
						       	<c:if test="${dataLiveVideo.oldOrNew != 1}">
						            <li><img src="${picUrl3}" width="300" height="200"/></li>
						       	</c:if>
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
					             <c:if test="${dataLiveVideo.oldOrNew == 1}">
						            <img src="${ctx}/dataLiveVideoAction.do?method=download&id=${dataLiveVideo.id}&fileType=4" width="300" height="200" />
						       	</c:if>
						       	<c:if test="${dataLiveVideo.oldOrNew != 1}">
						            <li><img src="${picUrl4}" width="300" height="200"/></li>
						       	</c:if>
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
					              <c:if test="${dataLiveVideo.oldOrNew == 1}">
						            <img src="${ctx}/dataLiveVideoAction.do?method=download&id=${dataLiveVideo.id}&fileType=5" width="300" height="200" />
						       	</c:if>
						       	<c:if test="${dataLiveVideo.oldOrNew != 1}">
						            <li><img src="${picUrl5}" width="300" height="200"/></li>
						       	</c:if>
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
						             <c:if test="${dataLiveVideo.oldOrNew == 1}">
						            <img src="${ctx}/dataLiveVideoAction.do?method=download&id=${dataLiveVideo.id}&fileType=6" width="300" height="200" />
						       	</c:if>
						       	<c:if test="${dataLiveVideo.oldOrNew != 1}">
						            <li><img src="${picUrl6}" width="300" height="200"/></li>
						       	</c:if>
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
					             <c:if test="${dataLiveVideo.oldOrNew == 1}">
						            <img src="${ctx}/dataLiveVideoAction.do?method=download&id=${dataLiveVideo.id}&fileType=7" width="300" height="200" />
						       	</c:if>
						       	<c:if test="${dataLiveVideo.oldOrNew != 1}">
						            <li><img src="${picUrl7}" width="300" height="200"/></li>
						       	</c:if>
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
					              <c:if test="${dataLiveVideo.oldOrNew == 1}">
						            <img src="${ctx}/dataLiveVideoAction.do?method=download&id=${dataLiveVideo.id}&fileType=8" width="300" height="200" />
						       	</c:if>
						       	<c:if test="${dataLiveVideo.oldOrNew != 1}">
						            <li><img src="${picUrl8}" width="300" height="200"/></li>
						       	</c:if>
					        </dd>
						</dl>
					</div>	
		      </td>
		    </tr>
	     </c:if>
		<tr>
         		<tr>
		             <td>
		             	填报日期：<span class="noRedSpan">*</span>
		             </td>
		             <td>
		             	<fmt:formatDate value="${dataLiveVideo.recoder_date}"/>
		             </td>
           	 </tr>
           	 <tr>
					<td>
						备注：<span class="noRedSpan">*</span>
					</td>
					<td colspan="3">
						${dataLiveVideo.memo}
					</td>
			</tr>
		</table>
	</fieldset>

	<div class="saveDiv">
		<input id="btn_back" value="返回" type="button" icon="icon_back"/>
	</div>	
	
<div class="bottomDiv" style="width:99%;margin-left:auto;margin-right:auto;margin-top:10px;height:190px;border:1px solid #B2D4EE;">
	<div class="newTitle index_other">现场视频<span class="opeatormemo">&nbsp;&nbsp;(当鼠标移至图片列表左右箭头时，图片会循环滚动。)</span></div>
	<div style="width:99%;height:130px;">
		<div class="jMyCarousel" >
	    <ul>
	    	<c:if test="${dataLiveVideo.oldOrNew != 1}">
<!--	    		<li><img src="http://192.168.1.100:8012/upload/prjVideoUP_Photo_Annex/1474512633771_7528.png" /></li>-->
	    		<c:if test="${dataLiveVideo.id != null && dataLiveVideo.attach_name != null}">
		    		<li><img src="${picUrl}" /></li>
		    	</c:if>
		    	<c:if test="${dataLiveVideo.id != null && dataLiveVideo.attach_name1 != null}">
		    		<li><img src="${picUrl1}" /></li>
		    	</c:if>
		    	<c:if test="${dataLiveVideo.id != null && dataLiveVideo.attach_name2 != null}">
		    		<li><img src="${picUrl2}" /></li>
		    	</c:if>
		    	<c:if test="${dataLiveVideo.id != null && dataLiveVideo.attach_name3 != null}">
		    		<li><img src="${picUrl3}" /></li>
		    	</c:if>
		    	<c:if test="${dataLiveVideo.id != null && dataLiveVideo.attach_name4 != null}">
		    		<li><img src="${picUrl4}" /></li>
		    	</c:if>
		    	<c:if test="${dataLiveVideo.id != null && dataLiveVideo.attach_name5 != null}">
		    		<li><img src="${picUrl5}" /></li>
		    	</c:if>
		    	<c:if test="${dataLiveVideo.id != null && dataLiveVideo.attach_name6 != null}">
		    		<li><img src="${picUrl6}" /></li>
		    	</c:if>
		    	<c:if test="${dataLiveVideo.id != null && dataLiveVideo.attach_name7 != null}">
		    		<li><img src="${picUrl7}" /></li>
		    	</c:if>
		    	<c:if test="${dataLiveVideo.id != null && dataLiveVideo.attach_name8 != null}">
		    		<li><img src="${picUrl8}" /></li>
		    	</c:if>
	    	</c:if>
	    	
	    	
	    	<c:if test="${dataLiveVideo.oldOrNew == 1}">
		    	<c:if test="${dataLiveVideo.id != null && dataLiveVideo.attach_name != null}">
		    		<li><img src="${ctx}/dataLiveVideoAction.do?method=download&id=${dataLiveVideo.id}&fileType=0" /></li>
		    	</c:if>
		    	<c:if test="${dataLiveVideo.id != null && dataLiveVideo.attach_name1 != null}">
		    		<li><img src="${ctx}/dataLiveVideoAction.do?method=download&id=${dataLiveVideo.id}&fileType=1" /></li>
		    	</c:if>
		    	<c:if test="${dataLiveVideo.id != null && dataLiveVideo.attach_name2 != null}">
		    		<li><img src="${ctx}/dataLiveVideoAction.do?method=download&id=${dataLiveVideo.id}&fileType=2" /></li>
		    	</c:if>
		    	<c:if test="${dataLiveVideo.id != null && dataLiveVideo.attach_name3 != null}">
		    		<li><img src="${ctx}/dataLiveVideoAction.do?method=download&id=${dataLiveVideo.id}&fileType=3" /></li>
		    	</c:if>
		    	<c:if test="${dataLiveVideo.id != null && dataLiveVideo.attach_name4 != null}">
		    		<li><img src="${ctx}/dataLiveVideoAction.do?method=download&id=${dataLiveVideo.id}&fileType=4" /></li>
		    	</c:if>
		    	<c:if test="${dataLiveVideo.id != null && dataLiveVideo.attach_name5 != null}">
		    		<li><img src="${ctx}/dataLiveVideoAction.do?method=download&id=${dataLiveVideo.id}&fileType=5" /></li>
		    	</c:if>
		    	<c:if test="${dataLiveVideo.id != null && dataLiveVideo.attach_name6 != null}">
		    		<li><img src="${ctx}/dataLiveVideoAction.do?method=download&id=${dataLiveVideo.id}&fileType=6" /></li>
		    	</c:if>
		    	<c:if test="${dataLiveVideo.id != null && dataLiveVideo.attach_name7 != null}">
		    		<li><img src="${ctx}/dataLiveVideoAction.do?method=download&id=${dataLiveVideo.id}&fileType=7" /></li>
		    	</c:if>
		    	<c:if test="${dataLiveVideo.id != null && dataLiveVideo.attach_name8 != null}">
		    		<li><img src="${ctx}/dataLiveVideoAction.do?method=download&id=${dataLiveVideo.id}&fileType=8" /></li>
		    	</c:if>
	    	</c:if>
	    </ul>
		</div>
	</div>
</div>

  </body>
</html:html>
