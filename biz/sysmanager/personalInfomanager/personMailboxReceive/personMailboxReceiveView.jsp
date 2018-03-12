<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
<html:html>
<head>
	<script type="text/javascript">
		//加载
	   $(document).ready(function(){
	   		//
	   		noread('${userinfo.empId}');
			//
			$("#btn_back").click(function(){ 
				location.href="personMailboxSendAction.do?method=receive&flag=${flag}&ec_crd=${param.ec_crd}";
			}); 
			//
			$("#btn_reply").click(function(){ 
				location.href="personMailboxSendAction.do?method=create&sendId=${personMailboxReceive.sendid}&flag=${flag}&receiveid=${personMailboxReceive.id}&ec_crd=${param.ec_crd}";
			}); 
			//
			$("#btn_reload").click(function(){ 
				location.href="personMailboxSendAction.do?method=befortransmit&receiveid=${personMailboxReceive.id}&flag=${flag }&ec_crd=${param.ec_crd}";
			}); 
			//
		});
		//
	  function noread(userid){		
		   	$.ajax({
			   type: "POST",
			   url: "${ctx}/personMailboxSendAction.do?method=countNoread",
			   data: "userid="+userid,
			   success: function(msg){
			   		msg = msg.split(";");
					parent.Links.noread.innerHTML =msg[0];
			        parent.Links.allreceive.innerHTML =msg[1];
			        parent.Links.allsend.innerHTML =msg[2];
			        parent.Links.Draft.innerHTML =msg[3];
			      // parent.Links.garabge.innerHTML =msg[4];
			   }
			});	
	  }
		
	</script>
</head>
<content tag="heading">
信件信息
</content>
<body>
<html:hidden property="flag" value="${flag}" />
<fieldset >
		<legend>[信件信息]</legend>
					<table class="titleTable">
						<COLGROUP>
					         <COL class="tdLeftOneTwo" />
						     <COL class="tdRightOneTwo" />
					    </COLGROUP>
					<tr>
						<td>
							发&nbsp;&nbsp;件&nbsp;&nbsp;人：<span class="noRedSpan">*</span>
						</td>
						<td colspan="3">
							<ex:empName id="${personMailboxReceive.recorder}"/>
						</td>
					</tr>
					<tr>
						<td>
							标&nbsp;&nbsp;&nbsp;&nbsp;题：<span class="noRedSpan">*</span>
						</td>
						<td colspan="3">
							${personMailboxReceive.title}
						</td>
					</tr>
					<tr>
						<td>
							内&nbsp;&nbsp;&nbsp;&nbsp;容：<span class="noRedSpan">*</span>
						</td>
						<td colspan="3">
							${tempContent}
						</td>
					</tr>
				</table>
		</fieldset>
	<%@ include file="/commons/showFiles.jsp"%>
	<div class="saveDiv">
		<input id="btn_back" value="${texts['button.back']}" type="button"  icon="icon_back"/>
		<input id="btn_reply" value="回  复" 					 type="button"  icon="icon-back"/>
		<input id="btn_reload" value="转  发" 					 type="button"  icon="icon-reload"/>
	</div>
</body>
</html:html>
