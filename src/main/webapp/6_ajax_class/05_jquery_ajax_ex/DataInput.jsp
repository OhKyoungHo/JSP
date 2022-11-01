<%@ page language="java" import="java.sql.*"%>
<%
String driver="oracle.jdbc.driver.OracleDriver";
String user="scott";
String pass="tiger";
String dbURL="jdbc:oracle:thin:@192.168.0.26:1521:xe";

//이전 화면에서 넘어오는 데이터를 받아 변수에 담기
request.setCharacterEncoding("utf-8");
String name  = request.getParameter("name");
String age = request.getParameter("age");
String tel = request.getParameter("tel");
String addr= request.getParameter("addr");

	//DB와 연결
	Class.forName(driver);
	Connection connection=DriverManager.getConnection(dbURL,user,pass);		
	//SQL문 작성
	String sql = "insert into ajax_temp(name, age, tel, addr) values(?,?,?,?)";
	// DB로 전송 및 결과 수신
	PreparedStatement ps = connection.prepareStatement(sql);
	ps.setString(1, name);
	ps.setString(2,age);
	ps.setString(3,tel);
	ps.setString(4,addr);
	int result = ps.executeUpdate();		

	ps.close();
	connection.close();
	
	out.write(String.valueOf(result));
%>