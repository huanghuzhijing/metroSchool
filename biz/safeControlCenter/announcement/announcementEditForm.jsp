<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
<html:html>
<head>
	<script type="text/javascript">
		//
	   $(document).ready(function(){
	   
			//
			$("#btn_save").click(function(){
				var properties=new Array();
				properties[0]=["title","标题"];
				properties[1]=["content","内容"];
				saveValidateRequired("#btn_save",properties,"announcementForm");
			}); 
			//
			$("#btn_back").click(function(){ 
				document.forms[0].action='announcementAction.do?method=list&ec_p=${param.ec_p}&ec_id=${param.id}&ec_crd=${param.ec_crd}';   
	    		document.forms[0].submit();
			});  
		
		
			
		});
		function fileSelect(){
		  $("[name='fileName_']").val( $("#fileAddr_").val().substring($("#fileAddr_").val().lastIndexOf("\\")+1,$("#fileAddr_").val().lastIndexOf(".")));
		}
		
		function fileClear(){
			 $("#fileName_").val("");
			 $("#fileAddr_").val("");
		}
		function showUploadDialogAndRefresh(URL,tWidth,tHeight)
    {   dlgFeatures = "dialogWidth:" + tWidth + "px;dialogHeight:" + tHeight +"px;resizable:yes;center:yes;";
		var url = URL;
		art.dialog({id:'newwindow',title:'文件上传', iframe:url, width:'500', height:'250',top:'50%'}) ;	
    }
    
    
	</script>
</head>
<content tag="heading">
	系统公告
</content>
<body>
	<html:form enctype="multipart/form-data" action="announcementAction.do" method="POST">
		<input name="method" value="save" type="hidden" />
		<html:hidden property="id" />
	 	<html:hidden property="qtitle" />
		<html:hidden property="qcreater" />
		<html:hidden property="qstartDate" />
		<html:hidden property="qendDate" />
		<!--查询定位 开始-->
		<html:hidden property="ec_id" value="${announcement.id}"/>
		<html:hidden property="ec_p" />
		<html:hidden property="ec_crd" />
		<!--查询定位 结束-->
		<fieldset >
			<legend>系统公告-编辑</legend>
			<table class="formTable" >
					<COLGROUP>
							<COL class="tdLeftTwo" />
			                <COL class="tdRightTwo" />
			                <COL class="tdLeftTwo" />
			                <COL class="tdRightTwo" />
					</COLGROUP>
					<tr>
						<td>
						  标题：<span class="redSpan">*</span>
						</td>
						<td >
							<html:text property="title" styleClass="inputText" maxlength="100" size="40"/>
						</td>
					</tr>
					<tr>
				<td>
						  内容：<span class="redSpan">*</span>
						</td>
				<td colspan="3">
	   		<html:textarea property="content" styleId="content" value="${announcement.content}"   cols="20" rows="40" onblur="checkTextarea('content',4000)" onkeydown="textCounter('content','spanSummary',4000)" onkeyup="textCounter('content','spanSummary',4000)"/>	   					
	    </td>
				</tr>
					<tr>
						<td>
							附件：<span class="noRedSpan">*</span>
						</td>
							<td >
						       <span style="float: left;"><input type="text" id="fileName_" name="fileName_"
							class="inputText" size="30" value="${announcement.affixName}" /></span>
						<span style="float: inherit;margin-left:5px;"><input type="button" icon="icon_currWeek"
							onclick="javascript:showUploadDialogAndRefresh('contentSelectAction.do?method=uploadFile&flag=1&mainTableName=${maintable}',900,700);"
							style="width: 76px; height: 65px; cursor: pointer" value="文件上传"
							alt="进入文件上传页面" /></span>
						<%--							<input id="fileAddr_" class="inputText" type="file" onchange="fileSelect(this)" name="fileAddr_"/>--%>
						<input type="button" icon="icon_delete" onclick="fileClear(this)"
							style="width: 76px; height: 65px; cursor: pointer" value="清空" />
							<c:if test="${announcement.affixAddress!=null}">
								<a href="<%=request.getContextPath()%>/announcementAction.do?method=downloadSingle&id=${announcement.id }">${announcement.affixName}</a>
							</c:if>

						</td>
						<td style="display:none">
							文件地址：<span class="noRedSpan">*</span>
						</td>
						<td style="display:none">
							<input type="text" id="fileAddr_" name="fileAddr_" class="inputText" readonly="readonly" size="30" value="${announcement.affixAddress}"/>
							
						</td>
					</tr>
					
					<tr>
						<td>
							作者：<span class="noRedSpan">*</span>
						</td>
						<td >
						<input  type="text" readonly="readonly" id="creater" name="creater" class="form_input"  value="<ex:empName id="${announcement.creater}"/>"   />
							
						</td>
						<td>
							创建日期：<span class="noRedSpan">*</span>
						</td>
						<td >
							<input  type="text" id="createDate" name="createDate" class="form_input" readonly="readonly"  value="${createDate}"  />
							
							
						<br></td>
					</tr>
			</table>
		</fieldset>
		<div class="saveDiv">
			<input id="btn_save" value="确  定" type="button" icon="icon_save"/>
			<input id="btn_back" value="${texts['button.back']}" type="button" icon="icon_back"/>
		</div>
	</html:form>
</body>
</html:html>
