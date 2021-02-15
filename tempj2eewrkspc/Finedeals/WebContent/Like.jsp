<%@ page import="java.sql.*" %>  

<%
String id = request.getParameter("id");
String val = request.getParameter("val");
String type = request.getParameter("type");

try {
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "kavin", "admin");
	String Query = "update coupons set "+ type +"="+val+" where id="+id;
	PreparedStatement ps = con.prepareStatement(Query);     
	ResultSet rs = ps.executeQuery();
	con.close();
} 

catch (Exception e) {
	System.out.print("Error at : "+e);
	out.print(e);
}
%>