<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>
<ex:bundle />
<script type="text/javascript" src="${ctx}/scripts/button/script/pico-div-button.js"></script>
<script type="text/javascript">

$(document).ready(function(){
	
	 //详细
       $(".btn_view_dictData").click(function(){
       		var url = "dataDictRecordAction.do?method=view&data_id="+$(this).attr("paramId")+"&dicid="+$(this).attr("paramName")+'&ec_p='+$("input[name='ec_p']").val()+"&ec_id="+$(this).attr("paramName")+"&ec_crd="+$("input[name='ec_crd']").val();
       		commonUrl(url);
       });
       
       //修改
       $(".btn_edit_dictData").click(function(){
       		var url = "dataDictRecordAction.do?method=edit&data_id="+$(this).attr("paramId")+"&dicid="+$(this).attr("paramName")+'&ec_p='+$("input[name='ec_p']").val()+"&ec_id="+$(this).attr("paramName")+"&ec_crd="+$("input[name='ec_crd']").val();
       		commonUrl(url);
       });
	
	//删除
	$(".btn_delete_dictData").click(function(){ 
				ret = window.confirm('${texts['dtaq.common.delete.msg']}');
				if(ret){
					 $.ajax({
						   type: "POST",
						   url: 'dataDictRecordAction.do?method=delete'+'&data_id='+$(this).attr("paramId")+'&dicid='+$(this).attr("paramName"),		
						   success: function(msg){
							  $('#request').html(msg);
						   }
					});
				}
			});
  });
  
  function commonUrl(url){
			document.forms[0].action=url;   
		    document.forms[0].submit();   
		}
</script>
<fieldset>
		<legend>
			[数据字典项信息列表]
		</legend>
			<div class="promptDiv" >
					所属数据字典:<span class="keyInfoSpan"> ${dataname}</span>		
			</div>
			
<table class="listTable" id="webTable" >
	<thead>
		<tr>
			<th width="5%" >序号</th>
				<th width="25%">字典项名称</th>
				<th width="10%" >字典项值</th>
				<th width="10%" >排序值</th>
				<th width="25%" >备注</th>		
				<th width="25%" >操作</th>
		</tr>
	</thead>
		<c:forEach items="${dict_Datas}" varStatus="index" var="dict_Data">
			<tr  id="d${dict_Data.dict_id}">
				<td>${index.count}&nbsp;</td>
				
				<td>${dict_Data.data_name}&nbsp;</td>
				<td>${dict_Data.data_short_name}&nbsp;</td>
				<td>${dict_Data.spell_code}&nbsp;</td>
				<td>${dict_Data.description}&nbsp;</td>
				<td>
					<div >
						<input type="button" class="btn_view_dictData" icon="icon_view" paramId="${dict_Data.data_id}" paramName="${dict_Data.dict_id}"  value="详 细"/>
				        <input type="button" class="btn_edit_dictData" icon="icon_edit" paramId="${dict_Data.data_id}" paramName="${dict_Data.dict_id}"  value="编 辑"/>
				        <input type="button" class="btn_delete_dictData" icon="icon_delete" paramId="${dict_Data.data_id}" paramName="${dict_Data.dict_id}"  value="删 除"/>			
					</div>
				</td>
			</tr>
		</c:forEach>
	</table>
</fieldset>


