<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>MYket : �ı� �ۼ�</title>
<script src="//cdn.ckeditor.com/4.14.1/standard/ckeditor.js"></script>
<link rel='stylesheet' href='../css/board.css' />
<style type="text/css">
body {
	margin: 0 auto;
	width: 1080px;
	min-width: 1080px;
}
	table{
		width: 80%;
		border: 2px solid black;
		border-collapse: collapse;
		height: auto;
		margin-bottom: 50px;
	}
	
	tr{
		border: 2px solid black;
		border-collapse: collapse;
		height:70px;
		padding: 10px;
	}
	.th{
	text-align: center;
		width: 20%;
		height:30px;
	}
	td{
		text-align: left;
	}
	textarea{
		width: 90%;
		height: 90%;
		
	}
	.txt{
		width: 90%;
	}
	.subject_txt{
		font-family: GodoB;
		font-size: 23px;
		border: none;
	}
</style>

</head>
<body>
<form action="rwrite.do" method="post" enctype="multipart/form-data" name="f">
<input type="hidden" name="id" value="${play.id }">
<input type="hidden" name="no" value="${play.no }">
	<table>
		<tr><td class="th">����</td><td>${play.category }</td><td class="th">��¥</td><td>${play.date }&nbsp; ${play.time }</td></tr>
		<tr><td class="th">����</td><td colspan="3">${play.subject }</td></tr>
		<tr><td class="th">����</td><td colspan="3">${play.review }</td></tr>
		<tr><td class="th">÷������</td><td colspan="3">${play.file1 }</td></tr>
	</table>
	<div class="a_div">
		<a class="submit_a" href="rupdateForm.do?no=${play.no }">����</a>
		<a class="submit_a" href="rlist.do?no=${play.no }">���</a>
	</div>
</form>
</body>
</html>