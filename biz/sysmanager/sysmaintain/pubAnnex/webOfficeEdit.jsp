<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<content tag="heading"> <font size="4">${fileName}</font> </content>
<head>
	<script type="text/javascript" src="${ctx}/webOffice/js/template.js"></script>
	<script type="text/javascript" src="${ctx}/webOffice/js/main.js"></script>
	<script language=javascript>
	$(document).ready(function(){
		$("#btn_save").click(function(){
			 saveDoc();
		
		});
		$("#btn_close").click(function(){
			window.close();
		}) ;
	});
		/****************************************************
		*
		* 					初始化控件
		*
		****************************************************/
		function WebOffice1_NotifyCtrlReady() {
			if(${param.id==null||param.id==''}) {	// 新建文档
					document.all.WebOffice1.LoadOriginalFile("", "${param.fileType}");
			} else {	// 打开文件 
					document.all.WebOffice1.LoadOriginalFile("<%=basePath%>/pubAnnexAction.do?method=downloadWebOffice&id=${param.id}", "${param.fileType}");
			}
			document.all.WebOffice1.OptionFlag |=0x0400;
			document.all.WebOffice1.IsModify=false;
		 	document.all.WebOffice1.ShowToolBar=false; 					// 屏蔽 WebOffice 控件菜单栏
		 	document.all.WebOffice1.SetKeyCtrl(595,-1,0);				// 屏蔽 保存快捷键(Ctrl+S) 
			document.all.WebOffice1.SetKeyCtrl(592,-1,0);				// 屏蔽 打印快捷键(Ctrl+P) 
			notSave();
			notPrint();
			notCopy();
			allHideMenu_onclick();//2007
		}
       //按钮事件监听   
       function WebOffice1_NotifyToolBarClick(iIndex){   
     	  //alert(iIndex);
           // if(iIndex==32777){//保存   
           //         saveDoc();   
           // }  
        }   
	   function  saveDoc(){
	    var returnValue; // 保存页面的返回值   
            document.all.WebOffice1.HttpInit(); // 初始化Http引擎   
            // 添加相应的Post元素    
            document.all.WebOffice1.HttpAddPostString("id", ${param.id});   
            //添加上传文件    
            document.all.WebOffice1.HttpAddPostCurrFile("officeUpload","");    
            //提交上传文件    
           returnValue = document.all.WebOffice1.HttpPost("<%=basePath%>/pubAnnexAction.do?method=webOfficeSave&id=${param.id}");   
           if(returnValue=="ok"){
              alert("保存成功");
           }
           if(returnValue=="error"){
              alert("保存失败");
           }
	   }
</script>

<SCRIPT LANGUAGE=javascript FOR=WebOffice1 EVENT=NotifyCtrlReady>
<!--
 WebOffice1_NotifyCtrlReady()			// 在装载完Weboffice(执行<object>...</object>)控件后执行 "WebOffice1_NotifyCtrlReady"方法
//-->
</SCRIPT>
 <SCRIPT language=javascript event=NotifyToolBarClick(iIndex) for=WebOffice1>  
   <!--   
     WebOffice1_NotifyToolBarClick(iIndex);   
    //-->  
 </SCRIPT>  
</head>
<body >
<form name="officeForm">
<table width="99%" height="99%">
<tr><td>
<div class="saveDiv">
	<input type="button" id="btn_close" icon="icon_close" value="关 闭"/>
	<input type="button" id="btn_save" icon="icon_save" value="保 存"/>
</div>
	</td>
</tr>
<tr><td>
								<!-- -----------------------------== 装载WebOffice控件 ==--------------------------------- -->
<object id=WebOffice1 height=768 width='100%' height='100%' style='LEFT: 0px; TOP: 0px'  classid='clsid:E77E049B-23FC-4DB8-B756-60529A35FAD5' codebase='${ctx}/webOffice/js/weboffice_v6.0.5.0.cab#Version=6,0,5,0'>
<param name='_ExtentX' value='6350'><param name='_ExtentY' value='6350'>
</object>
								<!-- --------------------------------== 结束装载控件 ==----------------------------------- -->
	</td>
</tr>
</table>
</form>
</html>
