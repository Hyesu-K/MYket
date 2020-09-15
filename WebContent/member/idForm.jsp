<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>아이디찾기</title>
<style type="text/css">
	@font-face {
	font-family: 'GodoB';
	src: url(../css/godoFont/GodoB.ttf) format('truetype');
}
form{
	text-align: center;
}
table{
	margin-top: 50px;
	display: inline-block;
	font-family: GodoB;
}
input[type=text]{
	border: 1px solid black;
	font-family: GodoB;
	font-size: 15px;
	box-sizing: border-box;
	padding: 5px;
	margin-left: 15px;
}
caption{
	font-size: 30px;
	padding-bottom: 20px;
}
.th{

	border-collapse: collapse;
	width: 30%;
	height: 100%;
	font-size: 20px;
	text-align:right;
	margin-right: 10px;
}
.td {

	border-collapse: collapse;
	width: 100%;
	height: 100%;
	font-size: 15px;
	text-align:left;
}
.btn_submit {
	border: 1px solid black;
	border-radius: 3px;
	background-color: #6594BE;
	color: white;
	font-size: 20px;
	font-family: GodoB;
	margin-top: 30px;
	padding: 5px 10px;
}

</style>
</head>
<body>
<form action="id.me" method="post">
<table><caption>아이디찾기</caption>
	<tr><td class="th">이메일</td><td class="td"><input type="text" name="email"></td></tr>
	<tr><td class="th">생년월일</td><td class="td"><input type="text" name="birth" placeholder="yyyy-mm-dd"></td></tr>
	<tr><td colspan="2"><input type="submit" value="아이디찾기" class="btn_submit"></td></tr>
</table>
</form>
</body>
</html>