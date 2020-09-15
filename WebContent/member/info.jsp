<%@page import="model.MemberDao"%>
<%@page import="model.Member"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>MYket : 회원 정보</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<link rel='stylesheet' href='../css/input.css' />
<link rel='stylesheet' href='../css/div.css' />
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
	border: 2px solid black;
	margin: 0 auto;
	width: 70%;
	height: 350px;
	font-family: GodoB;
	font-size: 25px;
	margin-bottom: 20px;
	padding-top: 20px;
	padding-bottom: 20px;
}

img {
	border: 2px solid black;
	width: 150px;
	height: 190px;
}

.a_btn {
	border: 2px solid black;
	background-color: #6594BE;
	color: white;
	font-family: GodoB;
	font-size: 30px;
	text-decoration: none;
	padding: 9px;
}
</style>

</head>
<body>
	<table>
		<thead>
			<tr>
				<td colspan="3" style="text-align: center; font-size: 35px;">내
					정보</td>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td style="text-align: right; padding-right: 20px;">아이디</td>
				<td style="text-align: left;">${mem.id}
				<td rowspan="4"><img src="picture/${mem.picture}" id="pic">
				</td>
			</tr>
			

			<tr>
				<td style="text-align: right; padding-right: 20px;">닉네임</td>
				<td style="text-align: left;">${mem.nickname}</td>
			</tr>
			<tr>
				<td style="text-align: right; padding-right: 20px;">생년월일</td>
				<td style="text-align: left;">${mem.birth}</td>
				<td></td>
			</tr>
			<tr>
				<td style="text-align: right; padding-right: 20px;">이메일</td>
				<td colspan="2" style="text-align: left;">${mem.email}</td>
			</tr>
		</tbody>

	</table>

<a href="logout.me" class="a_btn">로그아웃</a>
	<a href="updateForm.me?id=${mem.id }" class="a_btn">수정</a>
	<c:if test="${param.id != 'admin' && sessionScope.login != 'admin' }">
		<a href="deleteForm.me?id=${mem.id }" class="a_btn">탈퇴</a>
	</c:if>
	<c:if test="${param.id == 'admin' && sessionScope.login == 'admin' }">
		<a href="list.me?id=${mem.id }" class="a_btn">회원목록</a>
	</c:if>
</body>
</html>