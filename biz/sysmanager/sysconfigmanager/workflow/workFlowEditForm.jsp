<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
<html:html>
<head>
	<script type="text/javascript">
	//
	$(document).ready(function(){
	    //初始化
	    initBut();
	    //
	    $("#btn_save").click(function(){
	      sub();
	    })
	    //
		$(".button1").click(function(){
		   chooseActor(this);  
		})
		//
		$(".choseRadio").click(function(){
		   changerButton(this); 
		})
		//
		$("#btn_back").click(function(){ 
			document.forms[0].action='workFlowAction.do?method=list&ec_p=${param.ec_p}&ec_id=${workFlow.id}';   
	    	document.forms[0].submit(); 
		}); 
		//  
	}); 
	//加载按钮
	function initBut(){
	    var choseRadio = $(".choseRadio").each(function(){
	       var index = $(this).attr("paramId");
	       if($(this).attr("checked")){
	          $("#button"+index).attr("disabled",false);
	       }
	    })
	}
	//
	function sub(){ 
	  var flag=0;
	  var count=0;
	  var index=0;
	  $(".dataTr").each(function(i){
	    index = i+1;
	    var choseActor = "choseActor"+index;
	    //循环每组radio框
	    $("[name='"+choseActor+"']").each(function(j){
	       if($(this).attr("checked")){
	          count++;
	          var radioVal=$(this).val();
	          if(radioVal==0){//选角色
	            if($("#actRoles"+index).val()==""||$("#actorIds"+index).val()==""){
	              flag=1;
	              return false;
	            }
	          }else{//人
	            if($("#actorIds"+index).val()==""){
	              flag=1;
	              return false;
	            }
	          }
	       }
	    });
	  });
	  //被选中的按钮小于行数就代表有节点没有被选择
	  if(count!=index){
	    flag=1;
	  }
	  if(flag==1){
	     alert("请设定所有的节点的参与者或角色信息！");
	     return false;
	  }
	   $("#btn_save").addClass("z-btn-dsb");
	   $("#btn_save").attr("disabled",true);
	   $("#workFlowForm").submit();
	}
	//
	function chooseActor(t){
	      var index =$(t).attr("paramId");
	      var choose = $("[type=radio][name='choseActor"+index+"']:checked"); 
	      var chooseval= choose.val();
	      var url = $(t).attr("url")+"&choose="+chooseval;;
	      art.dialog({id:'commonDialog1',title:'工作流管理', iframe:url, width:'600', height:'400',top:'30',lock:true});
	}
	//更改变更按钮的置灰
	function changerButton(t){
	   var index = $(t).attr("paramId");
	   $("#button"+index).attr("disabled",false);
	}
    </script>
</head>
	<content tag="heading">工作流管理</content>
