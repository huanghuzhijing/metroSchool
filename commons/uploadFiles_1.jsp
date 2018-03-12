<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/commons/taglibs.jsp"%> 
 
 

<script language="JavaScript">
		 function deleteFile(obj){
		  //$("#documentlist").remove($(obj).parent().parent());
				 
				$(obj).parent().parent().remove(); 
			}
		function delFile(md5){
		 
			$("."+md5).val("");
			$("."+md5+"TR").hide();
		 
		}
function showDelDialogAndRefresh(URL,FileName,tWidth,tHeight)
{
	if(!window.confirm("您确认要删除文件:" + FileName +"吗?"))
	{
		return;
	}
	dlgFeatures = "dialogWidth:" + tWidth + "px;dialogHeight:" + tHeight +"px;resizable:yes;center:yes;";
	//window.showModalDialog(URL,"",dlgFeatures);
	//window.location.reload();
	window.open (URL, "newwindow", "width="+(window.screen.availWidth-10)+",height="+(window.screen.availHeight-30)+ ",top=0,left=0, toolbar=no, menubar=no, scrollbars=no, resizable=yes, location=no, status=no")

}
function showUploadDialogAndRefresh(URL,tWidth,tHeight)
{
	dlgFeatures = "dialogWidth:" + tWidth + "px;dialogHeight:" + tHeight +"px;resizable:yes;center:yes;";
	//window.open(URL,"",dlgFeatures);
	//window.location.reload();
	//window.open (URL, "newwindow", "width="+(window.screen.availWidth-10)+",height="+(window.screen.availHeight-30)+ ",top=0,left=0, toolbar=no, menubar=no, scrollbars=no, resizable=yes, location=no, status=no")
		var url = URL;
		art.dialog({id:'newwindow',title:'文件上传', iframe:url, width:'500', height:'250',top:'30'}) ;	
}
 
</script>
<script type="text/javascript">
 

//-->
function openWin(url){
	window.open (url, "newwindow", "width="+(window.screen.availWidth-10)+",height="+(window.screen.availHeight-30)+ ",top=0,left=0, toolbar=no, menubar=no, scrollbars=no, resizable=yes, location=no, status=no")
}
</script>
	 
	<fieldset><legend>附件信息</legend>
			<div class="saveDiv">
            <input type="hidden" name="fileUpload" value="1"/>
            <input type="button" icon="icon_currWeek" onclick="javascript:showUploadDialogAndRefresh('contentSelectAction.do?method=uploadFile&mainTableName=${maintable}',900,700);" style="width: 76px; height: 65px; cursor:pointer" value="上传" alt="进入文件上传页面" />
			</div>
			<table cellpadding="0" cellspacing="0" class="maintable" width="100%" >
                <tr>
                    <td>
                    	<table cellpadding="0" cellspacing="0" id="documentlist" class="listTable" >
					        <tr class="indextabletitle">
						        
						        <th width="30%">附件名称</th>
						         <th width="10%">文件类型</th>
						        <th width="10%">文件大小</th>
						        
						        <th width="10%">操&nbsp;作</th>
					        </tr>
					        <c:forEach items="${pubannexLst_1}" var="annex">
					        <tr  >
					          <td>${annex.filename}</td>
					           <td>${annex.filetype}</td>
					         <td>${annex.filesize}&nbsp;(K)</td>
					         <td>
 					   <input type="hidden" name="file_Id"    value="${annex.id}"  />
		     			<input type="hidden" name="file_Addr"    value="${annex.fileaddress}"  />
		     			 <input type="hidden" name="file_Name"    value="${annex.filename}"  />
		      			 <input type="hidden" name="file_Type"    value="${annex.filetype}"  />
		        		<input type="hidden" name="file_realSize"    value="${annex.filesize}"  />
					 <a href="javascript:#" 	onclick="window.document.location.href='pubAnnexAction.do?method=download&id=${annex.id}'"   >下载</a>
					 <a  href="javascript:#" onclick="openWin('pubAnnexAction.do?method=webOfficeView&id=${annex.id}&fileType=${fn:toLowerCase(annex.filetype)}');">在线查看</a>
					      &nbsp;  <a  href="javascript:#" onclick="deleteFile(this);">删除</a>
					     
							</td>
					        </tr>
					        </c:forEach>
		 
	  
					    </table>
					   
                    </td>
                </tr>
               <tr><td><div id="newFile">
               
               
               </div></td></tr>
            </table>
            <table cellpadding="0" cellspacing="0" id="indexfoot">
              
             </table>
</fieldset>
