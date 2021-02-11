<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 

<!DOCTYPE html>
<html lang="en" > 
<head>
  <title>FineDeals.bootcamp</title>
  <!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> -->
  <script src="images/jquery-3.3.1.js"></script>
  <script src='https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js'></script>
  <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.min.css'>
  <link rel='stylesheet' href='styles/HomeCss.css'>
</head>
<body>
 	
	<%
		String mail = (String)session.getAttribute("email");
		if(mail==null || mail=="" || mail.isBlank()){
			response.sendRedirect("Login.jsp");
		}
	%>

<!-- NavBar --> 	
<div class="hero-anime">	

	<div class="navigation-wrap bg-light start-header start-style">
		<div class="container">
		<div class="row">
		<div class="col-12">
		<nav class="navbar navbar-expand-md navbar-light">
		
 		<!-- Logo -->
		<img src="images/finedeals_img.jpg" width="30px" height="30px"><a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false"></a>
			
 	
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav ml-auto py-4 py-md-0">
		
			<!-- Home Button -->
			<li class="nav-item pl-4 pl-md-0 ml-0 ml-md-4">
				<a class="nav-link dropdown-toggle" data-toggle="dropdown" href="fineDeals.jsp" role="button" aria-haspopup="true" aria-expanded="false">Home</a>
			</li>
			
			<!-- Services button -->
			<li class="nav-item pl-4 pl-md-0 ml-0 ml-md-4">
				<a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">Services</a>
				<div class="dropdown-menu">
					<a class="dropdown-item01" onclick="location.href = 'coupons.jsp?type=offer'">Offers</a>
					<a class="dropdown-item02" onclick="location.href = 'coupons.jsp?type=coupon'">Coupon codes</a>
					<a class="dropdown-item03" onclick="location.href = 'coupons.jsp?type=giftcard'">Gift Cards</a>
				</div>
			</li>
		
			<!-- Upload Deal button -->
			<li class="nav-item pl-4 pl-md-0 ml-0 ml-md-4">
				<a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">Upload Deal</a>
				<div class="dropdown-menu">
					<a class="dropdown-item" href="offers.jsp">Upload offers</a>
					<a class="dropdown-item" href="coupons.jsp">Upload coupons</a>
					<a class="dropdown-item" href="gifts.jsp">Upload gift cards</a>
				</div>
			</li>
		
			<!-- Account button -->
			<li class="nav-item pl-4 pl-md-0 ml-0 ml-md-4">
				<%if( ((String)session.getAttribute("email"))!=null  ) {%>
				<%if(((String)session.getAttribute("email")).equals("admin@finedeals.com")){ %>
				<a class="nav-link dropdown-toggle" href="AdminPage.jsp" role="button" aria-haspopup="false" aria-expanded="false">Admin</a>
				<%}else{ %>
				<a class="nav-link dropdown-toggle" href="${pageContext.request.contextPath}/ClientController?action=LIST&email=${email}" role="button" aria-haspopup="false" aria-expanded="false">My Profile</a>
				<%} }%>
			</li>
		
			<!-- Contact button -->
			<li class="nav-item pl-4 pl-md-0 ml-0 ml-md-4">
				<a class="nav-link" href="Menus/ContactUs.jsp">Contact us</a>
			</li>
		
			<!-- Disclaimer button -->
			<li class="nav-item pl-4 pl-md-0 ml-0 ml-md-4">
				<a class="nav-link" href="Menus/Disclaimer.jsp">Disclaimer</a>
			</li>
			
			<!-- Disclaimer button -->
			<li class="nav-item pl-4 pl-md-0 ml-0 ml-md-4">
				<a class="nav-link" href="Logout.jsp">Logout</a>
			</li>
		
		</ul>
		</div>
		
		</nav>		
		</div>
		</div>
		</div>
	</div>
</div>
	
 	<!-- Coupon grids -->
	<div id="container">
	<c:forEach items="${offers}" var="offer">
		<div class="item">
			<div id="votes" style="display:inline-block;float:right">
				<button id="downvote" onclick="downvote(${offer.id},this)" style="padding: 2px;background-color: #FFF;text-align: center;display:inline-block;width:30px;height:30px;"><span>&#128078</span></button>
				<div id="downvote_count" style="padding: 2px;background-color: #fcf0cf;text-align: center;display:inline-block;width:30px;height:30px;">${offer.downvotes}</div>
				<button id="upvote" onclick="upvote(${offer.id},this)" style="background-color: #FFF; text-align:center;display:inline-block;width:30px;height:30px;"><div>&#128077</div></button>
				<div id="upvote_count" style="padding: 2px;background-color: #fcf0cf; text-align: center;display:inline-block;width:30px;height:30px;">${offer.upvotes}</div>
			</div>
			<img alt="Product_img" src="images/finedeals_img.jpg">
			<div class="Name">${offer.company}</div>
			<div class="Description">${offer.desc}</div>
			<div class="price">Offer code : ${offer.code}</div>
			<a href="${offer.url}/" target="_blank"><button id="addtocart" style="float:right;font-size:5px;width=100px;font-size:14px;text-align: center;">Get Deal</button></a>
		</div>
	</c:forEach>
	</div> 
	
</body>
<script>

function upvote(x,y){
	$('#container').on('click','upvote',function(){		//x-id,y-this
		console.log(y);
	});
	
	/*var request=new XMLHttpRequest(); 
	var url="Like.jsp?id="+parseInt(y)+"&val="+val;
 	try{
		request.onreadystatechange=function(){
			if(request.readyState==4){  
				var val=request.responseText;  
				document.getElementById('upvote_count').innerHTML=val;  
			}
		} 
		request.open("GET",url,true);  
		request.send();  
	}
	catch(e){
		alert("Unable to connect to server");
	} */
}

function downvote(y,x){
	console.log("Downvote :"+this);
}
</script>
</html>