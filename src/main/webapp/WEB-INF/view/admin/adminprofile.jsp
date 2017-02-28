<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page session="true" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page isELIgnored="false" %>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/admin/table.css" />

<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap-switch.min.css" />
<jsp:include page="upperheader.jsp"></jsp:include>
<script src="${pageContext.request.contextPath }/resources/js/admin/table.js"></script>
<%-- <script src="${pageContext.request.contextPath }/resources/js/bootstrap-switch.min.js"></script> --%>
<script src="${pageContext.request.contextPath }/resources/js/bootstrap-switch.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/jquery.validationEngine-en.js" type="text/javascript" charset="utf-8"></script>
  <script src="${pageContext.request.contextPath }/resources/js/jquery.validationEngine.js" type="text/javascript" charset="utf-8"></script>
  <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/validationEngine.jquery.css" />
<!-- Left side column. contains the logo and sidebar -->
  <aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
      <!-- Sidebar user panel -->
      <div class="user-panel">
        <div class="pull-left image">
          <img src="${pageContext.request.contextPath }/resources/image/admin/<%=session.getAttribute("image") %>" class="img-circle" alt="User Image">
        </div>
        <div class="pull-left info">
          <p><%=session.getAttribute("aname") %></p>
          <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
        </div>
      </div>
      <!-- search form -->
      <form action="#" method="get" class="sidebar-form">
        <div class="input-group">
          <input type="text" name="q" class="form-control" placeholder="Search...">
              <span class="input-group-btn">
                <button type="submit" name="search" id="search-btn" class="btn btn-flat"><i class="fa fa-search"></i>
                </button>
              </span>
        </div>
      </form>
      <!-- /.search form -->
      <!-- sidebar menu: : style can be found in sidebar.less -->
      <ul class="sidebar-menu">
        <li class="header">MAIN NAVIGATION</li>
        <li class="treeview">
          <a href="${pageContext.request.contextPath }/admin/dashboard">
            <i class="fa fa-dashboard"></i> <span>Dashboard</span>
            <span class="pull-right-container">

            </span>
          </a>

        </li>
        <%if(session.getAttribute("role").equals("superadmin")){ %>
        <li class="treeview">
          <a href="${pageContext.request.contextPath }/admin/manageadmin">
            <i class="fa fa-user"></i> <span>Manage Admin</span>
            <span class="pull-right-container">
<!--               <i class="fa fa-angle-left pull-right"></i> -->
            </span>
          </a>

        </li>
        <%} %>
        <li class="treeview">
          <a href="${pageContext.request.contextPath }/admin/manageusers">
            <i class="fa fa-user"></i> <span>Manage Users</span>
            <span class="pull-right-container">
<!--               <i class="fa fa-angle-left pull-right"></i> -->
            </span>
          </a>

        </li>
        <li class="treeview">
          <a href="${pageContext.request.contextPath }/admin/managefooditems">
            <i class="fa fa-cutlery"></i> <span>Manage Food Items</span>
            <span class="pull-right-container">
<!--               <i class="fa fa-angle-left pull-right"></i> -->
            </span>
          </a>

        </li>
        <li class="treeview">
          <a href="${pageContext.request.contextPath }/admin/manageexerciseitems">
            <i class="fa fa-heartbeat"></i> <span>Manage Exercise Items</span>
            <span class="pull-right-container">
<!--               <i class="fa fa-angle-left pull-right"></i> -->
            </span>
          </a>

        </li>
        <li class="treeview">
          <a href="managePostsAndComments">
            <i class="fa fa-comments"></i> <span>Manage Posts And Comments</span>
            <span class="pull-right-container">
<!--               <i class="fa fa-angle-left pull-right"></i> -->
            </span>
          </a>

        </li>

