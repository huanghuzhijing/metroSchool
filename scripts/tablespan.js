
jQuery.fn.rowspan = function(colIdx) { 
	return this.each(function(){
		var that;
		jQuery('tr', this).each(function(row) { 
			jQuery('td:eq('+colIdx+')', this).filter(':visible').each(function(col) {
				if (that!=null && jQuery(this).html() == jQuery(that).html()) {  
					rowspan = jQuery(that).attr("rowSpan"); 
					if (rowspan == undefined) { 
						jQuery(that).attr("rowSpan",1);
						rowspan = jQuery(that).attr("rowSpan"); 
					}
					rowspan = Number(rowspan)+1;
					jQuery(that).attr("rowSpan",rowspan);
					jQuery(this).hide(); 
				}else{ 
					that = this;
				}
		   }); 
		});
	});
}

jQuery.fn.colspan = function(rowIdx){
	return this.each(function(){
		var that;
		jQuery('tr', this).filter(":eq("+rowIdx+")").each(function(row){  
			jQuery(this).find('td').filter(':visible').each(function(col) {
				if (that!=null && jQuery(this).html() == jQuery(that).html()) {
					
					colspan = jQuery(that).attr("colSpan"); 
					if (colspan == undefined) {  
						jQuery(that).attr("colSpan",1); 
						colspan = jQuery(that).attr("colSpan"); 
					} 
					colspan = Number(colspan)+1;
					jQuery(that).attr("colSpan",colspan);
					jQuery(this).hide(); 
				}
				else {
					that = this;
				}
			});
		});
 	});
}

