<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- java 코드 쓸때 '% %' 사용 -->
<%
	String id = request.getParameter("User");//User로 넘어온것을 id에 담음
	String pw = request.getParameter("Pass");//Pass로 넘어온것을 pw에 담음
%> 
   
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> 폼의 입력값 처리 </title>
</head>
<body>
	<h2>폼의 입력값 넘겨받아 처리</h2>
	입력한 아이디 :  <%= id %><br/>	<%-- 값을 화면에 출력시 '%= %' 사용--%>
	입력한 패스워드 : <%= pw %>
</body>
</html>