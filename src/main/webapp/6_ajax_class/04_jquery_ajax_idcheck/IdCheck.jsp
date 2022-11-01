<%@ page contentType="text/html; charset=utf-8" %>
<%@ page language="java" import="java.sql.*"%>

<%
String driver="oracle.jdbc.driver.OracleDriver";
String user="scott";
String pass="tiger";
String dbURL="jdbc:oracle:thin:@localhost:1521:xe";

	/*받아온 id에 해당하는 value로 SQL을 수행한다. 
    id와 동일한 정보가 있으면 1행 이상이 ResultSet에 담아지고, 
    ResultSet의 다음행이 있는지 next() 함수로 확인하여 YES, NO를 
    변수 result에 담아 IdForm.jsp로 돌려준다.*/
	Class.forName(driver);
	Connection connection=DriverManager.getConnection(dbURL,user,pass);
	
	String sql = "select * from emp where ename=?";
	System.out.println(sql);
	PreparedStatement ps = connection.prepareStatement(sql);
	ps.setString(1, request.getParameter("id"));
	ResultSet rs = ps.executeQuery();		

	String result="NO";
	//해당되는 사원이 있으면 YES, 없으면 NO 
	if (rs.next()){		
		result = "YES";
	}		
	out.print(result);
%>

