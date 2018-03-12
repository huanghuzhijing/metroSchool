/*
 * Title:
 * Description:
 * Aucthor: 曾宪斌
 * Email: zengxianbin@gmail.com
 * Create Date:2009-06-18
 * Copyright 2009
 */ 
(function($){
	$.fn.btn = function(){
		var btn = this.data("_self");
		if(btn){
			return btn;
		};
		this.init = function(){
			var obj = $(this);
			var classname=$(this).attr('class')
			var id=$(this).attr('id')||"gen"+Math.random();
			var icon = $(this).attr('icon')||'icon-btncom';
			var paramId = $(this).attr('paramId');
			var paramName=$(this).attr('paramName');
			var paramArray=$(this).attr('paramArray');
			var urladdr=$(this).attr('url');
			var clickvalue=$(this).attr('onclick');
			var bntStr=[
		            '<table id="',id,'" class="z-btn ',classname,'" cellSpacing=0 cellPadding=0 border=0 paramId="',paramId,
		            '" paramName="',paramName,'" paramArray="',paramArray,'" url="',urladdr,'" ><tbody><tr>',
					'<TD class=z-btn-left><i>&nbsp;</i></TD>',
					'<TD class=z-btn-center><EM unselectable="on">',
						'<INPUT type="button" class="z-button z-btn-text ',icon,'"  value="',$(this).attr('value'),'" ></INPUT>',
					'</EM></TD>',
					'<TD class=z-btn-right><i>&nbsp;</i></TD>',
				'</tr></tbody></table>'
			];
			var bnt = $(bntStr.join('')).btn();
			bnt._click = eval(obj.attr("onclick"));
			
			bnt.disable();
			if(obj.attr("disabled"))
				bnt.disable();
			else bnt.enable();
			$(this).replaceWith(bnt);
			bnt.data("_self", bnt);
			
			return bnt;
		};
		

		
		
		this.enable = function(){
			this.removeClass("z-btn-dsb");
			this.click(this._click);
			this.hover(
				  function () {
				    $(this).addClass("z-btn-over");
				  },
				  function () {
				    $(this).removeClass("z-btn-over");
				  }
				)
		};
		this.disable = function(){
			 this.addClass("z-btn-dsb");
			 this.click(this._click);
			 this.unbind("hover");
			 this.unbind("click");
		};  
		return this;
	};
	
	$(function(){
		$("input[type='button']",".div_iconShow").each(function(){
			$(this).btn().init();
		
		});
		$("input[type='reset']",".div_iconShow").each(function(){
			$(this).btn().init().click(function(){
				var form = $(this).parents("form")[0];
				if(form)
					form.reset();
			});
		});
		$("input[type='submit']",".div_iconShow").each(function(){
			$(this).btn().init().click(function(){
				var form = $(this).parents("form")[0];
				if(form)
					form.submit();
			});
		});
	})
})(jQuery);	