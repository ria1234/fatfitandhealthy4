<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%-- <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%> --%>
<%@taglib  uri="http://www.springframework.org/tags" prefix="spring"%>

<%@ page session="true" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page isELIgnored="false" %>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/admin/table.css" />

<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap-switch.min.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/user/form.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/plugins/datepicker/datepicker3.css">
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
          <a href="dashboard">
            <i class="fa fa-dashboard"></i> <span>Dashboard</span>
            <span class="pull-right-container">

            </span>
          </a>

        </li>
        <li class="treeview">
          <a href="manageadmin">
            <i class="fa fa-user"></i> <span>Manage Admin</span>
            <span class="pull-right-container">
<!--               <i class="fa fa-angle-left pull-right"></i> -->
            </span>
          </a>

        </li>
        <li class="active treeview">
          <a href="manageusers">
            <i class="fa fa-user"></i> <span>Manage Users</span>
            <span class="pull-right-container">
<!--               <i class="fa fa-angle-left pull-right"></i> -->
            </span>
          </a>

        </li>
		<li class="treeview">
          <a href="managefooditems">
            <i class="fa fa-cutlery"></i> <span>Manage Food Items</span>
            <span class="pull-right-container">
<!--               <i class="fa fa-angle-left pull-right"></i> -->
            </span>
          </a>

        </li>
        <li class="treeview">
          <a href="manageexerciseitems">
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
        Update User Information
        <small>Control panel</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-user"></i> Home</a></li>
        <li>Manage Admins</li>
        <li class="active">Update User Information</li>
      </ol>
    </section>



			<section class="content">
			<div class="row">
			
				<div class="col-md-8 col-md-offset-2">
				
					
						
							<div class="box box-primary">
					            <div class="box-header with-border">
					              <h3 class="box-title">Update User Information</h3>
				            </div>
							<form method="post" action="${pageContext.request.contextPath }/admin/userupdate" enctype="multipart/form-data">
							<spring:bind path="UserLogin.id">
								<input type="hidden" name="${status.expression }" value="${status.value}">/>
							</spring:bind>
				              <div class="box-body">
				                <div class="form-group">
				                  <label>Email address</label>
				                  <spring:bind path="UserLogin.email">
				                  <input type="email" class="form-control" name="${status.expression }" value="${status.value}" required="true"/>
				                  </spring:bind>
				                </div>
				                <div class="form-group">
				                  <label>Password</label>
				                  <spring:bind path="UserLogin.password">
				                  <input type="password" class="form-control" name="${status.expression }" value="${status.value}" required="true"/>
				                  </spring:bind>
				                </div>
				                 <div class="form-group">
				                  <label>First Name</label>
				                  <spring:bind path="UsersPersonal.fname">
				                  <input type="text" class="form-control" name="${status.expression }" value="${status.value}" required="true"/>
				                  </spring:bind>
				                </div>
				                <div class="form-group">
				                  <label>Last Name</label>
				                  <spring:bind path="UsersPersonal.lname">
				                  <input type="text" class="form-control" name="${status.expression }" value="${status.value}" required="true"/>
				                  </spring:bind>
				                </div>
				                <div class="form-group">
				                	<label>Gender</label><br>
				                  <spring:bind path="UsersPersonal.gender">
				                    <label class="radio-inline">
				                    
				                      <input type="radio" name="${status.expression }" id="optionsRadios1" value="male" ${UsersPersonal.gender eq 'male'?'checked':'' }>Male
				                      
				                     </label>
				                     <label class="radio-inline">
				                      <input type="radio" name="${status.expression }" id="optionsRadios1" value="female" ${UsersPersonal.gender eq 'female'?'checked':'' }>female
				                     </label>
				                     </spring:bind>
				                  
				                </div>
				                <div class="form-group">
				                  <label for="exampleInputFile">File input</label><br>
				                  <img src="${pageContext.request.contextPath }/resources/image/user/${UserLogin.image}" class="img-thumbnail" alt="Cinque Terre" width="150" height="150" id="output"><br>
				                  
				                  <input type="file" id="image" name="file" class="file" onchange="loadFile(event)">
				                  <spring:bind path="UserLogin.image">
								  <input type="hidden" name="${status.expression }" value="${status.value}" class="image" />
								  </spring:bind>
				                  <p class="help-block">select image that you want to update</p>
				                </div>
				                <!-- <div class="form-group">
				                  <label>Role</label>
				                  <form:select path="role" cssClass="form-control">
				                  	<form:option value="admin" label="admin"></form:option>
				                  	<form:option value="superadmin" label="superadmin"></form:option>
				                  </form:select>
				                </div> -->
				               
				               <div class="form-group">
								<label>Date Of Birth</label>
								<div class="input-group date">
								<div class="input-group-addon">
									<i class="fa fa-calendar"></i>
								</div>
								<spring:bind path="UsersPersonal.dob">
								<input id="datepicker" class="form-control pull-right" type="text" name="${status.expression }" value="${status.value}">
								</spring:bind>
								</div>
								<div class="form-group">
				                  <label for="exampleInputEmail1">Mobile number</label>
				                  <spring:bind path="UsersPersonal.mobNo">
				                  <input type="number" class="form-control" id="exampleInputEmail1" name="${status.expression }" value="${status.value}" oninput="maxLengthCheck(this)" maxlength = "10">
				                  </spring:bind>
				                </div>
				                <div class="form-group">
				                  <label for="exampleInputEmail1">Weight (in kg)</label>
				                  <spring:bind path="UserHealth.weight">
				                  <input type="number" class="form-control" id="exampleInputEmail1" name="${status.expression }" value="${status.value}" oninput="maxLengthCheck(this)" maxlength = "4" step="0.01">
				                  </spring:bind>
				                </div>
				                <div class="form-group">
				                  <label for="exampleInputEmail1">Height (in cm)</label>
				                  <spring:bind path="UserHealth.height">
				                  <input type="number" class="form-control" id="exampleInputEmail1" name="${status.expression }" value="${status.value}" oninput="maxLengthCheck(this)" maxlength = "6" step="0.01">
				                  </spring:bind>
				                </div>
				                <div class="form-group">
				                  <label>Activity Factor</label>
				                  <spring:bind path="UserHealth.activityFactor">
				                  <select name="${status.expression }" class="form-control">
				                  	<option>----select----</option>
				                  	<option value="sedentary" ${status.value eq 'sedentary'?'selected':'' }>sedentary</option>
				                  	<option value="lightly active" ${status.value eq 'lightly active'?'selected':'' }>lightly active</option>
				                  	<option value="moderetely active" ${status.value eq 'moderetely active'?'selected':'' }>moderetly active</option>
				                  	<option value="very active" ${status.value eq 'very active'?'selected':'' }>very active</option>
				                  	<option value="extra active" ${status.value eq 'extra active'?'selected':'' }>extra active</option>
				                  </select>
				                  </spring:bind>
						        </div>
						        <div class="form-group">
				                  <label>Weight Goal</label>
				                  <spring:bind path="UserHealth.weightGoal">
				                  <select name="${status.expression }" class="form-control" onchange="kgso();" id="a">
				                  	<option>----select----</option>
				                  	<option value="maintain weight" ${status.value eq 'maintain weight'?'selected':'' }>maintain weight</option>
				                  	<option value="loose weight" ${status.value eq 'loose weight'?'selected':'' }>loose weight</option>
				                  	<option value="gain weight" ${status.value eq 'gain weight'?'selected':'' }>gain weight</option>
				                  	
				                  </select>
				                  </spring:bind>
						         </div> 
						          <div class="form-group" id="kg" style="display: none">
					                  <label for="exampleInputEmail1" id="kglabel"></label>
					                  <spring:bind path="UserHealth.kgs">
					                  <select name="${status.expression }" class="form-control">
					                  	<option selected=" ${status.value eq '0'?'selected':'' }" value="0">----select----</option>
					                  	<option value="0.5" ${status.value eq '0.5'?'selected':'' }>0.5 kg</option>
					                  	<option value="0.25" ${status.value eq '0.25'?'selected':'' }>0.25 kg</option>
					                  	
					                  	
					                  </select>
					                  </spring:bind>
					                </div>
				              </div>
				              <!-- /.box-body -->
				                <spring:bind path="UserLogin.status">
								<input type="hidden" name="${status.expression }" value="${status.value}">
								</spring:bind>
								<spring:bind path="UserLogin.createTimestamp">
								<input type="hidden" name="${status.expression }" value="${status.value}">
								</spring:bind>
				              <div class="box-footer">
				                <button type="submit" class="btn btn-primary">Submit</button>
				              </div>
            				</form>
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
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.11.2/moment.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/plugins/datepicker/bootstrap-datepicker.js"></script>
  
  <!-- Add the sidebar's background. This div must be placed
       immediately after the control sidebar -->
  <div class="control-sidebar-bg"></div>
</div>
<!-- ./wrapper -->
<!-- </body>
</html> -->
<script type="text/javascript">
var loadFile = function(event) {
    var reader = new FileReader();
    reader.onload = function(){
      var output = document.getElementById('output');
      output.src = reader.result;
    };
    reader.readAsDataURL(event.target.files[0]);
  };
  function maxLengthCheck(object)
  {
    if (object.value.length > object.maxLength)
      object.value = object.value.slice(0, object.maxLength)
  }
  function kgso() {
	  var r=document.getElementById('a');
	if (r.value=="loose weight") {
		document.getElementById("kg").style.display="block";
		document.getElementById("kglabel").innerHTML="How many kilograms of weight do you want to loose in a week ?";
	}
	else{
			if(r.value=="gain weight")
				{
				document.getElementById("kg").style.display="block";
				document.getElementById("kglabel").innerHTML="How many kilograms of weight do you want to gain in a week?";
				}
			else{
				document.getElementById("kg").style.display="none";
				}
		}
	
}
  $(document).ready(function(){
	  kgso();
	   $(".file").change(function(){
			var filename=$(this).val();
			filename=filename.substr(filename.indexOf('.'));
			//alert(filename);
			$(".image").val(filename);
		}); 
	});
</script>