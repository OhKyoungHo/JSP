<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD Xhtml 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title></title>
	<script>
		var xmlHttp;
		//(1) 01_ajax_get.csv.jsp 페이지 접속
		window.onload=function(){
			// 1. 브라우저에 따른 XMLHttpRequest생성하기.
			xmlHttp = new XMLHttpRequest();
			
			// 2. 요청에 대한 응답처리 이벤트 리스너 등록.
			xmlHttp.onreadystatechange=on_ReadyStateChange;
			
			// (2)서버로 보낼 데이터 생성.
			// 3.데이터 생성.
			var data = "cate=book&name=kim";
			
			//###########################################################
			// 4. GET방식으로 데이터 보내기, 응답은 비동기로 클라이언트<->서버간의 연결 요청준비.
			//(3)get 방식으로 01_server.jsp?cate=book&name=kim 페이지를 엶
			xmlHttp.open("GET", "01_server.jsp?"+data, true);			
			// 5. 실제 데이터 전송.
			xmlHttp.send(null);
			//####
			 //(5)alert 띄움 ("전송 시작!")
			// T. 동기/비동기 실행 테스트를 위한 부분.
			alert("전송 시작!");
		}
		
			
		// 6.응답처리.
		/*  (6)on_ReadyStateChange() 메소드 수행 시작
			->화면의 상태(xmlHttp.readyState)가 순차적으로
		   초기화면(0), 로딩중(1) 로딩됨(2) 대화상태(3) 데이터전송완료(4)로 바뀜
         ( readyState의 값이 변경될 때마다 사용자 액션이 없더라도
           on_ReadyStateChange() 메소드에 등록된 callback 함수가 수행되어 총 4회 수행된다.)
     		→ 4까지 오면 서버로부터 응답이 성공인 것 */
		function on_ReadyStateChange(){
			// 4=데이터 전송 완료.(0=초기화전,1=로딩중,2=로딩됨,3=대화상태)
			// (7)4가 되면 if문 수행
			if(xmlHttp.readyState==4){
				//200은 에러 없음.(404=페이지가 존재하지 않음)
				//(8)xmlHttp.status == 200 인지 확인 
				if(xmlHttp.status==200){
					// (9)200일 경우 alert 띄움 ,서버에서 받은 값.
					alert("서버에서 받은 원본 데이터 : "+xmlHttp.responseText);
					
					//7. 데이터 파싱처리.
				//(10)parseData 함수로 데이터 파싱처리 수행하여 cate와 name에 해당하는 내용을 분리(01_server.jsp에서 받아온 구문 사용)
					parseData(xmlHttp.responseText);
				}
				else{
					alert("처리 중 에러가 발생했습니다.");
				}
			}
		}
		
		//##################################################
		//7. CSV포맷  데이터 처리.
		function parseData(strText){
			
			// alert( strText );
			
			var aryData = strText.split("|");// // |를 기준으로 문자열을 분리하여 배열로 담음
						
			for(var i=0;i<aryData.length;i++){
				var param  = aryData[i].split("=");		// =를 기준으로 분자열을 분리하여 배열로 담음				
				if( param[0].trim() == 'cate'){  // 공백제거를 하지 않으면 처음에 공백에 들어와서 cate를 찾지 못함
					// param[0]에 cate가 있으면 출력은 param[1]을 함
					//(11) 화면의 #cate에 해당하는 곳에 구문분석한 cate값을 대입하여 출력
					 document.getElementById("cate").value = param[1];
				}
				
				if( param[0].trim() == 'name'){
					// param[0]에 name이 있으면 출력은 param[1]을 함
					//(11) 화면의 #name에 해당하는 곳에 구문분석한 name값을 대입하여 출력
					document.getElementById("name").value = param[1];
				}
			
			}
			
		}
	</script>
</head>

<body>
서버로부터 넘겨받은 데이터<br/>
첫번째 데이터 : <input type="text" name="" id="cate"/><br/>
두번째 데이터 : <input type="text" name="" id="name"/><br/>
</body>
</html>


