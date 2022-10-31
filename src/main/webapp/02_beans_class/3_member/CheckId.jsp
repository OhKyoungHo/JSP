<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="member.beans.MemberDao" %>  
    
    <% 
    //이름이 "userId"인 것에서 값 가져오기
    String userId = request.getParameter("userId");
    %>
    <%
    MemberDao dao = MemberDao.getInstance();
    //"userId"를 넣어 중복값인지 아닌지 확인하는 isDuplicatedId에 넣은 결과값을 변수 result에 넣기
    boolean result = dao.isDuplicatedId(userId);
    %>
  
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> 아이디 중복 확인 </title>
</head>
<body>
<%
	if(result) {
%>
		사용중인 아이디가 있습니다. 다시 입력하여 주십시오.
<%  }else { %>
		사용할 수 있는 아이디입니다.
<%  } %>
</body>
</html>