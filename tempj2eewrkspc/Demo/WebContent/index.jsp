<%-- <% response.sendRedirect("EmployeeController?action=LIST");  %> --%>

<html>
	<head>
		<title></title>
		<link href="https://unpkg.com/bootstrap@4.1.0/dist/css/bootstrap.min.css" rel="stylesheet"/>
	</head>
	
	<body>
	
		<%
			String mail = (String)session.getAttribute("mail-id");
			if(mail!=null){
				response.sendRedirect("EmployeeController?action=LIST");
			}
			
			String action = request.getParameter("status");
		
			if(action!=null){
				if(action.equals("False")){
					out.print("Invalid Credentials");
				}
				else if(action.equals("Error")){
					out.print("An Error Occured, Please try again later!!!");
				}
			}
		
		
		%>
	
	
		<div class="container">
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
			</div>
		</form>
		</div>
	</body>
</html>


<!-- 
<form>
  <div class="form-group">
    <label for="exampleInputEmail1">Email address</label>
    <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
  </div>
  <div class="form-group">
    <label for="exampleInputPassword1">Password</label>
    <input type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
  </div>
  <div class="form-group form-check">
    <input type="checkbox" class="form-check-input" id="exampleCheck1">
    <label class="form-check-label" for="exampleCheck1">Check me out</label>
  </div>
  <button type="submit" class="btn btn-primary">Submit</button>
</form>  -->