<jsp:include page="header.jsp"></jsp:include>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/login.css" />
<div style="display: block; height: 100px;"></div>
<div class="login-block" style="z-index: 20 !important; margin-bottom: 30px;">
	<%if(request.getAttribute("error").equals("1")){ %>
    <h1><i class="fa fa-warning"></i> Oops ! Invalid Token. </h1>
    <p>We couldn't find the request you made for the resetting password.</p>
    <%} %>
    <%if(request.getAttribute("error").equals("2")){ %>
    <h1><i class="fa fa-warning"></i> Oops ! Your request is expired. </h1>
    <p>Your request for resetting password is expired. you should reset your password in 2 days after the request for resetting password is made.</p>
    <%} %>
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
	<%} %> --%>
    
</div>
<jsp:include page="footer.jsp"></jsp:include>
<style>
<!--
body{
	background-color: gray;
}
h1{
	font-weight: bold;
	color: orange !important;
}
p{
	font-weight: bold;
	text-align: justify;
}
-->
</style>