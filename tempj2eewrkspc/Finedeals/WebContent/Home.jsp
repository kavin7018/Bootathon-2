<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<style >
float-right{
	postion: relative;
	top-margin:2px;
	right-margin:2px;
}</style>

</head>
<body>

	<%
		String mail = (String)session.getAttribute("email");
		if(mail==null || mail=="" || mail.isBlank()){
			response.sendRedirect("index.jsp");
		}
	%>

	 <div class="container">
	 	<div>
				<a href="${pageContext.request.contextPath}/Logout.jsp">Logout</a>
	 	</div>
	 	
	 	
	 	<% if(  ((String)session.getAttribute("email")).equals("admin@finedeals.com")  ){%>
	 	
	 	<a href="${pageContext.request.contextPath}/AdminController?action=LIST">Client Records</a>
	 	
		<% }%>
	 	<p>Inside Client Panel</p>
	 	<a href="${pageContext.request.contextPath}/ClientController?action=LIST&email=${email}">My Profile</a>
	 </div>
</body>
</html>