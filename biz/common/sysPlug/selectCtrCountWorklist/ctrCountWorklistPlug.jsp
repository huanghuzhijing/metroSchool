<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<ex:bundle />
<script type="text/javascript">
	//加载
	$(document).ready(function(){
			//
			$("#plug_selectCtrCountWorklist").click(function(){
					var seg_id=$("#seg_id").val();
					var worklist_id=$("#worklist_id").val();
					if("${listFlag}"=='1'){
						seg_id=$("#qseg_id").val();
						worklist_id=$("#qworklist_id").val();
					}
					if(seg_id!=""){
						var url ='contentSelectAction.do?method=selectCtrCountWorklist&queryCtrCountWorklistType=${queryCtrCountWorklistType}&oper_id='+worklist_id+'&qsegId='+seg_id;
							art.dialog({id:'commonDialog1',title:'合同清单', iframe:url, width:'800', height:'400'}).close(function(){
								if($("#plug_ctrCountWorklistId").val()!=""){
									setCtrCountWorklistParamValue($("#plug_ctrCountWorklistId").val(),$("#plug_cwlName").val(),$("#plug_totalSum").val());
								}
						});
					}else{
						alert("请选择标段！");
					}
			}); 
			//
	});
</script>
	<input id="plug_selectCtrCountWorklist" value="选择" type="button"  icon="icon_selectInfo"/>
	<div style="display: none;">
		<input id="plug_ctrCountWorklistId" type="text" />
	    <input id="plug_cwlName" type="text" />
	    <input id="plug_totalSum" type="text" />
	</div>



	



