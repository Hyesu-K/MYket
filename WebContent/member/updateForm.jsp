<%@page import="model.MemberDao"%>
<%@page import="model.Member"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>MYket : 내 정보 수정</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
function inputcheck(f){
	if(f.pass1.value == null){
		alert("비밀번호를 입력해주세요")
		f.pass1.focus();
		return false;
	}
	if(f.pass1.value!=f.pass2.value){
		alert("비밀번호 불일치")
		f.pass2.focus();
		return false;
	}
	f.submit();
}
function win_upload() {
	var op = "width=500,height=150,left=500,top=300";
	open("pictureForm.me", "", op);
}
</script>
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
.check_btn {
	color: red;
	border: none;
	font-size: 15px;
	font-family: GodoB;
	margin-left: 5px;
	margin-right: 5px;
	height: 45px;
	width: 45px;
	text-align: center;
	background-color: white;
}
.submit_btn {
	border: 2px solid black;
	border-radius: 3px;
	background-color: #6594BE;
	color: white;
	font-size: 25px;
	font-family: GodoB;
	margin-left: 5px;
	margin-right: 5px;
	height: 45px;
	width: 100px;
}
.txt_join {
	text-align: left;
	width: 60%;
	height: 40px;
	border: 2px solid black;
	padding-left: 5px;
	padding-right: 5px;
	font-size: 15px;
	font-family: GodoB;
}

.btn_join {
	border: 2px solid black;
	border-radius: 3px;
	background-color: white;
	font-size: 15px;
	font-family: GodoB;
	margin-left: 5px;
	margin-right: 5px;
	height: 45px;
	width: 45px;
}
</style>

</head>
<body>
<form action="update.me" name="f" method="post" onsubmit="return inputcheck(this)">
	<input type="hidden" name="picture" value="${mem.picture }">
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
				<td style="text-align: left;"><input type="text" name="id" readonly="readonly" class="txt_join" value="${mem.id }">
				<td rowspan="4"><img src="picture/${mem.picture }" id="pic">
						 <br> <font size="1"> <a
								href="javascript:win_upload()" style="font-size: 15px;">[
									사진등록 ]</a></font>
				</td>
			</tr>
			<tr>
				<td style="text-align: right; padding-right: 20px;">비밀번호</td>
				<td style="text-align: left;"><input type="password" name="pass1" class="txt_join"></td>
			</tr>
<tr>
						<td style="text-align: right; padding-right: 20px;">비밀번호 재확인</td>
						<td style="text-align: left;"><input type="password"
							name="pass2" class="txt_join"><input type="button"
							value="X" class="check_btn"></td>
					</tr>
			<tr>
				<td style="text-align: right; padding-right: 20px;">닉네임</td>
				<td style="text-align: left;"><input type="text" name="nickname" value="${mem.nickname }" class="txt_join"><input type="button" value="중복"
							class="btn_join"></td>
			</tr>
			<tr>
				<td style="text-align: right; padding-right: 20px;">생년월일</td>
				<td style="text-align: left;"><input type="text" name="birth" value="${mem.birth }" class="txt_join"></td>
				<td></td>
			</tr>
			<tr>
				<td style="text-align: right; padding-right: 20px;">이메일</td>
				<td colspan="2" style="text-align: left;"><input type="text" name="email" value="${mem.email }" class="txt_join"><input type="button" value="중복"
							class="btn_join"></td>
			</tr>
		</tbody>
<tfoot>
	<tr><td colspan="3 "><input type="submit" value="수정" class="submit_btn"></td></tr>
</tfoot>
	</table>


	</form>
</body>
</html>