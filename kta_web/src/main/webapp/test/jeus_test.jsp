<%@ page pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*, javax.naming.*, javax.sql.*"%>
<%
 Connection conn = null;
 PreparedStatement pstmt = null;
 ResultSet rs = null;

 try{
  Context ctx = new InitialContext();
  DataSource ds = (DataSource)ctx.lookup("kotmas");
  conn = ds.getConnection();

  pstmt = conn.prepareStatement("select sysdate from dual");
  rs = pstmt.executeQuery();

  while(rs.next()){
  %>
   <%=rs.getString(1)%>
  <%
  }
  
 } catch(Exception e){
  e.printStackTrace();
 } finally {
  try{
   if( rs != null ) rs.close();
   if( pstmt != null ) pstmt.close();
   if( conn != null ) conn.close();
  }catch(Exception ex){
   ex.printStackTrace();
  }
 }
%>