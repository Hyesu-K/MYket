<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>MYket : �������</title>

<style type="text/css">
	@font-face {
	font-family: 'GodoB';
	src: url(../css/godoFont/GodoB.ttf) format('truetype');
}
input  {
 font-family: GodoB;
		font-size: 15px;
}
h3 {
 font-family: GodoB;
		font-size: 25px;
}
</style>
</head>
<body style="text-align: center;">
<h3>�������ε�</h3>
<form action="picture.me" method="post" enctype="multipart/form-data">
		<input type="file" name="picture">
		<input type="submit" value="�������" >

</form>
</body>
</html>