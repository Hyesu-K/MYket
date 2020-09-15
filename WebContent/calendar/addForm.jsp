<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>MYket : 일정등록</title>
<style type="text/css">
@font-face {
	font-family: 'GodoB';
	src: url(../css/godoFont/GodoB.ttf) format('truetype');
}
form{
width : 100%;
	margin: 0 auto;
}
table {
	margin: 0 auto;
	
	border-collapse: collapse;
	colmargin: 0 auto;
	width: 70%;
	height: auto;
	font-family: GodoB;
	font-size: 25px;
	padding-top: 10px;
	padding-bottom: 20px;
}

input[type=text]{
	border: 1px solid black;
	font-family: GodoB;
	font-size: 15px;
	 box-sizing: border-box;
}

.th{

	border-collapse: collapse;
	width: 30%;
	height: 100%;
	font-size: 25px;
	text-align:right;
}
.td {

	border-collapse: collapse;
	width: 100%;
	height: 100%;
	font-size: 25px;
	text-align:left;
} 
.date {
	text-align: center;
	font-size: 35px;
	padding: 20px;
}
.cal_txt {
	text-align: left;
	width: 100%;
	height: 30px;
	border: 0px;
	padding-left: 5px;
	padding-right: 5px;
	font-size: 15px;
	font-family: GodoB;
}
.date_txt{
	text-align: center;
	width: 50%;
	height: 50px;
	border: 0;
	padding-left: 5px;
	padding-right: 5px;
	font-size: 30px;
	font-family: GodoB;
}
.btn_submit {
	border: 2px solid black;
	border-radius: 3px;
	background-color: #6594BE;
	color: white;
	font-size: 30px;
	font-family: GodoB;
	
	margin-left: 5px;
	margin-right: 5px;
	padding: 10px 15px;
	
}
.a_div{
	margin-top: 20px;
	text-align: center;
	
}
.m{
	color: red;
	text-align: left;
	font-family: GodoB;
	width: 5%;
}
</style>
<script type="text/javascript">
	function inputcheck(){
		f = document.f;
		if(f.subject.value==""){
			alert("제목을 입력하세요");
			f.subject.focus();
			return;
		}
		if(f.category.value==""){
			alert("카테고리를 선택해주세요");
			f.category.focus();
			return;
		}
		if(f.price.value==""){
			alert("가격을 입력하세요");
			f.price.focus();
			return;
		}
		f.submit(); 
}
</script>
</head>
<body>
<form action="write.do" enctype="multipart/form-data" method="post" name="f">
<input type="hidden" name="id" value="${param.id }">
<input type="hidden" name="date" value="${param.date }">
<table>
	<tr><td class="td date" colspan="3">${param.date }</td></tr>
	<tr><td class="th">극이름</td><td class="m">*</td><td class="td"><input type="text" class="cal_txt" name="subject"></td></tr>
	<tr><td class="th">카테고리</td><td class="m">*</td><td class="td">
		<select class="cal_txt" name="category" style="border: 1px solid black;">
       		<option value="뮤지컬" selected="selected">뮤지컬</option>
    		<option value="연극">연극</option>
    		<option value="기타">기타</option>
		</select>
	</td></tr>
	<tr><td class="th">가격</td><td class="m">*</td><td class="td"><input type="text" class="cal_txt" name="price"></td></tr>
	<tr><td class="th">시간</td><td class="m"></td><td class="td">
			<select class="cal_txt" name="time" style="border: 1px solid black;">
				<option value="14:00">14:00</option>
    			<option value="18:00">18:00</option>
       			<option value="20:00" selected="selected">20:00</option>
			</select></td></tr>
	<tr><td class="th">캐스트</td><td class="m"></td><td class="td"><input type="text" class="cal_txt" name="cast"></td></tr>
	<tr><td class="th">장소</td><td class="m"></td><td class="td"><input type="text" class="cal_txt" name="place"></td></tr>
	<tr><td class="th">메모</td><td class="m"></td><td class="td"><input type="text" class="cal_txt" name="memo"></td></tr>
</table>
<div class="a_div">
	<input type="button" class="btn_submit" value="추가" onclick="inputcheck()">
</div>
</form>
</body>
</html>