<body>
	<html:form action="workFlowAction.do"  enctype="multipart/form-data" styleId="workFlowForm" method="POST">
		<input type="hidden" name="method" value="save" />
		<html:hidden property="id" />
		<!--查询定位 开始-->
		<html:hidden property="qworkFlowName"  value="${param.qworkFlowName}"/>
		<html:hidden property="ec_p" value="${param.ec_p}"/>
		<html:hidden property="ec_id" value="${workFlow.id}"/>
		<html:hidden property="ec_auditStatus"  value="0"/>
		<!--查询定位 结束-->
		<fieldset >
		<legend>工作流-编辑</legend>
					<table class="formTable" >
						<COLGROUP>
							<COL class="tdLeftOne" />
							<COL class="tdRightOne" />
						</COLGROUP>
						<tr>
							<td>
							    流程定义名称：<span class="redSpan">*</span>
							</td>
							<td colspan="3">
								<html:text property="workFlowName" styleClass="showText" size="50"></html:text>
							</td>
						</tr>
					   <tr>
					    <td >流程定义图形描述：<span class="noRedSpan">*</span></td>
					    <td>
							<img class="img_workFlowImage" src="workFlowAction.do?method=image&id=${workFlow.id }">
						</td>
					  </tr>	
						<tr>
							<td>
								流程定义图片：<span class="noRedSpan">*</span>
							</td>
							<td>
								<html:file property="workFlowImage" size="50" styleClass="inputText"> </html:file>
							</td>
							 </tr>	
						<tr>
						   	<td>
								流程定义压缩包：<span class="noRedSpan">*</span>
							</td>
							<td>
							 <html:file property="workFlowZip" size="50" styleClass="inputText"></html:file>
							</td>
			</tr>
		</table>
		<fieldset><legend>审核人设定</legend>
		        <table class="listTable">
           <tr>
           <th>序号</th>
           <th>任务名称</th>
           <th>选择</th>
           <th>任务人</th>
           <th>任务角色</th>
           <th>部门过滤</th>
           <th>上报筛选</th>
           <th>变更执行者</th>
           </tr>
           <%int count=1; %>
           <c:forEach items="${workFlowTaskActors}" var="workFlowTaskActor" varStatus="_index">
           <tr class="dataTr" >
             <td><%=count %></td>
             <%count++; %>
             <input name="processDefinitionId" type="hidden" value="${workFlowTaskActor.processDefinitionId}">
             <input name="taskId" type="hidden"  value="${workFlowTaskActor.taskId}">
             <input name="taskName"  type="hidden"value="${workFlowTaskActor.taskName}"/>
             <td>${workFlowTaskActor.taskName}&nbsp;</td>
             <td>
             <c:if test="${workFlowTaskActor.choseType==0}">
               <input type="radio"  class="choseRadio"  name="choseActor${_index.count}" value="0" index=${_index.count} checked="checked" >角色
             </c:if>
             <c:if test="${workFlowTaskActor.choseType!=0}">
               <input type="radio"  class="choseRadio"   name="choseActor${_index.count}" value="0" index=${_index.count} >角色
             </c:if>
             <c:if test="${workFlowTaskActor.choseType==1}">
                <input type="radio" class="choseRadio"    name="choseActor${_index.count}" value="1" index=${_index.count}  checked="checked">人
             </c:if>
             <c:if test="${workFlowTaskActor.choseType!=1}">
                <input type="radio"  class="choseRadio"    name="choseActor${_index.count}" value="1" index=${_index.count} >人
             </c:if>     
                 
             </td>    
             <td>
                  <input name="actors"  type="text" size="50" class="showText"   id="actors${_index.count}"   value="${workFlowTaskActor.actors}">
                  <input name="actorIds"  type="hidden" id="actorIds${_index.count}"   value="${workFlowTaskActor.actorIds}">
                  <input name="actors_"   type="hidden" id="actors_${_index.count}"   value="${workFlowTaskActor.actors}">
                  <input name="actorIds_" type="hidden" id="actorIds_${_index.count}"   value="${workFlowTaskActor.actorIds}">
             </td>
             <td>
               <input name="actRoles"  type="text" size="50" class="showText"   id="actRoles${_index.count}" value="${workFlowTaskActor.actRoles}">
               <input name="actRoleIds" type="hidden" id="actRoleIds${_index.count}" value="${workFlowTaskActor.actRoleIds}">
               <input name="actRoles_" type="hidden" id="actRoles_${_index.count}" value="${workFlowTaskActor.actRoles}">
               <input name="actRoleIds_" type="hidden" id="actRoleIds_${_index.count}" value="${workFlowTaskActor.actRoleIds}">
              </td>
              <td>
             <c:if test="${workFlowTaskActor.isFilter==0}">
               <input type="radio"  class="choseRadio"  name="isFilter${_index.count}" value="0" index=${_index.count} checked="checked" >否
             </c:if>
             <c:if test="${workFlowTaskActor.isFilter!=0}">
               <input type="radio"  class="choseRadio"   name="isFilter${_index.count}" value="0" index=${_index.count} >否
             </c:if>
             <c:if test="${workFlowTaskActor.isFilter==1}">
                <input type="radio" class="choseRadio"    name="isFilter${_index.count}" value="1" index=${_index.count}  checked="checked">是
             </c:if>
             <c:if test="${workFlowTaskActor.isFilter!=1}">
                <input type="radio"  class="choseRadio"    name="isFilter${_index.count}" value="1" index=${_index.count} >是
             </c:if>  
              </td>
             <td>
             <c:if test="${workFlowTaskActor.isFurnish==0}">
               <input type="radio"  class="choseRadio"  name="isFurnish${_index.count}" value="0" index=${_index.count} checked="checked" >否
             </c:if>
             <c:if test="${workFlowTaskActor.isFurnish!=0}">
               <input type="radio"  class="choseRadio"   name="isFurnish${_index.count}" value="0" index=${_index.count} >否
             </c:if>
             <c:if test="${workFlowTaskActor.isFurnish==1}">
                <input type="radio" class="choseRadio"    name="isFurnish${_index.count}" value="1" index=${_index.count}  checked="checked">是
             </c:if>
             <c:if test="${workFlowTaskActor.isFurnish!=1}">
                <input type="radio"  class="choseRadio"    name="isFurnish${_index.count}" value="1" index=${_index.count} >是
             </c:if>  
              </td>
             <td>
             	<input id="button${_index.count}" value="变更" type="button" class="button1"    
             	 	   url="workFlowAction.do?method=choseActor&index=${_index.count}" paramId=${_index.count} />
             </td>
            </tr>
           </c:forEach>
        </table>
        </fieldset>
	</html:form>
	<div class="inputInfoDiv">
		<span class="inputShowLeft">填&nbsp;&nbsp;报&nbsp;&nbsp;人：${userinfo.empName} </span>
		<span class="inputShowRight"> 填报日期：${now_date}</span>
	</div>
	<div class="saveDiv">
		<input id="btn_save" value="${texts['button.save']}" type="button"  icon="icon_save"/>
		<input id="btn_back" value="${texts['button.back']}" type="button"  icon="icon_back"/>
	</div>
</body>
</html:html>
