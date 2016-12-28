<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page session="true" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page isELIgnored="false" %>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/admin/table.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/plugins/select2/select2.min.css" />

<%-- <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap-switch.min.css" /> --%>
<jsp:include page="upperheader.jsp"></jsp:include>
<script src="${pageContext.request.contextPath }/resources/js/admin/table.js"></script>
<%-- <script src="${pageContext.request.contextPath }/resources/js/bootstrap-switch.min.js"></script> --%>
<%-- <script src="${pageContext.request.contextPath }/resources/js/bootstrap-switch.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/jquery.validationEngine-en.js" type="text/javascript" charset="utf-8"></script>
  <script src="${pageContext.request.contextPath }/resources/js/jquery.validationEngine.js" type="text/javascript" charset="utf-8"></script> --%>
  <script type="text/javascript" src="${pageContext.request.contextPath }/resources/plugins/select2/select2.full.min.js"">
<!--

//-->
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
     
        <li class="active treeview">
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
        Manage Water Intake
        <small>Fatfitandhealthy</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-user"></i> Home</a></li>
        <li class="active">Manage Water Intake</li>
        
      </ol>
    </section>



			<section class="content">
			<div class="row">
			
				<div class="col-md-8 col-md-offset-2">
				
					
						
							<div class="box box-primary">
					            <div class="box-header with-border">
					              <h3 class="box-title">Manage Water Intake</h3>
				            </div>
							
							<div class="box box-solid">
					            <div class="box-header with-border">
					              <i class="fa fa-tint"  aria-hidden="true"></i>
								 <%-- <img src="${pageContext.request.contextPath }/resources/images/calorie.png" height="30" width="30" style="padding-top: 0px; margin-top: 0px"> --%>
					              <h3 class="box-title">Maintain Daily Water Intake</h3>
					            </div>
					            <!-- /.box-header -->
					            <div class="box-body">
					            <div class="row">
					              <div class="col-md-1 col-md-offset-1" style="border: outset #3c8dbc; padding-left: 5px !important;" id="goal">
					              ${goal}
					              </div>
					              <div class="col-md-1" style="horizontal-align: middle;"><p style="font-size: 2em; padding-left: 10px; margin-top: -10px"><b>-</b></p></div>
					              
					              <div class="col-md-1" style="border: outset #3c8dbc; padding-left: 5px !important;" id="water">
					              	<%-- ${water} --%>
					              	<fmt:formatNumber value="${water}" maxFractionDigits="3" groupingUsed="False"/>
					              </div>
					              <div class="col-md-1" style="horizontal-align: middle;"><p style="font-size: 2em; padding-left: 10px; margin-top: -10px"><b>=</b></p></div>
					              <div class="col-md-1" style="border: outset #3c8dbc; padding-left: 5px !important;" id="total">
					              <%-- ${goal-water} --%>
					              <fmt:formatNumber value="${goal-water}" maxFractionDigits="3" groupingUsed="False"/>
					              </div>
					              </div>
					              <div class="row">
					              <div class="col-md-1 col-md-offset-1" style="">
					              	Goal<br>(Glass)
					              </div>
					              <div class="col-md-1" style="horizontal-align: middle;"><p style="font-size: 2em; margin: 0; padding: 0"><b></b></p></div>
					              
					              <div class="col-md-1" style="">
					              	Water
					              </div>
					              
					              <div class="col-md-1" style="horizontal-align: middle;"><p style="font-size: 2em; margin: 0; padding: 0"><b></b></p></div>
					              <div class="col-md-1" style="margin-left: -10px !important;">
					              	Remaining
					              </div>
					              </div>
					            </div>
					            <div class="box-footer">
					            
					            	<button type="button" class="btn btn-primary btn-block btn-flat" data-toggle="collapse" data-target="#wateri">Add Water</button>
					           
					            
					            </div>
					            <!-- /.box-body -->
					          </div>
          <!-- /.box -->
          					
					            
					          <div class="box-footer">
				                
				                <div class="col-md-8 collapse col-md-offset-2" style="" id="wateri">
				                	<div class="form-group">
					                <label>Add Water</label>
					                
					              </div>
					              <div id="glass">
					              	
					              	<form  action="${pageContext.request.contextPath }/home/addwater" id="w">
					              		<div class="form-group" style="margin-top: 15px;">
					              			<label style="font-weight:400;">Number Of Glass</label>
					              			<div class="col-sm-10">
					              				<input class="form-control" type="number" name="glass">
					              			</div>
					              		</div><br>
					              		<button class="btn btn-primary pull-left" type="submit" style="margin-top: 15px;">Submit</button>
					              	</form>
					              </div>
				                </div>
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
 

  $(document).ready(function(){

		//submit exerciseitems form
		$("#w").submit(function(e)
		{
			e.preventDefault();
			//this.reset();
			
			//var select=$("#fooditem");
		
			var water=$("input[name=glass]").val();
			var uid=${cookie.id.value};
			//alert(water);
			this.reset();
			var formURL = $(this).attr("action");
			$.ajax(
					{
						url : formURL,
						type: "POST",
						data : {"water":water,"uid":uid},
						success:function(data, textStatus, jqXHR) 
						{
							//alert(data.result);
							$('#wateri').removeClass( "in" );
							//$("#f").reset();
							//data: return data from server
							$("#water").text((parseFloat($("#water").text())+parseFloat(water)).toFixed(2));
							$("#total").text((parseFloat($("#goal").text())-parseFloat($("#water").text())).toFixed(2));
							//alert($("fcal").html());
						},
						error: function(jqXHR, textStatus, errorThrown) 
						{
							//if fails		
						}
					});
			//$(this).unbind(e);
		});
	  });
</script>