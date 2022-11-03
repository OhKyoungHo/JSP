<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="board_ex.model.*,board_ex.service.*" %>

<%
	request.setCharacterEncoding("utf-8");
%>

<!-- 전 화면의 입력값을 넘겨받아 BoardVO 클래스의 각 멤버 필드에 지정 -->
<jsp:useBean id="rec" class="board_ex.model.BoardVO">
	<jsp:setProperty name="rec" property="*"/>
</jsp:useBean>
 
<%	//BoardDao에서 받아온 rec를 변수 seq에 저장 
	int seq =WriteArticleService.getInstance().write(rec); %>
<% 
	//BoardSave.jsp에서 새로고침을 하게 되면 중복 입력되기에
	// 추후에 입력 후 BoardView.jsp?seq=글번호 로 넘겨서 처리하고자
	//만약 BoardDao에서 받아오지 않으면 null 값 출력
	response.sendRedirect("BoardView.jsp?seq="+seq);%>	

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>게시판글저장</title>
</head>
<body>
입력되었는지 확인해보시구염...<br/>
만일 안되어도..환장하지 맙시다 !!! ^^
</body>
</html>