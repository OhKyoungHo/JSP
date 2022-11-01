<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title> 아이디 중복 검사 </title>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
	/*중복체크 버튼을 클릭했을 때 .userinput의 사용자 입력값을
	userid라는 key값으로 IdCheck.jsp로 보낸다.*/
	$('#id_check').click(function(){
		//$('.userinput').keyup(function(){
		$.ajax({
			url : 'IdCheck.jsp',
			data: { id : $('.userinput').val()},
			success : function(data){
				//alert('<'+data+'>')
				if(data.trim()=='YES'){
					$('#idmessage').text('이미 존재하는 아이디입니다.')
					$('#idmessage').show();
				}else if(data.trim()=='NO'){
					$('#idmessage').text('사용 가능한 아이디입니다.')
					$('#idmessage').show();
				}
			}
			
			
			
		})
	})
	
})
</script>

</head>
<body>

<input name="id" type="text" class="userinput" size="15" />
<button type="button" id="id_check">중복체크</button><br/><br/>
<div id="idmessage" style="display:none;"></div>

</body>
</html>