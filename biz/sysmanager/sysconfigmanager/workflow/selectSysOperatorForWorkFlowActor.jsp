<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
<html:html>
<head>
<%@ include file="/commons/meta.jsp"%>
	<script type="text/javascript">
		//区别关闭方法的全局变量
		var closeFlag='0';
		//加载
		$(document).ready(function(){
		  
			  setSelect();
			  closewin();
			  //
			  $("#btn_allSelect").click(function(){
			     choseAll(this);
			  })
			  //
			  $("#btn_notSelect").click(function(){
			     choseNone();
			  })
			  //
			  $("[name=checkboxs]").click(function(){
			     chockboxChange(this);
			  })
			  //
			  $("#btn_confrim").click(function(){
			    var flag=false;
			   	 $("input[type=checkbox][name='checkboxs'][checked]").each(function(){
			   		 flag=true;
			   	 })
			   	 if(flag){
			     var index = $("#index").val();
		             select_acror();
		             closeFlag = 1 ;
		             $("#actRoles"+index,parent.document).val("");
			         $("#actRoleIds"+index,parent.document).val("");
				     parent.art.dialog({id:'commonDialog1'}).close();
			     }else{
			        alert("请选择信息！");
			     }
			  })
			  //
		});
		//
	    function choseAll(){
	      $("[name=checkboxs]").attr("checked",true);
	    }
	    //
	    function choseNone(){
	      $("[name=checkboxs]").attr("checked",false);
	    }
	    //确定函数 
	   function select_acror(){
	        var index = $("#index").val();
	        var parentActors_ = $("#actors_"+index,parent.document).val();
		    var parentActorIds_ = $("#actorIds_"+index,parent.document).val();
		    $("#actors"+index,parent.document).val(parentActors_);
		    $("#actorIds"+index,parent.document).val(parentActorIds_);
	    }
	    //
	    function setSelect(){
	        var index = $("#index").val();
	        var roleId = parent.$("#actRoleIds"+index).val();
	        if(roleId==''){
		        var parentActors_ = $("#actors_"+index,parent.document).val();
			    var parentActorIds_ = $("#actorIds_"+index,parent.document).val();
			    var parentActors = $("#actors"+index,parent.document).val();
			    var parentActorIds = $("#actorIds"+index,parent.document).val();
			    var arrayActorIds_ = parentActorIds_.split(";");
			    //如果父页面中转字段为空就直接加载实际的值
			    if(parentActorIds_==""){
			        var arrayActorIds_ = parentActorIds.split(";");
			    }
			    $("[name=checkboxs]").each(function(){
			        for(var i=0;i<arrayActorIds_.length;i++){
			           if($(this).val()==arrayActorIds_[i]){
			              $(this).attr("checked",true);
			           }
			        }
			    });
		    }else{
		    	 $("#actors_"+index,parent.document).val("");
	       		 $("#actorIds_"+index,parent.document).val("");
		    }
	    }
	    //监听checkbox
	    function chockboxChange(t){
	        var index = $("#index").val();
	        var parentActors_ = $("#actors_"+index,parent.document).val();
		    var parentActorIds_ = $("#actorIds_"+index,parent.document).val();
		    var arrayActors_ = parentActors_.split(";");
		    var arrayActorIds_ = parentActorIds_.split(";");
	      if($(t).attr("checked")){//选中时
	         if(parentActors_==""){
		            parentActors_+=$(t).attr("paramName");
		            parentActorIds_+=$(t).val();
		            $("#actors_"+index,parent.document).val(parentActors_);
		            $("#actorIds_"+index,parent.document).val(parentActorIds_);
		      }else{
		         var flag = 0;
		         for(var i=0;i<arrayActors_.length;i++){
		             if($(t).attr("paramName")==arrayActors_[i]){
		               flag=1;
		               break;
		             }
		         }
		         if(flag==0){
		            parentActors_+=";";
		            parentActors_+=$(t).attr("paramName");
		            parentActorIds_+=";";
		            parentActorIds_+=$(t).val();
		            $("#actors_"+index,parent.document).val(parentActors_);
		            $("#actorIds_"+index,parent.document).val(parentActorIds_);
		         }
		      }
	      }else{//取消时
	          var pActors_="";
	          var pActorIds_="";
	          var arrayActor_=parentActors_.split(";");
	          var arrayActorId_=parentActorIds_.split(";");
	          for(var k=0;k<arrayActorId_.length;k++){
	             var flag_=0;
	             if($(t).val()==arrayActorId_[k]){
	                flag_=1;
	             }
	             if(flag_==0){
	                if(pActorIds_==""){
	                  pActors_+=arrayActor_[k];
	                  pActorIds_+=arrayActorId_[k];
	                }else{
	                  pActors_+=";";
	                  pActors_+=arrayActor_[k];
	                  pActorIds_+=";";
	                  pActorIds_+=arrayActorId_[k];
	                }
	             }
	          }
	          		$("#actors_"+index,parent.document).val(pActors_);
		            $("#actorIds_"+index,parent.document).val(pActorIds_);
	      }
	    }
	    //点XX关闭
	    function closewin(){
	        parent.art.dialog({id:'commonDialog1'}).close(function(){
	            var index = $("#index").val();
	            if( closeFlag == "0"){
	            $("#actors_"+index,parent.document).val("");
	            $("#actorIds_"+index,parent.document).val("");
	            }
	        });
	    }
		
	</script>
