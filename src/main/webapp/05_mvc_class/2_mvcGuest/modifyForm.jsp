<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="mvc.guest.*" %>
<%
	// 1. 수정할 레코드의 게시글번호를 넘거받기
	String msg = request.getParameter("id");

	
%>   
     
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시글 수정하기</title>
</head>
 <body>
	<h4> 게시판 글 수정하기 </h4><br/>
	<form action='BoardModify.jsp' name='frm' method='post'>
	<input type='hidden' name='id' value='id'>
	이   름 : <input type='text' name='name'value='guestname'><br/><br/>
	패스워드(수정/삭제시 필요) :
			<input type='password'name='pass'><br/><br/>
	내  용 : <textarea name='message' rows='10' cols='40'><%= msg.getMessage() %></textarea><br/><br/>
	

	<input type='submit' value='수정하기'>
	<input type='button' value='목록보기' onclick="window.location='BoardList.jsp'">
	</form>

</body>
</html>