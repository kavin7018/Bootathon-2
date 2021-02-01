<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Insert title here</title>
		<link href="https://unpkg.com/bootstrap@4.1.0/dist/css/bootstrap.min.css" rel="stylesheet"/>
		<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/bs4/dt-1.10.23/datatables.min.css"/>
 	</head>
<body>

		<% 
			String email = (String)session.getAttribute("mail-id");
			if(email==null){
				response.sendRedirect("index.jsp");
			}
		%>

		<div class="container">
			<div class="float-right">
				<a href="${pageContext.request.contextPath}/logout.jsp">Logout</a>
			</div>
		
			<p>${Message}</p>
			
			<button class="btn btn-primary" onclick="window.location.href='views/employee-add.jsp'">Add Employee</button>
			<table  border="1" class = "table table-striped table-bordered" id="datatable">
				<thead>
					<tr class="thread-dark">
						<th>ID</th>
						<th>Name</th>
						<th>DOB</th>
						<th>DEPT</th>
						<th>Action</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list}" var="employee">
						<tr>
							<td>${employee.id}</td>
							<td>${employee.name}</td>
							<td>${employee.dob}</td>
							<td>${employee.dept}</td>
							<td>
								<a href="${pageContext.request.contextPath}/EmployeeController?action=EDIT&id=${employee.id}">Edit</a>
								|
								<a href="${pageContext.request.contextPath}/EmployeeController?action=DELETE&id=${employee.id}">Delete</a>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<script src="https://unpkg.com/jquery@3.3.1/dist/jquery.min.js"></script>
		<script type="text/javascript" src="https://cdn.datatables.net/v/bs4/dt-1.10.23/datatables.min.js"></script>
		<script>
			$(document).ready(function() {
		    	$('#datatable').DataTable();
			} );
		</script>
</body>
</html>