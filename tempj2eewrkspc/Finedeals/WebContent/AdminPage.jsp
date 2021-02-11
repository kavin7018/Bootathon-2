<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<div class="text-left">
	 		<a href="${pageContext.request.contextPath}/AdminController?action=Front">&#8592 Back</a>
	 </div>
	<p>Inside Admin Page</p>
	<a href="${pageContext.request.contextPath}/AdminController?action=LIST">Client Records</a>
</body>
</html>