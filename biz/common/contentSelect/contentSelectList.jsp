<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
<html:html>
<head>
		<%@ include file="/commons/meta.jsp"%>
		<script type="text/javascript">
 	 $(document).ready(function(){
	 		$("#btn_select").click(function(){ 
		 		 $("#btn_select").checked = true;
			     $("#btn_edit").checked = false;
				 location.href= "contentSelectAction.do?method=list&flag=1&type=${type}";
			});
			$("#btn_edit").click(function(){ 
		 		 $("#btn_select").checked = false;
			     $("#btn_edit").checked = true;
				 location.href= "contentSelectAction.do?method=list&flag=2&type=${type}";
			});
			$("#btn_allSelect").click(function(){ 
			 var alldatas = document.getElementsByName("select_id");
		  		 for(var i=0;i<alldatas.length;i++){
		      	 	 alldatas[i].checked = true;
		      	 }
			});
			$("#btn_notSelect").click(function(){ 
			 var alldatas = document.getElementsByName("select_id");
	    		for(var i=0;i<alldatas.length;i++){
	      			alldatas[i].checked = false;
	      		}
			});
			$("#btn_confirm").click(function(){
				selectInfo();
			});
			
			$("tr").click(function (e) {
		    	if ($(e.target).attr("type") != "checkbox") {
		        	$(this).find(":checkbox").attr("checked", !$(this).find(":checkbox").attr("checked"));
		    	}
			});
     });
    

     	
     //双击
        function dbSelectInfo(mutil_id){
          $("input[name='select_id'][value='"+mutil_id+"']").attr("checked","checked");
            selectInfo();
      }
     function selectInfo(){
     		 /*
     		    类型判断 
		  	 */
			   var type=${type};
			  if(type==1){//办理情况
			  	parent.$("[name='transactCircs']").val("");
     	       }
     	       if(type==2){//来文单位(收文管理、督办管理) 
     	       	parent.$("[name='sendCorp']").val("");
     	       }
     	       if(type==3){//送办意见(收文管理、督办管理) 
     	       	parent.$("[name='impowerOpinion']").val("");
     	       }
     	        if(type==4){//送办意见(部门收文、发文、汇报材料、工作函)
     	        	parent.$("[name='impowerOpinion']").val(""); 
     	       } 
     	        if(type==5){//来文单位(部门收文管理-独立) 
      				parent.$("[name='sendCorp']").val("");
     	       }	
     	       if(type==6){// 主送-发文管理-独立
     	       		parent.$("[name='mainCopyDept']").val("");
     	       }
     	       if(type==7){//送办意见(发文管理-独立) 
     	       		parent.$("[name='impowerOpinion']").val("");
     	       }
     	       if(type==8){// 主送-部门发文管理-独立
     	       		parent.$("[name='mainCopyDept']").val("");
     	       }
     	        if(type==9){//地点-工作计划-独立
     	        	parent.$("[name='eventPlace']").val("");
     	       }
     	         if(type==10){//授权范围-材料
     	         	parent.$("[name='accreditScope']").val("");
     	       }
     	       if(type==12){//意见选择-审核意见工作流
     	       		parent.$("[name='approveContent']").val("");
     	       }
     	       if(type==13){//计划支付申请条件_办公
     	       		parent.$("[name='planPayReason']").val("");
     	       }
     	        if(type==14){//计划支付申请条件_工程
     	        	parent.$("[name='planPayReason']").val("");
     	       }
     	        if(type==15){//计划支付申请条件_土地
     	        	parent.$("[name='planPayReason']").val("");
     	       }
     	        if(type==16){//计划支付申请条件_费用
     	        	parent.$("[name='planPayReason']").val("");
     	       }
     	       if(type==17){//甲方单位
     	       		parent.$("[name='firstParty']").val("");
     	       }
     	       if(type==18){//乙方单位
     	       		parent.$("[name='secondParty']").val("");
     	       }
     	       if(type==19){//丙方单位
     	       		parent.$("[name='thirdParty']").val("");
     	       }
		  	 /*
		  	   类型对应的内容
		  	 */
    		  var names = "";
		  	  var alldatas = document.getElementsByName("select_id");
		  	  for(var i=0;i<alldatas.length;i++){
		  	     if(alldatas[i].checked){
		  	     	names+=$("input[name='select_id'][value='"+alldatas[i].value+"']").attr("data")+"，";
		  	     }
		  	  }
		  	 if(names!=""){
		  	    var  len = names.length;
		  	    names = names.substring(0,len-1);
		  	 }
			 /*
		  	   类型对应的内容赋值
		  	 */
		  	 if(type==1){//办理情况
		  	 		parent.$("[name='transactCircs']").val(names);
		      }
		       if(type==2){//来文单位(收文管理、督办管理) 
		       		parent.$("[name='sendCorp']").val(names);
		      }
		       if(type==3){//送办意见(收文管理、督办管理) 
		       		parent.$("[name='impowerOpinion']").val(names);
		      }
		      if(type==4){//送办意见(部门收文、发文、汇报材料、工作函) 
		      		parent.$("[name='impowerOpinion']").val(names);
		      }
		       if(type==5){//来文单位(部门收文管理-独立) 
		       		parent.$("[name='sendCorp']").val(names);
		      }
		       if(type==6){//主送-发文管理-独立 
		  	     parent.$("[name='mainCopyDept']").val(names);
		      }
		       if(type==7){//送办意见(发文管理) 
		       		parent.$("[name='impowerOpinion']").val(names);
		      }
		      if(type==8){//主送-部门发文管理-独立 
		      		parent.$("[name='mainCopyDept']").val(names);
		      }
		      if(type==9){//地点-工作计划-独立 
		      		parent.$("[name='eventPlace']").val(names);
		      }
		       if(type==10){//授权范围-材料 
		       		parent.$("[name='accreditScope']").val(names);
		      }
		      if(type==12){//意见选择-工作流审核意见
		      		parent.$("[name='approveContent']").val(names);
     	       }
     	       if(type==13){//计划支付申请条件_办公
     	       		parent.$("[name='planPayReason']").val(names);
     	       }
     	       if(type==14){//计划支付申请条件_工程
     	       		parent.$("[name='planPayReason']").val(names);
     	       }
     	          if(type==15){//计划支付申请条件_土地
     	          	parent.$("[name='planPayReason']").val(names);
     	       }
     	          if(type==16){//计划支付申请条件_费用
     	          	parent.$("[name='planPayReason']").val(names);
     	       }
     	        if(type==17){//甲方单位
     	        	parent.$("[name='firstParty']").val(names);
     	       }
     	       if(type==18){//乙方单位
     	       		parent.$("[name='secondParty']").val(names);
     	       }
     	       if(type==19){//丙方单位
     	       		parent.$("[name='thirdParty']").val(names);
     	       }
		     parent. art.dialog({id:'commonDialog1'}).close();
			};
	</script>
