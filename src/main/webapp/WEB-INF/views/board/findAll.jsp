<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board_findAll.jsp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
</head>
<body>
	<h2>글목록</h2>
	<br>
	<form action="/board/search" method="get">
		<select name="searchtype">
			<option value="b_title">제목</option>
			<option value="b_writer">작성자</option>
		</select>
			<input type="text" name="keyword" placeholder="검색어..">
			<input type="submit" value="검색">
	</form>	
	<br>
	
	<a href="/member/m_mypage?m_number=${loginNumber}">마이페이지</a><br><br>
	<a href = "/board/save">글쓰기화면</a><br><br>
	
		<c:if test="${sessionScope.loginId eq 'admin'}">
		<a href="/member/m_findAll">회원목록(관리자)</a>
		</c:if>
		
		<br><br><br>
		
		<c:if test="${sessionScope.loginId eq 'admin'}">
		<a href="/board/findAll">글목록(관리자)</a>
		</c:if>
		
		<br><br><br>
	
	
		<table class="table table-dark">
	<tr>
		<th>글번호</th>
		<th>제목</th>
		<th>작성자</th>
		<th>조회수</th>
		<th>작성시간</th>
		<th>첨부파일명</th>
		<c:if test="${sessionScope.loginId eq 'admin'}">
		<th>삭제(admin)</th>
		</c:if>		
	</tr>
		<c:forEach items="${boardList}" var="board">
		<tr>
			<td>${board.b_number}</td>
			<td><a href="/board/detail?b_number=${board.b_number}&page=${paging.page}">${board.b_title}</a></td> 
			<td>${board.b_writer}</td> 
			<td>${board.b_hits}</td>
			<td>${board.b_date}</td>
			<td><img alt="" src="/resources/upload/${board.b_filename}"></td>
			<c:if test="${sessionScope.loginId eq 'admin'}">
      		<td><a href="/board/delete?b_number=${board.b_number}">삭제</a></td>         
		</c:if>		
		</tr>
		</c:forEach>
	</table>
	
	<div>
		<c:choose>
			<c:when test="${paging.page<=1}">
				[이전]&nbsp;
			</c:when>
			<c:otherwise>
			<!-- 현재 페이지에서 1감소한 페이지 요청하는 링크 -->
				<a href="paging?page=${paging.page-1}">[이전]</a>&nbsp;
			</c:otherwise>
		</c:choose>
		
		<c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="i" step="1">
			<c:choose>
				<c:when test="${i eq paging.page}">
					${i}
				</c:when>
				<c:otherwise>
					<a href="paging?page=${i}">${i}</a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
	
		<c:choose>
			<c:when test="${paging.page>=paging.maxPage}">
				[다음]
			</c:when>
			<c:otherwise>
				<a href="paging?page=${paging.page+1}">[다음]</a>
			</c:otherwise>
		</c:choose>
	</div><br><br>

		<td><a href="/">첫페이지로</a></td>
		
		
		

		
</body>
</html>