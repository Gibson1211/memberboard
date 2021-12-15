<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board_save.jsp</title>

<script>
	function imagePre(event) {
		console.log(event);
	}
</script>

</head>
<body>
	<h2>save.jsp</h2>
	<form action="/board/save" method="post" enctype="multipart/form-data">
		제목: <input type="text" name="b_title"> <br> 
		작성자: <input type="text" name="b_writer" value="${sessionScope.loginId}"> <br> 
		내용: <textarea name="b_contents" rows="5"></textarea><br>
		파일: <input type="file" name="b_file">
		<input type="submit" value="작성">
	</form>
	
	<div id="images-preview">
	
	</div>
	
			<br><br><br>
		<td><a href="/">첫페이지로</a></td>
	
</body>
</html>