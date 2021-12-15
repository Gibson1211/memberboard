<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>detail.jsp</title>
</head>
<body>
		<h2>detail.jsp</h2>
		<table class="table table-dark">
	<tr>
		<th>번호</th>
		<th>아이디</th>
		<th>비밀번호</th>
		<th>이름</th>
		<th>이메일</th>
		<th>프로필사진</th>
	</tr>

	<tr>
	<td>${member.m_number}</td>
	<td>${member.m_id}</td>
	<td>${member.m_password}</td>
	<td>${member.m_name}</td>
	<td>${member.m_email}</td>
	<td><img alt="" src="/resources/upload/${member.m_filename}"></td>
	
	<td><a href="/member/m_delete?m_number=${member.m_number}">삭제</a></td> 
	<td><a href="/member/m_update?m_number=${member.m_number}">수정</a></td>
	
	</tr>
	
	</table>
	
		<a href="/member/m_findAll">목록으로 돌아가기</a>
		
				<br><br><br>
		<td><a href="/">첫페이지로</a></td>
</body>
</html>