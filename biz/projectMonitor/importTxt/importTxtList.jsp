<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>
<ex:bundle/>
<html>
<head>
<script type="text/javascript" src="${ctx}/scripts/dtree/dtree.js"></script>
<link rel="StyleSheet" href="${ctx}/scripts/dtree/css/dtree.css" type="text/css" />
<script type="text/javascript">
	var oper_id="";
	var file="";
	var path="";
	//加载
	$(document).ready(function(){
		//
		$("#btn_edit").hide();
		$("#btn_delete").hide();
		$("#btn_view").hide();
		$("#btn_submit").hide();
		//控制按钮
		var ec_id='${param.ec_id}';
		if('${tmpCount}'!=''){
  alert('你刚刚导入了'+'${tmpCount}'+'条数据');
  }
		if(ec_id==null||ec_id==""){
			ec_id='${ec_id}';
			
		}
		pullValue(ec_id);
	

	});
  	//设置list页面id
	function setPullValue(common_oper_id,mutil_auditStatus,select_count){
		oper_id=common_oper_id;
	}
			       	//指令码判断
	function checkCmd(){
		
	}
	
	function test(obj,filter){ 
	path=obj.value;
	file = obj.value.match(/[^\/\\]+$/gi)[0];     //文件名
	
    var rx = new RegExp('\\.(' + (filter?filter:'') + ')$','gi');
    if(filter&&file&&!file.match(rx)){
      alert("只能选择txt");
      pageRefresh();
      //重新构建input file
    }
    
  }
  function pageRefresh(){
  
			location.href='importTxtAction.do?method=list';
		}
  function sub(){
  alert('正在导入,请稍等');
       location.href='importTxtAction.do?method=importFile&file1='+file+'&path='+path;
  }
 
</script>
</head>

<body >
  <fieldset>
           <tr>
               <td colspan="3">
                          
                          <input type="file"  name="file" id="t" onchange="test(this,'txt');"/></font>
                         </td>
                          <td>
                          <input type="button" value="导入" icon="icon_query" onclick="sub()">
                   </td>
           </tr>
         </fieldset>
            
           

 
</body>
</html>