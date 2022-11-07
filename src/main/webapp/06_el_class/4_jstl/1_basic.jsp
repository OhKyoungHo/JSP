<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL 기초문법</title>
</head>
<body>

<!-- 	Less Than   Lt   <
		Greater Than   Gt   >
		Less Than Or Equal   Le   <=
		Greater Than Or Equals   Ge   >= 
		-->
<!-- 변수선언 -->
<c:set var='gender' value='male'/>
<!--if문   -->
<c:if test="${ gender eq'male'}">당신은 남성</c:if>
<c:if test="${ gender eq'female'}">당신은 여성</c:if>

<!-- 변수선언 -->
<c:set var='age'>19</c:set>
<!--choose문   -->
<c:choose>
	<c:when test="${ age lt 10}">어린이입니다.</c:when>
	<c:when test="${ age ge 10 and age lt 20}">청소년입니다.</c:when>
	<c:otherwise>성인입니다.</c:otherwise>
</c:choose>
<hr/>

<c:set var='sum' value='0'/>
<c:forEach var='i' begin='1' end='100'>
<c:set var= 'sum' value='${sum+i}'/>
</c:forEach>
1~100까지의 합 : ${sum}<hr/>

<!-- 1부터 100까지의 짝수의 합 구하기(조건문 활용하면 된다!) -->
<c:set var='evensum' value='0'/>
<c:forEach var='i' begin='1' end='100'>
	<c:if test="${ i mod 2 eq 0}"><c:set var= 'evensum' value='${evensum+i}'/></c:if>
</c:forEach>
1~100까지의 짝수의 합 : ${evensum}<hr/>

<!-- 1부터 100까지의 홀수의 합 -->
<c:set var='oddsum' value='0'/>
<c:forEach var='i' begin='1' end='100'>
	<c:if test="${ i mod 2 eq 1}"><c:set var= 'oddsum' value='${oddsum+i}'/></c:if>
</c:forEach>
1~100까지의 홀수의 합 : ${oddsum}<hr/>

<!-- step : 각 반복마다 증가값 설정 -->
<c:set var='sum1' value='0'/>
<c:forEach var='i' begin='0' end='100' step = '2'>
<c:set var= 'sum1' value='${sum1+i}'/>
</c:forEach>
1~100까지의 짝수의 합 : ${sum1}<hr/>

<c:set var='sum2' value='0'/>
<c:forEach var='i' begin='1' end='100' step = '2'>
<c:set var= 'sum2' value='${sum2+i}'/>
</c:forEach>
1~100까지의 홀수의 합 : ${sum2}<hr/>

</body>
</html>


<!-- 

*JSP 기초문법
< %@% > : 설정
		 - page
		 - include
		 - taglib : JSTL 사용	


< %!% > : 선언(변수, 함수)
< %% > : 스크립트릿(자바코드)
< %=% > : 표현식(화면결과 출력)
 -->