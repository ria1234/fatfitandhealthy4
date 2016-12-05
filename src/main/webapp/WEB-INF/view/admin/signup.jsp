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
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/validationEngine.jquery.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/admin/validationcolor.css" />
	<!-- End CSS Files -->
	<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/jquery-1.11.0.min.js"></script>
	<%-- <script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/admin/jquery.min.js"></script> --%>
	<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/bootstrap.min.js"></script>
 	<script src="${pageContext.request.contextPath }/resources/js/jquery.validationEngine-en.js" type="text/javascript" charset="utf-8"></script>
  <script src="${pageContext.request.contextPath }/resources/js/jquery.validationEngine.js" type="text/javascript" charset="utf-8"></script>
 	
</head>
<body>
	<div class="container">

    <form id="signup" method="post" action="signup" enctype="multipart/form-data" >

        <div class="header">
        
            <h3>Sign Up</h3>
            
            <p>You have to fill out this form</p>
            
        </div>
        
        <div class="sep"></div>

        <div class="inputs">
        
            <input type="email" name="email" placeholder="e-mail" value="" class=" validate[required,custom[email]]" autofocus required />
        
            <input type="password" name="password" placeholder="Password" class="validate[required] text-input" required />
            
            <input type="text" placeholder="firstname" name="firstname" class="validate[required] text-input" required />
            
            <input type="text" placeholder="lastname" name="lastname" class="validate[required] text-input" required />
            Select image for your profile
            <input type="file" required="true" id="image" name="file" class="file validate[required] text-input"/>
            <input type="hidden" name="image" value="" class="image">
            
            <div class="checkboxy">
                <input name="cecky" id="checky" value="1" type="checkbox" class="validate[required]" required /><label class="terms">I accept the terms of use</label>
            </div>
			<input type="submit" value="Submit" id="forvalidation" style="display:none;"/>
            <a id="submit" >SIGN UP</a>
        
        </div>

    </form>

</div>
</body>
</html>
<script type="text/javascript">
	$(document).ready(function(){
			$("#submit").click(function(){
					if($("#image").val()==''){
						alert("enter image for your profile");
						}
					$("#forvalidation").click();
				});
			$(".file").change(function(){
				var filename=$(this).val();
				//alert(filename);
				$(".image").val(filename);
			});
			 
		});
	jQuery(document).ready(function(){
		// binds form submission and fields to the validation engine
		//alert();
		jQuery("#signup").validationEngine();
	});
</script>