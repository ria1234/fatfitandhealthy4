<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib  uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ page session="true" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page isELIgnored="false" %>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/admin/table.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/plugins/select2/select2.min.css" />

<%-- <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap-switch.min.css" /> --%>

<jsp:include page="upperheader.jsp"></jsp:include>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/plugins/datepicker/datepicker3.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/validationEngine.jquery.css" />
<script src="${pageContext.request.contextPath }/resources/js/admin/table.js"></script>
<%-- <script src="${pageContext.request.contextPath }/resources/js/bootstrap-switch.min.js"></script> --%>
<%-- <script src="${pageContext.request.contextPath }/resources/js/bootstrap-switch.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/jquery.validationEngine-en.js" type="text/javascript" charset="utf-8"></script>
  <script src="${pageContext.request.contextPath }/resources/js/jquery.validationEngine.js" type="text/javascript" charset="utf-8"></script> --%>
  <script type="text/javascript" src="${pageContext.request.contextPath }/resources/plugins/select2/select2.full.min.js"">

<!--

//-->
</script>
<script src="${pageContext.request.contextPath }/resources/js/jquery.validationEngine-en.js" type="text/javascript" charset="utf-8"></script>
  <script src="${pageContext.request.contextPath }/resources/js/jquery.validationEngine.js" type="text/javascript" charset="utf-8"></script>
<!-- Left side column. contains the logo and sidebar -->
  <aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
      <!-- Sidebar user panel -->
      <div class="user-panel">
        <div class="pull-left image">
          <img src="${pageContext.request.contextPath }/resources/image/user/${cookie.uimage.value}" class="img-circle" alt="User Image">
        </div>
        <div class="pull-left info">
          <p>${cookie.uname.value}</p>
          <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
        </div>
      </div>
      <!-- search form -->
      <form action="#" method="get" class="sidebar-form" style="display:none;">
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
          <a href="${pageContext.request.contextPath }/home">
            <!-- <i class="fa fa-dashboard"></i> --> <img src="${pageContext.request.contextPath }/resources/images/calorie.png" height="15" width="15"><span style="padding-left: 7px">Manage Calories</span>
            <span class="pull-right-container">

            </span>
          </a>

        </li>
     
        <li class="treeview">
          <a href="${pageContext.request.contextPath }/waterintake">
            <i class="fa fa-tint"></i> <span>Water Intake</span>
            <span class="pull-right-container">
<!--               <i class="fa fa-angle-left pull-right"></i> -->
            </span>
          </a>

        </li>
       
        <li class="treeview">
          <a href="${pageContext.request.contextPath }/sleepcycle">
            <i class="fa fa-bed"></i> <span>Sleep Cycle</span>
            <span class="pull-right-container">
<!--               <i class="fa fa-angle-left pull-right"></i> -->
            </span>
          </a>

        </li>
        <li class="treeview">
          <a href="${pageContext.request.contextPath }/caloriehistory">
            <i class="fa fa-history"></i> <span>View History</span>
            <span class="pull-right-container">
<!--               <i class="fa fa-angle-left pull-right"></i> -->
            </span>
          </a>

        </li>
        
         <li class="treeview">
          <a href="${pageContext.request.contextPath }/editgoal">
            <i class="fa fa-pencil-square-o"></i> <span>Edit Weight And Fitness Goal</span>
            <span class="pull-right-container">
<!--               <i class="fa fa-angle-left pull-right"></i> -->
            </span>
          </a>

        </li>
        
        <li class="treeview">
          <a href="${pageContext.request.contextPath }/progress">
            <i class="fa fa-bar-chart"></i> <span>View Progress</span>
            <span class="pull-right-container">
<!--               <i class="fa fa-angle-left pull-right"></i> -->
            </span>
          </a>

        </li>
        <li class="treeview">
          <a href="${pageContext.request.contextPath }/shareideas">
            <i class="fa fa-comments"></i> <span>Share Ideas</span>
            <span class="pull-right-container">
