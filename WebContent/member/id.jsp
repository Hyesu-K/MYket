<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="model.MemberDao"%>
<%@page import="model.Member"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���̵�</title>

<script type="text/javascript">

   function idsend(id) {

	   opener.document.f.id.value=id;

	   self.close();

   }

</script>

</head>

<body>

<table><tr><th>���̵�</th>

    <td>${id}**</td></tr>

  <tr><td colspan="2">

     <input type="button" value="���̵�ã��" 

    onclick="idsend('${id}')"></td></tr>

</table></body></html>