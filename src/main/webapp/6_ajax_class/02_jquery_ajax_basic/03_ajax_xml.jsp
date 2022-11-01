<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title></title>
	<script  type="text/javascript"  src="libs/jquery-1.9.1.min.js"> </script>
<script type="text/javascript">
$(function(){
	var param = {cate : 'it', name: 'hong'}	
	
	$.ajax({
		type : 'get',	//전송방식
		data : param,	//보내는 데이터
		url: '03_server.jsp',	//요청 서버 페이지
		data : 'xml', //text(default)/html/xml/json
		success : function(data){		//성공시 연결함수
			//alert(data);
			$('#cate').val($(data).find('first').text());
			$('#name').val($(data).find('second').text());
		}
	});
	
})


</script>
</head>

<body>
서버로부터 넘겨받은 데이터<br/>
첫번째 데이터 : <input type="text" name="" id="cate"/><br/>
두번째 데이터 : <input type="text" name="" id="name"/><br/>
</body>
</html>


