<%@ page import="java.util.*" contentType="text/html; charset=UTF-8" 
pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head><title> Number Guess </title></head>
<body>

<%! int answer=0; %>
<%! int numGuesses=0; %>

<!-- request.getParameter : 데이터의 값을 읽어오는 역할 
guess 라는 키값을 가져와서 guess라는 String 변수에 저장
-->

<% String guess=request.getParameter("guess");
	 	//guess 값이 null값일때 게임시작
		if( guess==null ) {
%>
			<p>Welcome to the Number Guess game. </p>
			<!--1부터 100중에서 랜덤으로 나오는 정수 값을 answer에 저장  -->
<% 			answer= (int)( Math.random()*100 )  + 1;
			//추측횟수를 0으로 설정
			numGuesses=0;
		//guess 값이 null값이 아닐 경우	
		} else {
			//String guess 값을 int로 변환
			int value =  Integer.parseInt(guess);
			//숫자를 맞췄을때
			if( value==answer ){
%>
					<p>Congratulations!!! you got it.<br/><br/>
					And after just <%= numGuesses %> tries..</p>
					<!--다시 처음화면으로 돌아가도록 설정  -->
					<p>Care to <a href="01_QuizNumber.jsp"> try again </a> </p>
<%			//숫자를 못맞췄을때
		} else {
%>
				Good guess, but nope. try
				<!--추측횟수 +1-->
<%				numGuesses++;
				//제시한 숫자가 정답보다 작을때		
				if( value < answer ) {
%>
						<b> higher </b>
				<!-- 제시한 숫자가 정답보다 클때 -->	
<%			} else  if( value > answer ) {
%>
						<b> lower </b>
<%			} 
			}
		}		
%>
		<p>I'm thinking of a number between 1 and 100. </p>
		
		<form method='get' action="">
				What's your guess?
				<input type='text' name='guess'>
				<input type='submit' value="전송">
		</form>
	</body>
</html>
