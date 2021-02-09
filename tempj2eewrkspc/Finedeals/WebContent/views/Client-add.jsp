<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<%
		String mail = (String)session.getAttribute("email");
		if(mail.isEmpty() || mail==""){
			response.sendRedirect("Login.jsp");
		}
	%>
	
	<div class="container">
		<h3>Client Records</h3>
		<form action="${pageContext.request.contextPath}/AdminController" method="post">
			<input type="text" name="username" value="${client.username}" placeholder="Enter userName"><br></br>
			<input type="email" name="email" value="${client.email}" placeholder="Enter email"><br></br>
			<input type="password" name="password" value="${client.password}" placeholder="Enter password"><br></br>
			<p>Please select your Gender</p>
			<input type="radio" name="gender" value="male" placeholder="Gender">
				<label for ="male">Male</label><br></br>
			<input type="radio" name="gender" value="female" placeholder="Gender">
				<label for = "female">Female</label><br></br>
			<input type="date" name="dob" value="${client.dob}" placeholder="DOB"><br></br>
			<input type="text" name="country" value="${client.country}" placeholder="Enter your Location"><br></br>
			<input type="hidden" name="id" value="${client.id}"> 
			<input type="submit" value="Save">
		</form>
	</div>
</body>
</html>