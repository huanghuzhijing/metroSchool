<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
<script type="text/javascript">
	//加载
	$(document).ready(function(){
			//
			$("#plug_selectSuperCorp").click(function(){
			     var corpName='监理单位信息';
			    if('${bidWinCorpType}'==''){
			  	  corpName='监理单位信息'
			    }
				var url ='contentSelectAction.do?method=selectSuperCorp&queryCorpType=${queryCorpType}';
				art.dialog({id:'commonDialog1',title:corpName, iframe:url, width:'700', height:'400',top:'0'}).close(function(){
				  	//
				  	setParamSuperValue($("#plug_superCorpId").val(),$("#plug_superCorpType").val(),$("#plug_superCorpName").val());
				});	
			}); 
			//
	});
</script>
	<input id="plug_selectSuperCorp" value="监理单位选择" type="button"  icon="icon_selectInfo"/>
	<div style="display: none;">
		<input id="plug_superCorpId" type="text" >
	    <input id="plug_superCorpType" type="text" >
	    <input id="plug_superCorpName" type="text" >
	</div>



	



