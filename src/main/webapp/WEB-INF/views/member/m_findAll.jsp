<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>m_findAll.jsp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
</head>
<body>
	<h2>m_findAll.jsp</h2>
	
	<h2>회원목록</h2>
		<table class="table table-dark">
	<tr>
		<th>번호</th>
		<th>아이디</th>
		<th>비밀번호</th>
		<th>이름</th>
		<th>이메일</th>
		<th>프로필사진</th>
		<th>상세조회</th>
		<th>삭제</th>
		<th>수정</th>
	</tr>
		<c:forEach items="${memberList}" var="member">
		<tr>
			<td>${member.m_number}</td>
			<td>${member.m_id}</td>
			<td>${member.m_password}</td>
			<td>${member.m_name}</td>
			<td>${member.m_email}</td>
			<td><img alt="" src="/resources/upload/${member.m_filename}"></td>
			<td><a href="m_detail?m_number=${member.m_number}">조회</a></td>
			<td><a href="m_delete?m_number=${member.m_number}">삭제</a></td>
			<c:if test="${sessionScope.loginId eq member.m_id}">			
			<td><a href="m_update?m_number=${member.m_number}">수정</a></td>
			</c:if>
		</tr>
		</c:forEach>
	</table>	
				<br><br><br>
		<td><a href="/">첫페이지로</a></td>
</body>
</html>