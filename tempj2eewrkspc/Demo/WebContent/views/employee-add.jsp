<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<link href="https://unpkg.com/bootstrap@4.1.0/dist/css/bootstrap.min.css" rel="stylesheet"/>
<body>

	<div class="container">
	
		<h1>Employee Records</h1><hr/>
		<div class="float-right">
			<a href="${pageContext.request.contextPath}/index.jsp">Logout</a>
		</div>
	
		<div class="row">
			<div class="col-md-4">
			 	<form action="${pageContext.request.contextPath}/EmployeeController" method="Post">
					<div class="form-group">
						<input type="text" class="form-control" name="name" value="${Employee.name}" placeholder="Enter Name"  /><br>
					</div>
					<div class="form-group">
						<input type="date" class="form-control" name="dob" value="${Employee.dob}" placeholder="Enter DOB" /><br>
					</div>
					<div class="form-group">
						<input type="text" class="form-control" name="dept" value="${Employee.dept}" placeholder="Enter Department" /><br>
					</div>
					<input type="hidden" name="id" value="${Employee.id}" >
					<button class="btn btn-primary" type="submit">Save Details</button>
				</form>
			</div>
		</div>
	</div>
</body>
</html>