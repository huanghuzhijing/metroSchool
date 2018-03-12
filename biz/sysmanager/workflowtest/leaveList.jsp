﻿<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>
<ex:bundle/>
<html:html>
<head>
<title>业务系统</title>
<content tag="heading">
  请假管理
</content>  
<script src="${ctx}/scripts/public.js" type="text/javascript"></script>
	<script type="text/javascript">
	//
	$(document).ready(function(){
			//
      		var ecid = '${param.ec_id}';
	 		if((ecid==null || ecid == ''||ecid=='null') && ('${count}' > 0)){
		 		pullValue('${ecid}');
		 	}else{
		 		pullValue('${param.ec_id}');
		 	}
	        //
	       //增加
	       $("#btn_add").click(function(){
	       		var operObj = $("input[type=radio][name='select_id'][checked]");
	       		location.href=$(this).attr("url");
	       });
	        //详细
	       $("#btn_view").click(function(){
	       		var operObj = $("input[type=radio][name='select_id'][checked]");
	       		var id = operObj.val();
	       		showView(id);
	       });
	       //修改
	       $("#btn_edit").click(function(){
	       		var operObj = $("input[type=radio][name='select_id'][checked]");
	       		var id = operObj.val();
	       		location.href=$(this).attr("url")+"&id="+id;
	       });         
	       //删除
	       $("#btn_delete").click(function(){
	         var operObj = $("input[type=radio][name='select_id'][checked]");
	       	 var id = operObj.val();
			   if(window.confirm("${texts['dtaq.common.delete.msg']}"))
				{
				   location.href=$(this).attr("url")+"&id="+id;
				}
	       });
	       //上报
	       $("#btn_submit").click(function(){
	       		if(window.confirm("是否确认上报？")){
	       			var operObj = $("input[type=radio][name='select_id'][checked]");
		       		var id = operObj.val();
		       		location.href='leaveAction.do?method=submitToWorkFlow&id='+id+'&flagSubmit=submit&auditStatus='+ $("[name='select_id'][type='radio'][value='"+id+"']").attr("auditStatus")+'&ec_id='+id+'&ec_auditStatus=1&ec_p='+$("input[name='ec_p']").val()+'&ec_crd='+$("[name='ec_rd']").val();
	       		}
	       });
	        //办结
	       $("#btn_trans").click(function(){
	       		var operObj = $("input[type=radio][name='select_id'][checked]");
	       		var id = operObj.val();
	       		location.href=$(this).attr("url")+"&objectid="+id+"&wfentryid=3";
	       });
	       //查看审核记录
	       $("#btn_approveInfoView").click(function(){
	       		var operObj = $("input[type=radio][name='select_id'][checked]");
	       		var id = operObj.val();
	       		location.href=$(this).attr("url")+"&id="+id;
	       });
	       //图形展示
	       $("#btn_jbpmImgView").click(function(){
	       		var operObj = $("input[type=radio][name='select_id'][checked]");
	       		var id = operObj.val();
	       		var url=$(this).attr("url")+"&id="+id;
				window.open(url,"流程图形展示");
	       });
     });
	 //
     function pullValue(mutil_id){
                var select_count=0;
    		 	var sels=$("input[name='select_id']");
				for(i=0;i<sels.length;i++){
					if(sels[i].value==mutil_id){
						select_count++;
						$("input[name='select_id'][value='"+mutil_id+"']").attr("checked","checked");
						break;
					}
				}
				if(select_count!=0){
		          	   if($("input[type=radio][name='select_id'][checked]").attr("state")==-1){
			                $("#btn_view").show();
			                $("#btn_edit").hide();
			                $("#btn_delete").hide();
					  	 	$("#btn_submit").hide();
	             		 	$("#btn_approveInfoView").hide();
	               			$("#btn_jbpmImgView").show();
	               			 $("#btn_trans").hide();
			            }else if($("input[type=radio][name='select_id'][checked]").attr("state")==1){
			               $("#btn_view").show();
			                $("#btn_edit").hide();
			                $("#btn_delete").hide();
					    	$("#btn_submit").hide();
	             		 	$("#btn_approveInfoView").hide();
	               			$("#btn_jbpmImgView").show();
	               			 $("#btn_trans").hide();
			            }else if($("input[type=radio][name='select_id'][checked]").attr("state")==-2){
			                $("#btn_view").show();
			                $("#btn_edit").show();
			                $("#btn_delete").hide();
					    	$("#btn_submit").show();
	             		 	$("#btn_trans").show();
	             		 	$("#btn_approveInfoView").hide();
	               			$("#btn_jbpmImgView").show();
		          	  }else{
			            	$("#btn_view").show();
			                $("#btn_edit").show();
			                $("#btn_delete").show();
					    	$("#btn_submit").show();
					    	$("#btn_approveInfoView").hide();
			                $("#btn_jbpmImgView").hide();
			                $("#btn_trans").hide();
			            }
	       	 	}else{
	               $("#btn_edit").hide();
	               $("#btn_view").hide();
	               $("#btn_delete").hide();
	               $("#btn_submit").hide();
	               $("#btn_approveInfoView").hide();
	               $("#btn_jbpmImgView").hide();
	               $("#btn_trans").hide();
	       	    }
		}
      	//
		function showView(id){
	    	location.href="leaveAction.do?method=view&id="+id;
	  	}
	</script>
