<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>MYket : 탈퇴확인</title>
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
	padding-top: 30px;
	margin: 0 auto;
	width: 80%;
	font-family: GodoB;
}

td {
	text-align: center;
	font-size: 25px;
	padding-top: 10px;
}

.txt{
	width: 40%;
}
.submit_btn {
	border: 2px solid black;
	border-radius: 3px;
	background-color: #6594BE;
	color: white;
	font-size: 25px;
	font-family: GodoB;
	
	margin : 5px 5px 15px 5px;
	height: 45px;
	width: 120px;
	
}
</style>
</head>
<body>
	<form action="delete.me" method="post">
		<input type="hidden" name="id" value="${param.id }">
		<table>
			<tr>
				<td>정말로 탈퇴하시겠습니까?
				</td>
			</tr>
			<tr>
				<td colspan="2"><input type="button" value="NO" class="submit_btn" onclick="history.back(-1)"/>
								<input type="submit" value="YES" class="submit_btn"/></td>
			</tr>
		</table>
	</form>
</body>
</html>
