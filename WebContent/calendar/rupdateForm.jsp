<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>MYket : 후기 수정</title>
<script src="//cdn.ckeditor.com/4.14.1/standard/ckeditor.js"></script>
<link rel='stylesheet' href='../css/board.css' />
<style type="text/css">
body {
	margin: 0 auto;
	width: 1080px;
	min-width: 1080px;
}

table {
	width: 80%;
	border: 2px solid black;
	border-collapse: collapse;
}

tr, td {
	border: 2px solid black;
	border-collapse: collapse;
	padding: 5px;
}

.th {
	text-align: center;
	width: 20%;
}

td {
	text-align: left;
	text-align: left;
}

textarea {
	width: 90%;
	height: 90%;
}

.txt {
	width: 90%;
}

.subject_txt {
	font-family: GodoB;
	font-size: 23px;
	border: none;
}
</style>
<script type="text/javascript">
	function inputcheck(){
		f = document.f;		
		/* if(f.review.value==""){
			alert("내용을 입력하세요");
			f.review.focus();
			return;
		} */
		f.submit(); 
}
</script>
</head>
<body>
<form action="rwrite.do" method="post" enctype="multipart/form-data" name="f">
<input type="hidden" name="no" value="${play.no }">
	<table>
		<tr><td class="th">종류</td><td>${play.category }</td><td class="th">날짜</td><td>${play.date }&nbsp; ${play.time }</td></tr>
		<tr><td class="th">제목</td><td colspan="3"><input type="text" name="subject" class="subject_txt" value="${play.subject }"></td></tr>
		<tr><td class="th">내용</td><td colspan="3"><textarea rows="15" name=review id="review">${play.review }</textarea></td></tr>
		<script>CKEDITOR.replace("review",{filebrowserImageUploadUrl : "imgupload.do"});</script>
		<tr><td class="th">첨부파일</td><td colspan="3"><input type="file" class="txt" name="file1"></td></tr>
	</table>
	<div class="a_div">
		<a class="submit_a" href="javascript:inputcheck()">등록</a>
	</div>
</form>
</body>
</html>