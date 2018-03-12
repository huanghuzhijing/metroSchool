// JavaScript Document
/*
* 功能：表格处理类方法
* 作者：PHJ
* 版本：1.0
*/
/*
* 攻取obj对象所在行的ID值
* obj: 单元格元素或单元格中的某个元素
*/
function getCurrentID(obj)
{
	var i;
	var elmt = obj;
	if(elmt == null || elmt == "undefined") return -1;
	
	while(elmt.tagName != "TD" && elmt.tagName != "TR")
	{
		if(elmt.parentElement)
		{
			elmt = elmt.parentElement;
		}
	}

	for(i=0; i<elmt.children.length; i++)
	{
		if(elmt.children[i].tagName == "INPUT")
		{
			if(elmt.children[i].value != "")
			   return elmt.children[i].value;
			else
			   return -1;
		}
	}
   return -1;
}


function getCurrentName(obj)
{
	var i;
	var elmt = obj;
	var swch ;
	if(elmt == null || elmt == "undefined") return -1;
	
	while(elmt.tagName != "TD" && elmt.tagName != "TR")
	{
		if(elmt.parentElement)
		{
			elmt = elmt.parentElement;
		}
	}

	for(i=0; i<elmt.children.length; i++)
	{
		if(elmt.children[i].tagName == "INPUT")
		{
			if(elmt.children[i].value != "")
			   return elmt.children[i].name;
			else
			   return -1;
		}
	}
   return -1;
}

/*
 * 获取当前被点击的元素所在的行元素，
 * 如果被点击元素不在表格中，则返回null
*/
function getCurrentRow()
{
	var elmt = window.event.srcElement;

	if(elmt.tagName == "TABLE" || elmt.tagName == "HTML") return null;

	while(elmt.tagName != "TR" && elmt.tagName != "TABLE" && elmt.tagName != "HTML")	
	{
		if(elmt.parentElement)
		{
			elmt = elmt.parentElement;
		}
	}
	if(elmt.tagName == "TR")
		return elmt;
	else
		return null;
}


