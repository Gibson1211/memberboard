<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>update.jsp</title>
<style>
	input { 
		display: block;
		}
</style>
<script>
   function m_update(){
		console.log('update 함수호출');
	// 이 문장이 아래 form을 전송하는 문장
	//	update_form.submit();
	const pw = document.getElementById('m_password').value;
	console.log(pw);
	const pwDB = '${member.m_password}';
	console.log(pwDB);
	if(pw==pwDB){
		m_update_form.submit();
	} else {
		alert('비밀번호가 틀립니다.');
	}
}	   
</script>
</head>
<body>
	<h2>회원정보 수정 페이지</h2>
	<form action="/member/m_update" method="post" name="m_update_form" enctype="multipart/form-data">
		<input type="hidden" name="m_number" value="${member.m_number}">
		아이디: <input type="text" name="m_id" value="${member.m_id}" readonly>
		비밀번호: <input type="password" name="m_password" id="m_password">
		이름: <input type="text" name="m_name" value="${member.m_name}"readonly>
		이메일: <input type="text" name="m_email" value="${member.m_email}">
		프로필사진 : <input type ="file" name="m_file"><br>
		<input type="button" value="수정" onclick="m_update()">
			
	</form>
	
			<br><br><br>
		<td><a href="/">첫페이지로</a></td>
		
</body>
</html>