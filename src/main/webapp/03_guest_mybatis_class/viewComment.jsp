<%@ page language="java" contentType="text/html; charset=utf-8"%>
 <%@ page import="mybatis.guest.model.Comment" %>   
 <%@ page import="mybatis.guest.service.CommentService" %>   
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>  
    
      
  <!-- 키에 해당하는 글번호를 넘겨받아 서비스의 메소드 호출  -->
  <% 
  int commentNo = Integer.parseInt(request.getParameter("cId"));
  Comment comment = CommentService.getInstance().selectCommentByPrimaryKey(commentNo);
  %>
 <script type="text/javascript">
 $(function(){
	 $('#btnDelete').click(function(){
		 window.location = "deleteCommentForm.jsp?cId=<%=comment.getCommentNo()%>";
	 })
 })
 
  $(function(){
	 $('#btnModify').click(function(){
		 window.location = "modifyCommentForm.jsp?cId=<%=comment.getCommentNo()%>";
	 })
 })
 
 </script>

<!DOCTYPE HTML> 
<html>
<head> 
	<meta charset="UTF-8">
<title> 메세지 보기 </title>
</head>
<body>
<table border="1">
		<tr><td>작성자</td><td><%=  comment.getCommentNo()%></td></tr>
		<tr><td>메세지</td><td><%=  comment.getCommentContent()%></td></tr>
		<tr><td>등록일</td><td><%=  comment.getRegDate()%></td></tr>
		<tr><td colspan="2">
				<input type="button" id="btnModify" value="수정" name="cId"/>
				<input type="button" id="btnDelete" value="삭제" name="cId" />
				</td></tr>
</table>
</body>
</html>