<!--               <i class="fa fa-angle-left pull-right"></i> -->
            </span>
          </a>

        </li>

        
      </ul>
    </section>
    <!-- /.sidebar -->
  </aside>
  
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        User Profile
        <small>Fatfitandhealthy</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-user"></i> Home</a></li>
        <li class="active">User Profile</li>
        
      </ol>
    </section>



			<!-- <section class="content">
			<div class="row">
			
				
					</div>
				</div>
				
			</div>
			</section> -->
			
			<!-- Main content -->
    <section class="content">

      <div class="row">
        <div class="col-md-3">

          <!-- Profile Image -->
          <div class="box box-primary">
            <div class="box-body box-profile">
              <img class="profile-user-img img-responsive img-circle" src="${pageContext.request.contextPath }/resources/image/user/${cookie.uimage.value}" alt="User profile picture">

              <h3 class="profile-username text-center">${cookie.uname.value}</h3>

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
              <h3 class="box-title">Fitness Details</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <strong><i class="fa fa-arrows-v margin-r-5"></i> Height</strong>

              <p class="text-muted">
                ${UserHealth.height} cm.
              </p>

              <hr>

              <strong><i class="fa fa-balance-scale margin-r-5"></i>Weight</strong>

              <p class="text-muted">${UserHealth.weight} kg.</p>

              <hr>

              <strong><i class="fa fa-bicycle margin-r-5"></i>Activity Factor</strong>

              <p class="text-muted">${UserHealth.activityFactor}</p>
              <hr>

              <strong><i class="fa fa-bullseye margin-r-5"></i>Weight Goal</strong>

              <p class="text-muted">${UserHealth.weightGoal}</p>
              <hr>
              <strong><i class="fa fa-pencil margin-r-5"></i>Alter kgs per week</strong>

              <p class="text-muted">${UserHealth.kgs} kg.</p>
              <hr>
              <strong><i class="fa fa-bullseye margin-r-5"></i>Daily Cal Goal</strong>

              <p class="text-muted">${UserHealth.dailyCalGoal} Calories.</p>
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
<%--               <div class="active tab-pane" id="activity">
                <!-- Post -->
                <div class="post">
                  <div class="user-block">
                    <img class="img-circle img-bordered-sm" src="../../dist/img/user1-128x128.jpg" alt="user image">
                        <span class="username">
                          <a href="#">Jonathan Burke Jr.</a>
                          <a href="#" class="pull-right btn-box-tool"><i class="fa fa-times"></i></a>
                        </span>
                    <span class="description">Shared publicly - 7:30 PM today</span>
                  </div>
                  <!-- /.user-block -->
                  <p>
                    Lorem ipsum represents a long-held tradition for designers,
                    typographers and the like. Some people hate it and argue for
                    its demise, but others ignore the hate as they create awesome
                    tools to help create filler text for everyone from bacon lovers
                    to Charlie Sheen fans.
                  </p>
                  <ul class="list-inline">
                    <li><a href="#" class="link-black text-sm"><i class="fa fa-share margin-r-5"></i> Share</a></li>
                    <li><a href="#" class="link-black text-sm"><i class="fa fa-thumbs-o-up margin-r-5"></i> Like</a>
                    </li>
                    <li class="pull-right">
                      <a href="#" class="link-black text-sm"><i class="fa fa-comments-o margin-r-5"></i> Comments
                        (5)</a></li>
                  </ul>

                  <input class="form-control input-sm" type="text" placeholder="Type a comment">
                </div>
                <!-- /.post -->

                <!-- Post -->
                <div class="post clearfix">
                  <div class="user-block">
                    <img class="img-circle img-bordered-sm" src="../../dist/img/user7-128x128.jpg" alt="User Image">
                        <span class="username">
                          <a href="#">Sarah Ross</a>
                          <a href="#" class="pull-right btn-box-tool"><i class="fa fa-times"></i></a>
                        </span>
                    <span class="description">Sent you a message - 3 days ago</span>
                  </div>
                  <!-- /.user-block -->
                  <p>
                    Lorem ipsum represents a long-held tradition for designers,
                    typographers and the like. Some people hate it and argue for
                    its demise, but others ignore the hate as they create awesome
                    tools to help create filler text for everyone from bacon lovers
                    to Charlie Sheen fans.
                  </p>

                  <form class="form-horizontal">
                    <div class="form-group margin-bottom-none">
                      <div class="col-sm-9">
                        <input class="form-control input-sm" placeholder="Response">
                      </div>
                      <div class="col-sm-3">
                        <button type="submit" class="btn btn-danger pull-right btn-block btn-sm">Send</button>
                      </div>
                    </div>
                  </form>
                </div>
                <!-- /.post -->

                <!-- Post -->
                <div class="post">
                  <div class="user-block">
                    <img class="img-circle img-bordered-sm" src="../../dist/img/user6-128x128.jpg" alt="User Image">
                        <span class="username">
                          <a href="#">Adam Jones</a>
                          <a href="#" class="pull-right btn-box-tool"><i class="fa fa-times"></i></a>
                        </span>
                    <span class="description">Posted 5 photos - 5 days ago</span>
                  </div>
                  <!-- /.user-block -->
                  <div class="row margin-bottom">
                    <div class="col-sm-6">
                      <img class="img-responsive" src="../../dist/img/photo1.png" alt="Photo">
                    </div>
                    <!-- /.col -->
                    <div class="col-sm-6">
                      <div class="row">
                        <div class="col-sm-6">
                          <img class="img-responsive" src="../../dist/img/photo2.png" alt="Photo">
                          <br>
                          <img class="img-responsive" src="../../dist/img/photo3.jpg" alt="Photo">
                        </div>
                        <!-- /.col -->
                        <div class="col-sm-6">
                          <img class="img-responsive" src="../../dist/img/photo4.jpg" alt="Photo">
                          <br>
                          <img class="img-responsive" src="../../dist/img/photo1.png" alt="Photo">
                        </div>
                        <!-- /.col -->
                      </div>
                      <!-- /.row -->
                    </div>
                    <!-- /.col -->
                  </div>
                  <!-- /.row -->

                  <ul class="list-inline">
                    <li><a href="#" class="link-black text-sm"><i class="fa fa-share margin-r-5"></i> Share</a></li>
                    <li><a href="#" class="link-black text-sm"><i class="fa fa-thumbs-o-up margin-r-5"></i> Like</a>
                    </li>
                    <li class="pull-right">
                      <a href="#" class="link-black text-sm"><i class="fa fa-comments-o margin-r-5"></i> Comments
                        (5)</a></li>
                  </ul>

                  <input class="form-control input-sm" type="text" placeholder="Type a comment">
                </div>
                <!-- /.post -->
              </div> --%>
              <!-- /.tab-pane -->
