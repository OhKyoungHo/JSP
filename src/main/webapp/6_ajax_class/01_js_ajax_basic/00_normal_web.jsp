<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<%
	// ***  한글이 깨지는 문제가 있지만 전반적인 흐름만 이해합니다.
	request.setCharacterEncoding("UTF-8");
	// 각 이름에 해당하는 값들을 가지고 와서 변수에 저장
	String cate = request.getParameter("cate");
	String name = request.getParameter("name");
	if( cate == null ) cate = "";
	if( name == null ) name = "";
%>
    
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title></title>
</head>

<body>
<!--(1) 클라이언트가 00.normal.web.jsp 페이지에서 사용자 입력값 넣고 버튼 클릭-->
<form name="frm" action="00_server.jsp">
<input type="submit" value="server.jsp파일을 불러 데이터 받아옴">
<br/>
<!--  (3) 00_normal_web.jsp?cate=(    )&name=(    )인 
페이지로 다시 화면이 그려지고 사용자에게 출력 -->
서버로부터 넘겨받은 데이터<br/>
첫번째 데이터 : <input type="text" name="cate" id="cate" value="<%=cate%>"/><br/>
두번째 데이터 : <input type="text" name="name" id="name" value="<%=name%>"/><br/>

</form>

</body>
</html>


