<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
<html:html>
<head>
	<%@ include file="/commons/meta.jsp"%>
	<script type="text/javascript" src="${ctx}/scripts/dtree/dtree.js"></script>
	<link rel="StyleSheet" href="${ctx}/scripts/dtree/css/dtree.css" type="text/css" />
	<script type="text/javascript">
	//
	$(document).ready(function(){
		//
		$("#inbutton").click(function(){ 
		 	insel();
		}); 
		//
		$("#outbutton").click(function(){ 
			outsel();
		}); 
		//
		$("#btn_confirm").click(function(){ 
			initvalue();
		}); 
		//
		$("#btn_close").click(function(){ 
			parent.art.dialog({id:'commonDialog1'}).close();
		}); 
		//
	});
	//
    function intOption(){
    	var  employee = document.getElementById("employee");
    	var ln = employee.options.length;
	    var choice = employee.selectedIndex;
	    $("#inbutton").attr("disabled","");
	    $("#inbutton").removeClass("z-btn-dsb");
	    $("#outbutton").attr("disabled","disabled");
	    $("#outbutton").addClass("z-btn-dsb");
	    //document.getElementById('inbutton').disabled=false;
	    //document.getElementById('outbutton').disabled=true;
    }
    //
    function outOption(){	
	    //document.getElementById('outbutton').disabled=false;
	    //document.getElementById('inbutton').disabled=true;
	    $("#inbutton").attr("disabled","disabled");
	    $("#outbutton").addClass("z-btn-dsb");
	    $("#outbutton").attr("disabled","");
	    $("#outbutton").removeClass("z-btn-dsb");
    }
    //
    function insel(){
	   		var employee=document.getElementById("employee");
			var receiver=document.getElementById("receiver");
			for(var j=0;j<employee.options.length;j++){
				if(employee.options[j].selected){
				  var sText = employee.options[j].text;
			      var sValue = employee.options[j].value;	
			      var oOption = document.createElement("option");
			      oOption.appendChild(document.createTextNode(sText));
			      oOption.setAttribute("value", sValue);
			      var ids = parent.document.getElementById("receive_ids").value;
	              var names = parent.document.getElementById("receive_names").value;
	              receiver=document.getElementById("receiver");
	                 if(ids==""){
	                 	ids+=sValue+";";
	                   names+=sText+";";
	                   receiver.appendChild(oOption);
	                 }else{
	                 	var ids_ = ids.split(";");
	                 	var flag=0;
	                 	for(var i=0;i<ids_.length-1;i++){
	                 		if(ids_[i]==sValue){
	                 		  flag=1;
	                 		  break;
	                 		}
	                 	}
	                 	if(flag!=1){
	           	      ids+=sValue;
			          ids+=";";
			          names+=sText;
			          names+=";";
			          receiver.appendChild(oOption);
	                 	}
	                 }
	             parent.document.getElementById("receive_ids").value=ids;
			  parent.document.getElementById("receive_names").value=names;
	            }
	            
	      }				
		//document.getElementById('inbutton').disabled=true;
		$("#inbutton").attr("disabled","disabled");
		$("#inbutton").addClass("z-btn-dsb");
 	}
	//
    function outsel(){
	  	var receiver=document.getElementById("receiver");
		var employee=document.getElementById("employee");	
	 	var count=0;
       	var index=0;
      	var flag =0;
          for(var i=0;i<receiver.options.length;i++){
             if(receiver.options[i].selected){
             		if(flag==0){
             		  flag=1;
             		  index=i;
             		}
             		count++;
             }
           }
          for(var j=0;j<count;j++){
             var sValue = receiver.options[index].value;
             var sText = receiver.options[index].text;
             var ids = parent.document.getElementById("receive_ids").value;
             var ids_="";
             var idstring = ids.split(";");
             for(var i =0;i<idstring.length-1;i++ ){
               if(sValue!=idstring[i]){
                 ids_+=idstring[i];
                 ids_+=";";
               }
             }
             parent.document.getElementById("receive_ids").value=ids_;
             var names = parent.document.getElementById("receive_names").value;
             var names_="";
             var namestring = names.split(";");
             for(var i=0;i<namestring.length-1;i++){
                if(sText!=namestring[i]){
                   names_+=namestring[i]; 
                   names_+=";";
                }
             }
             parent.document.getElementById("receive_names").value=names_;
             receiver.remove(index);
             //document.getElementById('outbutton').disabled=true;
             $("#outbutton").attr("disabled","disabled");
             $("#outbutton").addClass("z-btn-dsb");
          }
    }
    //
    function initvalue(){
    	var receivers = document.getElementById("receiver");
    	var length_ = receivers.options.length;
    	var names="";
        var ids="";
    	parent.document.getElementById("receiveperson").value;
        parent.document.getElementById("receiveperson_name").value;
       for(var i=0;i<length_;i++){
          var sText  = receivers.options[i].text;
          var sValue = receivers.options[i].value;
          names+=sText;
          names+=";";
          ids+=sValue;
          ids+=";";
       }
      parent.document.getElementById("receiveperson_name").value=names;
      parent.document.getElementById("receiveperson").value = ids;
      parent.art.dialog({id:'commonDialog1'}).close();//将ID为'b1'的提示层关闭	
    }
    //
    function sSuc_(id){
		//确定后关闭sAlert,需要提供id
		id=id?id:"";
		var bgObj=document.getElementById(id+"bgDiv");
		if(bgObj)document.body.removeChild(bgObj); 
		var msgObj=document.getElementById(id+"msgDiv");         
        if(msgObj)document.body.removeChild(msgObj); 
	} 
	//
    function init_(){
    	var receiveperson_name =  parent.document.getElementById("receive_names").value;
    	var receiveperson = parent.document.getElementById("receive_ids").value;
    	var receiver=document.getElementById("receiver");
	    var employee=document.getElementById("employee");	
    	var ids = receiveperson.split(";");
    	var names = receiveperson_name.split(";");
    	for(var i = 0;i<ids.length-1;i++){
    	    var oOption = document.createElement("option");
    	    oOption.appendChild(document.createTextNode(names[i]));
			oOption.setAttribute("value", ids[i]);	
		    receiver.appendChild(oOption);
		  //  employee.remove(oOption);
    	}
    }
    //
    function selall(){
    	var employee = document.getElementById("employee");
    	var receiver = document.getElementById("receiver");
    	var ids = parent.document.getElementById("receive_ids").value;
        var names = parent.document.getElementById("receive_names").value;
    	var len = employee.length;
    	if(len<1){
    	  alert("没有可选择的人员!");
    	}
    	var flag=0;
       for(var i=0;i<len;i++){
       	   var sText = employee.options[i].text;
		   var sValue = employee.options[i].value;	
		   flag=0;
		   var oOption = document.createElement("option");
		       oOption.appendChild(document.createTextNode(sText));
		       oOption.setAttribute("value", sValue);
		   if(ids!=""){
		   	 var ids_=ids.split(";"); 
		   	 for(var j=0;j<ids_.length-1;j++){
		   	    if(sValue==ids_[j]){
		   	    	flag=1;
		   	    }
		   	 }
		   	 if(flag==0){
		   	 	    ids+=sValue;
			        ids+=";";
			        names+=sText;
			        names+=";";
			        receiver.appendChild(oOption);
	 		        parent.document.getElementById("receive_names").value=names;
                    parent.document.getElementById("receive_ids").value = ids;
		   	 }
		   }else{
		     	    ids+=sValue;
			        ids+=";";
			        names+=sText;
			        names+=";";
			 parent.document.getElementById("receive_names").value=names;
             parent.document.getElementById("receive_ids").value = ids;       
		     receiver.appendChild(oOption);
		   }
       }
    }
    //
    function removeall(){
    	 var receiver = document.getElementById("receiver");
    	 var ids = parent.document.getElementById("receive_ids").value;
         var names = parent.document.getElementById("receive_names").value;        
         receiver.length=0;
         parent.document.getElementById("receive_names").value="";
         parent.document.getElementById("receive_ids").value = "";     
    }
    //
    function checkde(){
	   if(document.getElementById("gangwei").checked){
	     document.getElementById("gangwei").checked = false;
	  }
		    if(document.getElementById("proxy").checked){
	     document.getElementById("proxy").checked = false;
	  }
	      document.getElementById("org").checked = true;
		location.href="employeeAction.do?method=selectListForPersonMailboxSend";
		
	}
	//
	function checkde_(){
	      if(document.getElementById("org").checked){
	     document.getElementById("org").checked = false;
	  }
	    if(document.getElementById("proxy").checked){
	     document.getElementById("proxy").checked = false;
	  }
		document.getElementById("gangwei").checked = true;
		location.href="employeeAction.do?method=selectListForUserGroupForPersonMailbox";
	}
	//
	function checkdeforproxy(){
	  if(document.getElementById("org").checked){
	     document.getElementById("org").checked = false;
	  }
	    if(document.getElementById("gangwei").checked){
	     document.getElementById("gangwei").checked = false;
	  }
	  document.getElementById("proxy").checked = true;
	  location.href="employeeAction.do?method=selectListForEmpCorpForPersonMailbox";
	}
