<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title> 고객관리 프로그램 </title>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>

<script type="text/javascript" >

$(function(){
	//입력 버튼을 눌렀을때 화면에 입력값을 받아서 DB에 출력
	$('#btnInsert').click(function(){
		//원래 통신
		/*  (8-1) 일반적인 방법 사용
          InputCustomer.jsp 에서 입력하기 버튼이 눌렸을 때 화면의 입력값을 받아 DB에 넣는 함수를 작성한다. 
          → 보통의 정상적인 통신 - 화면이 바뀌면서 데이터가 전송됨
          → <form> 태그에 데이터 전송을 위한 속성을 부여 (action="DataInput.jsp") */
		//$('form').attr('action', 'DataInput.jsp');
		//$('form').submit();
		
		//AJAX 통신
		// submit()을 사용하지 않기 때문에 데이터가 넘어가지 않을 수 있어서 별도로 변수에 담은 뒤 전송 
		//(1) 사용자 입력값을 객체 형식으로 저장
		// 	-> 추후에 폼객체 serialize() 참고
		//데이터를 담을 별도의 변수 생성
		var param ={
				name : 	$('#name').val(),
				age : 	$('#age').val(),
				tel : 	$('#tel').val(),
				addr : 	$('#addr').val()
		}
		//alert(param);
		
		/*InputCustomer.jsp 에서 입력하기 버튼이 눌렸을 때 화면의 입력값을 받아 DB에 넣는 함수를 작성한다. 
          → submit()을 사용하지 않기 때문에 데이터가 넘어가지 않을 수 있어서 별도로 변수에 담은 뒤 전송
          → 입력 성공 후 1(성공의 결과를 1로 설정) 이라는 결과가 오더라도 통신과정에서 공백이 있을 경우
            입력 실패 alert가 나올 수 있기에 trim() 필수   */

		$.ajax({
			url: 'DataInput.jsp',
			data : param,
			success : function(data){
				//alert('<'+ data +'>')
				//결과값이 1일 경우
				if(data.trim() =='1'){
					alert('입력성공');
					//화면 입력값 초기화
					$('#name').val('');
					$('#age').val('');
					$('#tel').val('');
					$('#addr').val('');
				}else{
					alert('입력실패');
				}
			}
		});
	})
	
	// '가져오기' 버튼이 눌렸을 대 DB의 값을 받아와 테이블에 출력
	$('#btnSelect').click(function(){
		$.ajax({
			url: 'DataSelect.jsp',
			dataType : 'xml',
			success : selectResult
		})
	})
	
	function selectResult(data){
		//alert(data)
		//console.log(data);
		var person =$(data).find('person');
		//alert(person.length);
		
		$('#tbd').empty();//내용이 추가되어도 기존에 있는 내용들은 같이 나오지 않게함
		
		person.each(function(){
			var name = $(this).find('name').text();
			var age = $(this).find('age').text();
			var tel = $(this).find('tel').text();
			var addr = $(this).find('addr').text();
			
			$('#tbd').append('<tr>'
					+ '<td>'+ name +'</td>'
					+ '<td>'+ age +'</td>'
					+ '<td>'+ tel +'</td>'
					+ '<td>'+ addr +'</td>'
					+'</tr>')
		})//end of each
		
	}//end of selectResult
	
	
})


</script>

</head>


<!-- <body> -->
<body>

<h2> 고객정보 입력 </h2>

<form name="inForm" method="post">
<table border = 1>
	<tr>
		<td width="80" align="center">Name</td>
		<td width="50" align="center">Age</td>
		<td width="100" align="center">Tel</td>	
		<td width="250" align="center">Addr</td>
	</tr>
	<tr>
		<td align="center"><input type="text" size="8" name="name" id="name"></td>
		<td align="center"><input type="text" size="4" name="age" id="age"></td>
		<td align="center"><input type="text" size="12" name="tel" id="tel"></td>
		<td align="center"><input type="text" size="30" name="addr" id="addr"></td>
	</tr>
	<tr>
		<td colspan="4" align="center"> 
			<input type="button" id='btnInsert' value="입력">
		</td>
	</tr>
</table>

<br>
<hr>

<h2> 고객정보 목록보기  </h2>
<table border='0' width="510"> 
	<tr>
		<td align="right"><input type="button"  id='btnSelect' value="가져오기"></td>
	</tr>
</table>
<table border = 1 id="listTable">
	<tr>
		<td width="80" align="center">Name</td>
		<td width="50" align="center">Age</td>
		<td width="100" align="center">Tel</td>	
		<td width="250" align="center">Addr</td>
	</tr>
	<tbody id='tbd'></tbody>
</table>
<div id="myDiv"> </div>

</form>
</body>
</html>