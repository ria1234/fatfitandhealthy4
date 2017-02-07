<jsp:include page="header.jsp"></jsp:include>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/login.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/validationEngine.jquery.css" />
<div style="display: block; height: 100px;"></div>
<div class="login-block" style="z-index: 20 !important; margin-bottom: 30px;">
    <h1>New Password Reset</h1>
    <%-- <%if(request.getAttribute("error").equals("1")){ %>
    <div class="alert alert-warning">
  			<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
  			<strong>No available user with this Email ID.</strong>
		</div>
	<%} %>
	<%if(request.getAttribute("error").equals("2")){ %>
    <div class="alert alert-success">
  			<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
  			<strong>An email for resetting the password is sent to your Email.</strong>
		</div>
	<%} %> --%><div id="alert"></div>
    <form action="" method="post" id="reset">
    <p>Password:</p>
    <input type="password" value="" placeholder="Enter new password" id="psv" class="validate[required] text-input"/>
    <p>Verify Password:</p>
    <input type="password" value="" placeholder="Confirm password" id="vpsv" class="validate[required,equals[psv]]"/>
    <div class="row">
    <div class="col-xs-12">
    
    <button type="submit">Reset Password</button>
    </div>
    
    </div>
    </form>
</div>
<jsp:include page="footer.jsp"></jsp:include>
<style>
<!--
body{
	background-color: gray;
}
-->
</style>
<script src="${pageContext.request.contextPath }/resources/js/jquery.validationEngine-en.js" type="text/javascript" charset="utf-8"></script>
  <script src="${pageContext.request.contextPath }/resources/js/jquery.validationEngine.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript">
$(document).ready(function(){

	$("#reset").submit(function(e){
			e.preventDefault();
			var password=$("#psv").val();
			alert(password);
			
			$.ajax(
							{
								url : "${pageContext.request.contextPath }/resetpassword",
								type: "POST",
								data : {"password":password,"token":"${token}"},
								success:function(data, textStatus, jqXHR) 
								{
		
									var append="<div class='alert alert-success'>";
									append+="<a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a>";
									append+="<strong>Your password is reset successfully</strong>";
									append+="</div>";
									$("#alert").html(append);									
									
								},
								error: function(jqXHR, textStatus, errorThrown) 
								{
									//if fails
									//alert("fails");
									var append="<div class='alert alert-warning'>";
									append+="<a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a>";
									append+="<strong>Oops ! Something went wrong. your password is not reset.</strong>";
									append+="</div>";
									$("#alert").html(append);	
								}
							});
			
		});
});

jQuery(document).ready(function(){
	// binds form submission and fields to the validation engine
	//alert();
	jQuery("#reset").validationEngine();
});
</script>