<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%!String msg; %>		<!-- 변수나 함수 선언    --> 
    
<%
	msg="안녕하세요~~";
%> 

<!-- html 주석  -->    
<%-- jsp 주석 --%>
<% //java 주석 %>   
<!-- 가장 비효율적인 주석 : html(가장 마지막까지 남아있다.)  --> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
메세지 : <%= msg %>
</body>
</html>