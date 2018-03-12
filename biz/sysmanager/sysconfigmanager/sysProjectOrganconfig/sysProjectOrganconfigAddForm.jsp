<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
<html:html>
<head>
	<script type="text/javascript">
		$(document).ready(function(){
			//
			$("#btn_save").click(function(){
				var errors = "";
				var focus= "";
				//项目名称
				var prjid = $("input[name='prjid']").val();
				if(prjid == ""){
					errors += "项目名称 为必填项!\n";
				  	focus += "prjid,";
				}
				//项目周期
				var periodsid = $("input[name='periodsid']").val();
				if(periodsid == ""){
					errors += "项目周期 为必填项!\n";
				  	focus += "periodsid,";
				}
				//模块名称
				var moduleid = $("input[name='moduleid']").val();
				if(moduleid == ""){
					errors += "模块名称 为必填项!\n";
				  	focus += "moduleid,";
				}
				//员工
				var empIds = $("input[name='empIds']").val();
				if(empIds == ""){
					errors += "员工 为必填项!\n";
				  	focus += "empid,";
				}
				if(errors != ""){
					alert(errors);
					var focusStr = focus.substring(0,focus.indexOf(","));
					$("input[name='"+focusStr+"']").focus();
					return false;
				}
				$("#btn_save").attr("disabled","disabled");
				document.forms[0].submit();
			});  
			//
			$("#btn_back").click(function(){ 
				history.back(-1);
			}); 
			//
			$("#btn_selectPrj").click(function(){
				var url = 'sysProjectOrganconfigAction.do?method=selectPrjForPrjOrganCfg';
				art.dialog({id:'commonDialog1',title:'项目信息', iframe:url, width:'600', height:'400',top:'30'});
			}); 
			//
			$("#btn_selectEmp").click(function(){
				$("#empIds").val($("#tempEmpIds").val());
				$("#empNames").val($("#tempEmpNames").val()); 
				var url = 'sysProjectOrganconfigAction.do?method=selectEmpForPrjOrganCfg';
				art.dialog({id:'commonDialog1',title:'员工信息', iframe:url, width:'600', height:'400',top:'30'}).close(function(){
					$("#tempEmpIds").val($("#empIds").val());
					$("#tempEmpNames").val($("#empNames").val());
				});
			}); 
			//
			$("#btn_selectPrjPeriods").click(function(){ 
				var url = 'sysProjectOrganconfigAction.do?method=selectPrjPeriodsForPrjOrganCfg';
				art.dialog({id:'commonDialog1',title:'项目周期模块信息', iframe:url, width:'600', height:'400',top:'30'});
			}); 
			//
		});
	</script>
</head>
<content tag="heading">
	员工项目配置
</content>
<body >
	<html:form enctype="multipart/form-data" action="sysProjectOrganconfigAction.do" method="POST">
		<input type="hidden" name="method" value="save">
		<html:hidden property="id" />
<fieldset >
		<legend>员工项目配置-新增</legend>
					<table class="formTable" >
					    <COLGROUP>
							<COL class="tdLeftOne" />
							<COL class="tdRightOne" />
						</COLGROUP>
					  <tr>
					    <td >项目名称：<span class="redSpan">*</span></td>
					    <td >
					    	<input id="prjid" name="prjid" type="hidden">
					    	<input id="prjname" type="text" class="showText"  size="48">
							<input id="btn_selectPrj" value="项目选择" type="button"  icon="icon_selectInfo"/>
						</td>
					  </tr>
					  <tr>
					    <td >项目周期：<span class="redSpan">*</span></td>
					    <td >
					    	<html:hidden property="periodsid" />
							<html:text property="periodsname" size="70" styleClass="showText"/>
							<input id="btn_selectPrjPeriods" value="项目周期选择" type="button"  icon="icon_selectInfo"/>
						</td>
					  </tr>
					  <tr>
					    <td >模块名称：<span class="redSpan">*</span></td>
					    <td ><html:hidden property="moduleid" />
							<html:text property="modulename"  size="70" styleClass="showText" />
						</td>
					  </tr>
					  <tr>
					    <td >员  工：<span class="redSpan">*</span></td>
					    <td >
					    	<input id="tempEmpIds" type="hidden">
					    	<input id="tempEmpNames" type="hidden">
					    	<input id="empIds" name="empIds" type="hidden" >
					    	<input id="empNames" type="text" class="showText"  size="70">
							<input id="btn_selectEmp" value="人员选择" type="button"  icon="icon_selectInfo"/>
						</td>
			</tr>
		</table>
		</fieldset>
		<div class="inputInfoDiv">
			<span class="inputShowLeft">填&nbsp;&nbsp;报&nbsp;&nbsp;人：${userinfo.empName} </span>
			<span class="inputShowRight"> 填报日期：${now_date}</span>
		</div>
			<div class="saveDiv">
				<input id="btn_save" value="${texts['button.save']}" type="button" icon="icon_save"/>
				<input id="btn_back" value="${texts['button.back']}" type="button" icon="icon_back"/>
			</div>
	</html:form>
</body>
</html:html>
