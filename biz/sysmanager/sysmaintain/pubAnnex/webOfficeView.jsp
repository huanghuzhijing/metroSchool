<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<html>
<content tag="heading"> <font size="4">${fileName} </font> </content>
<head>
<script language="JavaScript" src="${ctx}/officeControlDemo-Oracle/OfficeContorlFunctions.js" charset="UTF-8"></script>
<script type="text/javascript">
	$(document).ready(function(){
		var type='${param.fileType}';
		if(type=='txt'){
			$.post("${ctx}/pubAnnexAction.do?method=download&id=${param.id}",function(msg){
				$("#officecontrol").html(msg);
			});
		}else{
			if(!('jpg,jpeg,gif,png'.indexOf(type)>-1)){
				init();
			}
		}
		$("#btn_close").click(function(){
			window.close();
		}) ;
	});
</script>
</head>
<body >
	<div id="officecontrol"  style="height:950px"> 
	 <c:if test="${fn:contains('jpg,jpeg,gif,png',fn:toLowerCase(param.fileType))}">
	 	<img src="${ctx}/pubAnnexAction.do?method=download&id=${param.id}"/>
	 </c:if>
	 <c:if test="${fn:contains('doc,docx,ppt,xls,.xlsx,pdf',fn:toLowerCase(param.fileType))}">
          <script language="javascript" type="text/javascript" src="${ctx}/officeControlDemo-Oracle/officecontrol/ntkoofficecontrol.js"></script>
                <div id=statusBar style="height:20px;width:100%;background-color:#c0c0c0;font-size:12px;"></div>
								<script language="JScript" for=NTKO_OCX event="OnDocumentClosed()">
									setFileOpenedOrClosed(false);
								</script>
								<script language="JScript" for=TANGER_OCX event="OnDocumentOpened(TANGER_OCX_str,TANGER_OCX_obj)">
									OFFICE_CONTROL_OBJ.SetReadOnly(true);
									SetReviewMode(true);
									setShowRevisions(true);
									WebUserName='${userinfo.empName}';
									//获取文档控件中打开的文档的文档类型
									switch (OFFICE_CONTROL_OBJ.doctype)
									{
										case 1:
											fileType = "Word.Document";
											fileTypeSimple = "wrod";
											break;
										case 2:
											fileType = "Excel.Sheet";
											fileTypeSimple="excel";
											break;
										case 3:
											fileType = "PowerPoint.Show";
											fileTypeSimple = "ppt";
											break;
										case 4:
											fileType = "Visio.Drawing";
											break;
										case 5:
											fileType = "MSProject.Project";
											break;
										case 6:
											fileType = "WPS Doc";
											fileTypeSimple="wps";
											break;
										case 7:
											fileType = "Kingsoft Sheet";
											fileTypeSimple="et";
											break;
										default :
											fileType = "unkownfiletype";
											fileTypeSimple="unkownfiletype";
									}
								 
									setFileOpenedOrClosed(true);
								</script>
									<script language="JScript" for=TANGER_OCX event="BeforeOriginalMenuCommand(TANGER_OCX_str,TANGER_OCX_obj)">
									alert("BeforeOriginalMenuCommand事件被触发");
								</script>
								<script language="JScript" for=TANGER_OCX event="OnFileCommand(TANGER_OCX_str,TANGER_OCX_obj)">
								 
								</script>
								<script language="JScript" for=TANGER_OCX event="AfterPublishAsPDFToURL(result,code)">
									result=trim(result); 
									document.all("statusBar").innerHTML="服务器返回信息:"+result;
									if(result=="文档保存成功。")
									{OFFICE_CONTROL_OBJ.ActiveDocument.AcceptAllRevisions();
									window.close();}
								</script>
								<script language="JScript" for=TANGER_OCX event="OnCustomMenuCmd2(menuPos,submenuPos,subsubmenuPos,menuCaption,menuID)">
								alert("第" + menuPos +","+ submenuPos +","+ subsubmenuPos +"个菜单项,menuID="+menuID+",菜单标题为\""+menuCaption+"\"的命令被执行.");
								</script>
								<script type="text/javascript">
								function init(){
								alert("location.href='pubAnnexAction.do?method=download&id=${annex.id}'");
									var TANGER_OCX_OBJ='';
						       	    TANGER_OCX_OBJ = document.getElementById("TANGER_OCX");
						       	 	TANGER_OCX_OBJ.AddDocTypePlugin(".pdf","PDF.NtkoDocument","4.0.0.0","${ctx}/officeControlDemo-Oracle/ntkooledocall.dll",51,true);	
						       	    TANGER_OCX_OBJ.BeginOpenFromURL("location.href='pubAnnexAction.do?method=download&id=41'");
								}
								</script>
								</c:if>

                </div>
<div class="saveDiv">
	<input type="button" id="btn_close" icon="icon_close" value="关 闭"/>
</div>
</html>
