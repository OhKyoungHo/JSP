<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="guest.model.*,guest.service.*" %>   
<%@ page import="java.util.List" %>
 
<%
//page라는 이름의 값을 가지고와서 pNum에 저장
	String pNum = request.getParameter("page");


	// 전체 메세지 레코드 검색 
	 ListMessageService service = ListMessageService.getInstance();
	 List <Message> mList = service.getMessageList(pNum);
	 
	 int totalPageCount =service.getTotalPage();
	 //새로운 변수 pageno을 1로 설정
	 int pageno=1;
	 //pNum이 null이 아니라면 pNum을 형 변환해서 pageno에 넣기
	 if(pNum!=null) {pageno=Integer.parseInt(pNum);}
	 
%>    
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script type="text/javascript">
/*$(function(){
	$('#prevbtn').click(function(){
		$.ajax({
			url : 'ListMessageService.jsp',
			success : function(data){
			
		})
		
	})
	
	$('#nextbtn').click(function(){
		alert('유지선')
		
	})
})*/

</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> 방명록 목록 </title>
</head>
<body>

	<% if( mList.isEmpty() ) { %>
		남겨진 메세지가 하나도~~없습니다. <br>
	<% } else { %>
	<table border="1">
	
		<% for(Message m : mList){%>
		<tr>	
			<td><%= m.getMessageId() %> </td> 
			<td><%=m.getGuestName() %> </td> 
			<td><a href='deleteMessage.jsp?messageId=<%=m.getMessageId() %>'>[삭제]</a></td>			
		</tr>
		<tr>
			<td colspan='3'> 
			<textarea cols=35 rows=3 style="font-family: '돋움', '돋움체'; font-size: 10pt; font-style: normal; line-height: normal; color: #003399;background-color:#D4EBFF;border:1 solid #00009C;">
			<%=m.getMessage() %>
			</textarea>
			</td>
		</tr>
<%}//end of for %>
	</table>
	
	<% } // end if-else %>

	<a href='insertMessage.jsp'>글쓰기</a>
	<hr/>
	<!--밑에 페이지번호 뜨게 만들기  -->
	<!-- <input type="button" value="<" id="prevbtn"></input> -->
	<!-- <input type='image' src='./imgs/left-arrow.png' height='10px'/> -->
	<a href="listMessage.jsp?page=1">[◀◀]</a>
	<%if(pageno>1){%><!--pageno가 1보다 크면 -1씩 이동 아닐  경우는 1페이지 유지 -->
	 <a href="listMessage.jsp?page=<%= pageno-1%>">[◀]</a>
	 <% }else{%> <a href="">[◀]</a><% }%>
	 <%for(int i=1; i<=totalPageCount; i++){ %>
		<a href='listMessage.jsp?page=<%=i %>'>[ <%= i %> ]</a>
	<% }//end of for %><%if(pageno==totalPageCount){%><!--pageno가 totalPageCount보다 크면 totalPageCoun페이지 유지 아닐 경우 +1씩 이동-->
	<a href="listMessage.jsp?page=<%=totalPageCount%>">[▶]</a><% }else{%>
	<a href="listMessage.jsp?page=<%=pageno+1%>">[▶]</a><% }%><a href="listMessage.jsp?page=<%=totalPageCount%>">[▶▶]</a>

	
	
</body>
</html>