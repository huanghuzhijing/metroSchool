
<%@ include file="/commons/taglibs.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<html>
	<head>
		<title>综合信息系统
		</title>
	</head>
	<frameset cols="*,100%,*" frameborder="no" border="0" framespacing="0">
		<frame src="<c:url value="commons/blank.html" />" name="leftFrame"
			id="leftFrame" title="leftFrame" scrolling="no" />
		<frameset id="bigmainFrame" name="bigmainFrame" rows="66,0,31,*,30"
			border="0" frameborder="no" framespacing="0">
			<!-- 题头框架 -->
			<frame id="topFrame" name="topFrame" scrolling="no"
				noresize="noresize" src="<c:url value="/top.jsp" />">
			<!-- 收缩框架 -->
			<frame id="udFrame" name="udFrame" scrolling="No" scrolling="no"
				noresize="noresize" src="<c:url value="/udbtn.jsp" />">
			<!-- 主菜单框架 -->
			<frame id="tmenuFrame" name="tmenuFrame" scrolling="auto"
				src="bizplat.do?method=bizPlatTree&code=0"/>
			<frameset cols="175,5,*" id="mainFrame" name="mainFrame" border="0"
				frameborder="no">
				<!-- 二级菜单框架 -->
				<frame id="menuFrame" src="bizplat.do?method=bizPlatSubMenu"
					name="menuFrame" />
				<!-- 收缩框架 -->
				<frame src="<c:url value="/btn.jsp" />"
					style="overflow: hidden; width: 5px" name="leftFrame"
					scrolling="no" noresize="noresize"
					id="leftFrame" title="leftFrame"  />
				<!-- 主显示框架--> 
				<frame id="contentFrame" name="contentFrame"
								src="${url}">
			</frameset>
			<frame id="bottomFrame" name="bottomFrame" scrolling="no"
				noresize="noresize" src="<c:url value="/commons/menufooter.jsp" />">
		</frameset>
		<frame src="<c:url value="commons/blank.html" />" name="rightFrame"
			id="rightFrame" title="rightFrame" scrolling="no" />
	</frameset>






</html>



