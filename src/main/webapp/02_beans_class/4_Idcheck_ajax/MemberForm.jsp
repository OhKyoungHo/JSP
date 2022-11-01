<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<title> 회원가입  </title>

</head>
<body>
<script type="text/javascript">
$(function(){
      function selectId(data){
         $("#result").text("");		//공백넣기(초기화)
         $("#result").text(data);	//데이터 보내기
      }
      //중복확인 버튼을 누를때
      $("#id_check").click(function(){
         $.ajax({
            type      	: "get",	//전송방식
            url         : "IdCheck.jsp",	//요청서버 페이지
            data        : { id : $("input[name='id']").val() },//키 id설정 및 키에 대한 값 설정
            dataType   	: "text",	
            success    	: selectId	//성공시 연결함수
         });
      });
   })

</script>


<h1>회원가입서 작성하기</h1>
 
	<form action="InsertMember.jsp" method="post" name="frm">
		<table>
			<tr>
				<td width="100">
				<font color="blue">아이디</font>
				</td>
				<td width="100">
				<input type="text" name="id" class='userinput'>
				<input type="button" id="id_check" value="중복확인" ><br/>
				<div id='result'></div>
				</td>
			</tr>
			<tr>
				<td width="100">
				<font color="blue">비밀번호</font>
				</td>
				<td width="100">
				<input type="password" name="password"/><br/>
				</td>
			</tr>
			<tr>
				<td width="100">
				<font color="blue">비밀번호학인</font>
				</td>
				<td width="100">
				<input type="password" name="repassword"/><br/>
				</td>
			</tr>
			<tr>
				<td width="100">
				<font color="blue">이름</font>
				</td>
				<td width="100">
				<input type="text" name="name"/><br/>
				</td>
			</tr>
			<tr>
				<td width="100">
				<font color="blue">전화번호</font>
				</td>
				<td>
				<input type="text" size="15" name="tel"/>
				<br/>
				</td>
			</tr>
			<tr>
				<td width="100">
				<font color="blue">주소</font>
				</td>
				<td>
				<input type="text" size="50" name="addr"/><br/>
				</td>
			</tr>
			<tr>
				<td width="100">
				 <!--로그인 버튼-->
				 <input type="submit" value="회원가입">
				</td>
				<td width="100">
				<input type="reset" name="cancel" value="취소"><br/>
				</td>
			</tr>
		</table>
	</form>



 </body>
</html>
    