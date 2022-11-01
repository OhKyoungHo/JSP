<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<script  type="text/javascript"  src="libs/jquery-1.9.1.min.js">
$(function(){
		var param = {cate : 'book', name: 'hong'}	
	
$.ajax({
		type :'post',	// 전송방식
		data : param,	// 보내는 데이터
		url : '02_server.jsp',	// 요청 서버 페이지
		success : parseData,	// 성공시 연결 함수
		errror : function(err){	// 실패시 연결 함수
			alert('error');
			console.log(err);	//실패에 대한 기록
		}
		
	}); 
		
		//7. CSV포맷  데이터 처리.
		function parseData(strText){
			
			// alert( strText );
			
			var aryData = strText.split("|");// | 로 나누기
						
			for(var i=0;i<aryData.length;i++){
				var param  = aryData[i].split("=");		// =를 기준으로 분자열을 분리하여 배열로 담음			
				if( param[0].trim() == 'cate'){  // 공백제거를 하지 않으면 처음에 공백에 들어와서 cate를 찾지 못함
					 document.getElementById("cate").value = param[1];
				}
				if( param[0].trim() == 'name'){
					document.getElementById("name").value = param[1];
				}
			
			}
			
		}		
		
		
})
</script>
</head>


<body>
서버로부터 넘겨받은 데이터<br/>
첫번째 데이터 : <input type="text" name="" id="cate"/><br/>
두번째 데이터 : <input type="text" name="" id="name"/><br/>
</body>
</html>