</head>
  <body > 
  <!-- 
	<table class="titleTable" width="99%" border="0" cellspacing="0" cellpadding="0"> 
		<tr>
			<td class="titleShow"><span class="titleContent">&nbsp;[查询条件]&nbsp;</span></td>
		</tr>
		 <tr>
    	 <td>
			 <html:form action="leaveAction.do?method=list">
			    <table align="left">
			    	<tr>
			    		<td>
			    			姓&nbsp;&nbsp;&nbsp;&nbsp;名：
			    			<html:text property="qname" maxlength="50" size="20"></html:text>
			    		</td>
			    	
					
			    		<td>   			
				      		<html:submit styleClass="button1" value="查  询"></html:submit>
				      	</td>
				    </tr>
			    </table>
			 </html:form>
		</td>
       </tr>
       </table>
    -->
		<div class="listButtonDiv">
				<input type="button" id="btn_add"   icon="icon_add" class="button1 "           url="leaveAction.do?method=create"      value="${texts['button.new']}"/>
	            <input type="button" id="btn_view"    icon="icon_view"  class="button1 hidden "    url="leaveAction.do?method=view"        value="${texts['button.detail']}"/>
	            <input type="button" id="btn_edit"    icon="icon_edit"    class="button1 hidden "    url="leaveAction.do?method=edit"        value="${texts['button.edit']}"/>
	            <input type="button" id="btn_delete"   icon="icon_delete" class="button1 hidden "    url="leaveAction.do?method=delete"      value="${texts['button.delete']}"/>
			    <input type="button" id="btn_submit"    icon="icon-reload"   class="button1 hidden "  value="上  报"/>
			    <%-- 
			    <input type="button" id="btn_trans"    icon="icon-reload"   class="button1 hidden "    url="leaveAction.do?method=trans"        value="办  结"/>
			    --%>
			    <input type="button" id="btn_approveInfoView"  icon="icon-event"    class="button1 hidden "    url="leaveAction.do?method=approveInfoView&forwardFlag=approveInfoView"        value="审核记录"/>
			    <input type="button" id="btn_jbpmImgView"  icon="icon-pkg"   class="button1 hidden "    url="leaveAction.do?method=jbpmImgView"      value="图形展示"/>
		</div>
	  <ec:table items="leaves" var="leave" action="leaveAction.do"
	 			title=""  
        		width="100%"  sortable="false" 
        		rowsDisplayed="10"
	 			imagePath="${ctx}/styles/extremecomponents/images/*.gif" locale="zh_CN" 
				retrieveRowsCallback="limit"
			   	filterRowsCallback="limit"
			   	sortRowsCallback="limit">
		    	<ec:row highlightRow="false" onmouseover="this.style.cursor='pointer'" ondblclick="showView('${leave.id}');"
		    		onclick="pullValue('${leave.id}')"	>
				    	 <ec:column property="rowcount" cell="rowCount" sortable="false" title="序号" />
				    	 <ec:column property="null" sortable="false" title="选择">
				    	 	 <input type="radio" name="select_id"   value="${leave.id}" state="${leave.auditStatus}"  />
				    	 </ec:column>
				    	  <ec:column property="leaver.empname" title="请假人"/>
				    	  <ec:column property="leaveDate" cell="date" width="10%" title="请假日期" />
				    	  <ec:column property="leaveDays" calcTitle="leaveDyas" title="请假天数"/>
				    	  <ec:column property="transState" calcTitle="transState" title="审核状态" width="8%">
								<ex:workFlowState  auditstatus="${leave.auditStatus}"  transState="${leave.transState}"/>
							</ec:column>
					</ec:row>
		 </ec:table>
  </body>
</html:html>
