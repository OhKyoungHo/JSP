<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="member.dao.*" %>
<% 
///0. 한글처리
request.setCharacterEncoding("utf-8");

//1. 이전 폼의 입력값 얻어오기(대소문자 주의)
String realname	 = request.getParameter("realname");
String nickname	 = request.getParameter("nickname");
String email	 = request.getParameter("myemail");
int age		     = Integer.parseInt(request.getParameter("myage"));

//2. vo객체에 저장하기
	MemberVO vo= new MemberVO();
 	vo.setRealname(realname);	 
 	vo.setNickname(nickname);	
 	vo.setEmail(email);	
 	vo.setAge(age);	

//3. db에 입력하기
//외부에서 호출 시 new를 사용하지 않고 getInstance를 사용하여 객체를 생성하거나 반환
	MemberDAO dao = MemberDAO.getInstance();		//private로 설정해서 오류발생
	dao.insert(vo);

%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 성공적으로 입력되었지 DB에서 확인합니다.
	 <hr/>
	 <!-- 4.얻어온 입력값을 출력  -->
	 	입력한 이름 	: <%= realname %><br/>	
		입력한 닉네임	: <%= nickname %>
		입력한 이메일	: <%= email  %>
		입력한 나이		: <%= age  %>
	
</body>
</html>