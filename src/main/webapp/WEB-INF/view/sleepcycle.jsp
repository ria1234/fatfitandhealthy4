<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page session="true" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page isELIgnored="false" %>
<%-- <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/admin/table.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/plugins/select2/select2.min.css" /> --%>

<%-- <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap-switch.min.css" /> --%>
<jsp:include page="upperheader.jsp"></jsp:include>
<%-- <script src="${pageContext.request.contextPath }/resources/js/admin/table.js"></script> --%>
<%-- <script src="${pageContext.request.contextPath }/resources/js/bootstrap-switch.min.js"></script> --%>
<%-- <script src="${pageContext.request.contextPath }/resources/js/bootstrap-switch.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/jquery.validationEngine-en.js" type="text/javascript" charset="utf-8"></script>
  <script src="${pageContext.request.contextPath }/resources/js/jquery.validationEngine.js" type="text/javascript" charset="utf-8"></script> --%>
<%--   <script type="text/javascript" src="${pageContext.request.contextPath }/resources/plugins/select2/select2.full.min.js""> --%>

<script src="${pageContext.request.contextPath }/resources/plugins/stylishtimepicker/timedropper.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/plugins/stylishtimepicker/timedropper.css">

<style>
<!--
td{
	background-color: lightblue;
	
}
-->
</style>

<script>

	$(document).ready(function(){
		
		});
		
	
</script>
	


</script>
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
       
        <li class="active treeview">
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
        Manage Sleep Cycle
        <small>Fatfitandhealthy</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-user"></i> Home</a></li>
        <li class="active">Manage Sleep Cycle</li>
        
      </ol>
    </section>



			<section class="content">
			<div class="row">
			
				<div class="col-md-8 col-md-offset-2">
				
					
						
							<div class="box box-primary">
					            <div class="box-header with-border">
					              <h3 class="box-title">Manage Sleep Cycle</h3>
				            </div>
							
							<div class="box box-solid">
					            <div class="box-header with-border">
					              <i class="fa fa-bed"  aria-hidden="true"></i>
								 <%-- <img src="${pageContext.request.contextPath }/resources/images/calorie.png" height="30" width="30" style="padding-top: 0px; margin-top: 0px"> --%>
					              <h3 class="box-title">Maintain Daily Sleep Cycle</h3>
					            </div>
					            <!-- /.box-header -->
					            <div class="box-body">
					    
					              <div id="first" class="text-center" style="display:block;">
					              	<p class="lead">If I want to wake up at</p>
									<input type="text" id="alarm" style="line-height: 200%;"/><br>
					              	<button class="btn btn-primary btn-flat" style="margin-top: 20px;" id="bed"><i class="fa fa-fw fa-clock-o"></i> When Should I Go To Bed ?</button>
					              	<p class="lead" style="margin-top: 20px;">If I Go To Sleep Now ... </p>
					              	<button class="btn btn-primary btn-flat" id="wake"><i class="fa fa-fw fa-clock-o"></i> When Should I Wake Up ?</button>
					              </div>
					              <div id="second" class="text-center" style="display: none;">
					              	<p class="lead">Go To Bed Times</p>
					              	<p>It takes the average human about 15 minutes to fall asleep.</p>
					              	<p>To wakeup refreshed at <b id="wt">8:00 </b>you should go to bed at one of the following times : </p>
					              	<div class="row">
					              	<div class="col-md-offset-4 col-md-4">
					              	<table class="table table-hover">
					              	<tbody>
					              		<tr><td id="ss6" style="font-weight: bold;">8:00</td></tr>
					              		<tr><td id="ss5" style="font-weight: bold;">8:00</td></tr>
					              		<tr><td id="ss4">8:00</td></tr>
					              		<tr><td id="ss3">8:00</td></tr>
					              		<tr><td id="ss2">8:00</td></tr>
					              		<tr><td id="ss1">8:00</td></tr>
					              	</tbody>
					              	</table>
					              	</div>
					              	<div class="col-md-4"></div>
					              	</div>
					              	<p>If you wake up at one of these times, you will feel refreshed whole day.</p>
					              	<p>A good night's sleep consists of 5-6 complete sleep cycles.</p>
					              	<button class="btn btn-primary btn-flat" onclick="document.getElementById('second').style.display='none';document.getElementById('first').style.display='block';"><i class="fa fa-undo"></i>&nbsp;&nbsp;Calculate Again</button>
					              </div>
					              <div id="third" class="text-center" style="display: none;">
					              	<p class="lead">Wake Up Times</p>
					              	<p>It takes the average human about 15 minutes to fall asleep.</p>
					              	<p>If you go to sleep right now, you should try to wake up at one of the following times:</p>
					              	<div class="row">
					              	<div class="col-md-offset-4 col-md-4">
					              	<table class="table table-hover">
					              	<tbody>
					              		<tr><td id="ws1">8:00</td></tr>
					              		<tr><td id="ws2">8:00</td></tr>
					              		<tr><td id="ws3">8:00</td></tr>
					              		<tr><td id="ws4">8:00</td></tr>
					              		<tr><td id="ws5" style="font-weight: bold;">8:00</td></tr>
					              		<tr><td id="ws6" style="font-weight: bold;">8:00</td></tr>
					              	</tbody>
					              	</table>
					              	</div>
					              	<div class="col-md-4"></div>
					              	</div>
					              	<p>If you wake up at one of these times, you will feel refreshed whole day.</p>
					              	<p>A good night's sleep consists of 5-6 complete sleep cycles.</p>
					              	<button class="btn btn-primary btn-flat" onclick="document.getElementById('third').style.display='none';document.getElementById('first').style.display='block';"><i class="fa fa-undo"></i>&nbsp;&nbsp;Calculate Again</button>
					              </div>
					            </div>
					            <div class="box-footer">
					            
					            	
					           
					            
					            </div>
					            <!-- /.box-body -->
					          </div>
          <!-- /.box -->
          					
					            
					          <div class="box-footer">
				                
				              </div>
					          </div>
							
            				</div>
					</div>
				</div>
				
			<!-- </div> -->
			</section>
      <!-- </div> -->
      <!-- /.row (main row) -->

    
    <!-- /.content -->
 <!--  </div> -->
  <!-- /.content-wrapper -->
  <jsp:include page="admin/footer.jsp"></jsp:include>

  
  <!-- Add the sidebar's background. This div must be placed
       immediately after the control sidebar -->
  <div class="control-sidebar-bg"></div> </div>