</head>
<body >
	<table class="queryTable" >
		<tr>
			<td>
				<input id="btn_select" type="radio" name="select"  checked="checked" value="1">选择
				<input id="btn_edit" type="radio" name="select"  value="2" >编辑
			</td>
		</tr>
	</table>
			<div class="listButtonDiv">
				<input id="btn_confirm" type="button" icon="icon_confirm" value="确  定">	
				<input id="btn_allSelect" type="button" icon="icon_allSelect" value="全  选">
				<input id="btn_notSelect" type="button" icon="icon_notSelect" value="全不选">	
			</div>
				<ec:table items="contentSelects" var="contentSelect" 
				action="contentSelectAction.do?method=list&flag=${param.flag}&type=${param.type}" title="" 
				sortable="false" rowsDisplayed="10"
				imagePath="${ctx}/styles/extremecomponents/images/*.gif"
				locale="zh_CN" retrieveRowsCallback="limit" filterRowsCallback="limit"
				sortRowsCallback="limit">
			<ec:row highlightRow="true"  ondblclick="dbSelectInfo('${contentSelect.id}')">
			<ec:column property="rowcount" cell="rowCount" sortable="false" width="10%"
				title="序号" />
			<ec:column property="null" sortable="false" title="选择" width="10%">
				<input type="checkbox" name="select_id"
					value="${contentSelect.id}" data="${contentSelect.content}" />
			</ec:column>
			<ec:column property="content" calcTitle="content"
					title="内容" />
		</ec:row>
	</ec:table>
</body>
</html:html>