<!--         <li class="header">LABELS</li>
        <li><a href="#"><i class="fa fa-circle-o text-red"></i> <span>Important</span></a></li>
        <li><a href="#"><i class="fa fa-circle-o text-yellow"></i> <span>Warning</span></a></li>
        <li><a href="#"><i class="fa fa-circle-o text-aqua"></i> <span>Information</span></a></li> -->
      </ul>
    </section>
    <!-- /.sidebar -->
  </aside>
  
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        Update your Profile
        <small>Settings</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-user"></i> Home</a></li>
        <li class="active">Update your Profile</li>
      </ol>
    </section>



			<section class="content">
			      <div class="row">
        <div class="col-md-3">

          <!-- Profile Image -->
          <div class="box box-primary">
            <div class="box-body box-profile">
              <img class="profile-user-img img-responsive img-circle" src="${pageContext.request.contextPath }/resources/image/admin/<%=session.getAttribute("image") %>" alt="User profile picture">

              <h3 class="profile-username text-center"><%=session.getAttribute("aname") %></h3>

              <p class="text-muted text-center"></p>

              <!-- <ul class="list-group list-group-unbordered">
                <li class="list-group-item">
                  <b>Followers</b> <a class="pull-right">1,322</a>
                </li>
                <li class="list-group-item">
                  <b>Following</b> <a class="pull-right">543</a>
                </li>
                <li class="list-group-item">
                  <b>Friends</b> <a class="pull-right">13,287</a>
                </li>
              </ul> -->

              <!-- <a href="#" class="btn btn-primary btn-block"><b>Follow</b></a> -->
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->

          <!-- About Me Box -->
          <div class="box box-primary">
            <div class="box-header with-border">
              <h3 class="box-title">Account Details</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <strong><i class="fa fa-envelope"></i>Email</strong>

              <p class="text-muted">
                ${Admin.email}
              </p>

              <hr>

              <strong><i class="fa fa-user"></i>First Name</strong>

              <p class="text-muted">${Admin.firstname}</p>

              <hr>

              <strong><i class="fa fa-user"></i>Last Name</strong>

              <p class="text-muted">${Admin.lastname}</p>
              <hr>

              <strong><i class="fa fa-user"></i>Role</strong>

              <p class="text-muted">${Admin.role}</p>
                          </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
        </div>
        <!-- /.col -->
        <div class="col-md-9">
          <div class="nav-tabs-custom">
            <ul class="nav nav-tabs">
              <!-- <li class="active"><a href="#activity" data-toggle="tab">Activity</a></li>
              <li><a href="#timeline" data-toggle="tab">Timeline</a></li> -->
              <li class="active"><a href="#settings" data-toggle="tab">Settings</a></li>
            </ul>
            <div class="tab-content">

              <div class="active tab-pane" id="settings">
              
                <form:form modelAttribute="Admin" class="form-horizontal" method="post" action="${pageContext.request.contextPath }/admin/adminprofile" enctype="multipart/form-data">
                 
					<form:input type="hidden" path="id" />
				
                 <div class="form-group">
                 <div class="row">
                 <div class="col-sm-4"></div>
                 <div class="col-sm-4" style="margin-bottom: 5px;">
                 <img class="profile-user-img img-responsive img-circle" src="${pageContext.request.contextPath }/resources/image/admin/${Admin.image}" alt="User profile picture" style="width: 140px;" id="output">
                 </div>
                 <div class="col-sm-4"></div>
                 </div>
                 <div class="row">
                  <div class="col-sm-5">
                  	
                  </div>
                  <div class="col-sm-2">
                  <input type="file" id="image" name="file" class="file" onchange="loadFile(event)">
                  
				  <form:input type="hidden" path="image" value="" class="image" />
				  
				  </div>
                  <div class="col-sm-5"></div>
                  </div>
                </div>
                  <div class="form-group">
                    <label for="inputName" class="col-sm-2 control-label">Email Id</label>

                    <div class="col-sm-10">
                    	
                      <form:input type="email" class="form-control  validate[required,custom[email]]" id="inputName" placeholder="Email" path="email" />
                      
                    </div>
                  </div>
                  <div class="form-group">
                    <label for="inputEmail" class="col-sm-2 control-label">Password</label>

                    <div class="col-sm-10">
                    
                      <form:input type="password" class="form-control  validate[required] text-input" id="inputEmail" placeholder="Password" path="password" />
                      
                    </div>
                  </div>
                  <div class="form-group">
                    <label for="inputName" class="col-sm-2 control-label">First Name</label>

                    <div class="col-sm-10">
                    
                      <form:input type="text" class="form-control  validate[required] text-input" id="inputName" placeholder="First Name" path="firstname" />
                      
                    </div>
                  </div>
                  <div class="form-group">
                    <label for="inputExperience" class="col-sm-2 control-label">Last Name</label>

                    <div class="col-sm-10">
                    
                      <form:input type="text" class="form-control  validate[required] text-input" id="inputName" placeholder="Last Name" path="lastname" />
                    
                    </div>
                  </div>
                  <form:input type="hidden" path="role"/>
                  <form:hidden path="permission"/>
                  <form:hidden path="editTimestamp"/>
                  <form:hidden path="createTimestamp"/>

                  
				
                
                
                

                  
                  <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                      <button type="submit" class="btn btn-danger">Submit</button>
                    </div>
                  </div>
                </form:form>
              </div>
              <!-- /.tab-pane -->
            </div>
            <!-- /.tab-content -->
          </div>
          <!-- /.nav-tabs-custom -->
        </div>
        <!-- /.col -->
      </div>
      <!-- /.row -->
</div>
				
			
			</section>
      <!-- </div> -->
      <!-- /.row (main row) -->

    
    <!-- /.content -->
  <!-- </div> -->
  <!-- /.content-wrapper -->
  <jsp:include page="footer.jsp"></jsp:include>

  
  <!-- Add the sidebar's background. This div must be placed
       immediately after the control sidebar -->
  <div class="control-sidebar-bg"></div>
</div>
<!-- ./wrapper -->
</body>
</html>
<script type="text/javascript">
var loadFile = function(event) {
    var reader = new FileReader();
    reader.onload = function(){
      var output = document.getElementById('output');
      output.src = reader.result;
    };
    reader.readAsDataURL(event.target.files[0]);
  };
  $(document).ready(function(){
	   $(".file").change(function(){
			var filename=$(this).val();
			filename=filename.substr(filename.indexOf('.'));
			//alert(filename);
			$(".image").val(filename);
		}); 
	});
  jQuery(document).ready(function(){
		// binds form submission and fields to the validation engine
		//alert();
		jQuery("form").validationEngine();
	});
</script>