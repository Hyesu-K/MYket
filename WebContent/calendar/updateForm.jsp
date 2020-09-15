<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>MYket : 일정수정</title>
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

.m{
	color: red;
	text-align: left;
	font-family: GodoB;
	width: 5%;
}
.btn_submit {
	border: 2px solid black;
	border-radius: 3px;
	background-color: #6594BE;
	color: white;
	font-size: 30px;
	font-family: GodoB;
	text-decoration: none;
	margin-top: 25px;
	padding: 10px 15px;
	
}
caption {
	text-align: center;
	font-size: 35px;
	padding-bottom: 20px;
}
.update_div{
	padding-bottom: 100px;
	margin: 20px;
	text-align: center;
}

</style>
</head>
<body>
<form action="update.do" method="post" enctype="multipart/form-data" name="f">
<input type="hidden" name="id" value="${param.id }">
<input type="hidden" name="no" value="${param.no }">
<input type="hidden" name="date" value="${play.date }">
<div class="update_div">
<table>
	<caption>${play.date }</caption>
	<tr><td class="th">극이름</td><td class="m">*</td><td class="td"><input type="text" class="u_txt" name="subject" value=${play.subject }></td></tr>
	<tr><td class="th">카테고리</td><td class="m">*</td><td class="td"><input type="text" class="u_txt" name="category" value=${play.category }></td></tr>
	<tr><td class="th">가격</td><td class="m">*</td><td class="td"><input type="text" class="u_txt" name="price" value=${play.price }></td></tr>
	<tr><td class="th">시간</td><td class="m"></td><td class="td"><input type="text" class="u_txt" name="time" value=${play.time }></td></tr>
	<tr><td class="th">캐스트</td><td class="m"></td><td class="td"><input type="text" class="u_txt" name="cast" value=${play.cast }></td></tr>
	<tr><td class="th">장소</td><td class="m"></td><td class="td"><input type="text" class="u_txt" name="place" value=${play.place }></td></tr>
	<tr><td class="th">메모</td><td class="m"></td><td class="td"><textarea rows="5" cols="20" class="info_txt" name="memo">${play.memo }</textarea></td></tr>	
</table>
<div class="a_div">
	<input type="submit" value="수정" class="btn_submit">
</div>
	
</div>
</form>
</body>
</html>