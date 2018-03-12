//附件
function ajaxFileUpload(){
	 var annexlist='';
	 var arrload=document.getElementsByName('thefiles');
	 for(var i=0;i<arrload.length;i++)
	 {
	   if(arrload[i].value.length>0)
	   {
	    	if(document.getElementById('tr'+i).style.display=='block')
	     		annexlist=annexlist+arrload[i].value+',';
	   }
	 }
	 $("annexlist").value=annexlist;
	 alert(arrload[arrload.length-1].value);
}
//动态添加
function insert(){
	var count = 0;
	for(i=0;i<9;i++){	
		var tmp_tr = document.getElementById("tr"+(i+1));
		if(tmp_tr.style.display!='none'){
			count+=1;
		}
	}
	var hisfname = document.getElementById("filename"+count);
	var hisffile = document.getElementById("thefile"+count);
	//如果文件名和文件路径不对则不能添加下一个
	if(hisffile && hisfname && (hisffile.value=='' || hisfname.value=='')){
		alert('完成文件名和文件路径才能添加下一个！');
	}else{
		if(count == 10){
			alert("上传附件不能超过10个");
		}else{
			var file = document.getElementById("tr"+(count+1));
			file.style.display='block';
		}
		$("#annexcount").val(count+1);
	}
}
//动态删除
function deletetr(theValue){
  $("#tr"+theValue).hide();
  $("#filename"+theValue).val("");
  var inputFile='<input onchange="upload_getFileName('+theValue+',this);" id="thefiles'+theValue+'" size="30" class="inputText" type="file" name="thefile'+theValue+'">';
  $("#upload_span_"+theValue).html(inputFile);
  var annexcount =$("#annexcount").val();
  $("#annexcount").val(annexcount-1);
}
//删除历史
function deleteHistoryAnnex(annexid){
	var _tr=document.getElementById('historytr'+annexid);
  	_tr.style.display='none';
  	$("#deleteannex").val(annexid+","+$("#deleteannex").val());
}
//得到文件名称
function upload_getFileName(controlID,fileBox) {
	if (fileBox.value){
		 var path = fileBox.value;
		 var fileName = path.substring(path.lastIndexOf('\\')+1,path.lastIndexOf('.'));
		 document.getElementById("filename"+controlID).value = fileName;
	}
}