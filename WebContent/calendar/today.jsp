<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<table class="today_table">
<c:forEach items="${play}" var="play">
	<tr><td class="tth">제목</td><td class="ttd" style="text-align: left;">${play.subject }</td></tr>
	<tr><td class="tth">날짜</td><td class="ttd" style="text-align: left;">${play.date }</td></tr>
	<tr><td class="tth">시간</td><td class="ttd" style="text-align: left;">${play.time }</td></tr>
</c:forEach>
</table> 
