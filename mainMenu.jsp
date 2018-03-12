<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ include file="/commons/taglibs.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<html>
<head>
<title><fmt:message key="system.title" /></title>
<link rel="stylesheet" type="text/css" href="${ctx}/scripts/themes/default/easyui.css"/>
<link rel="stylesheet" type="text/css" href="${ctx}/scripts/themes/icon.css"/>
<script language="javascript" src="${ctx}/scripts/public.js"></script>
<script language="javascript" src="${ctx}/scripts/jquery-1.4.2.min.js"></script>
<script language="javascript" src="${ctx}/scripts/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${ctx}/scripts/dtree/dtree.js"></script>
<link rel="StyleSheet" href="${ctx}/scripts/dtree/css/dtree.css"	type="text/css" />
<link href="<c:url value="/styles/blue.css"/>" type="text/css" rel="stylesheet"/>

<script type="text/javascript" >
 //
 $(document).ready(function(){
 	//
 	var tds = $(".content") ;
 	tds.addClass("normalTd") ;
 	//
 	tds.mouseover(function(){
 		$(this).addClass("overTd") ;
 	});
 	//
 	tds.mouseout(function(){
 		$(this).removeClass("overTd") ;
 	}) ;
 	//
 	tds.click(function(){
 		$(".content").removeClass("selectedTd") ;
 		$(this).addClass("selectedTd") ;
 	}) ;
 	//
 	$("#container").height($(document).height()) ;
 	var hitFlag='${param.hitFlag}';
 	
 	if(hitFlag==1){
 	//alert('${forwardUrl}');
 		self.parent.frames["contentFrame"].document.location = '${forwardUrl}' ;
 	}
 })
 //
 function showContend(url){
 	self.parent.frames["contentFrame"].document.location = url ; 
 }
 
</script>
</head>

<body class="body_menu">
	<div id="container">
		<script language='javascript'>
			var subMenusTree = new dTree('subMenusTree');
			subMenusTree.setIconPath("${ctx}/scripts/dtree/");
			subMenusTree.add('${menuIndx}',-99,'菜单栏','${ctx}/bizplat.do?method=bizPlatSubMenu');
			<c:forEach items="${subMenusTree}" var="menuTree">	
			   var url='${menuTree.f_mcode}';
			   if(url==''||url==null){
			    	url="";
			   }else{
			   		url='${ctx}/${menuTree.f_mcode}';
			   }
			   subMenusTree.add('${menuTree.f_mid}','${menuTree.f_parentid}','${menuTree.f_mname}',url,'','contentFrame','','');
				
			</c:forEach>
			document.write(subMenusTree);
			subMenusTree.openAll();
		</script>
	</div>
	
</body>
</html>
