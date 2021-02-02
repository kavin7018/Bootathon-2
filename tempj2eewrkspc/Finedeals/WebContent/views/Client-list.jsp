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
	<link href="styles/cssfile.css" rel="stylesheet"/>
</head>

<body>

	<%
		String mail = (String)session.getAttribute("email");
		if(mail.isEmpty() || mail==""){
			response.sendRedirect("index.jsp");
		}
	%>

	 <div class="container">
	 	 <div class="text-right">
				<a href="${pageContext.request.contextPath}/Logout.jsp">Logout</a>
		 </div>
		 
	 	<div class="text-center">
	 		<h4>Client Records</h4>
	 	</div>
	 	
	 	<div class="text-left"">
	 		<a href="${pageContext.request.contextPath}/Home.jsp">&#8592 Back</a>
	 	</div>
	 	
	 	<p>${Message}</p>
	 	<button class="btn btn-primary" onclick="window.location.href='views/Client-add.jsp'">Add Client</button>
	 
		<table border="1" class = "table table-striped table-bordered" id="datatable">
			<thead>
				<tr>
					<th>Id</th>
					<th>UserName</th>
					<th>Email</th>
					<th>Password</th>
					<th>Gender</th>
					<th>DOB</th>
					<th>Country</th>
					<th>Actions</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${list}" var="clients">
				<tr>
					<td>${clients.id}</td>
					<td>${clients.username}</td>
					<td>${clients.email}</td>
					<td>${clients.password}</td>
					<td>${clients.gender}</td>
					<td>${clients.dob}</td>
					<td>${clients.country}</td>
					<td>
						<a href="${pageContext.request.contextPath}/AdminController?action=EDIT&id=${clients.id}">Edit</a>
						|
						<a href="${pageContext.request.contextPath}/AdminController?action=DELETE&id=${clients.id}">Delete</a>
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