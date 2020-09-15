<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.io.IOException"%>
<%@page import="org.jsoup.nodes.Element"%>
<%@page import="org.jsoup.select.Elements"%>
<%@page import="org.jsoup.Jsoup"%>
<%@page import="org.jsoup.nodes.Document"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>MYket : 마이켓</title>
<link href='packages/core/main.css' rel='stylesheet' />
<link href='packages/daygrid/main.css' rel='stylesheet' />
<script src='packages/core/locales/ko.js'></script>
<script src='packages/core/main.js'></script>
<script src='packages/daygrid/main.js'></script>
<script src='packages/interaction/main.js'></script>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.17.0/moment.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<style type="text/css">
@font-face {
	font-family: 'GodoB';
	src: url(../css/godoFont/GodoB.ttf) format('truetype');
}
body {
	margin: 0 auto;
	width: 1080px;
	min-width: 1080px;
}


table{
	border-collapse: collapse;
	font-size: 10px;
	font-family: GodoB;
	
	 }
th{
	border: 1px solid black;
	width: 40px;
	font-size: 15px;
	background-color: #6594BE;
	color: white;
	}
td{
	border: 1px solid black;
	}
img{
	width: 70px;
	height: 102px;
}
	
.yth{
	border: 1px solid black;
	width: 40px;
	font-size: 15px;
	background-color: #F69827;
	color: white;
}
.main_div {
	width: 100%;
	height: auto;
	margin: 0 auto;
	padding: 15px;
	text-align: center;
	display: table;
		font-family: GodoB;
	font-size: 25px;
}

.left_content_div {
	width: 70%;
	height: auto;
	display: inline-block;
	vertical-align: top;
}

.right_content_div {
	width: 30%;
	height: auto;
	display: inline-block;
	vertical-align: top;
}

.cal_div {
	border: 1px solid black;
	height: 500px;
	width: 95%;
	display: inline-block;
}

.right_div {
	border: 1px solid black;
	width: auto;
	height: auto;
	display: inline-block;
}

.today_div {
	width: 100%;
	height: auto;
	display: inline-block;
	vertical-align: top;
	text-align: center;
	margin-bottom: 30px;
	margin-top: 20px;
}
.todotitle_div{
	width: 100%;
	height: 50px;
	display: inline-block;
	vertical-align:middle;
}
.todo_div{
	width: 100%;
	height: auto;
	display: inline-block;
	vertical-align:middle;
	text-align: center;
}

.chart_div {
	
	width: 100%;
	height: auto;
	display: inline-block;
	vertical-align: top;
	padding-bottom: 30px;

}
.mchart_div{
	font-size: 20px;
	width: 90%;
	height: auto;
	display: inline-block;

}
.ychart_div{
	font-size: 20px;
	width: 90%;
	height: auto;
	display: inline-block;
}

.today_table{
	margin-top: 10px;
	font-size: 20px;
	display: inline-block;
	width: auto;

	
}

.tth{
	width: 40px;
	padding: 7px;
	background-color: #F69827;
	color: white;
}
.ttd{
	width: 190px;
	padding: 7px;
	
}
</style>
<%
	//뮤지컬
	String url = "http://ticket.yes24.com/New/Genre/GenreMain.aspx?genre=15457&Gcode=009_202_002";
	String line = "";
	Document doc = null;
	List<String> list = new ArrayList<String>();
	List<String> list2 = new ArrayList<String>();
	try {
		doc = Jsoup.connect(url).get();
		Elements e1 = doc.select(".ms5-l-txt");
		Elements e2 = doc.select(".ms5-l>ul> li >a >dl >dd >img"); 
		
		for (Element ele : e1) {
			list.add(ele.html());	
		}
		for(Element ele2 : e2){
			list2.add(ele2.toString());	
		}
	} catch (IOException e) {
		e.printStackTrace();
	}
	pageContext.setAttribute("list", list);
	pageContext.setAttribute("list2", list2);
	//연극
	String yurl = "http://ticket.yes24.com/New/Genre/GenreMain.aspx?genre=15458&Gcode=009_202_003";
	String yline = "";
	Document ydoc = null;
	List<String> ylist = new ArrayList<String>();
	List<String> ylist2 = new ArrayList<String>();
	try {
		ydoc = Jsoup.connect(yurl).get();
		Elements e1 = ydoc.select(".ms5-l-txt");
		Elements e2 = ydoc.select(".ms5-l>ul> li >a >dl >dd >img"); 
		for (Element ele : e1) {
			ylist.add(ele.html());	
		}
		for(Element ele2 : e2){
			ylist2.add(ele2.toString());	
		}
	} catch (IOException e) {
		e.printStackTrace();
	}
	pageContext.setAttribute("ylist", ylist);
	pageContext.setAttribute("ylist2", ylist2);
%>
<%--
String fileUrl = "http://localhost:8085/khs_project/calendar/calmain.do";
Document document = Jsoup.connect(fileUrl).get();
Elements cal = document.select(".calmain");
pageContext.setAttribute("cal", cal);
--%>
<script>

	$(function() {
		<c:if test="${not empty sessionScope.login}">
			today();
		</c:if>	
		
	})
	
	function today() {
		$.ajax("${path}/calendar/today.do", {
			success : function(data) {
				$("#todo_div").html(data);
			},
			error : function(e) {
				alert("서버오류: " + e.status);
			}
		})
	}

	
</script>
</head>
<body>
<input type="hidden" name="id" id="id" value="${sessionScope.login }">
 <%request.setCharacterEncoding("UTF-8");%>
	<div class="main_div" style="text-align: center;">
		<div class="left_content_div">
			<div class="cal_div">캘린더 include
				<%-- <jsp:include page="../calendar/calmain.jsp"/> --%> 
				<%-- ${cal } --%>
			</div>
		</div>
		<div class="right_content_div" >
			<div class="right_div">
				<div class="today_div" id="today_div">
				<div class="todo_div" id="todotitle_div" >오늘의 일정</div>
					<div class="todo_div" id="todo_div" ></div>
				</div>
				<div class="chart_div">
					실기간 인기차트
					<div class="mchart_div" >
						<table>
						<caption>뮤지컬</caption>
						<c:forEach items="${list }" var="v" varStatus="stat">
							<tr><th>${stat.index +1}</th><td>${list2[stat.index]}</td><td style="text-align: left;">${v }</td></tr>
						</c:forEach>
						
						</table>
					</div>
					<div class="ychart_div">
					<table>
						<caption>연극</caption>
						<c:forEach items="${ylist }" var="v" varStatus="stat">
							<tr><th class="yth">${stat.index +1}</th><td>${ylist2[stat.index]}</td><td style="text-align: left;">${v }</td></tr>
						</c:forEach>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>