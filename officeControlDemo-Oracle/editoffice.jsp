<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page language="java" import="java.io.*,java.sql.*,oracle.jdbc.*" %>
<%@ include file="connectionInfo.jsp"%>
<%@ include file="FilePathInfo.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@   page   import="java.net.*"   %>    

<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<c:if test="${ctx=='/'}">
	<c:set var="ctx" value=""/>
</c:if>
<%
boolean isNewFile ;
String filetype="";
String fileId="";
String fileName="";
String fileUrl="";
String attachFileName="";
String attachFileDescribe="";
String attachFileUrl="";
String templateFileUrl="officeControlDemo-Oracle/templateFile/";//新建文档模板url
String otherData="";
Connection conn = null;
Statement stmt = null;
ResultSet rs = null;
String example="";
fileId = request.getParameter("FileId")==null?"":request.getParameter("FileId").toString().trim();

if(fileId=="")
{isNewFile = true;}
else
{isNewFile = false;}
if(isNewFile)
{
	filetype=request.getParameter("fileType")==null?"":request.getParameter("fileType").trim();//如果filetype参数为空,默认为word文档.
	example=request.getParameter("example")==null?"":request.getParameter("example").trim();// 
	
	if(filetype.equalsIgnoreCase("excel"))
	{	
		fileName="新建Excel文档.xls";
		templateFileUrl=templateFileUrl+"newExcelTemplate.xls";
	}
	else if(filetype.equalsIgnoreCase("word")){
		fileName="新建word文档.doc";
		if(example.equalsIgnoreCase("1")){
		templateFileUrl=templateFileUrl+"21.officefile.32424.doc";
		}else{
		templateFileUrl=templateFileUrl+"newWordTemplate.doc";
		}
		
	}
	else if(filetype.equalsIgnoreCase("ppt"))
	{
		fileName="新建ppt文档.ttp";
		templateFileUrl=templateFileUrl+"newPptTemplate.ppt";	
	}
	else{
		filetype="word";
		fileName="新建word文档.doc";
		templateFileUrl=templateFileUrl+"newWordTemplate.doc";
	}
	
 
	fileUrl=templateFileUrl;//如果是新文档，控件打开新建模板文档
}
else
{		 
				  		
	try
	{Class.forName(DBDriver);}
	catch(java.lang.ClassNotFoundException e)
	{out.println("Error:" + e.getMessage());return;}
	try
	{
		conn = DriverManager.getConnection(ConnStr,userName,userPasswd);    
		stmt=conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
	} 
	catch(SQLException e)
	{out.println("Error:" + e.getMessage());return;}
	rs = stmt.executeQuery("select * from "+officeFileInfoTableName+" where id="+fileId); 
	if(rs.next())
	{
		fileName = rs.getString("FILENAME");	
		fileUrl = relativeOfficeFileUrl+rs.getString("FILENAMEDISK");
		otherData = rs.getString("OTHERDATA");
		filetype=rs.getString("filetype");
		if(filetype.equalsIgnoreCase("Word.Document"))
		{filetype="word";}
		else if(filetype.equalsIgnoreCase("Excel.Sheet"))
		{filetype="excel";}
		else if(filetype.equalsIgnoreCase("PowerPoint.Show"))
		{filetype="ppt";}
		else{filetype="othertype";}
		attachFileDescribe = rs.getString("ATTACHFILEDESCRIBE")==null?"":rs.getString("ATTACHFILEDESCRIBE").trim();
		attachFileName = rs.getString("ATTACHFILENAMEDISK")==null?"":rs.getString("ATTACHFILENAMEDISK").trim();
		attachFileUrl=attachFileName.equalsIgnoreCase("")?"":(relativeAttachFileUrl+attachFileName);
	
	}
	if(rs != null)rs.close();
	if(stmt != null)stmt.close();
	if(conn != null)conn.close();	
	 
}

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html  xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>ntko office文档控件示例-ms office文档编辑</title>
		<meta content="IE=7" http-equiv="X-UA-Compatible" /> 
		<!--设置缓存-->
		<meta http-equiv="cache-control" content="no-cache,must-revalidate"/>
		<meta http-equiv="pragram" content="no-cache"/>
		<meta http-equiv="expires" content="0"/>
    <link href="StyleSheet.css" rel="stylesheet" type="text/css" />
    <SCRIPT LANGUAGE="JavaScript" src="OfficeContorlFunctions.js" charset="UTF-8"></SCRIPT>
    </head>
	<body  onload='intializePage("${pageContext.request.contextPath}/<%=fileUrl %>");'>
    <form id="form1" action="${ctx}/servlet/UploadOfficeServlet" enctype="multipart/form-data" style="padding:0px;margin:0px;">
    <div id="editmain" class="editmain">
         
        <div id="editmain_top" class="editmain_top">
                <div id="edit_button_div" class="edit_button_div">
             <c:if test="${param.type==1}"> <img alt="保存office文档" src="images/edit_save_office.gif" onclick="saveFileToUrl();" />
                 </c:if> 
                <img alt="示例程序帮助文档" src="images/demohelp.jpg" onclick="NtkoHelp();"/>
                </div>
            <table border="0" cellpadding="0" cellspacing="0">
                <tr>
                    <td><img src="images/edit_main_top.jpg"  alt="文件列表上框" /></td>
                </tr>
                <tr>
                    <td class="edittablebackground"><!--示例标题--><b>ntko office文档控件示例-ms office文档编辑</b></td>
                </tr>
            </table>
        </div>
        <div id="editmain_middle" class="editmain_middle">
             
            <div id="editmain_right" >
                <div id="formtop">
                    <table>
                        <tr>
                            <td colspan="5"  class="edit_tabletitle">文件表单数据:</td>
                        </tr>
                        <tr>
                            <td colspan="5">&nbsp;</td>
                        </tr>
                        <tr>
                            <td width="7%"> 文&nbsp;件&nbsp;ID:</td>
                            <td width="20%"><input name="fileId" id="fileId" readOnly  type="text" value="<%=fileId %>" /></td>
                            <td width="8%">文件名称:</td>
                            <td width="40%"><input name="filename" id="filename" type="text" value="<%=fileName %>" /></td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr> 
                            <td>其它数据:  </td>
                            <td><input id="otherData" name="otherData" align="left" type="text" value="<%=otherData %>" /></td>
                            <td>上传文件:</td>
                            <td><input class=fileup name="attachFile" type=file id="attachFile" />&nbsp;(选择附件)<br><input name="attachFileDescribe" type=text id=attachFileDescribe value="<%=attachFileDescribe %>" />&nbsp;(附件说明)</td>
                            
                          <td>&nbsp;</td>
                        </tr>
                        <tr><td>文档附件:</td>
                            <td colspan="4">
                            <!--附件列表-->
                            <%if(!isNewFile&&!attachFileUrl.equalsIgnoreCase(""))
														{
														%>
														<a href="<%=URLEncoder.encode(attachFileUrl)%>" target=uploadattachfile>点击下载</a>&nbsp;(<%=attachFileDescribe==""?"没有说明":"附件说明："+attachFileDescribe%>)
														<%
														}
														else
														out.println("没有附件");
														%>
                            </td>
                        </tr>
                    </table>
                </div>
                
                <div id="officecontrol">
                <script language="javascript" type="text/javascript" src="officecontrol/ntkoofficecontrol.js"  charset="UTF-8"></script>
                <div id=statusBar style="height:20px;width:100%;background-color:#c0c0c0;font-size:12px;"></div>
								<script language="JScript" for=NTKO_OCX event="OnDocumentClosed()">
									setFileOpenedOrClosed(false);
								</script>
								<script language="JScript" for=TANGER_OCX event="OnDocumentOpened(TANGER_OCX_str,TANGER_OCX_obj)">
									//OFFICE_CONTROL_OBJ.activeDocument.saved=true;//saved属性用来判断文档是否被修改过,文档打开的时候设置成ture,当文档被修改,自动被设置为false,该属性由office提供.
									//SetDocUser("陶勇");
									OFFICE_CONTROL_OBJ.SetReadOnly(false);
									if(fileId!=null&&fileId!=""){
									SetReviewMode(true);
									setShowRevisions(true);
									WebUserName="${userinfo.empName}";
									//TANGER_OCX_AddDocHeader("陶勇"); 
									var type='${param.type}';
									if(type==1){
											OFFICE_CONTROL_OBJ.SetReadOnly(false);
									}else{
									OFFICE_CONTROL_OBJ.SetReadOnly(false);
									FullScreenMode=true;
									setShowRevisions(false);
									}
									}
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
									alert(result);
									document.all("statusBar").innerHTML="服务器返回信息:"+result;
									if(result=="文档保存成功。")
									{OFFICE_CONTROL_OBJ.ActiveDocument.AcceptAllRevisions();
									window.close();}
								</script>
								<script language="JScript" for=TANGER_OCX event="OnCustomMenuCmd2(menuPos,submenuPos,subsubmenuPos,menuCaption,menuID)">
								alert("第" + menuPos +","+ submenuPos +","+ subsubmenuPos +"个菜单项,menuID="+menuID+",菜单标题为\""+menuCaption+"\"的命令被执行.");
								</script>

                </div>
            </div>
        </div>
       
    </div>
    </form>
</body>
</html>
