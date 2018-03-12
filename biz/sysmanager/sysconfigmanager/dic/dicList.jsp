<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
<html:html>
<head>
<script type="text/javascript" src="${ctx}/scripts/enterKey.js" ></script>
	<script type="text/javascript">
	//加载
 	$(document).ready(function(){
 		//
 		var ecid = '${param.ec_id}';
 		if((ecid==null || ecid == '') ){
	 		pullValue('${ec_id}');
	 	}else{
	 		pullValue('${param.ec_id}');
	 	}
 
 		$("[name='select_id']").click(function(){
        var operid = $("input[type=radio][name='select_id'][checked]").val();
        var sels = $("[name='select_id']");
        if($("input[type=radio][name='select_id'][checked]").size()!=0){
        	   $("#btn_create_dicData").show();
               $("#btn_edit").show();
               $("#btn_view").show();
               $("#btn_delete").show();       
        }else{
               $("#btn_create_dicData").hide();
               $("#btn_edit").hide();
               $("#btn_view").hide();
               $("#btn_delete").hide();
        }
        toRe(operid);
        });
       //增加
       $("#btn_add").click(function(){
       		var operObj = $("input[type=radio][name='select_id'][checked]");
       		location.href = $(this).attr("url");
       });
       //增加字典项
       $("#btn_add_dicData").click(function(){
       		var operObj = $("input[type=radio][name='select_id'][checked]");
       		var dicid = operObj.val();
       		var url = $(this).attr("url")+"&dicid="+dicid+'&ec_p='+$("input[name='ec_p']").val()+"&ec_id="+dicid+"&ec_crd="+$("input[name='ec_crd']").val();
       		commonUrl(url);
       });
        //详细
       $("#btn_view").click(function(){
       		var operObj = $("input[type=radio][name='select_id'][checked]");
       		var id = operObj.val();
       		showView(id);
       });
       //修改
       $("#btn_edit").click(function(){
       		var operObj = $("input[type=radio][name='select_id'][checked]");
       		var id = operObj.val();
       		var url = $(this).attr("url")+"&dict_id="+id+'&ec_p='+$("input[name='ec_p']").val()+"&ec_id="+id+"&ec_crd="+$("input[name='ec_crd']").val();
       		commonUrl(url);
       });         
       //删除
       $("#btn_delete").click(function(){
         var operObj = $("input[type=radio][name='select_id'][checked]");
       	 var id = operObj.val();
		   if(window.confirm("${texts['dtaq.common.delete.msg']}"))
			{
			   $.ajax({
			   type: "POST",
			   url: "${ctx}/dataDictAction.do?method=validateDelete",
			   data: "dicId="+id,
			   success: function(msg){
			   		msg = msg.split(",");
					if(msg[0]=="haveData"){
						alert("该数据字典下有字典项信息，移除无效");
						return;
					}
					else{
						location.href = "dataDictAction.do?method=delete&dict_id="+msg[1];
					}
			   }
			});
		  }
       }); 
      //
 	});
	//
	function pullValue(mutil_id){ 
			var select_count=0;
			var sels=$("input[name='select_id']");
			for(i=0;i<sels.length;i++){
				if(sels[i].value==mutil_id){
					select_count++;
					oper_id=mutil_id;
					//sels[i].checked=true;
					$("input[name='select_id'][value='"+mutil_id+"']").attr("checked","checked");
					break;
				}
			}
			if(select_count!=0){
				if(oper_id!=""){
				   $("#btn_add_dicData").show();
	               $("#btn_edit").show();
	               $("#btn_view").show();
	               $("#btn_delete").show(); 
	               toRe(oper_id);
				}else{
				   $("#btn_add_dicData").hide();
	               $("#btn_edit").hide();
	               $("#btn_view").hide();
	               $("#btn_delete").hide();
				}
			}
		}
		//
		function commonUrl(url){
			document.forms[0].action=url;   
		    document.forms[0].submit();   
		}
		//
		function toRe(operid){
		    $.ajax({
				   type: "POST",
				   url: "${ctx}/dataDictRecordAction.do?method=listRe&dicid="+operid,		
				   success: function(msg){
					  $('#request').html(msg);
				   }
				}); 	
		}
		//详细页面
		function showView(id){
	    	var url ='dataDictAction.do?method=view'+'&dict_id='+id+'&ec_p='+$("input[name='ec_p']").val()+"&ec_id="+id+"&ec_crd="+$("input[name='ec_crd']").val();
			commonUrl(url);
	  	}
	</script>
</head>
<content tag="heading">
	数据字典管理
</content>
<body >
	<table class="queryTable" >
		<tr>
			<td class="queryTitle">
				<span >&nbsp;[${texts['dtaq.common.query_field']}]&nbsp;</span>
			</td>
		</tr>
		<tr>
			<td>
				<html:form action="dataDictAction.do?method=list">
					<table class="queryContentTable">
						<tr>
							<td align="right">
								字典编码：&nbsp;&nbsp;
							</td>
							<td>
								<html:text property="qdict_code" size="20" styleClass="inputText" />
							</td>
							<td align="right">
								字典名称：&nbsp;&nbsp;
							</td>
							<td>
								<html:text property="qdict_name" size="20" styleClass="inputText" />
							</td>
							<td align="right">
								字典项名称：&nbsp;&nbsp;
							</td>
							<td>
								<html:text property="qdata_name" size="20" styleClass="inputText" />
							</td>
							<td align="right">
								描述：&nbsp;&nbsp;
							</td>
							<td>
								<html:text property="qdescription" size="20" styleClass="inputText" />
							</td>
							<td colspan="2">
								<input type="submit" id="btn_query" icon="icon_query" value="查 询" />
							</td>
						</tr>
					</table>
				</html:form>
		</td></tr></table>
			<div class="listButtonDiv">
				<input type="button" id="btn_add"   icon="icon_add"           url="dataDictAction.do?method=create"      value="${texts['button.new']}"/>
				<input type="button" id="btn_add_dicData"  icon="icon_add" url="dataDictRecordAction.do?method=create" value="字典项新增"/>
	            <input type="button" id="btn_view"    icon="icon_view"    url="dataDictAction.do?method=view"        value="${texts['button.detail']}"/>
	            <input type="button" id="btn_edit"     icon="icon_edit"    url="dataDictAction.do?method=edit"        value="${texts['button.edit']}"/>
	            <input type="button" id="btn_delete"   icon="icon_delete"    url="dataDictAction.do?method=delete"      value="${texts['button.delete']}"/>
			</div>
				<ec:table items="dataDicts" var="dataDict"
						action="dataDictAction.do?method=list" title=""  locale="zh_CN"
						sortable="false" rowsDisplayed="10" imagePath="${ctx}/styles/extremecomponents/images/*.gif"
						retrieveRowsCallback="limit" filterRowsCallback="limit" sortRowsCallback="limit">
						<ec:row highlightRow="true" onclick="pullValue('${dataDict.dict_id}');"
								ondblclick="showView('${dataDict.dict_id}');"
						>
							<ec:column property="rowcount" cell="rowCount" sortable="false" title="序号" />
							<ec:column property="null" sortable="false" title="选择" >
								<input type="radio" name="select_id" value="${dataDict.dict_id}" />
							</ec:column>
							<ec:column property="dict_code" title="字典编码" />
							<ec:column property="dict_name" title="字典名称" />
							
							<ec:column property="description" title="描述" />
						</ec:row>
					</ec:table>
				<div id="request" class="div_iconShow"></div>	
</body>
</html:html>
