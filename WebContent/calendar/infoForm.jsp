<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style type="text/css">
@font-face {
	font-family: 'GodoB';
	src: url(../css/godoFont/GodoB.ttf) format('truetype');
}
body {
	margin: 0 auto;
	max-height: 1000px;
	max-width: 1000px;
	min-width: 900px;
	min-height: 600px

}
table {
	margin: 0 auto;
	
	border-collapse: collapse;
	colmargin: 0 auto;
	width: 70%;
	height: auto;
	font-family: GodoB;
	font-size: 30px;
	padding-top: 10px;
	padding-bottom: 20px;

}

input[type=text]{
	border: 1px solid black;
	font-family: GodoB;
	font-size: 30px;
	 box-sizing: border-box;
}
caption{
	font-size: 35px;
}

.th{
	border-collapse: collapse;
	width: 20%;
	height: 100%;
	font-size: 30px;
	text-align:right;
}
.td {

	border-collapse: collapse;
	width: 30%;
	height: 100%;
	font-size: 30px;
	text-align:left;
} 
textarea{
font-family: GodoB;
	font-size: 30px;
}

.a_div{
	margin-top: 50px;
	text-align: center;
	
}
.m{
	color: red;
	text-align: left;
	font-family: GodoB;
	width: 5%;
}
.submit_a {
	border: 2px solid black;
	border-radius: 3px;
	background-color: #6594BE;
	color: white;
	font-size: 30px;
	font-family: GodoB;
	text-decoration: none;
	margin-left: 5px;
	margin-right: 5px;
	padding: 10px 15px;
	
}
caption {
	text-align: center;
	font-size: 35px;
	padding-bottom: 20px;
}
.info_div{
	padding-bottom: 100px;
	margin: 20px;
	text-align: center;
}

</style>

</head>
<body>
<input type="hidden" name="id" value="${play.id }">
<input type="hidden" name="no" value="${play.no }">
<div class="info_div">
	<div>
	<table>
		<caption>${play.date }</caption>
		<tr><td class="th">극이름</td><td width="5%">&nbsp;</td><td class="td"><input type="text" class="info_txt" name="subject" value="${play.subject }" readonly="readonly"></td></tr>
		<tr><td class="th">카테고리</td><td>&nbsp;</td><td class="td"><input type="text" class="info_txt" name="category" value="${play.category }" readonly="readonly"></td></tr>
		<tr><td class="th">가격</td><td>&nbsp;</td><td class="td"><input type="text" class="info_txt" name="price" value="${play.price }" readonly="readonly"></td></tr>
		<tr><td class="th">시간</td><td>&nbsp;</td><td class="td"><input type="text" class="info_txt" name="time" value="${play.time }" readonly="readonly"></td></tr>
		<tr><td class="th">캐스트</td><td>&nbsp;</td><td class="td"><input type="text" class="info_txt" name="cast" value="${play.cast }" readonly="readonly"></td></tr>
		<tr><td class="th">장소</td><td>&nbsp;</td><td class="td"><input type="text" class="info_txt" name="place" value="${play.place }" readonly="readonly"></td></tr>
		<tr><td class="th">메모</td><td>&nbsp;</td><td class="td">
				<textarea rows="5" cols="20" class="info_txt" name="memo"  readonly="readonly">${play.memo }</textarea></td></tr>
	</table>
	</div>
		
	
	<div class="a_div">
		<a class="submit_a" href="updateForm.do?no=${play.no }&id=${sessionScope.login}">수정</a>
		<a class="submit_a" href="deleteForm.do?no=${play.no }">삭제</a>
		<a class="submit_a" href="rwriteset.do?no=${play.no }">후기쓰러가기</a>
	</div>	
</div>
</body>
</html>