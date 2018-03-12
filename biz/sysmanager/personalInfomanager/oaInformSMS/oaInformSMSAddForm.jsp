<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
<html:html>
<head>
	<script type="text/javascript">
		//加载
		$(document).ready(function(){
		    //
			$("#btn_save").click(function(){//保存
	       		var res = "";
					if(($("#ids").val()==null || $("#ids").val()=="")&&($("#inputPhones").val()==null || $("#inputPhones").val()=="")){
					  res+="请输入手机号码或选择人员信息\n"
					}
					if($("#content").val()==null || $("#content").val()==""){
						res+="送办意见 为必填项。\n";
					}
				if(res!=""){
					alert(res);
					return ;
				}else{
					$("#btn_save").addClass("z-btn-dsb");
 					$("#btn_save").attr("disabled","disabled")
					$("#oaInformSMSForm").submit();
				}
		    });
		});
		var inputstate=0;//输入的是否有错误的状态 0:正确 1：错误
		function checkPhone(){
			var message=""
			var phone=$("[id='inputPhones']").val();
			//alert(phone.length);
			if(phone!=""){
				var phones =phone.split(",");
					for(i=0;i<phones.length;i++){
						  if(isNum(phones[i])==false){//验证有效性
						      if(phones[i]!=""){//过滤掉最后为空的记录
						  		 message+="您填写的: "+phones[i]+"手机位数或数值不正确\n";
						  		 inputstate=1;
						  	  }
						   }
					  } 
					 if(phone.length>1){
						var temp=phone.charAt(phone.length-1);
							if(temp!=""){//为最后一位加上分隔符
								if(!((phone.lastIndexOf(",")+1)==phone.length)){
							 		 $("[id='inputPhones']").val($("[id='inputPhones']").val()+",");
							    }
							}
					 }
					 if(message!=""){
							alert(message);
							$("[id='inputPhones']").focus();
							return;
					 }else {
					 		inputstate=0;
					 		message="";
					 }
		    }		
		
		}
		function setParamValue(empIds,empNames,organNames){
			$("[id='ids']").val(empIds);
			$("[id='totransActor']").val(formatStringComma(empNames));
			$("[id='totransactDept']").val(formatStringComma(organNames));
		}
		function isNum(phone ){//长度为11位的数字类型
		var reg=  /^\d{11}$/
		return reg.test(phone) 
		}

		function initInput(){
			if($("[id='inputPhones']").val()=="请输入手机号码"){
				$("[id='inputPhones']").val("");
			}
		}
</script>
</head>
	<content tag="heading">短信发送</content>
	<body>
		<fieldset>
		<legend>
				短息信息
			</legend>
			<html:form action="oaInformSMSAction.do" styleId="oaInformSMSForm"
		 styleClass="form" method="POST" >
		<input type="hidden" name="method" value="save" />
		<input type="hidden" id="ids" name="ids"/>
		<input type="hidden" name="docFileBorrowId" value="${docFileBorrow.id }" />
			<table class="formTable">
				<COLGROUP>
					<COL class="tdLeftTwo" />
					<COL class="tdRightTwo" />
					<COL class="tdLeftTwo" />
					<COL class="tdRightTwo" />
				</COLGROUP>
				<tr>
					<td>
						发送人：<span class="noRedSpan">*</span>
					</td>
					<td colspan="3">
						${userinfo.empName}
					</td>
				</tr>
				<tr>
					<td>
						手动输入号码：<span class="noRedSpan">*</span>
					</td>
					<td colspan="3">
					<textarea cols="56" rows="3" id="inputPhones" name="inputPhones"  onclick="initInput()" onblur="checkPhone()" ></textarea>
					<br>	<font color="red">说明：可以直接连续输入手机号码,并以英文逗号","分隔</font>
					</td>
				</tr>
				<tr  class="totransActor">
					<td>
						接&nbsp;&nbsp;收&nbsp;&nbsp;人：<span class="noRedSpan">*</span>
					</td>
					<td colspan="3">
					<textarea cols="56" rows="3" id="totransActor" disabled="disabled" name="totransActor" class="showText">${borrowMan }</textarea>
						<%@ include file="/biz/sysmanager/sysmaintain/sysPlug/selectEmpNoteOrganGroup/selectEmpNoteOrganGroup.jsp" %>
					</td>
				</tr>
				<tr class="totransactDept">
					<td>
						接收部门：<span class="noRedSpan">*</span>
					</td>
					<td colspan="3">
					<textarea cols="56" rows="3" id="totransactDept" disabled="disabled" name="totransactDept" class="showText"></textarea>
					</td>
				</tr>
				<tr class="impowerOpinion">
					<td>
						短信内容：<span class="redSpan">*</span>
					</td>
					<td colspan="3">
					<textarea cols="56" rows="3" id="content" name="content" class="inputText"></textarea>
					</td>
				</tr>
			</table>
				</html:form>
		</fieldset>
		<div class="inputInfoDiv">
			<span class="inputShowLeft">填&nbsp;&nbsp;报&nbsp;&nbsp;人：${userinfo.empName} </span>
			<span class="inputShowRight"> 填报日期：${now_date}</span>
		</div>
		<div class="saveDiv">
			<input type="button" id="btn_save"
				value="发送短息" icon="icon_save" />
			&nbsp;&nbsp;
		</div>
	
</body>
</html:html>
