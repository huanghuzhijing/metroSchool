<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>
<script type="text/javascript">
	$(document).ready(function(){
		$("span[id^='module_']").addClass("showmodule");
		//树的展开收缩
		$("#btn_openAll").click(function(){
			$("span[id^='module_']").removeClass("closemodule");
			$("span[id^='module_']").addClass("showmodule");
			$("div[id^='submodule_']").show();
		});
		//
		$("#btn_closeAll").click(function(){ 
			$("span[id^='module_']").removeClass("showmodule");
			$("span[id^='module_']").addClass("closemodule");
			$("div[id^='submodule_']").hide();
		});
		//
		$(".spanModuleFirst").click(function(){
			if($(this).hasClass("showmodule")){
				$(this).removeClass("showmodule");
				$(this).addClass("closemodule");
				$("div[id^='submodule_menu_"+$(this).attr("paramFirstId")+"_']").hide();
				//$("div[id^='submodule_"+$(this).attr("paramFirstId")+"_']").hide();
			}else{
				$(this).removeClass("closemodule");
				$(this).addClass("showmodule");
				$("div[id^='submodule_menu_"+$(this).attr("paramFirstId")+"_']").show();
				//$("div[id^='submodule_"+$(this).attr("paramFirstId")+"_']").show();
			}
		});
		//
		$(".spanModuleSecond").click(function(){
			if($(this).hasClass("showmodule")){
				$(this).removeClass("showmodule");
				$(this).addClass("closemodule");
				$("div[id^='submodule_"+$(this).attr("paramFirstId")+"_"+$(this).attr("paramSecondId")+"']").hide();
			}else{
				$(this).removeClass("closemodule");
				$(this).addClass("showmodule");
				$("div[id^='submodule_"+$(this).attr("paramFirstId")+"_"+$(this).attr("paramSecondId")+"']").show();
			}
		});
		//模块的选择
		$("#cbox_module_all").click(function(){
			if(this.checked==true){
				$("input[id^='cbox_module_']").attr("checked","checked");
			}else{
				$("input[id^='cbox_module_']").attr("checked","");
			}
		});
		//
		$(".cboxModuleFirst").click(function(){
			if(this.checked==true){
				$("input[id^='cbox_module_"+$(this).attr("paramFirstId")+"_']").attr("checked","checked");
			}else{
				$("input[id^='cbox_module_"+$(this).attr("paramFirstId")+"_']").attr("checked","");
				$("input[id^='cbox_competence_"+$(this).attr("paramFirstId")+"_']").attr("checked","");
			}
		});
		//
		$(".cboxModuleSecond").click(function(){
			if(this.checked==true){
				$("input[id^='cbox_module_"+$(this).attr("paramFirstId")+"_"+$(this).attr("paramSecondId")+"_']").attr("checked","checked");
			}else{
				$("input[id^='cbox_module_"+$(this).attr("paramFirstId")+"_"+$(this).attr("paramSecondId")+"_']").attr("checked","");
				$("input[id^='cbox_competence_"+$(this).attr("paramFirstId")+"_"+$(this).attr("paramSecondId")+"_']").attr("checked","");
			}
		});
		//
		$(".cboxModuleThird").click(function(){
			if(this.checked!=true){
				$("input[id^='cbox_competence_"+$(this).attr("paramFirstId")+"_"+$(this).attr("paramSecondId")+"_"+$(this).attr("paramThirdId")+"_']").attr("checked","");
			}
		});
		//权限的选择
		$("#cbox_competence_all").click(function(){ 
			if(this.checked==true){
				$("input[id^='cbox_competence_']").attr("checked","checked");
				$("input[id^='cbox_module_']").attr("checked","checked");
			}else{
				$("input[id^='cbox_competence_']").attr("checked","");
			}
		});
		//
		$(".cboxCompetenceFirst").click(function(){
			if(this.checked==true){
				$("input[id^='cbox_competence_"+$(this).attr("paramFirstId")+"_']").attr("checked","checked");
				$("input[id^='cbox_module_"+$(this).attr("paramFirstId")+"_']").attr("checked","checked");
			}else{
				$("input[id^='cbox_competence_"+$(this).attr("paramFirstId")+"_']").attr("checked","");
			}
		});
		//
		$(".cboxCompetenceSecond").click(function(){
			if(this.checked==true){
				$("input[id^='cbox_competence_"+$(this).attr("paramFirstId")+"_"+$(this).attr("paramSecondId")+"_']").attr("checked","checked");
				$("input[id^='cbox_module_"+$(this).attr("paramFirstId")+"_"+$(this).attr("paramSecondId")+"_']").attr("checked","checked");
			}else{
				$("input[id^='cbox_competence_"+$(this).attr("paramFirstId")+"_"+$(this).attr("paramSecondId")+"_']").attr("checked","");
			}
		});
		//
		$(".cboxCompetenceThird").click(function(){
			if(this.checked==true){
				$("#cbox_module_"+$(this).attr("paramFirstId")+"_"+$(this).attr("paramSecondId")+"_"+$(this).attr("paramThirdId")).attr("checked","checked");
			}
		});
		//
		
		
	});
