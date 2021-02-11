<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link href="styles/LoginCss.css" rel="stylesheet">
</head>
<body>

	<% 
		
		String email = (String)session.getAttribute("email");
		String password = (String)session.getAttribute("password");
		if(email!=null && password!=null){
			if(email.equals("admin@finedeals.com")){
				response.sendRedirect("AdminController?action=Front");
			}
			else{
				response.sendRedirect("ClientController?action=home");
			}
		}

		String status = request.getParameter("status");
		if(status!=null){
			if(status.equals("Registered")){
				out.print("Registration Successful");
			}
			if(status.equals("False")){
				out.print("Invalid Credentials");
			}
			else if(status.equals("Error")){
				out.print("An Error Occured!!! Please try Again Later");
			}
		}

	%>


	<div class="split left">
  		<div class="centered">
    		<img src="images/finedeals_img.jpg" alt="FineDeals">
    			<h2>FineDeals</h2>
    			<h2>Find your Finest Deals</h2>
  		</div>
	</div>

	<div class="split right">
  		<div class="centered">
  			<h2>Please sign-in to continue</h2>
    			<div class="container">
					<form action="LoginController" id="Loginform" method="post">
						<h3>Login Form</h3>
						<input type="email" name="email" class="form-control" placeholder="Enter email"><br></br>
						<input type="password" name="password" class="form-control" placeholder="Enter password"><br></br>
						<input type="submit" value="Login">
					</form>
					<p>Don't have an account!!!
						 <a href="${pageContext.request.contextPath}/views/RegisterJSP.jsp">Register</a>
					</p>
	 			</div>
    	</div>
</div>
</body>
</html>