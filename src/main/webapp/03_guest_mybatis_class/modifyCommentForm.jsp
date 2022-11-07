<%@ page language="java" contentType="text/html; charset=utf-8"%>
 <%@ page import="mybatis.guest.model.Comment" %>    
 <%@ page import="mybatis.guest.service.CommentService" %>   

 <!--  이전 폼에서 넘겨오는 데이타의 한글 처리  -->
 <% 
 	request.setCharacterEncoding("utf-8"); %>

 
 <!-- 서비스의 메소드 호출  -->
  <% 
  int commentNo = Integer.parseInt(request.getParameter("cId"));
  Comment comment = CommentService.getInstance().selectCommentByPrimaryKey(commentNo);
  %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수정하기</title>
</head>
<body>
	<h4> 수정하기 </h4><br/>
	<form name="frm" action="modifyCommentSave.jsp" >
<table>
	<tr><td>글번호</td><td><input type="text" name="commentNo" size="3" value=<%=comment.getCommentNo()%>/></td></tr>
	<tr><td>사용자</td><td><input type="text" name="userId" size="15" value=<%=comment.getUserId()%>/></td></tr>
	<tr><td>메세지</td><td><textarea name="commentContent" rows="10" columns="40" ><%=comment.getCommentContent()%></textarea></td></tr>
	<tr><td><input type="submit" value="입력"/></td></tr>
</table>
</form>

</body>
</html>