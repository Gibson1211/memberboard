<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board_update.jsp</title>
<%--<script>
	function update() {
	const pw = document.querySelector('#b_password').value;
    const pw1 = document.getElementById('b_password').value;		
    const pwDB = '${board.b_password}';
 	console.log(pwDB);
 	if(pw==pwDB){
	update_form.submit();	 		
 	}else{
 		alert('비밀번호가 틀립니다.');
 	}

}		 
</script>  --%>
</head>
<body>
	<h2>update.jsp</h2>
	<form action="/board/update" method="post" name="update_form" enctype="multipart/form-data">
	<input type="hidden" name="page" value=${page}><br>
		글번호: <input type="text" name="b_number" value="${board.b_number}" readonly> <br>
		제목: <input type="text" name="b_title" value="${board.b_title}"> <br>
		작성자: <input type="text" name="b_writer" value="${board.b_writer}" readonly> <br> 
		내용: <textarea name="b_contents" rows="5">${board.b_contents}</textarea><br>
		프로필사진 : <input type ="file" name="b_file"><br>	
		<input type="button" value="수정" onclick="update()">
	</form>		
			<br><br><br>
		<td><a href="/">첫페이지로</a></td>
</body>
</html>