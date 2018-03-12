//加载时控制
$(document).ready(function(){
	var ctx=location.href;
	ctx=ctx.substr(0,ctx.lastIndexOf("/"));
    //上传代码 
    $("#flex_fileupload").uploadify({ 
          'uploader'       : ctx+'/scripts/uploadify/uploadify.swf',
          'script'         : 'servlet/UploadFY', 
          'cancelImg'      : ctx+'/scripts/uploadify/cancel.png', 
          'fileDataName'   : 'flex_fileupload', 
          'auto'           : true, 
          'folder'    	 : '/upload',  
          'multi'          : true,  
          'buttonText'     : 'Browse', 
          'simUploadLimit' : 3, 
          'sizeLimit'      : 502309019, 
          'queueSizeLimit' : 3, 
          'fileDesc'       : '支持格式:doc/xls/pdf/dwg/jpg.',  
          'fileExt'        : '*.doc;*.xls;*.pdf;*.dwg;*.jpg',   
      	   onComplete: function (event, queueID, fileObj, response, data) {
      	   		var strs=response.split("@@");
      	   		alert(123);
      	   		 
      	   		$("[name='file_Name']").val(strs[0]);
      	   		$("[name='file_Addr']").val(strs[1]);
      	   		$("[name='file_Type']").val(strs[2]);
      	   		$("[name='file_Size']").val(strs[3]);
		   }, 
		   onError: function(event, queueID, fileObj) { 
       			alert("文件:" + fileObj.name + "上传失败"); 
 		   },
 		   onCancel: function(event, queueID, fileObj){ 
 				alert("取消了" + fileObj.name); 
 		   } 
      });
      //
});
