<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
<html:html>
<head>
<title>邮件发送平台</title>
<content tag="heading">邮件发送平台</content>
<script src="${ctx}/scripts/public.js" type="text/javascript"></script>
<script type="text/javascript">
function checkPhone(){
	var phones = jQuery("[name='inputPhone']").val();
	if(phones != ""){
		var index = "";
		var phoneStr = phones.split(",");
		for(var i=0; i<phoneStr.length; i++){
			if(chkMail(phoneStr[i]) == false){
	     		index += i + ",";
	     	}
		}
		if(index != ""){
			index = index.substring(0,index.length-1);
			alert("第 "+(parseInt(index)+1)+" 个邮箱验证不合格，请核实后重新填写！");
		}else{
			parent.selectPhones += phones+",";
			parent.selectIncepter += phones+",";
			parent.setPhoneOfEmp(parent.selectPhones,parent.selectIncepter);
			closeWindow();
		}
	}else{
		alert("没有输入任何的邮箱地址，保存无效！");
	}
}

function closeWindow(){

	parent.art.dialog({id:'dialog1'}).close();
	}

function chkMail(mailAddress){
	var pattern = /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(\.[a-zA-Z0-9_-])+/;
	if(mailAddress ==''){
		return false;
	}
	if(pattern.test(mailAddress)){
		return true;
	}else{
		return false;
	}
}
</script>
</head>
<body>
<table class="form_table"  width="100%" border="1" align="center" cellpadding="3" cellspacing="0" >
    <COLGROUP>
		<COL class="tr03" align="right" width="20%">
		<COL class="tr02" width="80%">
	</COLGROUP>
	<tr>
		<td colspan="2" align="center"><font color="blue">填写规则说明：请您输入正确的邮箱地址,并以逗号","结束；实例：zhangsan@sina.com,lisi@126.com</font></td>
		
	</tr>
	<tr>
		<td>邮箱地址
		<td><html:text property="inputPhone"  size="80" styleClass="text" value="" maxlength="100" /></td>
	</tr>
	</table>
	<div align="center">
		<input type="button" class="button1" value="${texts['button.save']}" onclick="checkPhone()" icon="icon_save"/>
		<input type="button" class="button1" name="back" value="${texts['button.close']}" onclick="closeWindow()" icon="icon_back"/>
	</div>
</body>
</html:html>
