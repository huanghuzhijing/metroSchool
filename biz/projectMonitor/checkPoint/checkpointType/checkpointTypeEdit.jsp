<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>
<ex:bundle/>
<html:html>
<head>
<title>监测控制标准管理</title>
<content tag="heading">监测控制标准管理</content>
<script type="text/javascript">
$(document).ready(function(){

			
   $("#btn_save").click(function(){
	var type_name = jQuery("[name='type_name']").val();
	var abs_warning_value = jQuery("[name='abs_warning_value']").val();
	var type_kind = '${type_kind}';
	var errors = "";
	var focus = "";
	if(type_kind == '5'){
		if(type_name == ""){
			errors += "类型名称 为必填项\n";
			focus += "type_name,";
		}
		if(abs_warning_value == ""){
			errors += "最大振速峰值 为必填项\n";
			focus += "abs_warning_value,"
		}
	}else{
		var abs_critical_value = jQuery("[name='abs_critical_value']").val();
		var negative_abs_critical_value = jQuery("[name='negative_abs_critical_value']").val();
		var negative_abs_warning_value = jQuery("[name='negative_abs_warning_value']").val();
		var rel_critical_value = jQuery("[name='rel_critical_value']").val();
		var rel_warning_value = jQuery("[name='rel_warning_value']").val();
		
		var init_value_title = jQuery("[name='init_value_title']").val();
		var current_value_title = jQuery("[name='current_value_title']").val();
		var pre_value_title = jQuery("[name='pre_value_title']").val();
		var current_change_title = jQuery("[name='current_change_title']").val();
		var change_rate_title = jQuery("[name='change_rate_title']").val();
		var total_change_title = jQuery("[name='total_change_title']").val();
		if(type_name == ""){
			errors += "类型名称 为必填项\n";
			focus += "type_name,"
		}
		if(abs_critical_value == ""){
			errors += "绝对临界值 为必填项\n";
			focus += "abs_critical_value,"
		}
		if(abs_warning_value == ""){
			errors += "绝对警戒值 为必填项\n";
			focus += "abs_warning_value,"
		}
		if(negative_abs_critical_value == ""){
			errors += "负绝对临界值 为必填项\n";
			focus += "negative_abs_critical_value,"
		}
		if(negative_abs_warning_value == ""){
			errors += "负绝对警戒值 为必填项\n";
			focus += "negative_abs_warning_value,"
		}
		if(rel_critical_value == ""){
			errors += "相对临界值 为必填项\n";
			focus += "rel_critical_value,"
		}
		if(rel_warning_value == ""){
			errors += "相对警戒值 为必填项\n";
			focus += "rel_warning_value,"
		}
		if(init_value_title == ""){
			errors += "初始值标题 为必填项\n";
			focus += "init_value_title,"
		}
		if(current_value_title == ""){
			errors += "本次值标题 为必填项\n";
			focus += "current_value_title,"
		}
		if(pre_value_title == ""){
			errors += "上次值标题 为必填项\n";
			focus += "pre_value_title,"
		}
		if(current_change_title == ""){
			errors += "本次变化量标题 为必填项\n";
			focus += "current_change_title,"
		}
		if(change_rate_title == ""){
			errors += "变化速率标题 为必填项\n";
			focus += "change_rate_title,"
		}
		if(total_change_title == ""){
			errors += "累计编号标题 为必填项\n";
			focus += "total_change_title,"
		}
	}
	if(errors != ""){
		alert(errors);
		var focusStr = focus.split(",");
		jQuery("[name='+focusStr[0])+']").focus() ;
	}else{
		var properties=new Array(); 
			
				saveValidateRequired("#btn_save",properties,"dtaqCheckpointTypeForm");
	}
				
			}); 
			$("#btn_back").click(function(){ 
		
		var url="dtaqCheckpointTypeAction.do?method=list&type_kind=${mianType.id}&dtaqCheckpointTypeList_page=${dtaqCheckpointTypeList_page}";
        document.forms[0].action=url;
	    document.forms[0].submit();
    });
		});
     function validateName(){
	    var oldName = jQuery("[name='oldName']").val();
	    var type_name = jQuery("[name='type_name']").val();
	    var type_id = jQuery("[name='type_id']").val();
	    if(type_id =="" || oldName != type_name){
	    $.ajax({
					type: "POST",
					url : "dtaqCheckpointTypeAction.do?method=validateEdit",
					data: "type_kind=${mianType.id}&type_name="+jQuery("[name='type_name']").val()+"&type_id="+jQuery("[name='type_id']").val(),
					success: function(msg){
						checkResponse(msg);
					}
				});
	//	var url = "dtaqCheckpointTypeAction.do?method=validateEdit";
		//var checkAjax = new Ajax.Request(url, {method:"post", parameters:, onComplete:checkResponse});
	}
}



