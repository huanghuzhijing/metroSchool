<%@ page contentType="text/html;charset=UTF-8"%>
<script type="text/javascript" src="${ctx}/scripts/TableTree/TableTree.js"></script>
<link rel="StyleSheet" href="${ctx}/scripts/TableTree/css/tabletree.css" type="text/css" />

<style>
<!--
/***************界面风格设置****************/
ul#type{ margin:0px; padding:0; height:100%}
	ul#type li{
		float:left;width:246px;;margin:8px; border:1px solid #999999; text-align:center; height:250px;background-color:#dbdbdb
	}
	ul#type li img{ width:230px; height:180px;border:1px solid #999999; margin-top:8px;}
	.div_radio{width:230px; height:40px;border:1px solid #999999; background-color:white; line-height:40px; margin:8px;}
-->
</style>

<script type="text/javascript">
	var gridTree;	
	tree_path="${ctx}";
	//加载
	$(document).ready(function(){
	    $(".btn_save").click(function(){
		      	//var ids='';
				//$("input:checked[name=nodecheck]").each(function(){
				//	ids+=$(this).val()+";";
				//});
				//document.getElementById("modids").value = ids;
				sub();
		    });
		    
	   
			    $("#btn_allSelect").click(function(){
			  		select_all();
			  	});
		  
			  $("#btn_notSelect").click(function(){
			  		select_none();
			  });
	}); 
	//
	
	//
	function sub(){
	      
	            $(".btn_save").addClass("z-btn-dsb");
	            $(".btn_save").unbind();
				document.forms[0].submit();
	}
	//
	
</script>
<html:form  action="personalInfoAction.do"  method="POST"   enctype="multipart/form-data">
		<input type="hidden" name="method" value="savePLS"/>
		<html:hidden property="id" value="${pls.id}"/>
		<table width="100%">
			<tr>
				<td>
						<div align="center" style="width:530px; margin:0px auto;">
								<ul id="type" >
							    	<li><img  src="${ctx}/styles/images_blue/demo_blue.jpg" />
							        	<div class="div_radio">
							        	
							        	<input type="radio" name="mainset" id="mainset" value="1" <c:if test="${pls.mainset==1||pls==null}">checked="checked"</c:if> /> <label for="blue">蓝色</label>
							            </div>
							        </li>
							        <li><img   src="${ctx}/styles/images_red/demo_red.jpg" />
							        	<div class="div_radio">
							            	 	<input type="radio" name="mainset" id="mainset" value="2" <c:if test="${pls.mainset==2}">checked="checked"</c:if>/><label for="red">红色</label>
							            </div>
							        </li>
							    </ul>
						    </div>
						<br/>
				</td>
			</tr>
			<tr>
				<td>
					<div  class="saveDiv">
						<input type="button" icon="icon_save" class="btn_save" value="${texts['button.save']}" /> 
					</div>
				</td>
			</tr>
		</table>

</html:form>
