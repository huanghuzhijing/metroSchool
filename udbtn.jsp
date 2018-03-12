<%@ include file="/commons/taglibs.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  <title></title>
  <%@ include file="/commons/meta.jsp" %>
<style type="text/css">
<!--
#btnCtl {

    margin-top: 0px;
    margin-bottom:0px;   
    margin-left:auto;
    margin-right:auto; 
    text-align:center;
    width:100%;
    height:100%;
  
}
-->
</style>
 <script language="javascript">
function reduece1()
{

    if(window.top.document.getElementById("bigmainFrame").rows!="0,1,26,*,20")
  {     $("t1").src='<c:url value="/images/btn_line_upz.gif" />';
        //parent.parent.frames["mainFrame"].document.body.style.display = "none";//没有有




        window.top.document.getElementById("bigmainFrame").rows="0,1,26,*,20"; 
        //alert(parent.framMain.cols);
    }
    else
    {    $("t1").src='<c:url value="/images/btn_line_downz.gif" />';
        window.top.document.getElementById("bigmainFrame").rows="100,1,26,*,20";
    }
   //alert(parent.mainFrame.cols);
     //parent.parent.frames[0].document.body.width=8px;
 }
</script>
</head>
<body   title='收缩/展开边栏' style='cursor:hand' align="center" background="<c:url value="/images/left/up_bg.gif" />">

<div onclick="reduece1()" id="btnCtl"><img src="<c:url value="/images/btn_line_downz.gif" />" alt="收缩/展开边栏" id="t1" /></div>
</body>
</html>

