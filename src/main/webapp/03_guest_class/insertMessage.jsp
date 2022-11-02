<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> 방명록 </title>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.11.0/jquery.validate.min.js" ></script>
<script type="text/javascript">
$(function(){
	//메세지보내기 버튼을 눌렀을때
	$('#submitBtn').click(function(){
		//유효성검사
			$('form[name="frm"]').validate({
			rules : {
				guestName : { required : true, maxlength : 10 },
				password : { required : true, maxlength : 10 },
				message : { required : true, maxlength : 1024 }
			},
			messages :{
				guestName : { required : "아이디를 입력해주세요" },
				password : { required : "비밀번호를 입력해주세요" },
				message : { required : "메세지를 입력해주세요" }
			}
		});
		
		//폼에 있던 내용이 submit 됨
		$('form[name="frm"]').submit();
	})

});


</script>

</head>

<body>

	<form action="saveMessage.jsp" name="frm" method="get">
		이름 : <input type="text" name="guestName" required /><br/><br/>
		암호 : <input type="password" name="password" required /><br/><br/>
		메세지 : <textarea name="message" rows="3" cols="30" required></textarea><br/><br/>
		<input id='submitBtn' type="button" value="메세지 남기기">
	</form>
</body>
</html>