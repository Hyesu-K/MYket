<%@page import="java.util.List"%>
<%@page import="model.MemberDao"%>
<%@page import="model.Member"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>MYket : 회원 목록 보기</title>
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
table {
	margin: 0 auto;
	border: 2px solid black;
	border-collapse: collapse;
	colmargin: 0 auto;
	width: 70%;
	height: 350px;
	font-family: GodoB;
	padding-top: 10px;
	padding-bottom: 20px;
	text-align: center;
}
td{
	border: 1px solid black;
	border-collapse: collapse;
	padding: 10px;
}
.th{
	font-size: 20px;
	background-color: #6594BE;
	color: white;
	height: 10px;
}
caption{
	font-size: 30px;
	padding-bottom: 20px;
}
</style>
</head>
<body>
<table><caption>회원목록</caption>
	<tr><td class="th">사진</td><td class="th">아이디</td><td class="th">닉네임</td>
		<td class="th">이메일</td><td class="th">생일</td><td class="th">&nbsp;</td></tr>
	<c:forEach var="m" items="${list }">
		<tr><td><img src="picture/sm_${m.picture }" width="100" height="120"></td>
		<td><a href="info.me?id=${m.id }">${m.id }</a></td>
		<td>${m.nickname }님</td>
		<td>${m.email }</td>
		<td>${m.birth }</td>
		<td><c:if test="${m.id != 'admin' }">
			<a href="delete.me?id=${m.id }">[강제탈퇴]</a>
			</c:if>
		</td></tr>
	</c:forEach>
</table>
</body>
</html>
