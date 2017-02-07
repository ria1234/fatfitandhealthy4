<jsp:include page="header.jsp"></jsp:include>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/login.css" />
<div style="display: block; height: 100px;"></div>
<div class="login-block" style="z-index: 20 !important; margin-bottom: 30px;">
    <h1>Reset Password</h1>
    <%if(request.getAttribute("error").equals("1")){ %>
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
	<%} %>
    <form action="" method="post">
    <p>Email:</p>
    <input type="email" value="" placeholder="Email Address" name="email" required/>
    <div class="row">
    <div class="col-xs-6">
    
    <button type="submit">Submit</button>
    </div>
    <div class="col-xs-6">
    	<button onclick="location.href = '${pageContext.request.contextPath }/login';" type="button">Cancel</button>
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