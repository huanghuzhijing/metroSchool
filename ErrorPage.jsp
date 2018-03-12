<%@ page contentType="text/html; charset=GBK" %>
<%@ page isErrorPage="true" %>
<%
    String strContextPath = request.getContextPath();
    String retrun_page = (String) request.getAttribute("retrun_page");

%>

<%
    if (exception != null && exception.getMessage() != null && exception.getMessage().indexOf("超时")>-1){
%>
                    <script language="javascript">
                        if (this.parent.parent != null) {
                            this.parent.parent.location.href="<%=strContextPath%>/index.jsp";
                        } else if (this.parent != null){
                            this.parent.location.href="<%=strContextPath%>/index.jsp";
                        } else{
                            this.location.href="<%=strContextPath%>/index.jsp";
                        }
                    </script>
<%
	}else{
%>
<html>
<head>
<meta http-equiv="Content-Language" content="zh-cn">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>信息处理系统错误页面</title>
<LINK href="<%=strContextPath%>/biz/css/main.css" rel="stylesheet" type="text/css">
<script language="JavaScript" type="text/JavaScript">
<!--
function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}
//-->
</script>
</head>

<body bgcolor="#FFFFFF" leftmargin="0" topmargin="4" marginwidth="0" marginheight="4">
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<table width="480" border="0" align="center" cellpadding="0" cellspacing="0" class="tableblack">
  <tr>
    <td>
      <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td>
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr height="28px">
                <td width="12" background="<%=strContextPath%>/images/common/titlebg/left.gif">
                  <!--img src="<%=strContextPath%>/images/common/titlebg/left.gif"-->
                </td>
                <td width="120" class="tabletitle">错误提示</td>
                <td width="38" background="<%=strContextPath%>/images/common/titlebg/center.gif">
                  <!--img src="<%=strContextPath%>/images/common/titlebg/center.gif"-->
                </td>
                <td class="tablecenter">&nbsp;</td>
              </tr>
            </table>
          </td>
        </tr>
        <tr>
          <td height="10" bgcolor="#FFFFFF"></td>
        </tr>
        <tr>
          <td height="38" align="center" valign="top" bgcolor="#FFFFFF">
            <table width="96%" border="0" cellspacing="0" cellpadding="0">
              <!-- tr align="center">
                <td height="24" colspan="2">
                  <strong></strong>
                </td>
              </tr-->
              <tr>              
                <td width="24%" align="center">
                  <img src="<%=strContextPath%>/images/common/titlebg/img_save_error.gif" width="48" height="48"> </td>
                <td style="line-height:150%">
				错误码：<%=pageContext.getErrorData().getStatusCode()%><br>
				页面URL：<%=pageContext.getErrorData().getRequestURI()%><br>				
				错误信息：<%=(exception!=null)?exception.getMessage():""%>				
				<%
					if(pageContext.getErrorData().getStatusCode() == response.SC_NOT_FOUND)
					{
						out.println("page not found");
					}					
				%>&nbsp;！
				<div style="cursor: hand;color:red;" onclick="if(detail.style.display=='block'){detail.style.display='none';}else{detail.style.display='block'}">[ 详细信息 ...... ]</div>
				</td>
              </tr>              
              <tr>
                <td colspan="2" align="center">
                <%if (retrun_page == null) {%>
                    <a href="javascript:window.history.back();">返回上页</a>
<%} else if (retrun_page.trim().equalsIgnoreCase("window.close();")) {%>
                    <a href="javascript:window.close();">关闭</a>
<%} else {%>
                    <a href="<%=retrun_page%>">返回上页</a>
<%}%>
                </td>
              </tr>
              <tr id="detail" style="display: none;" width="100%" class="tr03">
                <td colspan=2 > Stack Trace is :<br align="center">
                 <font color="red">
<%
if(exception!=null)
{
    java.io.CharArrayWriter cw = new java.io.CharArrayWriter();
    java.io.PrintWriter pw = new java.io.PrintWriter(cw,true);
    exception.printStackTrace(pw);
    int i=0,index1=0;
    StringBuffer sb=new StringBuffer(cw.toString());
    while((index1=sb.toString().indexOf("at ",i))>=0&&i<sb.length()){
        int index2=index1+3;
        if(index2>sb.length()){
            index2=sb.length();
        }
        sb.replace(index1,index2,"<br>&nbsp;&nbsp;&nbsp;&nbsp;at ");
        i=index1+"<br>&nbsp;&nbsp;&nbsp;&nbsp;at ".length();
        if(i>sb.length())i=sb.length();
    }
    out.println(sb.toString());
}
else out.println("Nothing");
%>
                  </font>
                </td>
              </tr>
            </table>
          </td>
        </tr>
        <tr>
          <td align="center" bgcolor="#FFFFFF">&nbsp;</td>
        </tr>
      </table>
    </td>
  </tr>
</table>
</body>
</html>
<%
    }
%>
