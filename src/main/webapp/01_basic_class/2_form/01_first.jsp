
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><!--있어야 글이 깨지지 않음  -->
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title> 로그인창 </title>
</head>
<body>

<h3>로그인 확인하기 </h3> 
<form action="01_second.jsp" method="post"><!-- get 방식이면 주소창에 id와 비밀번호가 나오게됨, post를 통해 안보이게 함 -->
사용자: <input name='User' type='text'><br/>
비밀번호: <input name='Pass' type='password'><br/>
<input type='submit' value='login'> <!-- sumit : 사용자 입력값을 서버로 전송  -->
</form>

</body>
</html>