<%@ page contentType="text/html;charset=UTF-8" %>
<style>
   .hidden{
     display:none;
   }
</style>
<script type="text/javascript">
function commenViewUrl(url){
    location.href=url+'&id='+$F("oper_id");
}
function commenEditUrl(url){
    location.href=url+'&id='+$F("oper_id");
}
function commenDelUrl(url){
	if(window.confirm("您确定删除？"))
	{
	    location.href=url+'&id='+$F("oper_id");
	}

}
     jQuery(document).ready(function(){
        //按钮控制函数
        jQuery("[name='select_id']").click(function(){
        var operid = $("input[type=radio][name='select_id'][checked]").val();
        var sels = jQuery("[name='select_id']");
        if($("input[type=radio][name='select_id'][checked]").size()!=0){
               $("#btn_edit").show();
               $("#btn_view").show();
               $("#btn_delete").show();
        }else{
               $("#btn_edit").hide();
               $("#btn_view").hide();
               $("#btn_delete").hide();
        }

        });
       //增加、详细、修改
       jQuery(".btn_oper").click(function(){
           location.href=$(this).attr("url");
       })
       //删除
       jQuery(".btn_operDel").click(function(){
		   if(window.confirm("您确定删除？"))
			{
			    location.href=$(this).attr("url");
			}
       })
     });
</script>
<div class="comDiv">
   <div align="right" class="commondDiv">
	<input type="hidden" id="oper_id">
	<input type="button" id="btn_create"   class="button1 btn_oper"           url="workFlowAction.do?method=beforcreate" value="${texts['button.new']}"/>
	<input type="button" id="btn_view"     class="button1 hidden btn_oper"    url="workFlowAction.do?method=view"        value="${texts['button.detail']}"/>
	<input type="button" id="btn_edit"     class="button1 hidden btn_oper"    url="workFlowAction.do?method=edit"        value="${texts['button.edit']}"/>
	<input type="button" id="btn_delete"   class="button1 hidden btn_operDel" url="workFlowAction.do?method=delete"      value="${texts['button.delete']}"/>
   </div>
</div>