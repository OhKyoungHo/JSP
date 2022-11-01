<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>03_result.jsp</title>
</head>
<body>

<!-- 이전 화면에서 사용자 입력값을 얻어와서 화면 출력  -->
<!-- -request.getParameter("")
	 -request.getParameterValues  -->
<% 
request.setCharacterEncoding("utf-8");//한국어로 설정
String name = request.getParameter("name");	 //name이 "name"인 것을 가져오기
String [] animal = request.getParameterValues("animal"); //name이 "animal"인 것들을 가져오기
String animaltxt ="";
//animal 값이 배열이므로 반복문으로 설정
for(int i=0; animal !=null && i< animal.length; i++){
	animaltxt += animal[i]+'/';
	}
	%>	
	
	이름 : 		<%= name  %>
	좋아하는 동물 : <%= animaltxt  %>	
	 	 


</body>
</html>