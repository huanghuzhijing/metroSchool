
/***********************************************qm begin****************************************************************/
//
function xheditorInsert(){
	var count = 0;
	for(i=0;i<9;i++){	
		var tmp_tr = document.getElementById("tr"+(i+1));
		if(tmp_tr.style.display!='none'){
			count+=1;
		}
	}
	var hisfname = document.getElementById("optionValue"+count);
	//
	if( hisfname && (hisfname.value=='')){
		//alert('完成选项值才能添加下一个！');
	}else{
	}
	if(count == 10){
		alert("上传附件不能超过10个");
	}else{
		var file = document.getElementById("tr"+(count+1));
		file.style.display='block';
	}
	$("#selectCount").val(count+1);
}
//
function xheditorDeletetr(theValue){
  $("#tr"+theValue).hide();
  $("#optionValue"+theValue).val("");
  $("#tempoptionContent"+theValue).val("");
  //var inputFile='<input onchange="upload_getFileName('+theValue+',this);" id="thefiles'+theValue+'" size="30" class="inputText" type="file" name="thefile'+theValue+'">';
  //$("#upload_span_"+theValue).html(inputFile);
  var selectCount =$("#selectCount").val();
  $("#selectCount").val(selectCount-1);
}
//
function insertXheditorUpload(msg) {
}

/***********************************************qm end****************************************************************/
