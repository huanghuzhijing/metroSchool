<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
<html:html>
<head>
		<%@ include file="/commons/meta.jsp"%>
		<script type="text/javascript">
 	 $(document).ready(function(){
	 		$("#btn_select").click(function(){ 
	 	
		 		 $("#btn_select").checked = true;
			     $("#btn_edit").checked = false;
				 location.href= "contentSelectAction.do?method=list&flag=1&type=${type}";
			});
			$("#btn_edit").click(function(){ 
		 		 $("#btn_select").checked = false;
			     $("#btn_edit").checked = true;
				 location.href= "contentSelectAction.do?method=list&flag=2&type=${type}";
			});
			 $(".btn_save").click(function(){
			      if($("#content").val()==""){
			    	alert("请填入内容！");
			    	return;
			    	}
			       $("form:first").submit();
		      });
			 $(".btn_delete").click(function(){
				 	if(window.confirm("确定删除？")){
				 	  var url =  "contentSelectAction.do?method=delete&id="+$(this).attr("paramId")+"&type="+${type};
				 	  location.href = url;
				 	}
			 });
			 $(".btn_edittd").dblclick( function () {
			   	   var inputText = $("<input type='text' class='btn_edittd' />") ;
				   inputText.val($(this).attr("paramName")) ;
				   inputText.attr("paramId",$(this).attr("paramId")) ;
				   $(this).html("") ;
				   $(this).append(inputText) ;
   				   inputText.focus();
   				   inputText.blur(function(){
   				   var parent = $(this).parent();
   				   parent.html($(this).val()) ;
   				   		$.ajax({
				   type: "POST",
				   url: "${ctx}/contentSelectAction.do?method=edittd",
				   data: "id="+$(this).attr("paramId")+"&content="+$(this).val(),
				   success: function(msg){
				   		 if(msg=="no"){ 
				   		 		alert("数据处理异常！");     
						  }else {
						
						  }
				   }
				});
   				   }) ;
    
    
     		 });
     });
    
	</script>
</head>
<body >
	<table class="queryTable" >
		<tr>
			<td>
				<input id="btn_select" type="radio"  value="1">选择
				<input id="btn_edit" type="radio"  checked="checked" value="2" >编辑
			</td>
		</tr>
	</table>
	<br/>
	<div style="margin-left: 3px">
<table class="listTable" >
   
	<thead>
		<tr >
			<th>
				序号
			</th>
			<th>
				内容
			</th>
		    <th>
				操作
			</th>
		</tr>
		</thead>
    <c:forEach items="${contentSelects}" var="contentSelect" varStatus="index">
      <tr>
       <td >${index.count}</td>
       <td paramId="${contentSelect.id}" paramName="${contentSelect.content}" class="btn_edittd">${contentSelect.content }</td>
       <td>
        <input type="button" value="删除" icon="icon_delete" class="btn_delete" paramId="${contentSelect.id}">
       </td>
      </tr>
    </c:forEach>
    	<html:form action="contentSelectAction.do?method=save&type=${type}"  	method="POST">
    <tr>
    <td>
     ${count}
    </td>
    <td>
    <input type="text" id="content" class="inputText" name="content" size="60">   
    <input type="hidden"  name ="type" value="${type}">
    </td>
    <td>
    <input type="button"  class="btn_save" icon="icon_save" value="确 定" >
    </td>
   </tr>
   </html:form>
</table>
</div>
</body>
</html:html>
