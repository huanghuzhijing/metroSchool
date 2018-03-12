<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
<html:html>
<head>
	<script type="text/javascript">
		
	   $(document).ready(function(){
			//
			$("#btn_save").click(function(){
				
				var properties=new Array(); 
				properties[0]=["sender","发送者"];
				properties[1]=["fromAddress","邮箱地址"];
				properties[2]=["password","邮箱密码"];
				properties[3]=["mailServerHost","发送邮件的服务器"];
				properties[4]=["incepter","接收者"];
				properties[5]=["subject","标题"];
		//		properties[6]=["fckcontent","内容"];
							
				saveValidateRequired("#btn_save",properties,"serviceMailInfoForm");
				
			}); 
			//
			$("#btn_back").click(function(){   
	    		location.href="${ctx}/serviceMailInfoAction.do?method=list";
			});
			
			
				
		});
		
		var selectPhones = ",";
         var selectIncepter = ",";
function selectEmployee(){
	var url ="${ctx}/employeeAction.do?method=selectMailEmployee&flag=t&selectType=email&selectPhones="+this.selectPhones+"&selectIncepter="+this.selectIncepter;
 	art.dialog({id:'selectEmp',title:'选择', iframe:url, width:'800', height:'440',top:'10'});
}


//手动输入
function inputSelect(){   
	var url = "${ctx}/biz/sysmanager/serviceMailInfo/inputMailSelect.jsp";
	art.dialog({id:'dialog1',title:'手动输入', iframe:url, width:'700', height:'440',top:'100'});
}

function setPhoneOfEmp(selectPhones,selectIncepter){
	this.selectPhones = selectPhones;
	this.selectIncepter = selectIncepter;
	if(this.selectPhones.length > 1){
		jQuery("[name='toAddress']").val(this.selectPhones.substring(1,this.selectPhones.length-1)) ;
		jQuery("[name='incepter']").val(this.selectIncepter.substring(1,this.selectIncepter.length-1)) ;
	}else{
		jQuery("[name='toAddress']").val("") ;
		jQuery("[name='incepter']").val("") ;
	}
}

function initTimeType(){
	var send_state = "${send_state}";
	alert("send_state----------"+send_state);
	if(send_state != ""){
		if(send_state == "1"){
			var errors = "邮件发送失败，可能原因：\n1.发送邮件的服务器匹配出错！\n2.您的邮箱SMTP服务未开启！\n3.密码输入错误！\n4.网络异常！ ";
			alert(errors);
		}
	}
}

