<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link href="https://unpkg.com/bootstrap@4.1.0/dist/css/bootstrap.min.css" rel="stylesheet"/>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
</head>
<body>
	<%
		String mail = (String)session.getAttribute("email");
		if(mail==null || mail=="" || mail.isEmpty()){
			response.sendRedirect("index.jsp");
		}
	%>
	<div class="container">
		<div class="float-right">
				<a href="${pageContext.request.contextPath}/ClientController?action=EDIT&id=${client.email}">Edit</a>
		 </div>
		 
		<a href="${pageContext.request.contextPath}/Home.jsp">&#8592 Back</a>
		<p>${message}</p>
		<h3>My profile</h3>
		
		<p>UserName : ${client.username}</p>
		<p>Email : ${client.email}</p>
		<p>Password : ${client.password}</p>
		<p>DOB : ${client.dob}</p>
		<p>Gender : ${client.gender}</p>
		<p>Country : ${client.country}</p>
		
	</div>
		
</body>
</html>