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
          <a href="manageadmin">
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
        <li class="active treeview">
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
        Update Food Item
        <small>Control panel</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-user"></i> Home</a></li>
        <li>Manage Food Items</li>
        <li class="active">Update Food Item</li>
      </ol>
    </section>



			<section class="content">
			<div class="row">
			
				<div class="col-md-8 col-md-offset-2">
				
					
						
							<div class="box box-primary">
					            <div class="box-header with-border">
					              <h3 class="box-title">Update Food Item</h3>
				            </div>
							<form:form method="post" action="${pageContext.request.contextPath }/admin/updatefooditem" modelAttribute="FoodItems">
								<form:hidden path="id"/>
				              <div class="box-body">
				                <div class="form-group">
				                  <label>Name:</label>
				                  <form:input type="text" class="form-control" path="name" required="true"/>
				                </div>
				                <div class="form-group">
				                  <label>Serving Size</label>
				                  <form:input type="text" class="form-control" path="servingSize" required="true"/>
				                </div>
				                <p><b>Note: </b>Below food item nutrients details are to be added per serving size.</p>
				                 <div class="form-group">
				                  <label>Calories</label>
				                  <form:input type="number" class="form-control" path="cal" required="true" step="0.01"/>
				                </div>
				                <div class="form-group">
				                  <label>Fat (in gram)</label>
				                  <form:input type="number" class="form-control" path="fat" required="true" step="0.01"/>
				                </div>
				                <div class="form-group">
				                  <label>Cholesterol (in mg)</label>
				                  <form:input type="number" class="form-control" path="cholesterol" required="true" step="0.01"/>
				                </div>
				                <div class="form-group">
				                  <label>Sodium (in mg)</label>
				                  <form:input type="number" class="form-control" path="sodium" required="true" step="0.01"/>
				                </div>
				                <div class="form-group">
				                  <label>Potassium (in mg)</label>
				                  <form:input type="number" class="form-control" path="potassium" required="true" step="0.01"/>
				                </div>
				               <div class="form-group">
				                  <label>Carbs (in gram)</label>
				                  <form:input type="number" class="form-control" path="carbs" required="true" step="0.01"/>
				                </div>
				                <div class="form-group">
				                  <label>Fiber (in gram)</label>
				                  <form:input type="number" class="form-control" path="fiber" required="true" step="0.01"/>
				                </div>
				                <div class="form-group">
				                  <label>Sugars (in gram)</label>
				                  <form:input type="number" class="form-control" path="sugars" required="true" step="0.01"/>
				                </div>
				                <div class="form-group">
				                  <label>Protein (in gram)</label>
				                  <form:input type="number" class="form-control" path="protein" required="true" step="0.01"/>
				                </div>
				                
				               
				              </div>
				              <!-- /.box-body -->
								
				              <div class="box-footer">
				                <button type="submit" class="btn btn-primary">Submit</button>
				              </div>
            				</form:form>
            				</div>
					</div>
				</div>
				
			</div>
			</section>
      </div>
      <!-- /.row (main row) -->

    
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
  <jsp:include page="footer.jsp"></jsp:include>

  
  <!-- Add the sidebar's background. This div must be placed
       immediately after the control sidebar -->
  <div class="control-sidebar-bg"></div>
</div>
<!-- ./wrapper -->
</body>
</html>
