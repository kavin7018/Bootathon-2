<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Login Form</title>
	<link href="https://unpkg.com/bootstrap@4.1.0/dist/css/bootstrap.min.css" rel="stylesheet"/>
</head>

<body>

	<%
		String email = (String)session.getAttribute("email");
		String password = (String)session.getAttribute("password");
		if(email!=null && password!=null){
			if(email.equals("admin") && password.equals("admin")){
				response.sendRedirect("AdminController?action=LIST");
			}
		}

		String mail = (String)session.getAttribute("mail-id");
		String status = request.getParameter("status");
		if(status!=null){
			if(status.equals("Registered")){
				out.print("Registration Successfull");
			}
			if(status.equals("False")){
				out.print("Invalid Credentials");
			}
			else if(status.equals("Error")){
				out.print("An Error Occured!!! Please try Again Later");
			}
		}
	%> 

	<div class="container">
		<form action="LoginController" method="post">
			<div class="card">
				<div class="card-Header">
					<h3>Login Form</h3>
				</div>
				<div class="card-Body">
					<input type="email" name="email" class="form-control" placeholder="Enter email"><br></br>
					<small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
					<input type="password" name="password" class="form-control" placeholder="Enter password"><br></br>
				</div>
				<div class="card-Footer">
					<input type="submit" value="Login">
				</div>
			</div>
		</form>
		<p>Don't have an account!!!
		 <a href="${pageContext.request.contextPath}/views/RegisterJSP.jsp">Register</a>
		</p>
	 </div>
	
</body>
</html>

<!-- <div class="container">
			<form action="LoginController" method="post">
			<div class="card">
				<div class="card-Header">
					Login
				</div>
				<div class="card-Body">
					<input type="text" name="mail-id" class="form-control" placeholder="Enter email"><br>
					<input type="password" name="password" class="form-control" placeholder=" Enter Password"><br>
				</div>
				<div class="card-Footer">
					<input type="submit" value="Login" class="btn btn-primary">	
				</div>
			</div> -->
	 

	<!--  
	<div class="container">
		<div class="card">
    		<div class="card-header">
        		<h3>Login</h3>
       		</div>
        	<div class="card-Body">
        	<form action="LoginController" method="post">
  			<div class="form-group">
    			<input type="text" name="email" class="form-control" placeholder="Enter email"><br></br>
   				<small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
 			</div>
  			<div class="form-group">
    			<input type="password" name="password" class="form-control" placeholder="Enter password"><br></br>
  			</div>
			</form>
            </div>
        	<div class="card-Footer">
        		<input type="submit" value="Login">
        		<p>Don't have an account!!!
		 			<a href="${pageContext.request.contextPath}/views/RegisterJSP.jsp">Register</a>
				</p>
       		</div>
      </div>
  </div> -->

  <!-- 	<div class="container">
		<form action="LoginController" method="post">
			<div class="card">
				<div class="card-Header">
					<h3>Login Form</h3>
				</div>
				<div class="card-Body">
					<input type="email" name="email" class="form-control" placeholder="Enter email"><br></br>
					<small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
					<input type="password" name="password" class="form-control" placeholder="Enter password"><br></br>
				</div>
				<div class="card-Footer">
					<input type="submit" value="Login">
				</div>
			</div>
		</form>
		<p>Don't have an account!!!
		 <a href="${pageContext.request.contextPath}/views/RegisterJSP.jsp">Register</a>
		</p>
	 </div>-->