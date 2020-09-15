<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>MYket : 로그인</title>
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
	padding-top: 60px;
	margin: 0 auto;
	width: 80%;
	font-family: GodoB;
}
td {
	text-align: center;
	font-size: 25px;
}
.btn{
	background-color: white;
}
</style>
<script type="text/javascript">
   function inputcheck(f) {
      if (f.id.value == '') {
         alert("아이디를 입력하세요");
         f.id.focus();
         return false;
      }
      if (f.id.value.length < 4) {
         alert("아이디는 4자리 이상 입력하세요");
         f.id.focus();
         return false;
      }
      if (f.pass.value == '') {
         alert("비밀번호를 입력하세요");
         f.pass.focus();
         return false;
      }
      return true;
   }
   function findId() {
      var nw;
      nw = open("idForm.me", "아이디찾기",
            "width=470,height=350,menubar=no,top=150,left=530");
   }
   function findPass() {
      var nw;
      nw = open("passForm.me", "비밀번호찾기",
            "width=470,height=350,menubar=no,top=150,left=530");
   }
</script>
</head>
<body>

	<form action="login.me" method="post" name="f">
		<div class="main_div">
			<div class="login_div">
				<table>
					<tr>
						<td style="text-align: right; padding-right: 15px;">아이디</td>
						<td><input type="text" class="txt" name="id"></td>
					</tr>
					<tr>
						<td style="text-align: right;">비밀번호</td>
						<th><input type="password" class="txt" name="pass"
							maxlength="20"></th>
					</tr>
					<tr>
						<td colspan="2">&nbsp;</td>
					</tr>
					<tr>
						<td colspan="2" style="padding-left: 10px;">아직 회원이 아니신가요? 
						<input type="button" class="btn" value="[회원가입]" onclick="location.href='joinForm.me'">
						</td>
					</tr>
					<tr>
						<td colspan="2"><input type="button" class="btn"
							value="[아이디찾기]" onclick="findId()"> <input type="button"
							class="btn" value="[비밀번호찾기]" onclick="findPass()"></td>
					</tr>
				</table>

			</div>
			<input type="submit" value="로그인" id="btnlogin" class="btnlogin">
		</div>
	</form>
</body>
</html>