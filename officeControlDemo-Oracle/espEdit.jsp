<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html;charset=gb2312" %>
<%@ page language="java" import="java.io.*,java.util.*" %>
<%@ include file="FilePathInfo.jsp"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>ntko office�ĵ��ؼ�ʾ��&nbsp; ��ȫ����ӡ���б�</title>
    <meta content="IE=7" http-equiv="X-UA-Compatible" /> 
    <link href="StyleSheet.css" rel="stylesheet" type="text/css" />
    <script language="javascript" type="text/javascript" src="ntko.js"></script>
    <script type="text/javascript" language="JavaScript">
        //��ȫ����ӡ��ϵͳ����
        var ntkosignctl = null; //��ʼ��ӡ�¹���ؼ�����
        var filename = ""; //����ӡ���ļ���
        var Signname = "";//ӡ���ļ�����
        
        function CreateNewSign() {
            Signname = document.forms(0).SignName.value;
            document.forms(0).filename.value = Signname + ".esp";
            ntkosignctl = document.all("ntkosignctl");
            if ((Signname == '') || (undefined == typeof (Signname))) {
                alert('������ӡ������');
                return false;
            }
            var Signuser = document.forms(0).SignUser.value;
            if ((Signuser == '') || (undefined == typeof (Signuser))) {
                alert('������ӡ��ʹ����');
                return false;
            }
            var Password1 = document.forms(0).Password1.value;
            var Password2 = document.forms(0).Password2.value;
            if ((Password1.length<6 ||Password1.length>32)||(Password1 == '') || (Password2 == '') || (Password1 != Password2) || (undefined == typeof (Password1))) {
                alert('ӡ�¿����Ϊ�ջ��߲�һ��,�����Ϊ6-32λ��');
                return false;
            }
            var Filename = document.forms(0).Filename.value;
            if ((Filename == '') || (undefined == typeof (Filename))) {
                alert('��ѡ��ӡ��Դ�ļ�');
                return false;
            }
            //  alert("Ӧ���ڴ˴����Ӵ��룬�ж��û�ѡ���Դ�ļ��Ƿ���ͼƬ�ļ���");
            ntkosignctl.CreateNew(Signname, Signuser, Password1, Filename);
            if (0 != ntkosignctl.StatusCode) {
                alert("����ӡ�´���.");
                return false;
            }
            alert("�����ɹ� �������浽���������߱��ذ�ť.");
            return true;
        }
        //�༭ӡ���ļ�
        function editesp(url) {
            ntkosignctl = document.all("ntkosignctl");
            ntkosignctl.OpenFromURL(url);
            document.forms(0).filename.value = url.substring(url.lastIndexOf("/") + 1, url.length);
            document.forms(0).SignName.value = ntkosignctl.SignName;
            document.forms(0).SignUser.value = ntkosignctl.SignUser;
            document.forms(0).Password1.value = ntkosignctl.PassWord;
            document.forms(0).Password2.value = ntkosignctl.PassWord;
            //ntkosignctl.height = ntkosignctl.SignHeight;
        }
        function savetourl() {
            //�ں�̨�����Ը����ϴ��ļ���inputname�Ƿ�Ϊ"SIGNFILE"���ж�
            //�Ƿ���ӡ�¿ؼ��ϴ����ļ�
            var Password1 = document.forms(0).Password1.value;
            var Password2 = document.forms(0).Password2.value;
            filename=document.forms(0).filename.value;
            if ((Password1.length<6 ||Password1.length>32)||(Password1 == '') || (Password2 == '') || (Password1 != Password2) || (undefined == typeof (Password1))) {
                alert('ӡ�¿����Ϊ�ջ��߲�һ��,�����Ϊ6-32λ��');
                return false;
            }
            ntkosignctl.SignName= document.forms(0).SignName.value;
            ntkosignctl.SignUser = document.forms(0).SignUser.value;
            ntkosignctl.PassWord = document.forms(0).Password1.value;
            //SaveToURL��������ӡ���ļ�
            var retStr = ntkosignctl.SaveToURL(document.forms(0).action, "SIGNFILE", "savetype=4", filename, 0);
            /*
            var newwin = window.open("", "espmsg", "left=200,top=200,width=400,height=200,status=1,toolbar=1,menubar=1,location=1,scrollbars=false,resizable=false", false);
            var newdoc = newwin.document;
            newdoc.open();
            newdoc.write("<center><hr>" + retStr + "<hr><input type=button VALUE='�رմ���' onclick='window.close();if(window.opener){window.opener.location.reload()};'></center>");
            newdoc.close();
            */
            //�ж��Ƿ񱣴�ɹ�������ɹ���ˢ�´���
            if(ntkosignctl.StatusCode==0)
            {
            	alert("����ɹ���");
            	window.close();
          	}
          	else{alert(retStr);}
        }

        function SaveToLocal() {
            ntkosignctl.SaveToLocal('', true);
            if (0 == ntkosignctl.StatusCode) {
                alert("����ɹ�!");
            }
            else {
                alert("�������.");
            }
            if(window.opener)
            window.opener.location.reload();
        }

