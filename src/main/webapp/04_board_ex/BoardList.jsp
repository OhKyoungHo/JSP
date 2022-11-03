<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="board_ex.model.*, board_ex.service.*" %>
<%@ page import="java.util.List" %>

<%  //웹브라우저가 게시글 목록을 캐싱할 경우 새로운 글이 추가되더라도 새글이 목록에 안 보일 수 있기 때문에 설정
	response.setHeader("Pragma","No-cache");		// HTTP 1.0 version
	response.setHeader("Cache-Control","no-cache");	// HTTP 1.1 version
	response.setHeader("Cache-Control","no-store"); // 일부 파이어폭스 버스 관련
	response.setDateHeader("Expires", 1L);			// 현재 시간 이전으로 만료일을 지정함으로써 응답결과가 캐쉬되지 않도록 설정
%>


<%
//밑에 있는 페이징된 곳에서 page라는 이름의 값을 가지고와서 pNum에 저장
	String pNum = request.getParameter("page");


	// 전체 메세지 레코드 검색 
	 ListArticleService service = ListArticleService.getInstance();
	 List <BoardVO> mList = service.getArticleList(pNum);
	 
	 int totalPageCount =service.getTotalPage();
	 //새로운 변수 pageno을 1로 설정
	 int pageno=1;
	 //pNum이 null이 아니라면 pNum을 형 변환해서 pageno에 넣기
	 if(pNum!=null) {pageno=Integer.parseInt(pNum);}
	 
%>  


<HTML>
<head><title> 게시글 목록 </title>
</head>

<BODY>

	<h3> 게시판 목록 </h3>
	
	<table border="1" bordercolor="darkblue">
	<tr>
		<td> 글번호 </td>
		<td> 제 목 </td>
		<td> 작성자 </td>
		<td> 작성일 </td>
		<td> 조회수 </td>
	</tr>
	
	<% if( mList.isEmpty() ) { %>
		<tr><td colspan="5"> 등록된 게시물이 없습니다. </td></tr>
	<% } else { %>
	<!--  여기에 목록 출력하기  -->
	<!--게시글의 내용이 넘어오면 반복문으로 구동(tr구조를 반복)  -->
	<!-- 제목을 누르면 게시판 글 내용을 볼 수 있는 페이지로 이동 -->
	<%for(BoardVO vo : mList){ %>
			<tr>
				<td><%=vo.getSeq()%></td>
				<td><a href='BoardView.jsp?seq=<%=vo.getSeq()%>'><%=vo.getTitle()%></a></td>
				<td><%=vo.getWriter()%></td>
				<td><%=vo.getRegdate()%></td>
				<td><%=vo.getCnt() %></td>
			</tr>
	<%} //end of for %>
	
	<% }  %>
		<tr>
			<td colspan="5">
				<a href="BoardInputForm.jsp">글쓰기</a>
			</td>
		</tr>
	</table>
	<hr/>
	<!--페이지 번호가 1인 창으로 이동  -->
	<a href="BoardList.jsp?page=1">[◀◀]</a>
	<%if(pageno>1){%><!--pageno가 1보다 크면 -1씩 이동 아닐  경우는 1페이지 유지 -->
	 <a href="BoardList.jsp?page=<%= pageno-1%>">[◀]</a>
	 <% }else{%> <a href="">[◀]</a><% }%>
	 <!--페이지번호 나오도록 반복문으로 구현  -->
	 <%for(int i=1; i<=totalPageCount; i++){ %>
		<a href='BoardList.jsp?page=<%=i %>'>[ <%= i %> ]</a>
	<% }//end of for %><%if(pageno==totalPageCount){%><!--pageno가 totalPageCount보다 크면 totalPageCoun페이지 유지 아닐 경우 +1씩 이동-->
	<a href="BoardList.jsp?page=<%=totalPageCount%>">[▶]</a><% }else{%>
	<a href="BoardList.jsp?page=<%=pageno+1%>">[▶]</a><% }%><a href="BoardList.jsp?page=<%=totalPageCount%>">[▶▶]</a><!--페이지 번호가 끝인 창으로 이동  -->
	
</BODY>
</HTML>
