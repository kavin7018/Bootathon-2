<%@ page import="java.sql.*" %>  

	<%
		String mail = (String)session.getAttribute("email");
		if(mail==null || mail=="" || mail.isBlank()){
			response.sendRedirect("../Login.jsp");
		}
	%>

<%
String name = request.getParameter("val");
String type = request.getParameter("type");

if(name=="" || name.equals("")){
	
}
else{
try {
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "kavin", "admin");
	String uppercase = name.toUpperCase();
	String lowercase = name.toLowerCase();
	String Query = "select * FROM gift WHERE company like '"+uppercase+"%'";
	PreparedStatement ps = con.prepareStatement(Query);     
	ResultSet rs = ps.executeQuery();
	
	if (!rs.isBeforeFirst()) {
		out.println("<p style='margin-top:150px;margin-right:150px;'>No Record Found!</p>");
	} else {
		out.print("<section class='product-list'>");
		out.print("<div><h1>Coupon Codes</h1></div>");
		int count = 0;
		out.print("<div class='product-container'>");
		out.print("<table>");

		while (rs.next()) {
	if (count == 0) {
		out.print("<tr>");
	}
	out.print("<td><div class='card'>");

	out.print("<div class='title'>");
	out.print("GiftCards");
	out.print("</div>");

	out.print("<div class='dlink'>");
	out.print("<h2>by " + rs.getString(1) + "</h2>");
	out.print("</div>");

	out.print("<div class='comp'>");
	out.print("<p text='bold' align='center'> " + rs.getString(3) + "<p>");
	out.print("</div>");

	out.print("<div class='text'>");
	out.print(rs.getString(4));
	out.print("</div>");

	out.print("<div class='text'>");
	out.print("valid till " + rs.getString(5));
	out.print("</div>");

	out.print("<div>");
	out.print("<a href=https://'" + rs.getString(2) + "'><button class='buy-button'>LINK</button></a>");
	out.print("</div>");

	out.print("</div></td>");
	count++;
	if (count == 4) {
		out.print("</tr>");
		count = 0;
	}
		}
		out.print("</table>");
		out.print("</div>");
		out.print("</section>");
	}
	con.close();
}

catch (Exception e) {
	System.out.print("Error at : "+e);
	out.print(e);
}}
%>