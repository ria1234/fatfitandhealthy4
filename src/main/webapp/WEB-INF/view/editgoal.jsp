<%@page import="fatfitandhealthy.dao.NutritionGoal"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page session="true" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page isELIgnored="false" %>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/admin/table.css" />
<%-- <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/plugins/select2/select2.min.css" /> --%>

<%-- <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap-switch.min.css" /> --%>
<jsp:include page="upperheader.jsp"></jsp:include>
<script src="${pageContext.request.contextPath }/resources/js/admin/table.js"></script>
<%-- <script src="${pageContext.request.contextPath }/resources/js/bootstrap-switch.min.js"></script> --%>
<%-- <script src="${pageContext.request.contextPath }/resources/js/bootstrap-switch.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/jquery.validationEngine-en.js" type="text/javascript" charset="utf-8"></script>
  <script src="${pageContext.request.contextPath }/resources/js/jquery.validationEngine.js" type="text/javascript" charset="utf-8"></script> --%>
  <%-- <script type="text/javascript" src="${pageContext.request.contextPath }/resources/plugins/select2/select2.full.min.js""> --%>
<!--

//-->
</script>
<style>
<!--
th{
	text-align: justify;
}
-->
</style>
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
        
         <li class="active treeview">
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
        Edit Weight And Fitness Goal
        <small>Fatfitandhealthy</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-user"></i> Home</a></li>
        <li class="active">Edit Weight And Fitness Goal</li>
        
      </ol>
    </section>



			<section class="content">
			<div class="row">
			
				<div class="col-md-8 col-md-offset-2">
				
					
						
							<div class="box box-primary">
					            <div class="box-header with-border">
					              <h3 class="box-title">Edit Weight And Fitness Goal</h3>
				            </div>
							<div class="box-body" style="padding: 0px !important;">
								<div class="alert alert-dismissible" style="margin-bottom: 0px !important;">
					                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
					                <h4><i class="icon fa fa-info"></i> Info</h4>
					                Updating your weight or fitness goal will recalculate your daily Calorie goal which will overwrite it.
					              </div>
							</div>
							<div class="box box-solid box-default" style="margin-bottom: 0px ! important;">
					            <div class="box-header with-border">
					             <i class="fa fa-bullseye"  aria-hidden="true"></i>
								 
					              <h3 class="box-title">Current Fitness Goal</h3>
					            </div>
					            <!-- /.box-header -->
					            <div class="box-body">
									
									<dl class="dl-horizontal">
					              	<dt>Activity Factor : </dt>
					                <dd id="af">${UserHealth.activityFactor}</dd>
					                <dt>Weight Goal : </dt>
					                <dd id="wg">${UserHealth.weightGoal}.</dd>
					                <dt>Alter Weight per week : </dt>
					                <dd id="k">${UserHealth.kgs} kg.</dd>
					                <dt>Daily Calorie Goal : </dt>
					                <dd id="dcg">${UserHealth.dailyCalGoal} Calorie.</dd>
					              </dl>
									
									</div>
								   
					                   					              
					            				              
					            <div class="box-footer">
					            	<button class="btn btn-primary" style="float: right;"  data-toggle="collapse" data-target="#fitnessform">Update Fitness Goal</button>
					            
					            </div>
					            
					            <div id="fitnessform" class="collapse">
					            	<div class="box-body">
					            		<form:form modelAttribute="UserHealth" method="post" action="${pageContext.request.contextPath }/editgoal" id="eg">
					            			<form:input type="hidden" path="id" />
					            			<div class="form-group">
							                  <label>Activity Factor</label>
							                  
							                  <form:select path="activityFactor" cssClass="form-control">
							                  	<option>----select----</option>
							                  	<form:option value="sedentary">sedentary</form:option>
							                  	<form:option value="lightly active">lightly active</form:option>
							                  	<form:option value="moderetely active">moderetly active</form:option>
							                  	<form:option value="very active">very active</form:option>
							                  	<form:option value="extra active">extra active</form:option>
							                  </form:select>
							                  
									        </div>
									        <div class="form-group">
							                  <label>Weight Goal</label>
							                  
							                  <form:select path="weightGoal" class="form-control" onchange="kgso();" id="a">
							                  	<option>----select----</option>
							                  	<form:option value="maintain weight">maintain weight</form:option>
							                  	<form:option value="loose weight">loose weight</form:option>
							                  	<form:option value="gain weight">gain weight</form:option>
							                  	
							                  </form:select>
							                  
									         </div>
									         
									         <div class="form-group" id="kg" style="display: none">
							                  <label for="exampleInputEmail1" id="kglabel"></label>
							                  
							                  <form:select path="kgs" class="form-control">
							                  	<form:option  value="0">----select----</form:option>
							                  	<form:option value="0.5">0.5 kg</form:option>
							                  	<form:option value="0.25">0.25 kg</form:option>
							                  	
							                  	
							                  </form:select>
							                  
							                </div>
					            		
					            	</div>
					            	<div class="box-footer">
					            		<button type="submit" class="btn btn-primary">Update</button>
					            		</form:form>
					            	</div>
					            </div>
					            <!-- /.box-body -->                 									         				          
					          </div>
							 <!-- /. cureent fitness goal box -->
							 <div class="box box-solid box-default">
					            <div class="box-header with-border">
					             <i class="fa fa-balance-scale"  aria-hidden="true"></i>
								 
					              <h3 class="box-title">Current Weight</h3>
					            </div>
					            <!-- /.box-header -->
					            <div class="box-body">
									
									<dl class="dl-horizontal">
					              	<dt>Weight (in kg) : </dt>
					                <dd id="w">${UserHealth.weight} kg.</dd>
					                
					              </dl>
									
									</div>
								   
					                   					              
					            				              
					            <div class="box-footer">
					            	<button class="btn btn-primary" style="float: right;"  data-toggle="collapse" data-target="#weightform">Update Weight</button>
					            
					            </div>
					            
					            <div id="weightform" class="collapse">
					            	<div class="box-body">
					            		<form:form modelAttribute="UserHealth" method="post" action="${pageContext.request.contextPath }/editweight" id="wf">
					            			<form:input type="hidden" path="id" />
					            			<div class="form-group">
							                  <label>Weight (in kg)</label>
							                  <form:input type="number" cssClass="form-control" path="weight" oninput="maxLengthCheck(this)" maxlength = "5" step="0.01"></form:input>
							                </div>
									        
									         
									         
					            		
					            	</div>
					            	<div class="box-footer">
					            		<button type="submit" class="btn btn-primary">Update</button>
					            		</form:form>
					            	</div>
					            </div>
					            <!-- /.box-body -->
					          
         
          					
					            
					          
					          </div>
					          <!-- ./ current weight box -->
            				</div>
					</div>
				</div>
				
			<!-- </div> -->
			</section>
      <!-- </div> -->
      <!-- /.row (main row) -->

    
    <!-- /.content -->
 </div>
  <!-- /.content-wrapper -->
  <jsp:include page="admin/footer.jsp"></jsp:include>

  
  <!-- Add the sidebar's background. This div must be placed
       immediately after the control sidebar -->
  <div class="control-sidebar-bg"></div> </div>
