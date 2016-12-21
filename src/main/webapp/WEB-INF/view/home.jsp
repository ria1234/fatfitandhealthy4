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
        <li class="active treeview">
          <a href="${pageContext.request.contextPath }/managecalories">
            <!-- <i class="fa fa-dashboard"></i> --> <img src="${pageContext.request.contextPath }/resources/images/calorie.png" height="15" width="15"><span style="padding-left: 7px">Manage Calories</span>
            <span class="pull-right-container">

            </span>
          </a>

        </li>
     
        <li class="treeview">
          <a href="${pageContext.request.contextPath }/waterintake">
            <i class="fa fa-user"></i> <span>Water Intake</span>
            <span class="pull-right-container">
<!--               <i class="fa fa-angle-left pull-right"></i> -->
            </span>
          </a>

        </li>
       
        <li class="treeview">
          <a href="${pageContext.request.contextPath }/admin/sleepcycle">
            <i class="fa fa-user"></i> <span>Sleep Cycle</span>
            <span class="pull-right-container">
<!--               <i class="fa fa-angle-left pull-right"></i> -->
            </span>
          </a>

        </li>
        <li class="treeview">
          <a href="${pageContext.request.contextPath }/admin/caloriehistory">
            <i class="fa fa-cutlery"></i> <span>Calorie History</span>
            <span class="pull-right-container">
