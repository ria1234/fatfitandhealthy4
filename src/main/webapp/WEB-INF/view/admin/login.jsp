<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8" />
    <title>Fatfitandhealthy</title>
    <meta name="description" content="" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />
    <!--Favicon -->
	<link rel="icon" type="image/png" href="${pageContext.request.contextPath }/resources/images/favicon.jpg" />
		
	<!-- CSS Files -->
		
	
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.min.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/admin/signup.css" />
	

	<!-- End CSS Files -->
	<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/jquery-1.11.0.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/bootstrap.min.js"></script>
 
</head>
<body>
	<div class="container">

    <form id="signup" method="post" action="login">

        <div class="header">
        
            <h3>Login</h3>         
                       
        </div>
        
        <div class="sep"></div>

        <div class="inputs">
        	<%if(request.getAttribute("error").equals("1")){ %>
		<div class="alert alert-warning">
  			<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
  			<strong>Username or password is incorrect or you have not given permission.</strong>
		</div>
	<%} %>
            <input type="email" name="email" placeholder="e-mail" autofocus required />
        
            <input type="password" name="password" placeholder="Password" required />  
            <p>Not registered? Register as admin <a href="signup" style="color:lightblue;">here</a></p>       
                     
            <a id="submit" onclick="document.getElementById('signup').submit();">Login</a>
        
        </div>

    </form>

</div>
</body>
</html>