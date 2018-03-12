<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
<html>
	<%@ include file="/commons/meta.jsp"%>
	<script type="text/javascript" src="${ctx}/scripts/enterKey.js" ></script>
	<script type="text/javascript">
	//加载
 	$(document).ready(function(){
 		//
	 	var ecid = '${param.ec_id}';
	 	if((ecid == ''|| ecid=='null') && ('${count}' > 0)){
	 		pullValue('${ecid}');
	 	}else{
	 		pullValue(ecid);
	 	}
 		//
 		$("[name='select_id']").click(function(){
	        var operid = $("input[type=radio][name='select_id'][checked]").val();
	        var sels = $("[name='select_id']");
	        if($("input[type=radio][name='select_id'][checked]").size()!=0){
	        	   $("#btn_addemp").show();
	               $("#btn_edit").show();
	               $("#btn_view").show();
	               $("#btn_delete").show();
	               $("#btn_imp_corp_emp").show();
	               
	        }else{
	               $("#btn_addemp").hide();
	               $("#btn_edit").hide();
	               $("#btn_view").hide();
	               $("#btn_delete").hide();
	               $("#btn_imp_corp_emp").hide();
	        }
	        toRe(operid);
        });
	       //增加
	       $("#btn_add").click(function(){
	       		var operObj = $("input[type=radio][name='select_id'][checked]");
	       		parent.document.location=$(this).attr("url");
	       });
	       //增加参建单位员工
	       $("#btn_addemp").click(function(){
	       		var operObj = $("input[type=radio][name='select_id'][checked]");
	       		var corpid = operObj.val();
	       		parent.document.location=$(this).attr("url")+"&corpid="+corpid+'&pageIndex='+$("input[name='ec_p']").val()+'&qcorpname='+encodeURI(encodeURI(document.getElementById("qcorpname").value))+'&qempname='+encodeURI(encodeURI(document.getElementById("qempname").value))+'&static_corptype=${param.static_corptype}';
	       });
	       //详细
	       $("#btn_view").click(function(){
	       		var operObj = $("input[type=radio][name='select_id'][checked]");
	       		var id = operObj.val();
	       		parent.document.location=$(this).attr("url")+"&id="+id+'&pageIndex='+$("input[name='ec_p']").val();
	       });
	       //修改
	       $("#btn_edit").click(function(){
	       		var operObj = $("input[type=radio][name='select_id'][checked]");
	       		var id = operObj.val();
	       		parent.document.location=$(this).attr("url")+"&id="+id+'&pageIndex='+$("input[name='ec_p']").val()+'&qcorpname='+encodeURI(encodeURI(document.getElementById("qcorpname").value))+'&qempname='+encodeURI(encodeURI(document.getElementById("qempname").value));
	       });         
	       //删除
	       $("#btn_delete").click(function(){
	         var operObj = $("input[type=radio][name='select_id'][checked]");
	       	 var id = operObj.val();
			   if(window.confirm("${texts['dtaq.common.delete.msg']}"))
				{
				   $.ajax({
				   type: "POST",
				   url: "${ctx}/corpAction.do?method=validateDelete",
				   data: "cId="+id,
				   success: function(msg){
				   		msg = msg.split(",");
						if(msg[0]=="haveEmp"){
							alert("该参建单位下有员工信息，移除无效");
							return;
						}
						else{
							parent.document.location="corpAction.do?method=delete&id="+msg[1];
						}
				   }
				});
			  }
	       }); 
	       //员工批量导入
	       //$("#btn_imp_corp_emp").click(function(){
	       		//var operObj = $("input[type=radio][name='select_id'][checked]");
	       		//var corpid = operObj.val();
	       		//alert("此功能暂未实现!");
	       		//parent.document.location=$(this).attr("url")+"&corpid="+corpid;
	      //});
 		});

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
					$("#btn_addemp").show();
	                $("#btn_edit").show();
	                $("#btn_view").show();
	                $("#btn_delete").show();
	                $("#btn_imp_corp_emp").show();
	                toRe(oper_id);
				}else{
					$("#btn_addemp").hide();
	                $("#btn_edit").hide();
	                $("#btn_view").hide();
	                $("#btn_delete").hide();
	                $("#btn_imp_corp_emp").hide();
				}
			}
		}


