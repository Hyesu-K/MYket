<%@page import="java.io.IOException"%>
<%@page import="org.jsoup.nodes.Element"%>
<%@page import="org.jsoup.select.Elements"%>
<%@page import="org.jsoup.Jsoup"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="org.jsoup.nodes.Document"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="decorator"
	uri="http://www.opensymphony.com/sitemesh/decorator"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title><decorator:title /></title>
<decorator:head />
<style type="text/css">
@font-face {
	font-family: 'GodoB';
	src: url(../css/godoFont/GodoB.ttf) format('truetype');
}
footer{
margin-top: 50px;
font-family: GodoB;
}
ul, ol, li {
	list-style: none; 
	margin: 0;
	padding: 0;
	text-decoration: none;
	display: block;	
}

a {
	color: black;
	text-decoration: none;}

.topmenu:hover{
	color: #F69827;
}
.cmenu:hover{
	color: #F69827;
}
.footer {
	height: 200px;

	left: 0;
	bottom: 0;
	width: 100%;
	text-align: center;
	 overflow: hidden;
}
div #mainlayout_div {

height: auto;
}
div .content {
display: inline-block;
	
height: auto;

}

.topmenu.cmenu{
	margin: 0;
	padding: 0;
	list-style-type: none;
}

.main-menu > li{
	display: inline-block;
	width: 150px;
	padding: 5px 10px;
	text-align: center;
	
	text-decoration: none;
	font-family: GodoB;
	font-size: 30px;
	color: black;
	
	vertical-align: top;
}
.sub-menu > li {
	float:none;
}

.main-menu > li:hover .sub-menu{
	opacity: 1;
	visibility: visible;
}
.sub-menu{
	text-decoration: none;
	font-family: GodoB;
	font-size: 20px;
	color: black;
	text-align: center;
	
	margin: 0;
	padding-top: 10px;
	padding-bottom: 25px;
	list-style-type: none;
	
	opacity: 0;
	visibility: hidden;
}

.sub-menu > li {
	margin: 5px;
}

#main_menu ul ul li {

float:none;

}
</style>

</head>

<body>
	<div class="logo"
		style="width: 100%; height: 170px; overflow: hidden; text-align: center;">
		<header id="header">
			<a href="${path }/member/main.me"> <img src="../img/logo.png"
				style="width: 300px; height: auto; border: 0px;">
			</a>
		</header>
	</div>

	<div class="menu" style="text-align: center;">
		<nav id="nav" style="text-align: center;">
			<ul class="main-menu">
				<li><a class="topmenu" href="${path }/calendar/calmain.do?id=${sessionScope.login}">스케줄</a></li>
				<li><a class="topmenu" href="${path }/calendar/rlist.do?id=${sessionScope.login}">기록장</a></li>
				<li><a class="topmenu" href="${path }/chart/mainchart.do?id=${sessionScope.login}">관극분석</a></li>
				<li><a class="topmenu" href="#">커뮤니티</a>
					<ul class="sub-menu">
						<li><a class="cmenu" href="${path }/board/list.do?id=${sessionScope.login}">자유게시판</a></li>
						<%-- <li><a class="cmenu" href="${path }/board/list.do?id=${sessionScope.login}">양도게시판</a></li> --%>
					</ul>
				</li>
				<li><a class="topmenu" href="${path }/member/checkForm.me?id=${sessionScope.login}">내정보</a></li>
			</ul>
		</nav>

	</div>


	<div id="mainlayout_div" style="width: 100%;  height:100%; text-align: center; ">
		<div class="content" style="width: 90%; height:80%; text-align: center;">
			<decorator:body />
		</div>
	</div>

	<div>
		<footer class="footer">
			<div style="text-align: center;">
				<h4>빅데이터 플랫폼 개발자 양성 과정 개인프로젝트 : MYket마이켓</h4>
				<p>Copyright Kim Hyesu, 2020</p>
			</div>
		</footer>
	</div>
</body>
</html>