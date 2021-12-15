<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" href="#">
<title>index.jsp</title>
<script>
	function logout() {
		location.href = "/member/logout";
	}
</script>
</head>
<body>
	<h2>index.jsp</h2>

	<a href="/member/m_save">회원가입</a><br><br>
	<a href="/member/m_login">로그인</a><br><br>
	세션값: ${sessionScope.loginId}<br><br>
	<c:if test="${sessionScope.loginId eq 'admin'}">
	<td><a href="/member/m_findAll">회원목록</a></td><br><br>         
		</c:if>		
	

	
<!-- <a href="/member/m_findAll">회원목록</a><br>  -->

<%--	<a href="/board/save">글쓰기화면</a><br><br>
	<a href="/board/paging">글목록출력</a><br><br>	 
<%--	<a href="/board/paging">페이징</a><br><br>		--%>
	
				<button onclick="logout()">로그아웃</button>
</body>
</html>