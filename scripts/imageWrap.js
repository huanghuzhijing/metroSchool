function imageWrap(idNum){
	var boxWrap = $(idNum);
	var oUl = boxWrap.find('ul');
	var prevNext = boxWrap.find('.prev_next');	
	var aLi = oUl.find('li');
	var boxWrapW =boxWrap.width();
	var liW = aLi.outerWidth(true);
	var oUlW = liW * aLi.length;
	var isRight=true;
	
	//如果内容长度大于外包裹容器宽度，则执行下面操作
	if(oUlW > boxWrapW){
		oUl.css('width', oUlW * 2);
		oUl.html(oUl.html() + oUl.html());
		area_mark('.prev, .area_left', '.prev');
		area_mark('.next, .area_right', '.next');
		prevNext.find('.next').click(function(){
			isRight=true;
			next();
		});
		prevNext.find('.prev').click(function(){
			isRight=false;
			next();
		});
		var timer = setInterval(next, 2000);
		boxWrap.hover(function(){
			clearInterval(timer);
		}, function(){
			timer = setInterval(next, 2000);
		});
	}
	
	//显示箭头
	function area_mark(area, arrows){
		prevNext.find(arrows).stop().animate({opacity: 0.8}, 'slow');
	//	prevNext.find(area).hover(function(){
	//	}, function(){
	//		prevNext.find(arrows).stop().animate({opacity: 0}, 'slow');
	//	});
	}
	function next(){
		if(isRight){//向后滚动
			if(!oUl.is(":animated")){			
				var runWidth = parseFloat(oUl.css('left'));
				if(runWidth <= -oUlW){
					oUl.css({'left': 0});
				}
				oUl.animate({left: '-=' + liW},'slow');
			}
		}else{//向前滚动
			if(!oUl.is(":animated")){
				var runWidth = parseFloat(oUl.css('left'));
				if(runWidth >= 0){
					oUl.css('left', -oUlW);
				}
				oUl.animate({left: '+=' + liW},'slow');
			}
		}
	}
}
	