<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>		


<%	
	// 1. Cookie 객체 생성
	Cookie c= new Cookie("yourid","oh");
	// 2. 속성 부여
	c.setMaxAge(1*60*3);//3분(if 180으로 주면 읽기 늦어질 수 있음)
	// 3. 클라이언트에 쿠키 전송(값을 보내는 경우에는 response)
	response.addCookie(c);
%>

<html>
<head><title>쿠키</title></head>
<body>

<b>Simple Cookie Example</b><hr>

<br><a href="01_GetCookie.jsp"> 쿠키검색 </a>

</body></html>