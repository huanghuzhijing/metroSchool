<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<html>
  <head>
   
<content tag="heading">
	保存txt数据
</content>
<script>
var file="";
	var path="";
	function getPath(obj)    
{    
  if(obj)    
    {    
   
    if (window.navigator.userAgent.indexOf("MSIE")>=1)    
      {    
        obj.select();    
   
      return document.selection.createRange().text;    
      }    
   
    else if(window.navigator.userAgent.indexOf("Firefox")>=1)    
      {    
      if(obj.files)    
        {    
   
        return obj.files.item(0).getAsDataURL();    
        }    
      return obj.value;    
      }    
    return obj.value;    
    }    
}    
function test(obj,filter){ 
	path=getPath(obj);
	alert(path+"111");
	file = obj.value.match(/[^\/\\]+$/gi)[0];     //文件名
	
    var rx = new RegExp('\\.(' + (filter?filter:'') + ')$','gi');
    if(filter&&file&&!file.match(rx)){
      alert("只能选择txt");
      pageRefresh();
      //重新构建input file
    }
    
  }
  
  function sub(){
  alert('saveTxtAction.do?method=importText&file='+file+'&path='+path);
       location.href='saveTxtAction.do?method=importText&file='+file+'&path='+path;
  }
 function pageRefresh(){
			location.href='saveTxtAction.do?method=list';
		}
</script>
  </head>
  
  <body>
  <fieldset>
           <tr>
               <td colspan="3">
                          
                          <input type="file"  name="file" id="t" onchange="test(this,'txt');"/></font>
                         </td>
                          <td>
                          <input type="button" value="导入" icon="icon_query" onclick="sub()">
                   </td>
           </tr>
         </br>
              
           

 
  </fieldset>
  </body>
</html>
