<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	//1) 이전화면에서 사용자 입력값들을 얻어오기
	//	-- request.getParameter('')
		String name		  = request.getParameter("name");
		String gender 	  = request.getParameter("gender");
		String occupation = request.getParameter("occupation");
		String []hobbys   = request.getParameterValues("hobby");
		String hobbytxt ="";
		//1)
		/* if(hobbys != null){
			for(int i=0; i<hobbys.length; i++){
				hobbytxt +=hobbys[i]+'/';
			}
		} */
		//2)
		if(hobbys != null){
			for(int i=0; hobbys != null &&  i<hobbys.length; i++){
				hobbytxt +=hobbys[i]+'/';
			}
		}
		
	//	-- request.getParameterValues('')

%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>02_check.jsp</title>
</head>
<body>
	<!-- 2)얻어온 입력값들을 화면에 출력하기 -->
	입력한 이름 : <%= name %><br/>	
	입력한 성별:  <%= gender %>
	입력한 직업 : <%= occupation  %>
	입력한 취미 : <%= hobbytxt  %>
<%-- <% for(int i=0; i<hobbys.length; i++){
		out.println(" "+hobbys[i]);}%>  --%>
	
	
</body>
</html>