<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<style>
a{
	margin-top: 1px;
    margin-right: 2px;
    position:absolute;
    top:0;
    right:0;

}
</style>

</head>
<body>
	<% 	String email = (String)session.getAttribute("email");
		String password = (String)session.getAttribute("password");
		if(email!=null && password!=null){
			if(email.equals("admin") && password.equals("admin")){
				response.sendRedirect("AdminController?action=LIST");
			}
			else{
				response.sendRedirect("Home.jsp");
			}
		}
	%>
	
	<!-- <a href="index.jsp">Login/Sign-Up</a> -->
	<a href="temp.jsp">Home page</a>
	
</body>
</html>