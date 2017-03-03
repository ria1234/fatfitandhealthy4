<jsp:include page="header.jsp"></jsp:include>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/login.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/validationEngine.jquery.css" />
<div style="display: block; height: 100px;"></div>
<div class="login-block" style="z-index: 20 !important; margin-bottom: 30px;">
    <h1>Login</h1>
    <%if(request.getAttribute("error").equals("1")){ %>
    <div class="alert alert-warning">
  			<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
  			<strong>Username or password is incorrect or you have not given permission.</strong>
		</div>
	<%} %>
    <form action="${pageContext.request.contextPath }/login" method="post">
    <input type="text" value="" placeholder="Username" id="username" name="username"  class=" validate[required,custom[email]]"/>
    <input type="password" value="" placeholder="Password" id="password" name="password"  class="validate[required] text-input"/>
    <p>New User? Register <a style="color:#3c8dbc " href="${pageContext.request.contextPath }/signup">Here</a></p>
    <p>Forgot Password? Reset <a style="color:#3c8dbc " href="${pageContext.request.contextPath }/resetform">Here</a></p>
    <p>Login As An Admin <a style="color:#3c8dbc " href="${pageContext.request.contextPath }/admin/">Here</a></p>
    <button type="submit">Submit</button>
    </form>
</div>
<jsp:include page="footer.jsp"></jsp:include>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/jquery.validationEngine-en.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/jquery.validationEngine.js"></script>
<style>
<!--
body{
	background-color: gray;
}
-->
</style>
<script type="text/javascript">
jQuery(document).ready(function(){
	// binds form submission and fields to the validation engine
	//alert();
	jQuery("form").validationEngine();
});
</script>