<!--               <i class="fa fa-angle-left pull-right"></i> -->
            </span>
          </a>

        </li>
        <li class="treeview">
          <a href="${pageContext.request.contextPath }/admin/shareideas">
            <i class="fa fa-heartbeat"></i> <span>Share Ideas</span>
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
        Manage Calories
        <small>Control panel</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-user"></i> Home</a></li>
        <li class="active">Manage Calories</li>
        
      </ol>
    </section>



			<section class="content">
			<div class="row">
			
				<div class="col-md-8 col-md-offset-2">
				
					
						
							<div class="box box-primary">
					            <div class="box-header with-border">
					              <h3 class="box-title">Manage Calories</h3>
				            </div>
							
							<div class="box box-solid">
					            <div class="box-header with-border">
					             <!--  <i class="fa fa-cutlery"  aria-hidden="true"></i> -->
								 <img src="${pageContext.request.contextPath }/resources/images/calorie.png" height="30" width="30" style="padding-top: 0px; margin-top: 0px">
					              <h3 class="box-title">Maintain Daily Calorie Goal</h3>
					            </div>
					            <!-- /.box-header -->
					            <div class="box-body">
					            <div class="row">
					              <div class="col-md-1 col-md-offset-1" style="border: outset #3c8dbc; padding-left: 5px !important;" id="dcal">
					              ${calgoal}
					              </div>
					              <div class="col-md-1" style="horizontal-align: middle;"><p style="font-size: 2em; padding-left: 10px; margin-top: -10px"><b>-</b></p></div>
					              
					              <div class="col-md-1" style="border: outset #3c8dbc; padding-left: 5px !important;" id="fcal">
					              	<%-- ${foodcal} --%>
					              	<fmt:formatNumber value="${foodcal}" maxFractionDigits="3" groupingUsed="False"/>
					              </div>
					              <div class="col-md-1" style="horizontal-align: middle;"><p style="font-size: 2em; padding-left: 10px; margin-top: -10px"><b>+</b></p></div>
					              <div class="col-md-1" style="border: outset #3c8dbc; padding-left: 5px !important;" id="ecal">
					              	<%-- ${execal} --%>
					              	<fmt:formatNumber value="${execal}" maxFractionDigits="3" groupingUsed="False"/>
					              </div>
					              <div class="col-md-1" style="horizontal-align: middle;"><p style="font-size: 2em; padding-left: 10px; margin-top: -10px"><b>=</b></p></div>
					              <div class="col-md-1" style="border: outset #3c8dbc; padding-left: 5px !important;" id="tcal">
					              <fmt:formatNumber value="${calgoal-foodcal+execal}" maxFractionDigits="1" groupingUsed="False"/>
					              
					              </div>
					              </div>
					              <div class="row">
					              <div class="col-md-1 col-md-offset-1" style="">
					              	Goal
					              </div>
					              <div class="col-md-1" style="horizontal-align: middle;"><p style="font-size: 2em; margin: 0; padding: 0"><b></b></p></div>
					              
					              <div class="col-md-1" style="">
					              	Food
					              </div>
					              <div class="col-md-1" style="horizontal-align: middle;"><p style="font-size: 2em; margin: 0; padding: 0"><b></b></p></div>
					              <div class="col-md-1" style="margin-left: -5px !important;">
					              	Exercise
					              </div>
					              <div class="col-md-1" style="horizontal-align: middle;"><p style="font-size: 2em; margin: 0; padding: 0"><b></b></p></div>
					              <div class="col-md-1" style="margin-left: -10px !important;">
					              	Remaining
					              </div>
					              </div>
					            </div>
					            <div class="box-footer">
					            <div class="col-md-8">
					            	<div class="row">
					            	<button type="button" class="btn btn-primary" style="margin-right: 90px;"  onclick="addfood('breakfast');" data-toggle="collapse" data-target="#food">Add Food In Breakfast</button>
					            	<button type="button" class="btn btn-primary"   onclick="addfood('lunch');" data-toggle="collapse" data-target="#food">Add Food In Lunch</button>
					            	</div>
					            	<div class="row" style="margin-top: 15px;">
					            	<button type="button" class="btn btn-primary" style="margin-right: 90px; padding-right: 20px; padding-left: 20px;"   onclick="addfood('dinner');"  data-toggle="collapse" data-target="#food">Add Food In Dinner</button>
					            	<button type="button" class="btn btn-primary e" style="padding-right: 30px; padding-left: 30px;" data-toggle="collapse" data-target="#exercisei" onclick="addexercise();">Add Exercise</button>
					            	</div>
					            </div>
					            <div class="col-md-4">
					            	<button type="button" class="btn btn-primary" style="padding-bottom: 30px; padding-top: 30px;">Nutrients Details</button>
					            </div>
					            </div>
					            <!-- /.box-body -->
					          </div>
          <!-- /.box -->
          					
					            
					          <div class="box-footer">
				                <div class="col-md-8 collapse col-md-offset-2" id="food">
				                	<div class="form-group">
					                <label>Add Food</label>
					                <select class="form-control select2" style="width: 100%;" id="fooditem" name="fooditem">
					                  <option selected="selected" id="de1" value="">Select food item</option>
					                  <c:forEach items="${FoodItems}" var="FoodItems">
					                  	<option value="${FoodItems.id }" ssize="${FoodItems.servingSize }">${FoodItems.name}</option>
					                  </c:forEach>
					                  
					                </select>
					              </div>
					              <div id="serving" style="display: none;">
					              	Serving Size: <span style="border: outset; padding: 8px;" id="servingsize">1 cup</span>
					              	<form action="${pageContext.request.contextPath }/home/addfood" id="f">
					              		<div class="form-group" style="margin-top: 15px;">
					              			<label style="font-weight:400;">Number Of Servings</label>
					              			<div class="col-sm-10">
					              				<input class="form-control" type="number" step="0.1" name="servingno">
					              			</div>
					              		</div><br>
					              		<button class="btn btn-primary pull-left" type="submit" style="margin-top: 15px;">Submit</button>
					              	</form>
					              </div>
				                </div>
				                <div class="col-md-8 collapse collapse col-md-offset-2" style="" id="exercisei">
				                	<div class="form-group">
					                <label>Add Exercise</label>
					                <select class="form-control select2" style="width: 100%;" id="exerciseitem">
					                  <option selected="selected" value="">Select Exercise</option>
					                  <c:forEach items="${Exercise}" var="Exercise">
					                  <option value="${Exercise.id}">${Exercise.name }</option>
					                  </c:forEach>
					                  
					                </select>
					              </div>
					              <div id="minute">
					              	
					              	<form  action="${pageContext.request.contextPath }/home/addexercise" id="e">
					              		<div class="form-group" style="margin-top: 15px;">
					              			<label style="font-weight:400;">Minutes Performed</label>
					              			<div class="col-sm-10">
					              				<input class="form-control" type="number" step="0.1" name="minute">
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
  $(function () {
    //Initialize Select2 Elements
    $(".select2").select2();
  });
  var food="";
   function addfood(foodi) {
	food=foodi;
	document.getElementById('fooditem').selectedIndex=0;
	$("#select2-fooditem-container").html("Select food item");
	$("#serving").css('display','none');
	//document.getElementById('food').style.display="block";
	//document.getElementById('exercisei').style.display="none";
	//$('#exercisei').toggle();
	$('#exercisei').removeClass( "in" );
	$('#food').removeClass( "in" );
	$("#food:first-child").children(".form-group").children('label').html('Add Food in '+foodi);
	//alert($("#food:first-child").children(".form-group").children().html());
	
} 
   function addexercise() {
	   document.getElementById('exerciseitem').selectedIndex=0;
	   $("#select2-exerciseitem-container").html("Select Exercise");
		$("#minute").css('display','none');
		$('#food').removeClass( "in" );
		//document.getElementById('food').style.display="none";
		   
	   
}
  $(document).ready(function(){
	  $("#fooditem").selectedIndex=0;
	  $("#exerciseitem").selectedIndex=0;
	  $("#select2-fooditem-container").html("Select food item");
	  //alert($("#fooditem").selectedIndex);
		$("#fooditem").change(function(e){
				
				
				$("#serving").css('display','block');
				if(this.options[e.target.selectedIndex].value==''){
					$("#serving").css('display','none');
					}
				else{
					
					$("#servingsize").html(this.options[e.target.selectedIndex].getAttribute('ssize'));
					}
			});
		$("#exerciseitem").change(function(e){
			
			
			$("#minute").css('display','block');
			if(this.options[e.target.selectedIndex].value==''){
				$("#minute").css('display','none');
				}
			
		});


		//submit fooditems form
		$("#f").submit(function(e)
		{
			e.preventDefault();
			//this.reset();
			
			//var select=$("#fooditem");
			var foodId=$("#fooditem").val();
			var servingNo=$("input[name=servingno]").val();
			var uid=${cookie.id.value};
			//alert(food);
			this.reset();
			var formURL = $(this).attr("action");
			$.ajax(
					{
						url : formURL,
						type: "POST",
						data : {"foodId":foodId,"servingNo":servingNo,"uid":uid,"slot":food},
						success:function(data, textStatus, jqXHR) 
						{
							alert(data.result);
							$('#food').removeClass( "in" );
							//$("#f").reset();
							//data: return data from server
							$("#fcal").text((parseFloat($("#fcal").text())+parseFloat(data.result)).toFixed(2));
							$("#tcal").text((parseFloat($("#dcal").text())-parseFloat($("#fcal").text())+parseFloat($("#ecal").text())).toFixed(2));
							//alert($("fcal").html());
						},
						error: function(jqXHR, textStatus, errorThrown) 
						{
							//if fails		
						}
					});
			//$(this).unbind(e);
		});


		//submit exerciseitems form
		$("#e").submit(function(e)
		{
			e.preventDefault();
			//this.reset();
			
			//var select=$("#fooditem");
			var exerciseId=$("#exerciseitem").val();
			var minutes=$("input[name=minute]").val();
			var uid=${cookie.id.value};
			//alert(uid);
			this.reset();
			var formURL = $(this).attr("action");
			$.ajax(
					{
						url : formURL,
						type: "POST",
						data : {"exerciseId":exerciseId,"minutes":minutes,"uid":uid},
						success:function(data, textStatus, jqXHR) 
						{
							alert(data.result);
							$('#exercisei').removeClass( "in" );
							//$("#f").reset();
							//data: return data from server
							$("#ecal").text((parseFloat($("#ecal").text())+parseFloat(data.result)).toFixed(2));
							$("#tcal").text((parseFloat($("#dcal").text())-parseFloat($("#fcal").text())+parseFloat($("#ecal").text())).toFixed(2));
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