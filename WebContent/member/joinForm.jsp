<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>MYket : 회원가입</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){
		$("#idchk_btn").click(function(){
			$.ajax({
				url : "idchk.me?id="+$("#id").val(),
				type : "get",
				success : function(chk){ 
					$("#idchk_btn").val(chk.trim());
				},
				error : function(e){
					alert("서버오류:"+e.status);
				}
			})			
		})	
		
		$("#nickchk_btn").click(function(){
			var nickname = $("#nickname").val();

			$.ajax({
				url : "nickchk.me?nickname="+encodeURI(nickname,"UTF-8"),
				type : "get",
				success : function(chk){ 
					$("#nickchk_btn").val(chk.trim());
				},
				error : function(e){
					alert("서버오류:"+e.status);
				}
			})			
		})	
		
		$("#emailchk_btn").click(function(){
			$.ajax({
				url : "emailchk.me?email="+$("#email").val(),
				type : "get",
				success : function(chk){ 
					$("#emailchk_btn").val(chk.trim());
				},
				error : function(e){
					alert("서버오류:"+e.status);
				}
			})			
		})
	})
	
	
	
	

	$(function() {
		$("input[name=pass2]").keyup(function() {
			var pass1 = $("#pass1").val();
			var pass2 = $("#pass2").val();
			if (pass1 != "" || pass2 != "") {
				if (pass1 == pass2) {
					$("#check_btn").val("o");
				} else {
					$("#check_btn").val("x");
				}
			}
		});
	});
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

td {
	font-size: 20px;
}

table {
border: 2px solid black;
	margin: 0 auto;
	width: 70%;
	height: 350px;
	font-family: GodoB;
	font-size: 25px;

	padding-top: 20px;
	padding-bottom: 20px;
}

img {
border: 2px solid black; width: 150px; height: 190px;
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
</style>
<script type="text/javascript">
	function win_upload() {
		var op = "width=500,height=150,left=500,top=300";
		open("pictureForm.me", "", op);
	}
</script>
</head>
<body>
	<form action="join.me" name="f" method="post" id="f">
		<input type="hidden" name="picture" value="">
		<div class="main_join">
			<table>
				<thead>
					<tr>
						<td colspan="3" style="text-align: center; font-size: 35px;">회원가입
						</td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td style="text-align: right; padding-right: 20px;">아이디</td>
						<td style="text-align: left;"><input type="text" name="id"
							class="txt_join" id="id"><input type="button" value="중복"
							class="btn_join" id="idchk_btn">
						<td rowspan="4">
							
								<img src="" id="pic">
						 <br> <font size="1"> <a
								href="javascript:win_upload()" style="font-size: 15px;">[
									사진등록 ]</a></font>
						</td>
					</tr>
					<tr>
						<td style="text-align: right; padding-right: 20px;">비밀번호</td>
						<td style="text-align: left;"><input type="password"
							name="pass1" class="txt_join" id="pass1"></td>
					</tr>
					<tr>
						<td style="text-align: right; padding-right: 20px;">비밀번호 재확인</td>
						<td style="text-align: left;"><input type="password"
							name="pass2" class="txt_join" id="pass2"><input type="button"
							value="x" class="check_btn" id="check_btn"></td>
					</tr>
					<tr>
						<td style="text-align: right; padding-right: 20px;">닉네임</td>
						<td style="text-align: left;"><input type="text"
							name="nickname" id="nickname" class="txt_join"><input type="button"
							value="중복" class="btn_join" id="nickchk_btn"></td>
					</tr>
					<tr>
						<td style="text-align: right; padding-right: 20px;">생년월일</td>
						<td style="text-align: left;"><input type="text" name="birth"
							class="txt_join"><font size=2px; color="gray">&nbsp;yyyyMMdd</font></td>
						<td></td>
					</tr>
					<tr>
						<td style="text-align: right; padding-right: 20px;">이메일</td>
						<td colspan="2" style="text-align: left;"><input type="text"
							name="email" id="email" class="txt_join"> <input type="button"
							value="중복" class="btn_join" id="emailchk_btn"></td>
					</tr>
				</tbody>
				<tfoot><tr><td>&nbsp;</td></tr>
					<tr>
						<td colspan="3 "><input type="submit" value="가입"
							class="submit_btn"></td>
					</tr>
				</tfoot>
			</table>
		</div>
	</form>

</body>
</html>