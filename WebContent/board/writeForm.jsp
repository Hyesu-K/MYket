<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--a�±׿� form�±״� ���� x -> �Լ��� f ���� --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>MYket : �ۼ� ������</title>
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
			alert("������ �Է��ϼ���");
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
		<tr><td class="tr">����</td><td class="td"><input type="text" class="txt" name="subject"></td></tr>
		<tr><td class="tr">�ۼ���</td><td class="td"><input class="txt" type="text" name="author" value="${mem.nickname }" readonly="readonly"></td></tr>
		<tr><td class="tr">����</td><td><textarea rows="15" name="content" id="content1"></textarea></td></tr>
		<script>CKEDITOR.replace("content1",{filebrowserImageUploadUrl : "imgupload.do"});</script>
		<tr><td class="tr">÷������</td><td><input type="file" class="txt" name="file1"></td></tr>
	</table>
	<div class="a_div">
		<a class="submit_a" href="javascript:inputcheck()">���</a>
	</div>
</form>
</body>
</html>