</script>
<style type="text/css">
	fieldset{
		margin:10;
	}
	legend{
		cursor:hand;
	}
	table{
		width:100%;
		align:center; 
		border:0; 
		cellpadding:2; 
		cellspacing:0;	
	}
	.showmodule{
		cursor:hand;
		font-size:13px;
		width: 158px;
		background:url( ${ctx}/scripts/dtree/img/nolines_minus.gif) no-repeat;
		padding-left:20px;
		height:20px;
		line-height:18px;
	}
	.closemodule{
		cursor:hand;
		font-size:13px;
		width: 158px;
		background:url( ${ctx}/scripts/dtree/img/nolines_plus.gif) no-repeat;
		padding-left:20px;
		height:20px;
		line-height:18px;
	}
	.divSecond{
		margin-left:30px;
	color:red;
	}
	.divFirst{
	color:blue;
	}
</style>
<fieldset style="text-align: left">
	<legend>新系统角色权限信息</legend>
	<div>
		<input id="btn_openAll" type="button" value="全部展开" class="button1">&nbsp;&nbsp;
		<input id="btn_closeAll" type="button" value="全部折叠" class="button1">&nbsp;&nbsp;
		<input id="cbox_module_all" type="checkbox" >全选模块&nbsp;
		<input id="cbox_competence_all" type="checkbox" >全选权限&nbsp;
	</div>
	<br/>
	
	<input type="hidden" id="roleString" />
	<input type="hidden" id="roleId" value="${param.f_rid}" />
	
	<c:forEach var="sysModuleInfoFirst" items="${sysModuleInfoFirsts}">
		<c:set value="${sysModuleInfoFirst.f_mid}" var="sysModuleInfoFirst_id"></c:set>
		<div class="divFirst">
			<span id="module_${sysModuleInfoFirst_id}" class="spanModuleFirst" paramFirstId="${sysModuleInfoFirst_id}">
				  <b>${sysModuleInfoFirst.f_mname}</b>
			</span>
			<span id="moduleControl_${sysModuleInfoFirst_id}" >
				<input id="cbox_module_${sysModuleInfoFirst_id}" type="checkbox" class="cboxModuleFirst" 
				paramFirstId="${sysModuleInfoFirst_id}">模块全选
				<input id="cbox_competence_${sysModuleInfoFirst_id}" type="checkbox" class="cboxCompetenceFirst"
				paramFirstId="${sysModuleInfoFirst_id}">权限全选
			</span>
		</div>
		
		<c:forEach var="sysModuleInfoSecond" items="${sysModuleInfoSeconds}">
			<c:if test="${sysModuleInfoFirst_id==sysModuleInfoSecond.f_parentid}">
			<c:set value="${sysModuleInfoSecond.f_mid}" var="sysModuleInfoSecond_id"></c:set>
			<div id="submodule_menu_${sysModuleInfoFirst_id}_${sysModuleInfoSecond_id}" class="divSecond" >
				<span id="module_${sysModuleInfoFirst_id}_${sysModuleInfoSecond_id}" class="spanModuleSecond"  
							paramFirstId="${sysModuleInfoFirst_id}" paramSecondId="${sysModuleInfoSecond_id}">
					 <b>${sysModuleInfoSecond.f_mname}</b>
				</span>
				<span id="moduleControl_${sysModuleInfoSecond_id}">
					<input id="cbox_module_${sysModuleInfoFirst_id}_${sysModuleInfoSecond_id}" 
						   type="checkbox" class="cboxModuleSecond" 
						   paramFirstId="${sysModuleInfoFirst_id}" paramSecondId="${sysModuleInfoSecond_id}">模块全选
					<input id="cbox_competence_${sysModuleInfoFirst_id}_${sysModuleInfoSecond_id}" 
					       type="checkbox" class="cboxCompetenceSecond"
					       paramFirstId="${sysModuleInfoFirst_id}" paramSecondId="${sysModuleInfoSecond_id}">权限全选
				</span>
			
			
				<div id="submodule_${sysModuleInfoFirst_id}_${sysModuleInfoSecond_id}" class="divThird">
			
					<table width="100%" align="center" border="0" cellpadding="2" cellspacing="0">
						<c:forEach var="sysModuleInfoThird" items="${sysModuleInfoThirds}">
					
							<c:if test="${sysModuleInfoSecond_id==sysModuleInfoThird.f_parentid}">
							<c:set value="${sysModuleInfoThird.f_mid}" var="sysModuleInfoThird_id"></c:set>
							<tr>
							<td width="10%" valign="top">&nbsp;</td>
							<td width="15%" valign="top">
								<c:set var="indexModule" value=",${sysModuleInfoThird.f_mid}," />
								<input id="cbox_module_${sysModuleInfoFirst_id}_${sysModuleInfoSecond_id}_${sysModuleInfoThird_id}"
									   name="hasModuleLimits" value="${sysModuleInfoThird.f_mid}" 
									   type="checkbox" class="cboxModuleThird"
									   paramFirstId="${sysModuleInfoFirst_id}" paramSecondId="${sysModuleInfoSecond_id}" 
									   paramThirdId="${sysModuleInfoThird_id}"
								       <c:if test="${fn:contains(sysRoleModules,indexModule)==true}">checked</c:if>  
								/>
							    ${sysModuleInfoThird.f_mname}&nbsp;
							    <input name="modlimits" type="checkbox" value="${sysSubModuleinfo.f_mid}" checked="checked" style="display:none"/>
							</td>
							<td width="75%">
								<c:forEach items="${sysModuleInfoThird.sysModuleOperations}" var="sysModuleOperation">
									<c:set value="${sysModuleOperation.f_mmid}" var="sysModuleOperation_id"></c:set>
									<c:set var="indexCmd" value=",${sysModuleOperation.f_mmid}," />
									<input id="cbox_competence_${sysModuleInfoFirst_id}_${sysModuleInfoSecond_id}_${sysModuleInfoThird_id}_${sysModuleOperation_id}" 
										   name="hasCompetenceLimits" value="${sysModuleInfoThird.f_mid},${sysModuleOperation.f_mmid}"
									       type="checkbox" class="cboxCompetenceThird"
									       paramFirstId="${sysModuleInfoFirst_id}" paramSecondId="${sysModuleInfoSecond_id}" 
									       paramThirdId="${sysModuleInfoThird_id}" paramOperationId="${sysModuleOperation_id}"
										   <c:if test="${fn:contains(sysRoleCmds,indexCmd)==true}">checked</c:if> 
									/>
									${sysModuleOperation.f_mname}&nbsp;
								</c:forEach>
							</td>
							</tr>
							</c:if>
						</c:forEach>
					</table>
				</div>
				
			</div>
			</c:if>
		</c:forEach>	
	</c:forEach>
</fieldset>
