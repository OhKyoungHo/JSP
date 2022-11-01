<%@page import="javax.management.Query"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="member.beans.MemberDao" %>



<% String id = request.getParameter("id"); %> 
<% System.out.print(id); %>
<% 
/* 새로운 객체 dao 만들기 */
/*전달받은 입력값을 변수에 담은 뒤 MemberDao의 객체를 생성하여 isDuplicatedId()함수를 수행한다.
(isDuplicaatedId()는 String인자를 받아가는 함수이고, 결과값으로 Boolean값을 리턴한다.)*/


   MemberDao dao = MemberDao.getInstance();
   /* 아이디가 중복되는지에 대해서 함수호출 후 값을 boolean에 저장 */
   
  /*결과값인 Boolean에 따라 알림창으로 보낼 내용을 결정하고 MemberForm.jsp로 보낸다.  (out.print)*/
	
  boolean result = dao.isDuplicatedId(id);
   //id가 아무것도 없거나 null값인 경우
   if(id==""||id==null){
	   out.print("아이디를 입력해주세요.");
	   return;
   }
   if( result )   out.print("사용중인 아이디입니다.");
   else         out.print("사용 가능한 아이디입니다.");
%>


