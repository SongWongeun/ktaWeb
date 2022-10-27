<%@ page contentType="text/html; charset=euc-kr" %> 
<%@ page import="java.sql.*,java.text.*,java.util.*,java.text.Format.*"%>
<%
	try{

	
	Class.forName("oracle.jdbc.driver.OracleDriver");	//ORACLE
	//Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");	//MSSQL
		out.println("JDBC 드라이버를 찾았습니다..<br><br>");
		} catch(ClassNotFoundException e) {
		out.println("JDBC 드라이버를 찾지 못했습니다.<br><br>");
		out.println(e);
		//e.printStackTrace();
		}
	String url="jdbc:oracle:thin:@192.1.60.1:1521:kotmaswb";	//ORACLE
	//String url = "jdbc:sqlserver://서버주소:1433;DatabaseName=스키마명";	//MSSQL
	String id="ktamail";
	String pass="ktamail";
		try{
		Connection connection=DriverManager.getConnection(url,id,pass);
		out.println("===================== 성공 =====================<br>");
		out.println("URL ------> " + url + "<br>");
		out.println("username -> " + id + "<br>");
		out.println("password -> " + pass + "<br>");
		out.println("================================================<br><br>");
		out.println("데이터베이스와의 연결이 성공 했습니다!<br><br>");
		connection.close();
		}catch(SQLException e) {
		out.println("===================== 실패 =====================<br>");
		out.println("URL ------> " + url + "<br>");
		out.println("username -> " + id + "<br>");
		out.println("password -> " + pass + "<br>");
		out.println("================================================<br><br>");
		out.println("데이터베이스와의 연결이 실패했습니다.<br><br><br><br>");
		out.println(e);
		//e.printStackTrace();
		}%><head><title></title></head>