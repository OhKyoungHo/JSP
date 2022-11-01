<%@page contentType="text/xml; charset=utf-8" %>
<%@ page language="java" import="java.sql.*"%>

<%
String driver="oracle.jdbc.driver.OracleDriver";
String user="scott";
String pass="tiger";
String dbURL="jdbc:oracle:thin:@192.168.0.26:1521:xe";



String rtn_xml="";

	Class.forName(driver);
	Connection connection=DriverManager.getConnection(dbURL,user,pass);
	
	String sql = "select * from ajax_temp";
	
	PreparedStatement ps = connection.prepareStatement(sql);
	ResultSet rs = ps.executeQuery();	
	
	rtn_xml += "<customer>";

	while (rs.next()){		
		rtn_xml += "<person>";
		rtn_xml += "<name>" + rs.getString("name") + " </name>";
		rtn_xml += "<age>" + rs.getString("age") +  "</age>";
		rtn_xml += "<tel>" + rs.getString("tel") +  "</tel>";
		rtn_xml += "<addr>" + rs.getString("addr") +  "</addr>";
		rtn_xml += "</person>";		
	}	
	rtn_xml += "</customer>";
	rs.close();
	ps.close();
	connection.close();

	

	System.out.println(rtn_xml);
	// 만들어진 태그를 클라이언트에게 전송 (예전에는 xml 구조로 보냈으나 요즘은 json 구조로 보냄)
	out.write(rtn_xml);

%>