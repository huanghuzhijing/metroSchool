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
	<center width="100%">
			<table cellpadding="0" cellspacing="0" class="maintable" width="100%" >
                    	<div id="banner2" style="width:50px">
                    	<input type="hidden" name="fileUpload" value="1"/>
                        <input type="button" icon="icon_currWeek" onclick="javascript:showUploadDialogAndRefresh('contentSelectAction.do?method=uploadFilesException&empId=${empId}&mainTableName=${maintable}',900,700);" style="width: 76px; height: 65px; cursor:pointer" value="上传" alt="进入文件上传页面" />
                    	</div>
                <tr>
                    <td>
                    	<table cellpadding="0" cellspacing="0" id="documentlist" class="listTable" >
					        <tr class="indextabletitle">
						        
						        <th width="30%">附件名称</th>
						        <c:if test="${maintable!='emergencyMember'&&maintable!='accidentDeal'}">
						         <th width="10%">文件类型</th>
						        <th width="10%">文件大小</th>
						        </c:if>
						         <c:if test="${maintable=='emergencyMember'||maintable=='accidentDeal'}">
						         <th width="10%">附件类型</th>
						        <th width="10%">上传人</th>
						         <th width="10%">上传时间</th>
						        </c:if>
						        <th width="10%">操&nbsp;作</th>
					        </tr>
					        <c:forEach items="${voList}" var="annex">
					        <tr  >
					          <td>${annex.annexname}</td>
					           <c:if test="${maintable!='emergencyMember'&&maintable!='accidentDeal'}">
					           <td>${annex.formattype}</td>
					         <td>${annex.annexsize}&nbsp;(K)</td>
					         </c:if>
					          <c:if test="${maintable=='emergencyMember'||maintable=='accidentDeal'}">
					          
						     <td> 
						     
						      <ex:dicDisplay dictIdentify="AttachType" dictValue="${annex.attachType}"/>
						      
						      
						      </td><td>
						       <ex:employeeName id="${annex.uploadMan}"/>
						       </td><td> ${annex.uploadDate}</td>
						        </c:if>
					         <td>
 					   <input type="hidden" name="file_Id"    value="${annex.annexId}"  />
 					   
		     			<input type="hidden" name="file_Addr"    value="${annex.annexaddress}"  />
		     			 <input type="hidden" name="file_Name"    value="${annex.annexname}"  />
		      			 <input type="hidden" name="file_Type"    value="${annex.formattype}"  />
		        		<input type="hidden" name="file_realSize"    value="${annex.annexsize}"  />
		        		<input type="hidden" name="attach_Type"    value="${annex.attachType}"  />
					 <a href="javascript:#" 	onclick="window.document.location.href='contentSelectAction.do?method=download&fileaddress=${annex.annexaddress}&filename=${annex.annexname }&fileType=${fn:toLowerCase(annex.formattype)}'"   >下载</a>
					 <a  href="javascript:#" onclick="openWin('contentSelectAction.do?method=webOfficeView&filename=${annex.annexname }&fileaddress=${annex.annexaddress}&fileType=${fn:toLowerCase(annex.formattype)}');">在线查看</a>
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
		</center>
					    

</fieldset>
