<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>start.jsp</title>
</head>
<body>

<a href='simpleView.jsp'>기존방식</a><hr/><!--해당방식은 이미지를 가지고 오지 못함  -->

<a href='/JSP/SimpleControl'>MVC 방식</a><br/>
<!-- 사용자의 요청에의해서 SimpleControl를 통해서 simpleView.jsp를 보여줌, 결국 사용자는 열리는 경로에 대해서 알지 못함-->
<!--url을 통해 파일 경로를 추적하지 못하게 하면서, 리소스는 제공하기 위함-->
<a href='/JSP/xxxx.oh'>MVC 방식</a><br/>2
</body>
</html>