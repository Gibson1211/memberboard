<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>m_save.jsp</title>
<style>
	input {
		display: block;
	}
</style>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>	
<script>
	function idDuplicate(){
		const id = document.getElementById('m_id').value;
		console.log(id);
		const checkResult = document.getElementById('id-dup-check');
		$.ajax({
			type: 'post', 
			url: 'idDuplicate', 
			data: {'m_id': id},
			dataType: 'text',
			success: function(result) {	 
				console.log('ajax 성공');
				console.log(result);
			if(result=="ok"){
				checkResult.style.color = 'green';
				checkResult.innerHTML = '멋진 아이디네요!!';
			} else {
				checkResult.style.color = 'red';
				checkResult.innerHTML = '이미 사용중인 아이디입니다.';					
			}
			},
			error: function() {	
				console.log('오타 찾으세요.');	

			}
	
		});
	}
</script>
<script>
	function imagePre(event) {
		console.log(event);
	}
</script>
</head>
<body>
	<h2>m_save.jsp</h2>
		
	<form action="/member/m_save" method="post" enctype="multipart/form-data">
			아이디:<input type="text" name="m_id" onblur="idDuplicate()" id="m_id"><br/>
			<span id="id-dup-check"></span> <br>
			비밀번호:<input type="text" name="m_password"><br/>
			이름:<input type="text" name="m_name"><br/>
			이메일:<input type="email" name="m_email"><br/>
			파일: <input type="file" name="m_file">
			<input type = "submit" value="회원 등록">
		</form>
		<br><br><br>
		<td><a href="/">첫페이지로</a></td>
		
		<div id="images-preview">
	
		</div>
</body>
</html>