<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>MYket : 기록장</title>
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
form{
	text-align: center;
	display: inline-block;
}

.listmain_div{
	width: 100%;
 	text-align: left;
 	display: inline-block;
 	font-size: 0;
 	
}
.cgy_btns{
	display: inline-block;
	width: 70%;
}
.main_div{
	display: inline-block;
	width: 100%;
}
.find_div{
	width: 970px;
	border: 1px solid black;
	vertical-align: middle;
	text-align: center;
	font-size: 0;
	position:relative;
	padding: 20px 50px 20px 0px;

	
}
.find_btn{
	position:absolute; 
	bottom:auto;
	font-family: GodoB;
	font-size: 30px;
	background-color: #6594BE;
	color: white;
	width: 100px;
	height: 61px;
	display: inline-block;
	border-style: none; 
	
}
.find_txt{
	height: 55px;
	width: 550px; 
	font-family: GodoB;
	font-size: 20px;
	display: inline-block;
	text-align: center;	
}
.list_div{
	border: 1px solid black;
	width: 1020px;
	height: 80%;
	text-align: center;
}
.list_table{
	font-size: 20px;
	color: black;
	width:100%;
	border-collapse: collapse;
	text-align: center;
	height: auto;
	font-family: GodoB;
}
.th{
	
}
.td{

}
td{
	border: 1px solid black;
	height: 50px;
}
.top_list{
	height: 70px;
	background-color: #6594BE;
	color: white;
	font-size: 30px;
}

.cgy_btn{
	border: 1px solid black;
	padding: 15px 32px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 25px;
	cursor: pointer;
	float: left;
	font-family: GodoB;
	background-color: white;
}
.clicked {
	background-color: #F69827;
	color: white;
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {

		$(".cgy_btn").off("click").on("click", function() {
				$(".cgy_btn").removeClass("clicked");
				$(this).addClass("clicked");
				
	          	if($(this).val() != '전체'){
					$('#category').val($(this).val());		
				} else {
					$('#category').val("");		
				}
	          	//f.submit();
		})
	})
	
	function listdo(page) {
		f = document.sf;
		f.pageNo.value = page;
		f.submit();
	}
</script>

</head>
<body>
	<div class="listmain_div">
		<div class="cgy_btns">
			<input type="button" class="cgy_btn" value="전체" > 
			<input type="button" class="cgy_btn" value="연극"> 
			<input type="button" class="cgy_btn" value="뮤지컬"> 
			<input type="button" class="cgy_btn" value="기타">
		</div>
		<div class="main_div">
			<div class="find_div">
				<form action="rlist.do" method="post" name="f">
					<input type="hidden" name="pageNo" value="1">
					<input type="hidden" name="category" id="category" > 
					<input type="hidden" name="id" value="${sessionScope.login }">
					<input type="text" value="${param.find}" name="find" class="find_txt" placeholder="제목 혹은 날짜 입력"><input type="submit" class="find_btn" value="검색">
				</form>
			</div>
			<div class="list_div">
				<table class="list_table">
					<c:if test="${playcount == 0 }">
						<tr>
							<td colspan="3">등록된 게시글이 없습니다.</td>
						</tr>
					</c:if>
					<c:if test="${playcount > 0 }">
						<tr class="top_list">
							<td class="th" width="20%">종류</td>
							<td class="th" width="50%">제목</td>
							<td class="th" width="30%">날짜/시간</td>
						</tr>
						<c:forEach var="p" items="${list }">
							<tr>
								<td>${p.category}</td>
								<td><a href="rinfo.do?no=${p.no }">${p.subject}</a></td>
								<td>${p.date }&nbsp;&nbsp;${p.time }</td>
							</tr>
						</c:forEach>
				<%--페이지 처리하기 --%>
				<tr>
				<td colspan="3"><c:if test="${pageNo <= 1 }">[이전]</c:if> <c:if
						test="${pageNo > 1 }">
						<a href="javascript:listdo(${pageNo-1 })">[이전]</a>
					</c:if> <c:forEach var="a" begin="${startpage }" end="${endpage }">
						<c:if test="${a == pageNo }">[${a }]</c:if>
						<c:if test="${a != pageNo }">
							<a href="javascript:listdo(${a})">[${a }]</a>
						</c:if>
					</c:forEach> <c:if test="${pageNo >= maxpage }">[다음]</c:if> <c:if
						test="${pageNo < maxpage }">
						<a href="javascript:listdo(${pageNo +1 })">[다음]</a>
					</c:if></td>
					</tr>	
					</c:if>
				</table>
			</div>
		</div>
	</div>
</body>
</html>