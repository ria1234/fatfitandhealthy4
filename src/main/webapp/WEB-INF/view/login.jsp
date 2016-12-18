<jsp:include page="header.jsp"></jsp:include>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/login.css" />
<div style="display: block; height: 100px;"></div>
<div class="login-block">
    <h1>Login</h1>
    <%if(request.getAttribute("error").equals("1")){ %>
    <div class="alert alert-warning">
  			<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
  			<strong>Username or password is incorrect or you have not given permission.</strong>
		</div>
	<%} %>
    <form action="${pageContext.request.contextPath }/login" method="post">
    <input type="text" value="" placeholder="Username" id="username" name="username"/>
    <input type="password" value="" placeholder="Password" id="password" name="password"/>
    <p>New User? Register <a style="color:#3c8dbc " href="${pageContext.request.contextPath }/signup">Here</a></p>
    <button type="submit">Submit</button>
    </form>
</div>
<jsp:include page="footer.jsp"></jsp:include>