function checkResponse(checkResponse){
	var resText = checkResponse;
	
	if(resText == "no"){
		alert("该名称已存在，请重新填报！");
		jQuery("[name='type_name']").val("") ;
		jQuery("[name='type_name']").focus() ;
	}
}

function checkDataValue(fieldType,field){
	if(fieldType == "abs"){
		var abs_critical_value = jQuery("[name='abs_critical_value']").val();
		var abs_warning_value = jQuery("[name='abs_warning_value']").val();
		var value = jQuery("[name='"+field+"']").val();
		if(value != "" && parseFloat(value) < 0){
			var field_name = "绝对警戒值";
			if(field == "abs_critical_value"){
				field_name = "绝对临界值";
			}
			alert(field_name + "必须大于0!");
			jQuery("[name='"+field+"']").val("") ;
			jQuery("[name='"+field+"']").focus() ;			
			return false;
		}
		if(abs_critical_value !="" && abs_warning_value !=""){
			if(parseFloat(abs_critical_value) >= parseFloat(abs_warning_value)){
				alert("绝对警戒值必须大于绝对临界值!");
				jQuery("[name='"+field+"']").val("") ;
				jQuery("[name='"+field+"']").focus() ;
				return false;
			}
		}
	}
	else if(fieldType == "neg"){
		var negative_abs_critical_value = jQuery("[name='negative_abs_critical_value']").val();
		var negative_abs_warning_value = jQuery("[name='negative_abs_warning_value']").val();
		var value = jQuery("[name='"+field+"']").val();
		if(value != "" && parseFloat(value) > 0){
			var field_name = "负绝对警戒值";
			if(field == "negative_abs_critical_value"){
				field_name = "负绝对临界值";
			}
			alert(field_name + "必须小于0!");
			jQuery("[name='"+field+"']").val("") ;
			jQuery("[name='"+field+"']").focus() ;
			return false;
		}
		if(negative_abs_warning_value != "" && negative_abs_critical_value !=""){
			if(parseFloat(negative_abs_warning_value) >= parseFloat(negative_abs_critical_value)){
				alert("负绝对警戒值必须小于负绝对临界值!");
				$(field).value = "";
				$(field).focus();
				return false;
			}
		}
	}
	else if(fieldType == "rel"){
		var rel_critical_value = jQuery("[name='rel_critical_value']").val();
		var rel_warning_value = jQuery("[name='rel_warning_value']").val();
		var value = jQuery("[name='"+field+"']").val();
		if(value != "" && parseFloat(value) < 0){
			var field_name = "相对警戒值";
			if(field == "rel_critical_value"){
				field_name = "相对临界值";
			}
			alert(field_name + "必须大于0!");
			jQuery("[name='"+field+"']").val("") ;
			jQuery("[name='"+field+"']").focus() ;
			return false;
		}
		if(rel_critical_value != "" && rel_warning_value !=""){
			if(parseFloat(rel_critical_value) >= parseFloat(rel_warning_value)){
				alert("相对警戒值必须大于相对临界值!");
				jQuery("[name='"+field+"']").val("") ;
				jQuery("[name='"+field+"']").focus() ;
				return false;
			}
		}
	}
}


