<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 상세보기</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="../css/info.css">
<script>
var bno = '${b.no}'; 

//페이지 로딩시 댓글 목록 출력
$(document).ready(function(){
    replyList();  
});

//댓글 목록 
function replyList(){
    $.ajax({
        url : "${path}/reply/replyList.do",
        type : 'POST',
        data : {'bno':bno},
        success : function(data){
        	$("#replys").html(data);
        },
		error : function(e) {
			alert("서버오류: " + e.status);
		}
	})
}
$(function() {
    $("[name=replyinsert_btn]").on("click", function() {
    	var insertData = $('[name=replyf]').serialize(); 
        console.log(insertData);
        replyInsert(insertData); 
    })
});
    
//댓글 등록
 function replyInsert(insertData){
    $.ajax({
        url : "${path}/reply/replyInsert.do",
        type : 'POST',
        data : insertData,
        success : function(data){
            	replyList(); //댓글 작성 후 댓글 목록 reload
                $('[name=content]').val('');
        }
    });
}
 
//댓글 삭제 
function replyDelete(rno){
    $.ajax({
        url : "${path}/reply/replyDelete.do?rno="+rno,
        type : 'POST',
        success : function(data){
            replyList(); //댓글 삭제후 목록 출력 
        }
    });
}

</script>

</head>
<body>
<table class="info_table">
<tr class="info_tr"><td class="th">제목</td> 
		<td class="td">${b.subject}</td></tr>
	<tr class="info_tr"><td class="th">날짜</td>
		<td class="td"><fmt:formatDate value="${b.regdate }" pattern="yyyy-MM-dd HH:mm" /></td></tr>
	<tr class="info_tr"><td class="th">작성자</td>
		<td class="td">${b.author}</td></tr>
	<tr class="info_tr"><td class="th">내용</td>
		<td><table style="width:100%; height:250px;">
	<tr class="info_tr"><td class="td" style="border-width: 0px; vertical-align: top; text-align: left;">${b.content}</td></tr></table></td></tr>
	<tr class="info_tr"><td class="th">첨부파일</td><td>
	<c:if test="${empty b.file1 }">
		&nbsp;
	</c:if>
	<c:if test="${!empty b.file1 }">
		<a href="file/${b.file1 }">${b.file1 }</a>	
	</c:if></td></tr>
</table>

<div class="reply_div" >
	<div style="text-align: left; font-size: 20px; margin-bottom: 5px;">댓글</div>
	
		<div class="replys" id="replys"></div>
	
	<div class="replywrite" >
		<form action="../reply/replyInsert.do" name="replyf" onsubmit="replyInsert($('[name=replyf]').serialize()); return false;">
			<input type="hidden" name="bno" value="${b.no }">
			<input type="hidden" name="id" value="${sessionScope.login}">
			<input type="text" name="content" class="content_txt">
			<input type="button" value="등록" name="replyinsert_btn" class="submit_btn">			
		</form>
	</div>
</div>

	<div class="a_div">
		<c:if test="${sessionScope.login == b.id }">
			<a class="submit_a"
				href="updateForm.do?no=${b.no }&&id=${sessionScope.login}">수정</a>
			<a class="submit_a" href="deleteForm.do?no=${b.no }">삭제</a>
		</c:if>

		<a class="submit_a" href="list.do?id=${sessionScope.login}">목록</a>
	</div>
</body>
</html>