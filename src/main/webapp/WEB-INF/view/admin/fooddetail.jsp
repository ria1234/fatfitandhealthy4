<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page session="true" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page isELIgnored="false" %>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/admin/table.css" />

<%-- <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap-switch.min.css" /> --%>
<jsp:include page="upperheader.jsp"></jsp:include>
<script src="${pageContext.request.contextPath }/resources/js/admin/table.js"></script>
<%-- <script src="${pageContext.request.contextPath }/resources/js/bootstrap-switch.min.js"></script> --%>
<%-- <script src="${pageContext.request.contextPath }/resources/js/bootstrap-switch.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/jquery.validationEngine-en.js" type="text/javascript" charset="utf-8"></script>
  <script src="${pageContext.request.contextPath }/resources/js/jquery.validationEngine.js" type="text/javascript" charset="utf-8"></script> --%>
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

        <li class="header">LABELS</li>
        <li><a href="#"><i class="fa fa-circle-o text-red"></i> <span>Important</span></a></li>
        <li><a href="#"><i class="fa fa-circle-o text-yellow"></i> <span>Warning</span></a></li>
        <li><a href="#"><i class="fa fa-circle-o text-aqua"></i> <span>Information</span></a></li>
      </ul>
    </section>
    <!-- /.sidebar -->
  </aside>
  
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        View Food Nutrition Information
        <small>Control panel</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-user"></i> Home</a></li>
        <li>Manage Food Items</li>
        <li class="active">View Food Nutrition Information</li>
      </ol>
    </section>



			<section class="content">
			<div class="row">
			
				<div class="col-md-8 col-md-offset-2">
				
					
						
							<div class="box box-primary">
					            <div class="box-header with-border">
					              <h3 class="box-title">View Food Nutrition Information</h3>
				            </div>
							
							<div class="box box-solid">
					            <div class="box-header with-border">
					              <i class="fa fa-cutlery"  aria-hidden="true"></i>
					
					              <h3 class="box-title">Food Nutrition details</h3>
					            </div>
					            <!-- /.box-header -->
					            <div class="box-body">
					              <dl class="dl-horizontal">
					              	<dt>Fat</dt>
					                <dd>${FoodItems.fat}</dd>
					                <dt>Cholesterol:</dt>
					                <dd>${FoodItems.cholesterol}.</dd>
					                <dt>Sodium</dt>
					                <dd>${FoodItems.sodium}</dd>
					                <dt>Potassium:</dt>
					                <dd>${FoodItems.potassium}</dd>
					                <dt>Carbs</dt>
					                <dd>${FoodItems.carbs}</dd>
					                <dt>Fiber</dt>
					                <dd>${FoodItems.fiber}</dd>
					                <dt>Sugars</dt>
					                <dd>${FoodItems.sugars}</dd>
					                <dt>Protein:</dt>
					                <dd>${FoodItems.protein}</dd>
					              </dl>
					            </div>
					            <!-- /.box-body -->
					          </div>
          <!-- /.box -->
          					
					            
					          <div class="box-footer">
				                <button type="button" class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath }/admin/managefooditems';">Back</button>
				              </div>
					          </div>
							
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
