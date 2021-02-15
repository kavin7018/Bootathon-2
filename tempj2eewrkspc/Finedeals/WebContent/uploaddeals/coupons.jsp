<!DOCTYPE html>
<html lang="en" >
<head>
  <title>FineDeals.bootcamp/coupons</title>
  <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.min.css'>
  <link rel="stylesheet" href="../styles/HomeCss.css">
 <script src="https://code.jquery.com/jquery-3.2.1.js"></script>
</head>
<body>
 
<body class="hero-anime">	
 
	<div class="navigation-wrap bg-light start-header start-style">
		<div class="container">
		<div class="row">
		<div class="col-12">
		<nav class="navbar navbar-expand-md navbar-light">
		
		<a class="navbar-brand" href="" target="_blank"><img src="https://www.finedeal.co.in/front/assets/img/logo1.png" alt="FineDeals"></a>	
		
		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
		</button>
		
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav ml-auto py-4 py-md-0">
		<li class="nav-item pl-4 pl-md-0 ml-0 ml-md-4 active">
		<a class="nav-link dropdown-toggle" data-toggle="dropdown" href="fineDeals.jsp" role="button" aria-haspopup="true" aria-expanded="false">Home</a>
		</li>
		<li class="nav-item pl-4 pl-md-0 ml-0 ml-md-4">
		<a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">Services</a>
		<div class="dropdown-menu">
		<a class="dropdown-item" href="#">Offers</a>
		<a class="dropdown-item" href="#">Coupon codes</a>
		<a class="dropdown-item" href="#">Gift Cards</a>
		</div>
		</li>
		<li class="nav-item pl-4 pl-md-0 ml-0 ml-md-4">
		<a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">Upload Deal</a>
		<div class="dropdown-menu">
		<a class="dropdown-item" href="offers.jsp">Upload offers</a>
		<a class="dropdown-item" href="coupons.jsp">Upload coupons</a>
		<a class="dropdown-item" href="gifts.jsp">Upload gift cards</a>
		</div>
		</li>
		<li class="nav-item pl-4 pl-md-0 ml-0 ml-md-4">
		<a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">Account</a>
		<div class="dropdown-menu">
		<a class="dropdown-item" href="signin">Sign In</a>
		<a class="dropdown-item" href="signup.jsp">Sign Up</a>
		</div>
		</li>
		<li class="nav-item pl-4 pl-md-0 ml-0 ml-md-4">
		<a class="nav-link" href="contact.jsp">Contact us</a>
		</li>
		<li class="nav-item pl-4 pl-md-0 ml-0 ml-md-4">
		<a class="nav-link" href="disclaimer.jsp">Disclaimer</a>
		</li>
		</ul>
		</div>
		
		</nav>		
		</div>
		</div>
		</div>
	</div>
	<div class="section full-height">
		<div class="absolute-center">
			<div class="container">
  <form id="upload_form" action="${pageContext.request.contextPath}/CouponController"  method="post">
    	<div class="row">
    		<h4>Upload Coupons</h4>
    		<div class="input-group input-group-icon">
    			<input type="text" id="comp_name" placeholder="Company Name" name="companyName">
    			<span class="error_form" id="fname_error_message"></span>
    			<div class="input-icon">
    				<i class="fa fa-user"></i>
    			</div>
    		</div>
    		<div class="input-group input-group-icon">
    			<input type="text" id="comp_url" placeholder="Company URL" name="companyURL">
    			<span class="error_form" id="url_error_message"></span>
    		</div>
    		<div class="input-group input-group-icon">
    			<input type="text" id="comp_code" placeholder="Coupon Code" name="code">
    			<span class="error_form" id="code_error_message"></span>
    		</div>
    		<div class="input-group input-group-icon">
    			<input type="text" id="comp_des" placeholder="Coupon Description" name="description">
    			<span class="error_form" id="des_error_message"></span>
    		</div>
    		<div class="input-group input-group-icon">
    			<input type="text" id="comp_ex" placeholder="Expiry date" name="exDate">
    			<span class="error_form" id="ex_error_message"></span>
    		</div>
    	</div>
    <div class="row">
      <h4>Terms and Conditions</h4>
      <div class="input-group">
        <input type="checkbox" id="terms"/>
        <label for="terms">I accept the terms and conditions for posting this deal, and hereby confirm I have read the privacy policy.</label>
      </div>
      <button>Submit</button>
    </div>
  </form>
