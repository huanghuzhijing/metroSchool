<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<table id="pointMgmt" style="width:100%;margin: auto">
<tr>
<td>
<div class="listButtonDiv" style="margin-left: 470px;">
<input type="button" id="btnStart_point" class="button1"  icon="icon_edit"  value="开始绘点"> 
<input type="button" id="btnBig" class="button1" icon="icon_edit"  value="放大图纸"> 
<input type="button" id="btnSmall" class="button1" icon="icon_edit"  value="缩小图纸"> 
<input type="button" id="btnDelete" class="button1" icon="icon_edit"  value="删除"> 
</div>
</td>
<tbody id="tbody">
</tbody>

<td>
<div id="box">

	<div id="picWrap">
		<img id="drawing" width="100%" height="400px" src="${path}" alt="" />
		<div id="point" class="point"></div>
	</div>
</div>
</td>
</tr>
</table>
<script type="text/javascript">
var pointCoordsArr = []; //存放监测点的坐标
var ss='${flag}';
$(function(){
	var _thisPage=$('#pointMgmt');
	var actualImgW = _thisPage.find('#drawing').width();
	var actualImgH = _thisPage.find('#drawing').height();
	var boxW = _thisPage.find('#box').width();
	_thisPage.find('#picWrap').css({
		width: actualImgW,
		height: actualImgH
	});
	var isDraw = false; isDraw = false;//定义是否可以绘制
	var pageL = 0, pageT = 0, //鼠标在当前视口的位置
		divOffsetL = 0, divOffsetT = 0, //div框在当前视口的相对偏移
		divScrollL = 0, divScrollT = 0, //div滚动条的偏移
		iX = 0, iY = 0; //点坐标

	var _pointx='${dtaqAutoCheckpoint.pointx}';
	if(_pointx!=''&&_pointx!=null){		
	     pointCoordsArr = [${dtaqAutoCheckpoint.pointx},${dtaqAutoCheckpoint.pointy}]
	}
	var scale = 1; //比例尺

	var pointIndex=0;

	if(pointCoordsArr.length > 0){
		_thisPage.find('#point').show().css({
			left: pointCoordsArr[0] - 8,
			top: pointCoordsArr[1] - 8
		});
		console.log(pointCoordsArr[0]+"--"+pointCoordsArr[1]);
	}
		
	//点击开始绘点按钮，开启绘点功能
	_thisPage.find('#btnStart_point').click(function(){
	  if(ss=='no'){
                alert('图片无效')
                isDraw = false;
            }else{
                isDraw = true;
            }
	});
	//放大按钮事件
	_thisPage.find('#btnBig').click(function(){
		_thisPage.find('#drawing, #picWrap').width(_thisPage.find('#drawing').width() * 1.1);
		_thisPage.find('#drawing,#picWrap').height(_thisPage.find('#drawing').height()*1.1);
		getPointCoords();
	});
	//缩小按钮事件
	_thisPage.find('#btnSmall').click(function(){	
		if(_thisPage.find('#drawing').width() <= boxW){
			return false;
		}
		_thisPage.find('#drawing, #picWrap').width(_thisPage.find('#drawing').width() * .9);
		_thisPage.find('#drawing,#picWrap').height(_thisPage.find('#drawing').height() * .9);
		if(_thisPage.find('#drawing').width() <= boxW){
			_thisPage.find('#drawing, #picWrap').width(boxW);
			_thisPage.find('#picWrap').height(_thisPage.find('#drawing').height());
		}
		getPointCoords();
	});
	
	//点击图片区域绘制点
	_thisPage.find('#picWrap').click(function(e){
		if(isDraw){
			_thisPage.find('#btnDelete, #btn_save').attr('disabled', false);
			drawPoint(e);
			getPointCoords();
		}
	});

    	//点击删除绘点按钮，删除绘点并关闭绘点功能
	_thisPage.find('#btnDelete').click(function(){
		isDraw = false;
		_thisPage.find('#point').hide();
		pointCoordsArr.remove(0);
		_thisPage.find('#btnDelete, #btnSave').attr('disabled', true);
	});


	//拖拽绘点
	_thisPage.find('#point').mousedown(function(e){
		isDrag = true;
		_thisPage.find(document).mousemove(function(e){
			if(isDraw && isDrag){
				drawPoint(e);
			}
		});
		_thisPage.find(document).mouseup(function(e){
			isDrag = false; //禁止拖动
		});
	})

	//点移动函数
	function drawPoint(e){
		pageL = e.pageX;
		pageT = e.pageY;
		divOffsetL = _thisPage.find('#box').offset().left;
		divOffsetT = _thisPage.find('#box').offset().top;
		divScrollL = _thisPage.find('#box').scrollLeft();
		divScrollT = _thisPage.find('#box').scrollTop();
		
		iX = pageL - divOffsetL + divScrollL - 8;
		iY = pageT - divOffsetT + divScrollT - 8;
		
		if(_thisPage.find('#point').is(':hidden')){
			_thisPage.find('#point').show();
		};
		if(pageL - divOffsetL <= 0){
			iX = -8;
		}
		if(iX >= _thisPage.find('#drawing').width() - 8){
			iX = _thisPage.find('#drawing').width() - 8
		}
		if(pageT - divOffsetT <= 0){
			iY = -8;
		}
		if(iY >= _thisPage.find('#drawing').height() - 8){
			iY = _thisPage.find('#drawing').height() - 8
		}
	_thisPage.find('#point').css({
		left: iX,
		top: iY
	});
	
       scale = _thisPage.find('#drawing').width() / actualImgW;
		var iW = parseInt((iX + 8) / scale);
		var iH = parseInt((iY + 8) / scale);
	
	}

	//缩放比例
	function getPointCoords(){
		scale = _thisPage.find('#drawing').width() / actualImgW;

		var pointCount=pointCoordsArr.length;
		if( pointCount> 0){
			for(var i=0;i<pointCount;i++){
				var arr=pointCoordsArr[i].split('_');
				_thisPage.find('#point'+pointCoordsArr[i]).css({
					left: (arr[0] - 8) * scale,
					top: (arr[1] - 8) * scale
				});

			}
		}
	}	


//获取坐标点
	function getPointCoords(){
	
		scale = _thisPage.find('#drawing').width() / actualImgW;
		var iW = parseInt((_thisPage.find('#point').position().left + 8) / scale);
		var iH = parseInt((_thisPage.find('#point').position().top + 8) / scale);
		pointCoordsArr = [iW, iH];
		_thisPage.find("[name='pointx']").val(iW);
		_thisPage.find("[name='pointy']").val(iH);
 
	}	

});

///删除方法
//function removeTD(){
//    $('#point').hide();
//	pointCoordsArr.remove(index);
//}

</script>