</script>
</head>
<body onload="init_()">
	<div class="listButtonDiv">
				<input type="radio" id="org" value="1" checked="checked"
					onclick="checkde()">
				按组织选择
				<input type="radio" id="gangwei" value="2"    onclick="checkde_()">
				按用户组选择
				<input type="radio" id="proxy" value="3"    onclick="checkdeforproxy()">
				按参建单位选择 
	</div>
	<fieldset>
	<legend>人员选择</legend>
	<table width="100%" border="0" cellpadding="0" cellspacing="0">
		<tr>
			<td valign="top" width="160px">
				<div style="width: 160px;text-align:left">
						<script language='javascript'>
							//显示树
							var organizationTree = new dTree('organizationTree');
							organizationTree.setIconPath("${ctx}/scripts/dtree/");
							//orgaizeationTree.setIconPath("${ctx}/js/dtree/");
							organizationTree.add('-1',-99,'组织树','${ctx}/employeeAction.do?method=selectListForPersonMailboxSend');
							<c:forEach items="${employeestree}" var="organization">
						       <c:if test="${organization.parentid==-1}">
						         organizationTree.add('${organization.id}','${organization.parentid}','${organization.organname}','${ctx}/employeeAction.do?method=selectListForPersonMailboxSend','','','','');
						       </c:if>
						       <c:if test="${organization.parentid!=-1}">
								organizationTree.add('${organization.id}','${organization.parentid}','${organization.organname}(${organization.employeecount})','${ctx}/employeeAction.do?method=selectListForPersonMailboxSend&static_enodecode=${organization.nodecode}&query=query&parentid=${organization.id}','','','','');
						       </c:if>
							</c:forEach>
							document.write(organizationTree);
					        organizationTree.openAll();
						</script>
				</div>
			</td>
			
			<td valign="top">
				<table style="margin-left: 5px;margin-right: 5px" width="100%" border="0" cellspacing="0" cellpadding="0">
				<html:hidden property="selflag" value="${selflag}"/>
					<tr>
						<td>
							<fieldset>
								<legend>
									<strong>&nbsp;[查询条件]&nbsp;</strong>
								</legend>
								<div>
									<html:form action="employeeAction.do?method=selectListForPersonMailboxSend">
				                           	员工姓名：<html:text property="qempname" styleClass="inputText" size="10"/>&nbsp;&nbsp;
				                          	职务：<html:text property="specialtecid" styleClass="inputText" size="10"/>&nbsp;&nbsp;    
											<input type="submit" value="<fmt:message key="button.query"/>" icon="icon_query" />
									</html:form>
								</div>
							</fieldset>
						</td>
					</tr>
					 <tr>
					 <td colspan="2">
					     <table width="100%" border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td align="center">
										<font size=2 color="red">【人员信息】</font>
									</td>
									<td>
										&nbsp;
									</td>
									<td align="center">
										<c:if test="${selflag!=2}">
										<font size=2 color="red">【收信人】</font>
										</c:if>
									    <c:if test="${selflag==2}">
										<font size=2 color="red">【发信人】</font>
										</c:if>
									</td>
								</tr>
								<tr>
									<td width="45%" height="150" align="center" valign="top">
										<select name="employee" id="employee" size="15" style="width: 100px"
											multiple="multiple" onchange="intOption()" ondblclick="insel()">
											<c:forEach items="${employees}" var="employee">
													<option value="<c:out value="${employee.id}"/>">
														<c:out value="${employee.empname}" />
													</option>
										
											</c:forEach>
										</select>
									</td>
									<td width="10%" align="center" valign="top">
														<br>
														<br>
														<br>
														<input type="button" id="inbutton" name="inbutton"
															disabled="disabled" class="button1" 
															value="移入---->"></input>
														<br>
														<br>
														<input type="button" id="outbutton" name="outbutton"
															disabled="disabled"  class="button1"
															value="<----移除"></input>
														<br>
														<br>
														<br>
														<input type="button" class="button1" value="全部移入---->"
															onclick="selall()"></input>
														<br>
														<input type="button" class="button1" value="<----全部移除"
															onclick="removeall()"></input>
														<br>
														<br>
													</td>
									<td width="45%" height="150" align="center" valign="top">
										<select name="receiver" id="receiver" size="15" style="width: 100px" 
											 multiple="multiple" onchange="outOption()" ondblclick="outsel()">
										</select>
									</td>
								</tr>
					     </table>
					 </td>
					</tr>
				</table>
			</td>         
         </tr>
	</table>
	</fieldset>
	<div class="saveDiv">
		<input id="btn_confirm" value="${texts['button.ok']}" type="button"  class="button1" icon="icon_confirm"/>
		<input id="btn_close" value="${texts['button.close']}" type="button"  class="button1" icon="icon_close"/>
	</div>
</body>
</html:html>