<!-- ./wrapper -->
</body>
</html>
<script>
 
$( "#alarm" ).timeDropper(true);
  $(document).ready(function(){
		//alert($("#alarm").val().slice(-2));
		//submit exerciseitems form
		$("#bed").click(function(e)
		{
		
			var time=$("#alarm").val();
			//alert(time);
			//$("#alarm").val(new Date()':');
			var d=new Date();
			
			d.setHours(parseInt(time.slice(-5)));
			d.setMinutes(parseInt(time.slice(-2)));
			if (d.getHours()<=12) {
				d.setDate(d.getDate()+1);
			}
			$("#wt").html(('0'+d.getHours()).slice(-2)+":"+('0'+d.getMinutes()).slice(-2));
			d.setMinutes(d.getMinutes()-15);
			var ss1=new Date(d);
			ss1.setMinutes(ss1.getMinutes()-90);
			var ss2=new Date(ss1);
			ss2.setMinutes(ss2.getMinutes()-90);
			var ss3=new Date(ss2);
			ss3.setMinutes(ss3.getMinutes()-90);
			var ss4=new Date(ss3);
			ss4.setMinutes(ss4.getMinutes()-90);
			var ss5=new Date(ss4);
			ss5.setMinutes(ss5.getMinutes()-90);
			var ss6=new Date(ss5);
			ss6.setMinutes(ss6.getMinutes()-90);
			//alert(ss6);
			
			$("#ss1").html(('0'+ss1.getHours()).slice(-2)+":"+('0'+ss1.getMinutes()).slice(-2));
			$("#ss2").html(('0'+ss2.getHours()).slice(-2)+":"+('0'+ss2.getMinutes()).slice(-2));
			$("#ss3").html(('0'+ss3.getHours()).slice(-2)+":"+('0'+ss3.getMinutes()).slice(-2));
			$("#ss4").html(('0'+ss4.getHours()).slice(-2)+":"+('0'+ss4.getMinutes()).slice(-2));
			$("#ss5").html(('0'+ss5.getHours()).slice(-2)+":"+('0'+ss5.getMinutes()).slice(-2));
			$("#ss6").html(('0'+ss6.getHours()).slice(-2)+":"+('0'+ss6.getMinutes()).slice(-2));
			$("#first").hide();
			$("#second").show();
			
		});

		$("#wake").click(function(e){

			var d2=new Date();
			var ws1=new Date(d2);
			ws1.setMinutes(ws1.getMinutes()+90+15);
			var ws2=new Date(ws1);
			ws2.setMinutes(ws2.getMinutes()+90);
			var ws3=new Date(ws2);
			ws3.setMinutes(ws3.getMinutes()+90);
			var ws4=new Date(ws3);
			ws4.setMinutes(ws4.getMinutes()+90);
			var ws5=new Date(ws4);
			ws5.setMinutes(ws5.getMinutes()+90);
			var ws6=new Date(ws5);
			ws6.setMinutes(ws6.getMinutes()+90);
			$("#ws1").html(('0'+ws1.getHours()).slice(-2)+":"+('0'+ws1.getMinutes()).slice(-2));
			$("#ws2").html(('0'+ws2.getHours()).slice(-2)+":"+('0'+ws2.getMinutes()).slice(-2));
			$("#ws3").html(('0'+ws3.getHours()).slice(-2)+":"+('0'+ws3.getMinutes()).slice(-2));
			$("#ws4").html(('0'+ws4.getHours()).slice(-2)+":"+('0'+ws4.getMinutes()).slice(-2));
			$("#ws5").html(('0'+ws5.getHours()).slice(-2)+":"+('0'+ws5.getMinutes()).slice(-2));
			$("#ws6").html(('0'+ws6.getHours()).slice(-2)+":"+('0'+ws6.getMinutes()).slice(-2));
			$("#third").show();
			$("#first").hide();
			//alert(ws2);
			});
	  });
</script>