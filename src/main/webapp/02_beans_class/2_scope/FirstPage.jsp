<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%  //--------------------------- 값 지정
	pageContext.setAttribute("name", "KIM");
	request.setAttribute("name", "SEUNGMIN");
	session.setAttribute("name", "DOKDO");
	application.setAttribute("name", "KOREA");			 /*모든 사용자들이 공유 가능 */
	//application.log("FirstPage.jsp : " + pageContext.getAttribute("name") + "님 접속");
%>

<!-- getParameter() 와 getAttribute() 의 차이점
		getParameter() 는 String을 getAttribute() 는 Object 를 리턴합니다.(클라이언트에서 넘어오는 테이터를 받을때)
		getParameter() 는 Client( Web Browser ) 에서 전송받은 request영역의 값을 가져옵니다.
		getAttribute() 는 setAttribute() 를 통하여 값을 받아오는데, 값이 입력되지 않는다면 무조건 null 값입니다.  -->
<!-- request.getAttribute() : request.setAttribute()에 저장된 값 얻어오기, 요소 속성 접근하기
	 setAttribute() : 요소 속성 추가(수정)
	 removeAttribute() : 요소 속성 제거 -->

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> 첫번째 페이지 </title>
</head>
<body>

하나의 페이지 속성 : <%= pageContext.getAttribute("name") %> <br>
하나의 요청 속성 :	 <%= request.getAttribute("name") %> <br>
하나의 세션 속성 :	 <%= session.getAttribute("name") %> <br>
하나의 어플리케이션 속성 : <%= application.getAttribute("name") %> <br>

<!-- #############  -->
<!-- <a href=''>다음</a> -->
<%-- <% response.sendRedirect("SecondPage.jsp");%> --%> <!-- 해당 경우에는 두번째 페이지의 값으로  나오게 된다  -->


<!-- 페이지 forward 이동된다면  -->
<jsp:forward page="SecondPage.jsp"></jsp:forward>
		

</body>
</html>