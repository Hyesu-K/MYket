<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--a태그와 form태그는 관련 x -> 함수에 f 선언 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>MYket : 작성 페이지</title>
<script src="//cdn.ckeditor.com/4.14.1/standard/ckeditor.js"></script>
<link rel='stylesheet' href='../css/board.css' />
<style type="text/css">
	table,tr,td {
	font-family: GodoB;
		border: 2px solid black;
		border-collapse: collapse;
		text-align: center;
	}
	.tr{
		width: 20%;
	}
	.td{
		text-align: center;
	}
	textarea{
		width: 90%;
		height: 90%;
	}
	.txt{
		width: 90%;
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
		f.submit(); 
}
</script>
</head>
<body>
<form action="write.do" method="post" enctype="multipart/form-data" name="f">
<input type="hidden" name="id" value="${mem.id }">
<input type="hidden" name="category1" value="Free">
	<table>
		<tr><td class="tr">제목</td><td class="td"><input type="text" class="txt" name="subject"></td></tr>
		<tr><td class="tr">작성자</td><td class="td"><input class="txt" type="text" name="author" value="${mem.nickname }" readonly="readonly"></td></tr>
		<tr><td class="tr">내용</td><td><textarea rows="15" name="content" id="content1"></textarea></td></tr>
		<script>CKEDITOR.replace("content1",{filebrowserImageUploadUrl : "imgupload.do"});</script>
		<tr><td class="tr">첨부파일</td><td><input type="file" class="txt" name="file1"></td></tr>
	</table>
	<div class="a_div">
		<a class="submit_a" href="javascript:inputcheck()">등록</a>
	</div>
</form>
</body>
</html>