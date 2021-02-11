<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

<div class="text-left"">
	 <%if( ((String)session.getAttribute("email"))!=null  ) {%>
			<%if(((String)session.getAttribute("email")).equals("admin@finedeals.com")){ %>
				<a href="${pageContext.request.contextPath}/AdminController?action=Front">&#8592 Back</a>
			<%}else{ %>
				<a href="${pageContext.request.contextPath}/ClientController?action=home">&#8592 Back</a>
	<%}}%>
</div>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<script>
function searchInfo(){
	var request=new XMLHttpRequest();
	var name=document.vinform.name.value;
	console.log("Before request");
	var type ="<%=request.getParameter("type")%>";
	var url="coupon_index.jsp?val="+name+"&type="+type;
	console.log("Inside coupons.jsp, type : "+type);
	
	
	try{
		request.onreadystatechange=function(){
			if(request.readyState==4){  
				var val=request.responseText;  
				document.getElementById('mylocation1').innerHTML=val;  
			}
		} 
		request.open("GET",url,true);  
		request.send();  
	}
	catch(e){
		alert("Unable to connect to server");
	}
}  
</script>  


<title>website</title>
<link href="CouponsStyle.css" rel="stylesheet">
</head>

<body>
			<form name="vinform" >
			<div class="sbar">
				<input placeholder="what are you searching" style="front-size: 70px;height: 40px;width:500px;position:absolute;top:5%;left:30%;" type="text" name="name" onkeyup="searchInfo()" > 
				</div>
			</form>
			<span id="mylocation1"></span>
	
</body>
</html>