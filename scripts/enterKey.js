//回车键替换TAB键
jQuery(document).ready(function(){
$(".showText,.inputText,select").keypress(function (e) {
			var keyCode = e.keyCode ? e.keyCode : e.which ? e.which : e.charCode;
			if(jQuery(this).hasClass("icon_query")){
				document.forms[0].submit() ;
			}else{
			    if (keyCode == 13)
			       {var i;
			          for (i = 0; i < this.form.elements.length; i++)
			          {
			            if (this == this.form.elements[i]) break;
			          }
			          var flag = true ;
			          i = (i + 1) % this.form.elements.length;
			          while(flag){
				          if(jQuery(this.form.elements[i]).attr("type")== "hidden"){
				          	  i += 1 ;
				          }else{
				          	  flag = false ;
				          }
			          }
			          this.form.elements[i].focus();
			          return false;
			        }else{ 
						return true;
					}
			}
	     });	 
})


function setDefFocus(object){
	var i;
    for (i = 0; i < object.form.elements.length; i++)
    {
      if (object == object.form.elements[i]) break;
    }
    var flag = true ;
    i = (i + 1) % object.form.elements.length;
    while(flag){
	    if(jQuery(object.form.elements[i]).attr("type")== "hidden"){
	    	  i += 1 ;
	    }else{
	    	  flag = false ;
	    }
    }
    object.form.elements[i].focus();
    return false;
}
