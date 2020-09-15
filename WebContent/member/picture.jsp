<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<script type="text/javascript">
	img = opener.document.getElementById("pic");
	img.src = "picture/${fname}"; //opener 창에 이미지가 보여짐
	opener.document.f.picture.value="${fname}"; //hidden태그. 파라미터값 설정
	self.close();
</script>