</div>		</div>		
		</div>
		<script type="text/javascript">
    		$(function(){
    			
    			$("#fname_error_message").hide();
    			$("#url_error_message").hide();
    			$("#code_error_message").hide();
    			$("#des_error_message").hide();
    			$("#ex_error_message").hide();
    			
    			var error_name = false;
    			var error_url = false;
    			var error_code = false;
    			var error_des = false;
    			var error_ex = false;
    			
    			$("#comp_name").focusout(function(){
    				check_fname();
    			});
    			$("#comp_url").focusout(function(){
    				check_url();
    			});
    			$("#comp_code").focusout(function(){
    				check_code();
    			});
    			$("#comp_des").focusout(function(){
    				check_des();
    			});
    			$("#comp_ex").focusout(function(){
    				check_ex();
    			});
    			
    			function check_fname(){
    				var pattern = /^[a-zA-Z]*$/;
    				var fname = $("#comp_name").val()
    				if(fname == ''){
    					$("#comp_name").css("border-bottom","2px solid #F90A0A");
    					error_code = true;
    				}
    				else if(pattern.test(fname) && fname !== '') {
    					$("#fname_error_message").hide();
    					$("#comp_name").css("border-bottom","2px solid #34F458");
    				}else{
    					$("#fname_error_message").html("should contain only characters");
    					$("#fname_error_message").show();
    					$("#comp_name").css("border-bottom","2px solid #F90A0A");
    					error_name = true;
    				}
    			}
    			
    			function check_url(){
    				var pattern = /[(http(s)?):\/\/(www\.)?a-zA-Z0-9@:%._\+~#=]{2,256}\.[a-z]{2,6}\b([-a-zA-Z0-9@:%_\+.~#?&//=]*)/;
    				var fname = $("#comp_url").val()
    				if(fname == ''){
    					$("#comp_url").css("border-bottom","2px solid #F90A0A");
    					error_code = true;
    				}
    				else if(pattern.test(fname) && fname !== '') {
    					$("#url_error_message").hide();
    					$("#comp_url").css("border-bottom","2px solid #34F458");
    				}else{
    					$("#url_error_message").html("entered URL is not valid");
    					$("#url_error_message").show();
    					$("#comp_url").css("border-bottom","2px solid #F90A0A");
    					error_url = true;
    				}
    			}
    			
    			
    			function check_code(){
    				var pattern = /^[0-9a-zA-Z]*$/;
    				var fname = $("#comp_code").val()
    				if(fname == ''){
    					$("#comp_code").css("border-bottom","2px solid #F90A0A");
    					error_code = true;
    				}
    				else if(pattern.test(fname) && fname !== '') {
    					$("#code_error_message").hide();
    					$("#comp_code").css("border-bottom","2px solid #34F458");
    				}else{
    					$("#code_error_message").html("should not contain special characters");
    					$("#code_error_message").show();
    					$("#comp_code").css("border-bottom","2px solid #F90A0A");
    					error_code = true;
    				}
    			}
    			
    			function check_des(){
    				var pattern = /^[0-9a-zA-Z ]*$/;
    				var fname = $("#comp_des").val()
    				
    				if(fname == ''){
    					$("#comp_des").css("border-bottom","2px solid #F90A0A");
    					error_code = true;
    				}
    				else if(pattern.test(fname)) {
    					$("#des_error_message").hide();
    					$("#comp_des").css("border-bottom","2px solid #34F458");
    				}else{
    					$("#des_error_message").html("should contain only characters and numbers");
    					$("#des_error_message").show();
    					$("#comp_des").css("border-bottom","2px solid #F90A0A");
    					error_des = true;
    				}
    			}
    			
    			function check_ex(){
    				var pattern = /^(0?[1-9]|[12][0-9]|3[01])[\/\-](0?[1-9]|1[012])[\/\-]\d{4}$/;
    				var fname = $("#comp_ex").val()
    				if(fname == ''){
    					$("#comp_ex").css("border-bottom","2px solid #F90A0A");
    					error_code = true;
    				}
    				else if(pattern.test(fname) && fname !== '') {
    					$("#ex_error_message").hide();
    					$("#comp_ex").css("border-bottom","2px solid #34F458");
    				}else{
    					$("#ex_error_message").html("should be in format dd/mm/yyyy");
    					$("#ex_error_message").show();
    					$("#comp_ex").css("border-bottom","2px solid #F90A0A");
    					error_ex = true;
    				}
    			}
    			
    			$("#upload_form").submit(function(){
    				error_name = false;
        			error_url = false;
        			error_code = false;
        			error_des = false;
        			error_ex = false;
        			
        			check_fname();
        			check_url();
        			check_code();
        			check_des();
        			check_ex();
        			
        			if(error_name == false && error_url == false && error_code == false && error_des == false && error_ex == false){
        				alert("Upload Successful");
        				return true;
        			}else{
        				alert("please enter the details correctly");
        				return false;
        			}
        				
    			})
    			
    		})
    	
    	</script>
</body>
</body>
 
<script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js'></script>
<script src='https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js'></script>
<script  src="function.js"></script>
 
</body>
</html>