function validateEmailAddress(object){
	var regin=/^([a-zA-Z0-9]+[_|\-|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\-|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/gi; 
 	if(jQuery(object).val() != ""){
	    if(!regin.test(jQuery(object).val())){  
	      	alert("非法的电子邮件");
	      	jQuery(object).val("") ;
	      	jQuery(object).focus();
  		}
  	}
}

function initId(name,addr){
	$("[name=fileName_1]").attr("id","fileName_1");
	$("[name=fileAddr_1]").attr("id","fileAddr_1");



	$("[name=fileName_2]").attr("id","fileName_2");
	$("[name=fileAddr_2]").attr("id","fileAddr_2");

	$("[name=fileName_3]").attr("id","fileName_3");
	$("[name=fileAddr_3]").attr("id","fileAddr_3");

	$("[name=fileName_4]").attr("id","fileName_4");
	$("[name=fileAddr_4]").attr("id","fileAddr_4");

	$("[name=fileName_5]").attr("id","fileName_5");
	$("[name=fileAddr_5]").attr("id","fileAddr_5");

	 $("[name="+name+"]").attr("id","fileName_");
	 $("[name="+addr+"]").attr("id","fileAddr_");
	}
	function setParameter(name,addr){
	  initId(name,addr);
	  
	    showUploadDialogAndRefresh('contentSelectAction.do?method=uploadFile&suffix=t&flag=1&mainTableName=${maintable}',900,700);
	    
	   
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

	function add(){
		var object5=document.getElementById('tr5');
		if(object5.style.display == 'block'){
			alert("上传附件个数最多不允许超过5个!");
		}else{
			for(var i=1;i<6;i++){
				 var obj=document.getElementById('tr'+i);
				 if(obj.style.display=='none'){
				   obj.style.display='block';
				   break;
				 }
			}
		}
	}

	function deleteFile(){
		for(var m=5; m>=1; m--){
			var obj=document.getElementById('tr'+m);
			var obj = jQuery("#tr"+m) ;
			if(!obj.is(":hidden")){
				if(m == 1){
					var displayFile1 = jQuery("#displayFile1") ;
					if(displayFile1.length > 0 ){
						displayFile1.hide();
					}
				}else{
					obj.hide() ;
				}
				var fileObj = document.getElementById('file'+m);
				var fileObj = jQuery("#file"+m) ;
				fileObj.val("") ;
				jQuery("[name='fileName_"+m+"']").val("") ;
				jQuery("[name='fileAddr_"+m+"']").val("") ;
				break;
			}
		}
	} 
		
	</script>
</head>
<content tag="heading">
	邮件发送平台
</content>
<body>
<c:if test="${fromAddress == null}">
		<font color="#EFB94F" size="2"><strong>您在员工信息模块中还没有录入自己的邮箱地址，禁止此操作！</strong></font>
	</c:if>
	<html:form enctype="multipart/form-data" action="serviceMailInfoAction.do" method="POST">
		<input name="method" value="save" type="hidden" />
		<html:hidden property="id" />
		<html:hidden property="toAddress" />
		
		<html:hidden property="isValidate" value="1"/>
		<html:hidden property="sender" value="${userinfo.empId}"/>
		
		<!--查询定位 开始-->
		<html:hidden property="ec_p" />
		<html:hidden property="ec_crd" />
		<!--查询定位 结束-->
		<fieldset >
			<legend>邮件发送平台-写邮件</legend>
			<table class="formTable" >
					<COLGROUP>
							<COL class="tdLeftTwo" />
			                <COL class="tdRightTwo" />
			                <COL class="tdLeftTwo" />
			                <COL class="tdRightTwo" />
					</COLGROUP>
					<tr>
						<td>
						  发送者：<span class="redSpan">*</span>
						</td>
						<td >
							<input size="30" name="sender"  value="<ex:employeeName id="${userinfo.empId}"/>"  styleClass="inputText" maxlength="100" readonly="readonly" >
						<font color="blue">备注：在发送邮件之前，请确保你的邮箱SMTP服务为开启状态，否则将发送不成功！</font>
						</td>
					</tr>
					<tr>
						<td>
						  邮箱地址：<span class="redSpan">*</span>
						</td>
						<td >
<%--							<html:text size="40" property="fromAddress" value="${fromAddress}" onblur="validateEmailAddress(this)"  styleClass="inputText" maxlength="100"/>--%>
							<input id="fromAddress" name="fromAddress" type="text" value="${fromAddress}" onblur="validateEmailAddress(this)"  size="40" maxlength="100">
						</td>
					</tr>
					<tr>
						<td>
						  邮箱密码：<span class="redSpan">*</span>
						</td>
						<td >
<%--							<html:text size="40" property="password"   styleClass="inputText" maxlength="100"/>--%>
							<input id="password" name="password" type="password" size="40" maxlength="100">
						</td>
					</tr>
					<tr>
						<td>
						  发送邮件的服务器：<span class="redSpan">*</span>
						</td>
						<td >
							<ex:dictSelect type="MailServerHost" property="mailServerHost"/><br>
					<font color="blue">备注：邮件服务器必须对应发送的邮箱类型,如果下拉框中没有您的邮件服务器，请在自定义档案模块中自行维护！</font>
						</td>
					</tr>
					<tr>
						<td>
						  接收者：<span class="redSpan">*</span>
						</td>
						<td >
							<html:text property="incepter" readonly="true" size="88" styleClass="text" />
							
					<input id="employee" onclick="selectEmployee()" type="button"  value="人员选择" class="button1">
					<input id="input" onclick="inputSelect()" type="button" value="手动输入" class="button1" icon="icon_edit">
						</td>
					</tr>
					<tr>
						<td>
						  标题：<span class="redSpan">*</span>
						</td>
						<td >
							<html:text property="subject" size="88" styleClass="text" />
						</td>
					</tr>
					<tr>
					<td>
						内容:
						<span class="noRedSpan">*</span>
					</td>
				</tr>
			 <tr>
			 <td colspan="4">
						<input type="hidden" name="fckcontent" />
						<iframe id="eWebEditor1"
							src="ewebeditor/ewebeditor.htm?id=fckcontent&style=coolblue"
							frameborder="0" scrolling="no" width="100%" HEIGHT="400"></iframe>
					</td>
				</tr>
													
			</table>
			
			<table class="def_table" width="100%" align="center" border="0" cellpadding="0" cellspacing="1">
					<thead align="center">
						<tr>
							<th width='100%' colspan="2" align="left">附件信息</th>
						</tr>
					</thead>
				<tr id=tr1 style="display:block">
						<td>
							上传附件1:<span class="noRedSpan">*</span>
						</td>
						<td >
							<input type="text" id="fileName_1" name="fileName_1" class="inputText"  size="30"/>
							<input type="button" icon="icon_currWeek" onclick="setParameter('fileName_1','fileAddr_1');" style="width: 76px; height: 65px; cursor:pointer" value="单附件上传" alt="进入文件上传页面" />
							<input type="button" icon="icon_delete" onclick="deleteFile()" style="width: 76px; height: 65px; cursor:pointer" value="删除附件"/>
			               <input type="button" icon="icon_add" onclick="add()" style="width: 76px; height: 65px; cursor:pointer" value="添加附件"/>
						</td>
						<td style="display:none">
							文件地址：<span class="noRedSpan">*</span>
						</td>
						<td style="display:none">
							<input type="text" id="fileAddr_1" name="fileAddr_1" class="inputText" readonly="readonly" size="30"/>

						</td>
					</tr>
				
				
					 <tr id=tr2 style="display:none">
				      	<td>
				      	上传附件2:<span class="noRedSpan">*</span>
				      	</td>
				      					      	
				      	<td >				      	
							<input type="text"  name="fileName_2"  class="inputText"  size="30"/>
							<input type="button" icon="icon_currWeek" onclick="setParameter('fileName_2','fileAddr_2');" style="width: 76px; height: 65px; cursor:pointer" value="单附件上传" alt="进入文件上传页面" />

				      	</td>
				      	<td style="display:none">
							文件地址：<span class="noRedSpan">*</span>
						</td>
						<td style="display:none">
							<input type="text"   name="fileAddr_2" class="inputText" readonly="readonly" size="30"/>

						</td>
				    </tr>
				     <tr id=tr3 style="display:none">
					 <td>
				      	上传附件3:<span class="noRedSpan">*</span>
				      	</td>
				      	
				      	
				      	<td >
				      	
							<input type="text"  name="fileName_3" class="inputText"  size="30"/>
							<input type="button" icon="icon_currWeek" onclick="setParameter('fileName_3','fileAddr_3');" style="width: 76px; height: 65px; cursor:pointer" value="单附件上传" alt="进入文件上传页面" />

				      	</td>
				      	<td style="display:none">
							文件地址：<span class="noRedSpan">*</span>
						</td>
						<td style="display:none">
							<input type="text"   name="fileAddr_3" class="inputText" readonly="readonly" size="30"/>

						</td>
				    </tr>
				     <tr id=tr4 style="display:none">
					 <td>
				      	上传附件4:<span class="noRedSpan">*</span>
				      	</td>			      					      	
				      	<td >				      	
							<input type="text"  name="fileName_4" class="inputText"  size="30"/>
							<input type="button" icon="icon_currWeek" onclick="setParameter('fileName_4','fileAddr_4');" style="width: 76px; height: 65px; cursor:pointer" value="单附件上传" alt="进入文件上传页面" />
				      	</td>
				      	<td style="display:none">
							文件地址：<span class="noRedSpan">*</span>
						</td>
						<td style="display:none">
							<input type="text" name="fileAddr_4"  class="inputText" readonly="readonly" size="30"/>

						</td>
				    </tr>
				    <tr id=tr5 style="display:none">
					 <td>
				      	上传附件5:<span class="noRedSpan">*</span>
				      	</td>			      					      	
				      	<td >				      	
							<input type="text"  name="fileName_5" class="inputText"  size="30"/>
							<input type="button" icon="icon_currWeek" onclick="setParameter('fileName_5','fileAddr_5');" style="width: 76px; height: 65px; cursor:pointer" value="单附件上传" alt="进入文件上传页面" />
				      	</td>
				      	<td style="display:none">
							文件地址：<span class="noRedSpan">*</span>
						</td>
						<td style="display:none">
							<input type="text"   name="fileAddr_5"  class="inputText" readonly="readonly" size="30"/>

						</td>
				    </tr>
				    
					</table>
		</fieldset>
		<!-- 附件增加 -->
<%--		<%@ include file="/commons/uploadFiles.jsp"%>--%>

            		
		<div class="saveDiv">
		<c:if test="${fromAddress != null}">
			<input id="btn_save" value="确  定" type="button" icon="icon_save"/>
			</c:if>
			<input id="btn_back" value="${texts['button.back']}" type="button" icon="icon_back"/>
		</div>
	</html:form>
</body>
</html:html>
