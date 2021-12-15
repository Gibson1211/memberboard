<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board_detail.jsp</title>
<link href="/resources/css/bgcolor.css" rel="stylesheet">
<script src="//code.jquery.com/jquery-3.4.1.min.js"></script>
</head>
<body>
	<h2>detail.jsp</h2>
	
	글번호: ${board.b_number}<br>
	제목: ${board.b_title}<br>
	작성자: ${board.b_writer}<br>
	조회수: ${board.b_hits} <br>
	작성일자: ${board.b_date}<br>
	파일이름: <img alt="" src="/resources/upload/${board.b_filename}"><br>

	<c:choose>
		<c:when test="${sessionScope.loginId eq board.b_writer}">
		<a href="/board/delete?b_number=${board.b_number}">삭제</a>
		<a href="/board/update?b_number=${board.b_number}&page=${page}">수정</a>
		</c:when>
		
		<c:when test="${sessionScope.loginId eq 'admin'}">
		<td><a href="/board/delete?b_number=${board.b_number}">삭제</a></td>
		</c:when>
	</c:choose>
		
		<a href="/board/paging?page=${page}">목록</a>
		
	<!-- 댓글 작성 -->
	<div id="comment-write">
		<input type="text" id="c_writer" value="${sessionScope.loginId}">
		<input type="text" id="c_contents" placeholder="댓글내용">
		<button id="comment-write-btn">댓글등록</button>
	</div>
	
	<!-- 댓글목록 출력 -->
	<div id="comment-list">
	<table class="table">
		<tr>
			<th>댓글번호</th>
			<th>작성자</th>
			<th>내용</th>
			<th>작성시간</th>
		</tr>
		<c:forEach items="${commentList}" var="comment">
			<tr>
				<td>${comment.c_number}</td>
				<td>${comment.c_writer}</td>
				<td>${comment.c_contents}</td>
				<td>${comment.c_date}</td>
			</tr>
		</c:forEach>
	</table>
  </div>
  
  		<br><br><br>
		<td><a href="/">첫페이지로</a></td>
  
</body>
<script>
	$("#comment-write-btn").click(function(){
		console.log("댓글등록버튼 클릭");	
		
		const commentWriter = $("#c_writer").val();
		const commentContents = $("#c_contents").val();
		const boardNumber = '${board.b_number}';
		console.log(commentWriter, commentContents, boardNumber);
		$.ajax({
			type: 'post',
			url: '/comment/save',
			data: {
				'c_writer':commentWriter,
				'c_contents': commentContents,
				'b_number': boardNumber},
			dataType: 'json',
			success: function(result) {
				console.log(result);
				let output = "<table class='table'>";
				output += "<tr><th>댓글번호</th>";
				output += "<th>작성자</th>";
				output += "<th>내용</th>";
				output += "<th>작성시간</th></tr>";
				for(let i in result){
					output += "<tr>";
					output += "<td>"+result[i].c_number+"</td>";
					output += "<td>"+result[i].c_writer+"</td>";
					output += "<td>"+result[i].c_contents+"</td>";
					output += "<td>"+result[i].c_date+"</td>";
					output += "</tr>";
				}
				output += "</table>";
				document.getElementById('comment-list').innerHTML = output;
				document.getElementById('c_writer').value='';
				document.getElementById('c_contents').value='';
			},
			error: function() {
				console.log("오류입니다.")
			}
			
		});

	});	
	
</script>

</html>