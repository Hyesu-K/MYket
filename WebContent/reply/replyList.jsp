<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:if test="${replyCount > 0}">
<table class="reply_table">
	<tr class="reply_tr1">
		<td class="reply_th" style="width: 20%;">작성자</td>
		<td class="reply_th" style="width: 45%;">내용</td>
		<td class="reply_th" style="width: 25%;">등록날짜</td>
		<td class="reply_th" style="width: 10%;">&nbsp;</td>
	</tr>
	<c:forEach var="reply" items="${list }" varStatus="stat">
		<tr class="reply_tr2">
			<td class="reply_td">${reply.author}</td>
			<td class="reply_td">${reply.content}</td>
			<td class="reply_td">${reply.regdate}</td>
			<td class="reply_td"><c:if test="${reply.id == sessionScope.login}">
					<a href="#" class="replydelete_btn" onclick="replyDelete(${reply.rno})">[삭제]</a>
				</c:if></td>
		</tr>
	</c:forEach>
</table>
</c:if>