<!--               <div class="tab-pane" id="timeline">
                The timeline
                <ul class="timeline timeline-inverse">
                  timeline time label
                  <li class="time-label">
                        <span class="bg-red">
                          10 Feb. 2014
                        </span>
                  </li>
                  /.timeline-label
                  timeline item
                  <li>
                    <i class="fa fa-envelope bg-blue"></i>

                    <div class="timeline-item">
                      <span class="time"><i class="fa fa-clock-o"></i> 12:05</span>

                      <h3 class="timeline-header"><a href="#">Support Team</a> sent you an email</h3>

                      <div class="timeline-body">
                        Etsy doostang zoodles disqus groupon greplin oooj voxy zoodles,
                        weebly ning heekya handango imeem plugg dopplr jibjab, movity
                        jajah plickers sifteo edmodo ifttt zimbra. Babblely odeo kaboodle
                        quora plaxo ideeli hulu weebly balihoo...
                      </div>
                      <div class="timeline-footer">
                        <a class="btn btn-primary btn-xs">Read more</a>
                        <a class="btn btn-danger btn-xs">Delete</a>
                      </div>
                    </div>
                  </li>
                  END timeline item
                  timeline item
                  <li>
                    <i class="fa fa-user bg-aqua"></i>

                    <div class="timeline-item">
                      <span class="time"><i class="fa fa-clock-o"></i> 5 mins ago</span>

                      <h3 class="timeline-header no-border"><a href="#">Sarah Young</a> accepted your friend request
                      </h3>
                    </div>
                  </li>
                  END timeline item
                  timeline item
                  <li>
                    <i class="fa fa-comments bg-yellow"></i>

                    <div class="timeline-item">
                      <span class="time"><i class="fa fa-clock-o"></i> 27 mins ago</span>

                      <h3 class="timeline-header"><a href="#">Jay White</a> commented on your post</h3>

                      <div class="timeline-body">
                        Take me to your leader!
                        Switzerland is small and neutral!
                        We are more like Germany, ambitious and misunderstood!
                      </div>
                      <div class="timeline-footer">
                        <a class="btn btn-warning btn-flat btn-xs">View comment</a>
                      </div>
                    </div>
                  </li>
                  END timeline item
                  timeline time label
                  <li class="time-label">
                        <span class="bg-green">
                          3 Jan. 2014
                        </span>
                  </li>
                  /.timeline-label
                  timeline item
                  <li>
                    <i class="fa fa-camera bg-purple"></i>

                    <div class="timeline-item">
                      <span class="time"><i class="fa fa-clock-o"></i> 2 days ago</span>

                      <h3 class="timeline-header"><a href="#">Mina Lee</a> uploaded new photos</h3>

                      <div class="timeline-body">
                        <img src="http://placehold.it/150x100" alt="..." class="margin">
                        <img src="http://placehold.it/150x100" alt="..." class="margin">
                        <img src="http://placehold.it/150x100" alt="..." class="margin">
                        <img src="http://placehold.it/150x100" alt="..." class="margin">
                      </div>
                    </div>
                  </li>
                  END timeline item
                  <li>
                    <i class="fa fa-clock-o bg-gray"></i>
                  </li>
                </ul>
              </div> -->
              <!-- /.tab-pane -->

              <div class="active tab-pane" id="settings">
              <div class="alert alert-info alert-dismissible">
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                <h4><i class="icon fa fa-info"></i> Info!</h4>
                Updating your information like height, Date of birth or gender will recalculate your daily Calorie goal which will overwrite it. 
              </div>
                <form class="form-horizontal" method="post" action="${pageContext.request.contextPath }/userupdate" enctype="multipart/form-data">
                 <spring:bind path="UserLogin.id">
					<input type="hidden" name="${status.expression }" value="${status.value}">
				</spring:bind>
                 <div class="form-group">
                 <div class="row">
                 <div class="col-sm-4"></div>
                 <div class="col-sm-4" style="margin-bottom: 5px;">
                 <img class="profile-user-img img-responsive img-circle" src="${pageContext.request.contextPath }/resources/image/user/${UserLogin.image}" alt="User profile picture" style="width: 140px;" id="output">
                 </div>
                 <div class="col-sm-4"></div>
                 </div>
                 <div class="row">
                  <div class="col-sm-5">
                  	
                  </div>
                  <div class="col-sm-2">
                  <input type="file" id="image" name="file" class="file" onchange="loadFile(event)">
                  <spring:bind path="UserLogin.image">
				  <input type="hidden" name="${status.expression }" value="${status.value}" class="image" />
				  </spring:bind>
				  </div>
                  <div class="col-sm-5"></div>
                  </div>
                </div>
                  <div class="form-group">
                    <label for="inputName" class="col-sm-2 control-label">Email Id</label>

                    <div class="col-sm-10">
                    	<spring:bind path="UserLogin.email">
                      <input type="email" class="form-control  validate[required,custom[email]]" id="inputName" placeholder="Email" name="${status.expression }" value="${status.value}">
                      </spring:bind>
                    </div>
                  </div>
                  <div class="form-group">
                    <label for="inputEmail" class="col-sm-2 control-label">Password</label>

                    <div class="col-sm-10">
                    <spring:bind path="UserLogin.password">
                      <input type="password" class="form-control  validate[required] text-input" id="inputEmail" placeholder="Password" name="${status.expression }" value="${status.value}">
                      </spring:bind>
                    </div>
                  </div>
                  <div class="form-group">
                    <label for="inputName" class="col-sm-2 control-label">Height (in cm)</label>

                    <div class="col-sm-10">
                    <spring:bind path="UserHealth.height">
                      <input type="number" class="form-control  validate[required]" id="inputName" placeholder="Height" name="${status.expression }" value="${status.value}" oninput="maxLengthCheck(this)" maxlength = "6" step="0.01">
                      </spring:bind>
                    </div>
                  </div>
                  <div class="form-group">
                    <label for="inputExperience" class="col-sm-2 control-label">First Name</label>

                    <div class="col-sm-10">
                    <spring:bind path="UsersPersonal.fname">
                      <input type="text" class="form-control  validate[required] text-input" id="inputName" placeholder="First Name" name="${status.expression }" value="${status.value}">
                    </spring:bind>
                    </div>
                  </div>
                  <div class="form-group">
                    <label for="inputExperience" class="col-sm-2 control-label">Last Name</label>

                    <div class="col-sm-10">
                    <spring:bind path="UsersPersonal.lname">
                      <input type="text" class="form-control validate[required] text-input" id="inputName" placeholder="Last Name" name="${status.expression }" value="${status.value}">
                      </spring:bind>
                    </div>
                  </div>
                  <div class="form-group">
					<label class="col-sm-2 control-label">Date Of Birth</label>
					<div class="input-group date col-sm-10" style="padding-left: 15px; padding-right: 15px;">
					<div class="input-group-addon">
						<i class="fa fa-calendar"></i>
					</div>
					<spring:bind path="UsersPersonal.dob">
					<input id="datepicker" class="form-control pull-right" type="text" name="${status.expression }" value="${status.value}" required>
					</spring:bind>
					</div>
				</div>
				<div class="form-group">
                  <label for="exampleInputEmail1"  class="col-sm-2 control-label">Mobile number</label>
                  <div class="col-sm-10">
                  <spring:bind path="UsersPersonal.mobNo">
                  <input type="number" class="form-control validate[required,minSize[10],maxSize[10]] text-input" id="exampleInputEmail1"  name="${status.expression }" value="${status.value}" oninput="maxLengthCheck(this)" maxlength = "10">
                  </spring:bind>
                  </div>
                </div>
                
                <div class="form-group">
                	<spring:bind path="UsersPersonal.gender">
                	<label class="col-sm-2 control-label">Gender</label>
                  	<div class="col-sm-10">
                    <label class="radio-inline">
                      <input type="radio" name="${status.expression }" id="optionsRadios1" value="male" ${UsersPersonal.gender eq 'male'?'checked':'' }>Male
                     </label>
                     <label class="radio-inline">
                      <input type="radio" name="${status.expression }" id="optionsRadios1" value="female" ${UsersPersonal.gender eq 'female'?'checked':'' }>female
                     </label>
                     
                  	</div>
                  	</spring:bind>
                </div>
                

                  
                  <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                      <button type="submit" class="btn btn-danger">Submit</button>
                    </div>
                  </div>
                </form>
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
    <!-- /.content -->
			
      <!-- </div> -->
      <!-- /.row (main row) -->

    
    <!-- /.content -->
 <!--  </div> -->
  <!-- /.content-wrapper -->
  <jsp:include page="admin/footer.jsp"></jsp:include>
  <script src="${pageContext.request.contextPath }/resources/plugins/datepicker/bootstrap-datepicker.js"></script>
  
  <!-- Add the sidebar's background. This div must be placed
       immediately after the control sidebar -->
  <div class="control-sidebar-bg"></div> </div>
<!-- ./wrapper -->
</body>
</html>
<script>
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
  $(document).ready(function(){
	  
	   $(".file").change(function(){
			var filename=$(this).val();
			filename=filename.substr(filename.indexOf('.'));
			//alert(filename);
			$(".image").val(filename);
		}); 
	});
	$(function(){
		//Date picker
	    $('#datepicker').datepicker({
	      autoclose: true
	    });
		});
	jQuery(document).ready(function(){
		// binds form submission and fields to the validation engine
		//alert();
		jQuery("form").validationEngine();
	});
</script>