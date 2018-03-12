<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
<script type="text/javascript">
	//加载
	$(document).ready(function(){
			//
			$("#plug_selectCorp").click(function(){
			     var corpName='中标单位信息';
			    if('${bidWinCorpType}'==''){
			  	  corpName='乙方单位信息'
			    }
				var url ='contentSelectAction.do?method=selectCorp&queryCorpType=${queryCorpType}';
				art.dialog({id:'commonDialog1',title:corpName, iframe:url, width:'700', height:'400',top:'0'}).close(function(){
				  	//
				  	if($("#plug_corpId").val()!=""){
				  		setParamCorpValue($("#plug_corpId").val(),$("#plug_corpType").val(),$("#plug_corpName").val());
				  	}
				});	
			}); 
			//
	});
</script>
	<input id="plug_selectCorp" value="单位选择" type="button"  icon="icon_selectInfo"/>
	<div style="display: none;">
		<input id="plug_corpId" type="text" >
	    <input id="plug_corpType" type="text" >
	    <input id="plug_corpName" type="text" >
	</div>



	



