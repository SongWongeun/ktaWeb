<%@ page contentType="text/html; charset=euc-kr" %> 
<%@ page import="java.sql.*,java.text.*,java.util.*,java.text.Format.*"%>
<%
	try{

	
	Class.forName("oracle.jdbc.driver.OracleDriver");	//ORACLE
	//Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");	//MSSQL
		out.println("JDBC ����̹��� ã�ҽ��ϴ�..<br><br>");
		} catch(ClassNotFoundException e) {
		out.println("JDBC ����̹��� ã�� ���߽��ϴ�.<br><br>");
		out.println(e);
		//e.printStackTrace();
		}
	String url="jdbc:oracle:thin:@192.1.60.1:1521:kotmaswb";	//ORACLE
	//String url = "jdbc:sqlserver://�����ּ�:1433;DatabaseName=��Ű����";	//MSSQL
	String id="ktamail";
	String pass="ktamail";
		try{
		Connection connection=DriverManager.getConnection(url,id,pass);
		out.println("===================== ���� =====================<br>");
		out.println("URL ------> " + url + "<br>");
		out.println("username -> " + id + "<br>");
		out.println("password -> " + pass + "<br>");
		out.println("================================================<br><br>");
		out.println("�����ͺ��̽����� ������ ���� �߽��ϴ�!<br><br>");
		connection.close();
		}catch(SQLException e) {
		out.println("===================== ���� =====================<br>");
		out.println("URL ------> " + url + "<br>");
		out.println("username -> " + id + "<br>");
		out.println("password -> " + pass + "<br>");
		out.println("================================================<br><br>");
		out.println("�����ͺ��̽����� ������ �����߽��ϴ�.<br><br><br><br>");
		out.println(e);
		//e.printStackTrace();
		}%><head><title></title></head>