</head>
<body >
		<table class="queryTable" >
		<tr>
			<td class="queryTitle">
				<span >&nbsp;[${texts['dtaq.common.query_field']}]&nbsp;</span>
			</td>
		</tr>
		<tr>
			<td>
				<html:form action="workFlowAction.do?method=choseActor&index=${param.index}&choose=${param.choose}">
					<table  class="queryContentTable">
						<tr>
							<td >${texts['sysOperator.sysOperatorList.qusername']}：</td>
							<td><html:text property="qusername" maxlength="25" styleClass="inputText" ></html:text></td>
							<td align="right">${texts['sysOperator.sysOperatorList.qempname']}：</td>
							<td><html:text property="qempname" maxlength="25" styleClass="inputText" ></html:text></td>
							<td>
								<input type="submit" icon="icon_query" value="${texts['button.query']}" />
							</td>
						</tr>
					</table>
				</html:form>
			</td>
		</tr>
	</table>
	<div class="listButtonDiv">
		<input type="button"  value="全 选" icon="icon_allSelect" id="btn_allSelect"/>
		<input type="button" value="全不选" icon="icon_notSelect" id="btn_notSelect"/>
		<input type="button" icon="icon_confirm" value="确  定" id="btn_confrim" />
		<input type="hidden" id="choose" value="${choose}">
		<input type="hidden" id="index" value="${index}">
	</div>
	<ec:table items="sysOperators" var="sysOperator"
		action="workFlowAction.do?method=choseActor&index=${param.index}&choose=${param.choose}" title="" locale="zh_CN"
		sortable="false" rowsDisplayed="10" imagePath="${ctx}/styles/extremecomponents/images/*.gif"
		retrieveRowsCallback="limit" filterRowsCallback="limit" sortRowsCallback="limit"
	>
		<ec:row highlightRow="true">
			<ec:column property="rowcount" cell="rowCount" sortable="false" title="序号" />
			<ec:column property="null" sortable="false" title="选择" >
					<input type="checkbox" name="checkboxs" value="${sysOperator.id}" paramName="${sysOperator.username}"/>
			</ec:column>
			<ec:column property="username" title="${texts['sysOperator.sysOperatorList.username']}" />
			<ec:column property="employeeid.empname" title="${texts['sysOperator.sysOperatorList.empname']}" />
			<ec:column property="null" title="${texts['sysOperator.sysOperatorList.cropname']}" >
				<ex:orgDisplay id="${sysOperator.employeeid.organid}"/>
			</ec:column>
			<ec:column property="null" title="${texts['sysOperator.sysOperatorList.croptype']}" >
				<ex:dicDisplay dictIdentify="Organidentify" dictValue="${sysOperator.corptype}"/>
			</ec:column>
		</ec:row>
	</ec:table>
</body>
</html:html>
