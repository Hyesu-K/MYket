<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>MYket : 게시판 목록</title>
<link rel="stylesheet" href="../css/board.css">
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
table{
	width: 100%;
	font-family: GodoB;
}
table, tr, td {
	border: 2px solid black;
	border-collapse: collapse;
	text-align: center;
	height: auto;
}

tr {
	height: 70px;
}
td{
	width: auto;
}
.th {
	border: 2px solid black;
	border-collapse: collapse;
	height: 10px;
	background-color: #6594BE;
	color: white;
	font-size: 30px;
}

.td {
	text-align: center;
}

textarea {
	width: 90%;
	height: 90%;
}

.a_div{
	margin-top: 50px;	
	text-align: center;
	margin-bottom: 100px;
}

select{
	width: 300px; 
    padding: .8em .5em;
	border: 1px solid black;
	font-size: 20px;	
	font-family: GodoB;
}

.findtxt{
	width: 30%; 
	font-family: GodoB;
	font-size: 20px;	
}

.find_btn{
	font-family: GodoB;
	font-size: 30px;
	background-color: #6594BE;
	color: white;
	width: 100px;
	height: 60px;
}
</style>
<script type="text/javascript">
	function listdo(page) {
		f = document.sf;
		f.pageNo.value = page;
		f.submit();
	}
</script>
</head>
<body>
	<form action="list.do" method="post" name="sf">
		<div style="display: flex; justify-content: center;">
			<input type="hidden" name="pageNo" value="1">
<input type="hidden" name="category1" value="Free"> 
<input type="hidden" name="id" value="${sessionScope.login }">

			
			<select class="sel" name="column">
				<option value="">선택하세요</option>
				<option value="subject">제목</option>
				<option value="author">작성자</option>
				<option value="content">내용</option>
				<option value="subject,author,content">제목+작성자+내용</option>
			</select>
			<script>
				document.sf.column.value = "${param.column}";
			</script>
			<input type="text" name="find" class="findtxt" value="${param.find}"> 
			<input type="submit" class="find_btn" value="검색">
		
		
		</div>
	</form>
	<table>
		
		<c:if test="${boardcount == 0 }">
			<tr>
				<td colspan="5">등록된 게시글이 없습니다.</td>
			</tr>
		</c:if>
		<c:if test="${boardcount > 0 }">
			<tr>
				<td class="th" width="8%">번호</td>
				<td class="th" width="50%">제목</td>
				<td class="th" width="14%">작성자</td>
				<td class="th" width="17%">등록일</td>
				<td class="th" width="11%">조회수</td>
			</tr>
			<c:forEach var="b" items="${list }">
				<tr>
					<td>${boardno }</td>
					<c:set var="boardno" value="${boardno-1 }" />
					<td style="text-align: left"><a href="info.do?no=${b.no }&&id=${sessionScope.login}">${b.subject}</a></td>
					<td>${b.author}</td>
					<td><fmt:formatDate var="rdate" value="${b.regdate }"
							pattern="yyyy-MM-dd" /> <c:if test="${today == rdate }">
							<fmt:formatDate value="${b.regdate }" pattern="HH:mm:ss" />
						</c:if> <c:if test="${today != rdate }">
							<fmt:formatDate value="${b.regdate }" pattern="yyyy-MM-dd HH:mm" />
						</c:if></td>
					<td>${b.readcnt }</td>
				</tr>
			</c:forEach>

			<%--페이지 처리하기 --%>
			<tr>
				<td colspan="5"><c:if test="${pageNo <= 1 }">[이전]</c:if> <c:if
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
	<div class="a_div">
		<a class="submit_a" href="writeForm.do?id=${sessionScope.login}">글쓰기</a>
	</div>
</body>
</html>