function toRe(operid){
    $.ajax({
		   type: "POST",
		   url: "${ctx}/employeeAction.do?method=listRe",	
		   data:"corpid="+operid+"&qempname="+$("[name='qempname']").val(),	
		   success: function(msg){
			  $('#request').html(msg);
		   }
		}); 	
}
</script>
	

	<body>
	<table class="queryTable" >
		<tr>
			<td class="queryTitle">
			<span >查询条件</span>
			</td>
		</tr>
		<tr>
			<td>
		<html:form action="corpAction.do?method=list" method="POST">
			<input type="hidden" value="${param.static_corptype}" name="static_corptype">
			<input type="hidden" value="${param.static_enodecode}" name="static_enodecode">
			<table class="queryContentTable">
				<tr>
					<td>
						参建单位名称：&nbsp;&nbsp;
					</td>
					<td>
						<html:text property="qcorpname" size="20" styleClass="inputText"/>
					</td>
					<td>
						员工姓名：&nbsp;&nbsp;
					</td>
					<td>
						<html:text property="qempname" size="20" styleClass="inputText"/>
					</td>
					<td>
					   <input type="submit" id="btn_query" icon="icon_query" value="查 询" />
					</td>
				</tr>
			</table>
		</html:form>
		</td>
		</tr>
		</table>
		<div class="promptDiv">
            <!-- 页面第一次加载时新增不可操作，组织树下面只能有一个根节点  -->
			<c:if test="${param.static_corptype!=null && param.static_corptype!=''}">所属参建单位类型:<span class="keyInfoSpan">
			${obj.typename}</span>
			</c:if>
		</div>
			<div class="promptDiv">
				<c:if test="${param.static_corptype == null || param.static_corptype == ''}">
					<span  class="keyInfoSpan">点击左边树最底层类型节点增加参建单位</span>
				</c:if>
				<c:if test="${param.static_corptype!=null && param.static_corptype!=''}">
					<input type="button" id="btn_add"  icon="icon_add"  url="corpAction.do?method=create&tmpnodecode=${param.tmpnodecode}&static_corptype=${param.static_corptype}" value="${texts['button.new']}"/>
				</c:if>	
				<input type="button" id="btn_addemp"  icon="icon_add"    url="corpEmployeeAction.do?method=create" value="参建单位员工新增"/>
				<input type="button" id="btn_view"     icon="icon_view"     url="corpAction.do?method=view"        value="${texts['button.detail']}"/>
				<input type="button" id="btn_edit"      icon="icon_edit"     url="corpAction.do?method=edit&static_corptype=${param.static_corptype}"        value="${texts['button.edit']}"/>
				<input type="button" id="btn_delete"    icon="icon_delete"    url="corpAction.do?method=delete"      value="${texts['button.delete']}"/>
			<!--<input type="button" id="btn_imp_corp_emp"  class="button1 hidden "  url="corpEmployeeAction.do?method=import" value="员工批量导入"/>-->		
			</div>
	
					<ec:table items="corps" var="corp"
						action="corpAction.do?method=list" title=""  locale="zh_CN"
						sortable="false" rowsDisplayed="10" imagePath="${ctx}/styles/extremecomponents/images/*.gif"
						retrieveRowsCallback="limit" filterRowsCallback="limit" sortRowsCallback="limit">
						<ec:row highlightRow="true" onclick="pullValue('${corp.id}');"
							ondblclick="parent.document.location='corpAction.do?method=view&id=${corp.id}'">
							<ec:column property="rowcount" cell="rowCount" sortable="false" title="序号" />
							<ec:column property="null" sortable="false" title="选择" >
								<input type="radio" name="select_id" value="${corp.id}" />
							</ec:column>
							<ec:column property="orderno" title="排序号" />
							<ec:column property="corpcode" title="参建单位编号" />
							<ec:column property="corpname" title="参建单位名称" />
							<ec:column property="organcode" title="组织机构代码" />
							<ec:column property="chargeperson" title="企业法人" />
							<ec:column property="recorddate" title="创建日期" >
								<fmt:formatDate value="${corp.recorddate}" pattern="yyyy-MM-dd"/>
							</ec:column>
						</ec:row>
					</ec:table>
		<div id="request" class="div_iconShow"></div>
	</body>
</html>
