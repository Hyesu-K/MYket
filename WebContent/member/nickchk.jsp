<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<sql:setDataSource var="conn" driver="org.mariadb.jdbc.Driver" url="jdbc:mariadb://localhost:3306/khs_project" user="scott" password="1234"/>
<sql:query var="rs" dataSource="${conn }"> 
	select * from member where nickname = ?
	<sql:param>${param.nickname}</sql:param>
</sql:query>

<c:if test="${empty rs.rows}">
	o
</c:if> 
<c:if test="${!empty rs.rows}">
	x
</c:if> 