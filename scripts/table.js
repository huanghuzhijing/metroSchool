// JavaScript Document
/*
* ���ܣ�������෽��
* ���ߣ�PHJ
* �汾��1.0
*/
/*
* ��ȡobj���������е�IDֵ
* obj: ��Ԫ��Ԫ�ػ�Ԫ���е�ĳ��Ԫ��
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
 * ��ȡ��ǰ�������Ԫ�����ڵ���Ԫ�أ�
 * ��������Ԫ�ز��ڱ���У��򷵻�null
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