</script>

</head>
<body>
    <form id="sealform" method="post" enctype="multipart/form-data" action="upLoadEsp.jsp">
    <div id="default" class="divdefault">
        <div id="top" class="top">
        <img src="images/index_banner.jpg" alt="ntko�ĵ��ؼ�ʾ��"/>
        </div>
        <div id="maindiv_top" class="maindiv_top">
            <table border="0" cellpadding="0" cellspacing="0">
                <tr>
                    <td><!--ʾ������-->ntko office�ĵ��ؼ�ʾ��</td>
                </tr>
                <tr>
                    <td><img src="images/index_main_top.gif"  alt="ӡ���б��Ͽ�" /></td>
                </tr>
                <tr>
                    <td class="tablebackground"></td>
                </tr>
            </table>
       </div>
       <div id="maindiv_middle" class="maindiv_middle">
       <div id="esp_button_div" class="espbar">
            <ul>
                <li onclick="CreateNewSign();">����ӡ��</li>
                <li onclick="savetourl();">����ӡ��</li>
                <li onclick="SaveToLocal();">����ӡ�µ�����</li>
                <li onclick="javascript:window.close();">�رմ���</li>
            </ul>
            </div>
            <div id="espobject">
            <script language="javascript" type="text/javascript" src="officecontrol/signtoolcontrol.js"></script>
            <table>
                    <tr><td width="19%">���ڱ༭��</td><td width="81%"><input id="filename" name="filename" value="" type="text" disabled="disabled"/></td></tr>
                  <tr><td width="19%">ӡ�����ƣ�</td><td width="81%"><input name="SignName"/></td></tr>
                  <tr><td>ӡ��ʹ���ߣ�</td><td><input name="SignUser"/></td></tr>
                  <tr><td>ӡ�¿��</td><td><input type="password" name="Password1" value=""></td></tr>
                  <tr><td>ȷ�Ͽ��</td><td><input type="password" name="Password2" value=""/></td></tr>
                  <tr><td>ӡ��Դ�ļ���</td><td><input type="file" name="Filename" class="fileup"/></td></tr>
                  <!--<tr><td>&nbsp;</td><td><img id="previewimg"></td></tr>-->
                </table>
            </div>
           <div id="wordlist" class="officelist">
           <span>����ӡ���ļ��б�:</span>
               <table class="tabletitle">
                   <tr><td width="25%">��&nbsp;��&nbsp;��&nbsp;��</td><td width="30%">��&nbsp;��&nbsp;��&nbsp;��</td><td width="20%">��&nbsp;��&nbsp;��&nbsp;С</td><td width="25%">��&nbsp;��&nbsp;��&nbsp;��</td></tr>
               </table>
               <table>
               <!--esp�ļ��б�-->
               <%
                  class Filter implements FilenameFilter   
								  {   
									  String extension;      
									  Filter(String extension)   
									  {   
									  	this.extension = extension;   
									  }    
									  public boolean accept(File myFile,String filename)   
									  {   
									  	return filename.endsWith("."+extension);   
									  }   
								  }   
									File espPath = new File(absoluteSecSignFileDir);   
				          File[] fileList;     
				          fileList=espPath.listFiles(new Filter("esp"));   

				          for(int i=0;i<fileList.length;i++) 
				          {
				          %>
				          <TR class=mouseout onmouseover='this.className="mouseover"'onmouseout='this.className="mouseout"'>
									<TD width="25%"><%=fileList[i].getName()%></TD>
									<TD width="30%"><%=new Date(fileList[i].lastModified()).toString()%></TD>
									<TD width="20%"><%=fileList[i].length()%></TD>
									<TD width="25%"><A href='javascript:editesp("<%=relativeSecSignFileDir+fileList[i].getName()%>");'>&nbsp;�� ��&nbsp;</A></td>
									</tr>
				       <%
				       }
               %>
               </table>
           </div>
       </div>
       <div id="maindiv_bottom" class="maindiv_bottom">
       <img alt="" src="images/index_main_nether.jpg" />
           <div id="conmpanyinfo" class="conmpanyinfo">
            <img alt="�������Ƽ����޹�˾" src="images/Companyinfo.jpg" />
            <p>����֧�������˾��վwww.ntko.com ����ϵ���ǡ�</p>
            <p>��˾��վ:WWW.NTKO.COM&nbsp;&nbsp;&nbsp;����֧�ֿ�����վ:DEV.NTKO.COM</p>
            </div>
       </div>
    </div>
    </form>
</body>
</html>