<!-- ./wrapper -->
</body>
</html>
<script type="text/javascript">

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
				document.getElementById("kgs").selectedIndex=0;
				}
		}
	
}
  function maxLengthCheck(object)
  {
    if (object.value.length > object.maxLength)
      object.value = object.value.slice(0, object.maxLength)
  }
  $(document).ready(function(){
	  kgso();
	  $("#eg").submit(function(e){
		  e.preventDefault();
		  var postData = $(this).serializeArray();
			var formURL = $(this).attr("action");
			//alert(postData);
			$.ajax(
					{
						url : formURL,
						type: "POST",
						data : postData,
						success:function(data, textStatus, jqXHR) 
						{
							//alert(data.result);
							var af=$("#activityFactor").val();
							$("#af").html(af);
							var wg=$("#a").val();
							$("#wg").html(wg);
							var k=$("#kgs").val();
							$("#k").html(k+" kg.");
							$("#dcg").html(data.result+" Calorie.");
							//$("#fitnessform").fadeOut(2000);
							$('#fitnessform').collapse( 'hide' );
							
							//alert($("fcal").html());
						},
						error: function(jqXHR, textStatus, errorThrown) 
						{
							//if fails		
						}
					});
		  });

	  //submitting weigtht form
	  $("#wf").submit(function(e){
		  e.preventDefault();
		  var postData = $(this).serializeArray();
			var formURL = $(this).attr("action");
			//alert(postData);
			$.ajax(
					{
						url : formURL,
						type: "POST",
						data : postData,
						success:function(data, textStatus, jqXHR) 
						{
							//alert(data.result);
							$("#dcg").html(data.result+" Calorie.");
							var weight=$("#weight").val();
							$("#w").html(weight+" kg.");
							//$('#weightform').removeClass( "in" );
							$("#weightform").collapse('hide');
							//alert($("fcal").html());
						},
						error: function(jqXHR, textStatus, errorThrown) 
						{
							//if fails		
						}
					});
		  });
	});
</script>