</script>
</head>
<body>
   <html:form action="dtaqCheckpointTypeAction.do">
  	    <input type="hidden" name="method" value="save">
	    <html:hidden property="type_id"/>
	    <html:hidden property="type_kind"/>
	    <html:hidden property="dtaqCheckpointTypeList_page" value="${dtaqCheckpointTypeList_page}"/>
	    <html:hidden property="typeName"/>
	    <html:hidden property="oldName" value="${dtaqCheckpointType.type_name}"/>
	    <html:hidden property="status"/>
		<html:hidden property="ts"/>
		<ex:formProperty name="type_kind" formName="dtaqCheckpointTypeForm" var="type_kind"/>
		<fieldset >
		<legend>监测控制标准管理</legend>
    <table class="formTable" >
					<COLGROUP>
						<COL class="tdLeftTwo" />
						<COL class="tdRightTwo" />
						<COL class="tdLeftTwo" />
						<COL class="tdRightTwo" />
					</COLGROUP>
    		<tr>
             <td>大类名称<span class="noRedSpan">*</span></td>
             <td>${mianType.name}</td>
             <td>监测小类<span class="redSpan">*</span></td>
             <td><html:text property="type_name" styleClass="text" maxlength="50" onchange="validateName()"/></td>
            </tr>
            <c:if test="${type_kind == 5}">
            	 <tr>
	           	 <td>绝对警戒值<span class="redSpan">*</span></td>
	             <td colspan="3"><html:text property="abs_warning_value"  maxlength="10"/><font class="unit_font">(单位：cm/s)</font></td>
	           </tr>
            </c:if>
			<c:if test="${type_kind !=5}">
	           <tr>
	           	 <td>绝对临界值<span class="redSpan">*</span></td>
							
	             <td><html:text property="abs_critical_value"  maxlength="10" onchange="checkDataValue('abs','abs_critical_value')"/><font class="unit_font"><c:if test="${type_kind != '4'&& type_kind != '6'}">(单位：mm)</c:if><c:if test="${type_kind == '4'}">(单位：kn)</c:if><c:if test="${type_kind == '6'}">(单位：℃)</c:if></font></td>
	           	 <td>绝对警戒值<span class="redSpan">*</span></td>
	             <td><html:text property="abs_warning_value"  maxlength="10" onchange="checkDataValue('abs','abs_warning_value')"/><font class="unit_font"><c:if test="${type_kind != '4'&& type_kind != '6'}">(单位：mm)</c:if><c:if test="${type_kind == '4'}">(单位：kn)</c:if><c:if test="${type_kind == '6'}">(单位：℃)</c:if></font></td>
	           </tr>
	           <tr>
	           	 <td>负绝对临界值<span class="redSpan">*</span></td>
	             <td><html:text property="negative_abs_critical_value"  maxlength="10" onchange="checkDataValue('neg','negative_abs_critical_value')" /><font class="unit_font"><font class="unit_font"><c:if test="${type_kind != '4'&& type_kind != '6'}">(单位：mm)</c:if><c:if test="${type_kind == '4'}">(单位：kn)</c:if><c:if test="${type_kind == '6'}">(单位：℃)</c:if></font></td>
	           	 <td>负绝对警戒值<span class="redSpan">*</span></td>
	             <td><html:text property="negative_abs_warning_value"  maxlength="10" onchange="checkDataValue('neg','negative_abs_warning_value')" /><font class="unit_font"><font class="unit_font"><c:if test="${type_kind != '4'&& type_kind != '6'}">(单位：mm)</c:if><c:if test="${type_kind == '4'}">(单位：kn)</c:if><c:if test="${type_kind == '6'}">(单位：℃)</c:if></font></td>
	           </tr>
	           <tr>
	           	 <td>相对临界值<span class="redSpan">*</span></td>
	             <td><html:text property="rel_critical_value"  maxlength="10" onchange="checkDataValue('rel','rel_critical_value')" /><font class="unit_font"><font class="unit_font"><c:if test="${type_kind != '4'&& type_kind != '6'}">(单位：mm)</c:if><c:if test="${type_kind == '4'}">(单位：kn)</c:if><c:if test="${type_kind == '6'}">(单位：℃/d)</c:if></font></td>
	           	 <td>相对警戒值<span class="redSpan">*</span></td>
	             <td><html:text property="rel_warning_value"  maxlength="10" onchange="checkDataValue('rel','rel_warning_value')" /><font class="unit_font"><c:if test="${type_kind != '4'&& type_kind != '6'}">(单位：mm)</c:if><c:if test="${type_kind == '4'}">(单位：kn)</c:if><c:if test="${type_kind == '6'}">(单位：℃/d)</c:if></font></td>
	           </tr>
	        </c:if>
	        <c:if test="${type_kind !=5}">
	        	<tr>
	           	 <td>初始值标题<span class="redSpan">*</span></td>
	             <td><html:text property="init_value_title" styleClass="text" maxlength="50"/></td>
	           	 <td>本次值标题<span class="redSpan">*</span></td>
	             <td><html:text property="current_value_title" styleClass="text" maxlength="50"/></td>
	           </tr>
	        	<tr>
	           	 <td>上次值标题<span class="redSpan">*</span></td>
	             <td><html:text property="pre_value_title" styleClass="text" maxlength="50"/></td>
	           	 <td>本次变化量标题<span class="redSpan">*</span></td>
	             <td><html:text property="current_change_title" styleClass="text" maxlength="50"/></td>
	           </tr>
	        	<tr>
	           	 <td>变化速率标题<span class="redSpan">*</span></td>
	             <td><html:text property="change_rate_title" styleClass="text" maxlength="50"/></td>
	           	 <td>累计/最大值标题<span class="redSpan">*</span></td>
	             <td><html:text property="total_change_title" styleClass="text" maxlength="50"/></td>
	           </tr>
	          </c:if>
         </table>
         </fieldset>
</html:form>
<div align="center">
	<input id="btn_save" value="${texts['button.save']}" type="button" icon="icon_save"/>
			<input id="btn_back" value="${texts['button.back']}" type="button" icon="icon_back"/>
</div>
  </body>
</html:html>
