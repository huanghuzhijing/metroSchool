<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
<html:html>
<head>
	<script type="text/javascript">
	//加载
	$(document).ready(function(){
		//
	    $("#btn_save").click(function(){
	      sub();
	    });
		//
		$("#btn_back").click(function(){
		    history.back(-1);
		}) ;
	});
	//提交
	function sub(){
	     if($("#imgChange").val()==""){
		      alert("请上传工作流程图片");
	      	  return false;
       	 }else{
       	  if(!/\.(gif|jpg|jpeg|png|GIF|JPG|PNG)$/.test($("#imgChange").val())){
	          alert("图片类型必须是.gif,jpeg,jpg,png中的一种")
	     		 return false;
	        }
       	 }
       	 if($("#zipChange").val()=="") {
	       	   alert("请上工作流程文件");
	      	   return false;
       	 }else{
       	  if(!/\.(jbpm)$/.test($("#zipChange").val())) {
	          alert("文件类型必须是.jbpm")
	     		return false;
	       	  }
       	 }
       $("#btn_save").addClass("z-btn-dsb");
	   $("#btn_save").attr("disabled",true);
	   $("#workFlowForm").submit();
	}
  	 
    </script>
</head>
	<content tag="heading">
    工作流管理
	</content>
<body>

	<html:form action="workFlowAction.do"  enctype="multipart/form-data" styleId="workFlowForm"  method="POST">
		<input type="hidden" name="method" value="save" />
		<html:hidden property="id" />
<fieldset >
		<legend>工作流-新增</legend>
					<table class="formTable" >
						<COLGROUP>
							<COL class="tdLeftOne" />
							<COL class="tdRightOne" />
						</COLGROUP>
						<tr>
							<td>
								流程定义图片：<span class="redSpan">*</span>
							</td>
							<td>
							<input id="imgChange" name="workFlowImage" size="50" class="inputText" type="file">
							</td>
						</tr>
						<tr>
						   	<td>
								流程定义压缩包：<span class="redSpan">*</span>
							</td>
							<td>
								<input id="zipChange" name="workFlowZip" size="50" class="inputText" type="file">
							</td>
					</table>
</fieldset>
	</html:form>

		<div class="inputInfoDiv">
			<span class="inputShowLeft">填&nbsp;&nbsp;报&nbsp;&nbsp;人：${userinfo.empName} </span>
			<span class="inputShowRight"> 填报日期：${now_date}</span>
		</div>
		<div class="saveDiv">
			<input type="button" icon="icon_save"  id="btn_save" value="${texts['button.save']}" /> 
			&nbsp;&nbsp;
			<input type="button" icon="icon_back"  id="btn_back" value="<fmt:message key="button.back"/>"  />
		</div>

</body>
</html:html>
