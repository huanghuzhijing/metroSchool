<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
<html:html>
<head>
	<script type="text/javascript">
	$(document).ready(function(){
		//返回
       $("#btn_back").click(function(){
       		history.back(-1);
       });
       //
       $("#btn_save").click(function(){
       if($("#ifExist").css("display")=="none"){
			var properties=new Array(); 
			properties[0]=["dict_code","字典编码"];
			properties[1]=["dict_name","字典名称"];
			saveValidateRequired("#btn_save",properties,"dataDictForm");
		}else{
		alert($("#ifExist").html());
		}
		
		}); 
		//
	 });
	  function checkValue(value){
                $.ajax({
					type: "POST",
					url: "dataDictAction.do?method=checkValue",
					data: "value="+value,
					success: function(msg){
						if(msg=="no"){
						$("#ifExist").show();
						}else{
						$("#ifExist").hide();
						}
					}
				});
	 }
</script>
</head>
	<content tag="heading">数据字典</content>
<body>
	<html:form action="dataDictAction.do" method="POST">
		<input type="hidden" name="method" value="save" />
		<html:hidden property="id"/>
		<fieldset >
		<legend>数据字典-新增</legend>
			<table class="formTable">
						<COLGROUP>
							<COL class="tdLeftTwo" />
							<COL class="tdRightTwo" />
							<COL class="tdLeftTwo" />
							<COL class="tdRightTwo" />
						</COLGROUP>
						<tr>
							<td>
								字典编码：<span class="redSpan">*</span>
							</td>

							<td>
								<html:text maxlength="30" property="dict_code" styleClass="inputText" size="30"/>
							</td>
							<td>
								字典名称：<span class="redSpan">*</span>
							</td>
							<td>
								<html:text maxlength="30" property="dict_name" onblur="checkValue(this.value)" styleClass="inputText" size="30"/><span id="ifExist" class="redSpan" style="display:none">该字典名称已存在，请重新填写！</span>
							</td>
						</tr>
						
						<tr>
							<td>
								描述：<span class="noRedSpan">*</span>
							</td>
							<td colspan="3">
								<html:text maxlength="20" property="description" styleClass="inputText" size="30"/>
							</td>
						</tr>
						
					</table>
					</fieldset>
		<div class="inputInfoDiv">
			<span class="inputShowLeft">填&nbsp;&nbsp;报&nbsp;&nbsp;人：${userinfo.empName} </span>
			<span class="inputShowRight"> 填报日期：${now_date}</span>
		</div>
		<div class="saveDiv">
			<input id="btn_save" value="${texts['button.save']}" type="button" class="button1" icon="icon_save"/>
			<input id="btn_back" value="${texts['button.back']}" type="button" class="button1" icon="icon_back"/>
		</div>
	</html:form>
</body>
</html:html>
