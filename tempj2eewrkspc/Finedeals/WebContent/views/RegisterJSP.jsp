<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link href="../styles/cssfile.css" rel="stylesheet"/>
</head>
<body>
 	<%
		String status = request.getParameter("status");
		if(status!=null){
			if(status.equals("False")){
				out.print("An Error Occured, Please try again!!!");
			}
		}
	%> 
 	<div class="container" id="registerjsp">
 		<div class="align-centre">
		<h3>Registration Form</h3></div>
		<form action="${pageContext.request.contextPath}/RegistrationController" method="post">
			<input type="text" name="username" placeholder="Enter UserName"><br></br>
			<input type="email" name="email" placeholder="Enter email"><br></br>
			<input type="password" name="password" placeholder="Enter password"><br></br>
			<p>Please select your Gender</p>
			<input type="radio" name="gender" value="male" placeholder="Gender">
				<label for ="male">Male</label><br></br>
			<input type="radio" name="gender" value="female" placeholder="Gender">
				<label for = "female">Female</label><br></br>
			<input type="date" name="dob" placeholder="DOB"><br></br>
			<input type="text" name="country" placeholder="Enter your Location"><br></br>
			<input type="submit" value="Register">
		</form>
	</div> 
</body>
</html>
