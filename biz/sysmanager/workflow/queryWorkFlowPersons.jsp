<%@ include file="/commons/taglibs.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head><%@ include file="/commons/meta.jsp"%>
  <title></title>
	<script type="text/javascript">
		$(document).ready(function(){
			var peopleids=parent.$("#peopleids").val();
			var peopleidNames=parent.$("#peopleidNames").val(); 
			//alert(parent.$("#peopleidNames").val());
			//$.each( $(".cbox_select"), function(i, obj){
			//	if(peopleids.indexOf(","+$(this).val()+",")>-1){
			//		obj.checked=true;
			//	}
			//});
			$("#btn_save").click(function(){
				peopleids="";
				peopleidNames="";
				$.each( $(".cbox_select"), function(i, obj){
					if(obj.checked==true){
						if(peopleids==""){
							peopleids=","+$(this).val()+",";
							peopleidNames=","+$(this).attr("paramName")+",";
						}else{
							peopleids+=$(this).val()+",";
							peopleidNames+=$(this).attr("paramName")+",";
						}
					}
				});
					parent.$("#peopleids").val(peopleids);
					parent.$("#peopleidNames").val(peopleidNames);
					parent.art.dialog({id:'commonDialog1'}).close();
			});
			//
			$("#btn_close").click(function(){
				parent.art.dialog({id:'commonDialog1'}).close();
			}); 
			//
			      //全选
	       $("#btn_allSelect").click(function(){
	       	 var ids = "" ;
	       		 $("[name='select_id']").attr("checked","checked") ;
	       });
	        //全不选
	       $("#btn_notSelect").click(function(){
	       	 $("[name='select_id']").attr("checked","") ;
	       });
		});
	</script>
	</head>
	
	<body>
			<div class="listButtonDiv">
				<input type="button" id="btn_allSelect"   icon="icon_allSelect"              value="全  选"/>
	            <input type="button" id="btn_notSelect"     icon="icon_notSelect"         value="全不选"/>
			</div>
	<form action="oscurrentstepAction.do" method="post">
	<input id="oscurrentstepid" name="oscurrentstepid" type="hidden" value="${param.oscurrentstepid}" />
	<table width="100%" border="0" cellpadding="0" cellspacing="0">
		<tr>
			<td valign="top">
			<ec:table sortable="false" showPagination="false" items="selectpeoples" var="sysoperrole">
		    	<ec:row>
				 <ec:column property="rowcount" cell="rowCount" sortable="false" title="序号" width="10%"/>
				<ec:column property="null" title="选择" width="8%">
					<input value="${sysoperrole.id}" name="select_id" type="checkbox" class="cbox_select" paramName="${sysoperrole.employeeid.empname}">
				</ec:column>
				 <ec:column property="employeeid.empname" title="姓名" width="10%"/>
				 <ec:column property="deptid" title="部门" width="60%" sortable="false">
					 <ex:orgDisplay id="${sysoperrole.employeeid.organid}"/>
				</ec:column> 
				</ec:row>
		    </ec:table>
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<input id="btn_save" type="button"  icon="icon_save"  value="保  存"  />
			<input id="btn_close" type="button"  icon="icon_close"  value="关  闭"  />
			</td>
		</tr>
	</table>
	</form>
	</body>
</html>
