<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
<html:html>
<head>
<%@ include file="/commons/meta.jsp"%>
	<script type="text/javascript">
		$(document).ready(function(){
			$("#btn_save").click(function(){
				var lineIdTemp=jQuery("[name='lineIdTemp']").val();
				if(lineIdTemp!=''){
					parent.supCondition(lineIdTemp,'${tourDate}');
				}else{
					alert('请选择线路！');
				
				}
				
			}); 
			$("#btn_close").click(function(){ 
				//parent.pageRefresh();
				parent.art.dialog({id:'commonDialog1'}).close();
			}); 
		
		});
		
	</script>
</head>

<body >
	<html:form enctype="multipart/form-data" action="eTourConditionAction.do" method="POST">
		<fieldset >
		<legend>计划补充</legend>
					<table class="formTable" >
					    <COLGROUP>
							<COL class="tdLeftOne" />
							<COL class="tdRightOne" />
						</COLGROUP>
					 
					  <tr>
					    <td >巡视时间：<span class="noRedSpan">*</span></td>
					    <td >
							  ${tourDate}
						</td>
					</tr>
					  <tr>
					    <td> 线路名称：<span class="noRedSpan">*</span></td>
					    <td >
							<html:select property="lineIdTemp" >
									 <html:option value="">请选择</html:option>
									 <html:optionsCollection name="lineList" value="line_id" label="line_name"/>
							</html:select>
						</td>
					  </tr>
					 
					</table>
					</fieldset>
	

			<div  class="saveDiv">
				<input id="btn_save" value="下一步" type="button" icon="icon_save"/>
				<input id="btn_close" value="${texts['button.close']}" type="button"  icon="icon_close"/>
			</div>

	</html:form>
</body>
</html:html>
