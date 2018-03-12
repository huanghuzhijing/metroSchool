<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
<html:html>
<head>
	<script type="text/javascript" src="${ctx}/scripts/public.js"></script>
	<script type="text/javascript">
	  //
	  $(document).ready(function(){
	  		//
		    $("#btn_save").click(function(){
			       var res = "";
						if($("#approveContent").val()==null || $("#approveContent").val()==""){
							res+="审核意见 为必填项。\n";
						}	
						if(res!=""){
							alert(res);
							return ;
						}else{
							$("#btn_save").addClass("z-btn-dsb");
		                    $("#btn_save").attr("disabled","disabled")
							$("#leaveForm").submit();
						}
			    })
			 //   
			$("#btn_back").click(function(){
			    history.back(-1);
			})
			//
			$("#btn_reject").click(function(){
			    var res = "";
						if($("#approveContent").val()==null || $("#approveContent").val()==""){
							res+="审核意见 为必填项。\n";
						}	
						if(res!=""){
							alert(res);
							return ;
						}else{
							$("#btn_save").addClass("z-btn-dsb");
		                    $("#btn_save").attr("disabled","disabled")
		                    $("#btn_reject").addClass("z-btn-dsb");
		                    $("#btn_reject").attr("disabled","disabled")
							$("#leaveForm").attr('action',$(this).attr("url"));  
			    			$("#leaveForm").submit();
						}
			})
			//
		}); 
		//
		function fileSelect(){
		  $("[name='fileAppName_']").val( $("#fileAppAddr_").val().substring($("#fileAppAddr_").val().lastIndexOf("\\")+1,$("#fileAppAddr_").val().lastIndexOf(".")));
		}
    </script>
</head>
<content tag="heading">
请假审核
</content>
<body>
	<ex:tab id="leaveTab">
		<ex:tabItem name="leaveDataItem" label="审核内容" disabled="false"
			url="${ctx}/leaveAction.do?method=approveView&id=${id}&forwardFlag=approveView"></ex:tabItem>
		<ex:tabItem name="leaveItem" label="审核意见" selected="true">
					<%@ include file="/commons/approveInfoList.jsp"%>
			<html:form action="leaveAction.do?method=approveSave&flag=desgin&designType=${param.designType}" styleId="leaveForm"
				styleClass="form" method="POST" enctype="multipart/form-data" >
				<html:hidden property="id"  value="${id}"/>
				<%@ include file="/commons/approveFromCommon.jsp"%>
			</html:form>
			<div align="center" class="sbDiv">
				<input type="button" class="button1" id="btn_save" icon="icon_save"
					value="确定" />
				&nbsp;&nbsp;
			<input type="button" id="btn_reject" icon="icon-pkg"
				url="leaveAction.do?method=backtoStart&flag=desgin&designType=${param.designType}" value="驳回" />&nbsp;&nbsp;
				<input type="button" class="button1" id="btn_back" icon="icon_back"
					value="<fmt:message key="button.back"/>" />
			</div>
		</ex:tabItem>
	</ex:tab>
</body>
</html:html>
