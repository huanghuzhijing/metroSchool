<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>
<ex:bundle />
		<script type="text/javascript" src="${ctx}/scripts/button/script/pico-div-button.js"></script>
	<script type="text/javascript">
	//加载
	$(document).ready(function(){
		   //参建单位员工详细
	       $(".btn_view_corpemp").click(function(){
	       		//parent.document.location = "corpEmployeeAction.do?method=view&id="+$(this).attr("paramId")+"&corpid="+$(this).attr("paramName");
	       		parent.document.location = "corpEmployeeAction.do?method=view&id="+$(this).attr("paramId")+"&corpid="+$(this).attr("paramName")+'&pageIndex='+$("input[name='ec_p']").val()+'&qcorpname='+encodeURI(encodeURI(document.getElementById("qcorpname").value))+'&qempname='+encodeURI(encodeURI(document.getElementById("qempname").value))+'&static_corptype='+document.getElementById("static_corptype").value;
	       });
	       //参建单位员工修改
	       $(".btn_edit_corpemp").click(function(){
	       		parent.document.location = "corpEmployeeAction.do?method=edit&id="+$(this).attr("paramId")+"&corpid="+$(this).attr("paramName")+'&pageIndex='+$("input[name='ec_p']").val()+'&qcorpname='+encodeURI(encodeURI(document.getElementById("qcorpname").value))+'&qempname='+encodeURI(encodeURI(document.getElementById("qempname").value))+'&static_corptype='+document.getElementById("static_corptype").value;
	       });
			//参建单位员工删除
			$(".btn_delete_corpemp").click(function(){ 
				ret = window.confirm("将删除该员工信息在用户管理，项目配置中的关联信息，确定删除？");
				if(ret){
					 $.ajax({
						   type: "POST",
						   url: 'corpEmployeeAction.do?method=delete'+'&id='+$(this).attr("paramId")+'&corpid='+$(this).attr("paramName"),		
						   success: function(msg){
						   	  alert("成功删除。");
							  $('#request').html(msg);
						   }
					});
				}
			});
	  });
	</script>
<fieldset>
		<legend>
			[参建单位员工列表]
		</legend>
		<div class="promptDiv">
		参建单位名称:<span class="keyInfoSpan"> ${corpname} </span>
		</div>				
<table class="listTable"  >
	<thead>
		<tr >
			<th width="5%" >序号</th>
				<th width="15%">人员编号</th>
				<th width="20%" >姓名</th>
				<th width="10%" >职务</th>
				<th width="10%" >性别</th>
			   	<th width="15%" >电话号码</th>				
				<th width="25%" >操作</th>
		</tr>
		</thead>
		<c:forEach items="${corpEmps}" varStatus="index" var="employee">
			<tr  id="${employee.id}">
				<td>${index.count}</td>
				<td>${employee.empcode}&nbsp;</td>
				<td>
					 ${employee.empname}&nbsp;
				</td>
				<td>${employee.empduty}&nbsp;</td>
				<td>
				 	<c:if test="${employee.sex==0}">男</c:if><c:if test="${employee.sex==1}">女</c:if>&nbsp;
				</td>	
			    <td>${employee.tel}&nbsp;</td>
				<td>
					<div >
						<input type="button" class="btn_view_corpemp" icon="icon_view" paramId="${employee.id}" paramName="${corpid}"  value="详 细"/>
				        <input type="button" class="btn_edit_corpemp" icon="icon_edit" paramId="${employee.id}" paramName="${corpid}"  value="编 辑"/>
				        <input type="button" class="btn_delete_corpemp" icon="icon_delete" paramId="${employee.id}" paramName="${corpid}" value="删 除"/>			
					</div>
				</td>
			</tr>
		</c:forEach>
	</table>
</fieldset>


