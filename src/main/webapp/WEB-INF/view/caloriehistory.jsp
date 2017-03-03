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
        <li class="active treeview">
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
        View History
        <small>Fatfitandhealthy</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-user"></i> Home</a></li>
        <li class="active">View History</li>
        
      </ol>
    </section>



			<section class="content">
			<div class="row">
			
				<div class="col-md-8 col-md-offset-2">
				
					
						
							<div class="box box-primary">
					            <div class="box-header with-border">
					              <h3 class="box-title">View History</h3>
				            </div>
							
							<div class="box box-solid">
					            <div class="box-header with-border">
					             <i class="fa fa-history"  aria-hidden="true"></i>
								 <h3 class="box-title">View Past Calorie, Nutrients And Water Intake History</h3>
					            </div>
					            <!-- /.box-header -->
					            
					            
					  					
					           
					           <!-- date2 finished -->
					   			<c:forEach items="${activitylog}" var="activitylog">
					   				<div id="date2">
					           	<div class="box box-default collapsed-box box-solid">
						            <div class="box-header with-border">
						              <h3 class="box-title">${activitylog.date}</h3>
						
						              <div class="box-tools pull-right">
						                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-plus"></i>
						                </button>
						              </div>
						              <!-- /.box-tools -->
						            </div>
						            <!-- /.box-header -->
						            <div class="box-body">
						            <div class="box-body">
						              <div class="row">
					              <div class="col-md-1 col-md-offset-1" id="dcal" style="padding-left: 0px !important; padding-right: 0px !important;">
					              <div style="border: outset #3c8dbc; margin-left:2px; margin-right: 2px;">
					              ${calGoal}
					              </div><p><br>&nbsp;Goal</p>
					              </div>
					              <div class="col-md-1" style="horizontal-align: middle;"><p style="font-size: 2em; padding-left: 10px; margin-top: -10px"><b>-</b></p></div>
					              
					              <div class="col-md-1" style="padding-left: 0px !important; padding-right: 0px !important;" id="fcal">
					              	<%-- ${foodcal} --%>
					              	<div style="border: outset #3c8dbc; margin-left:2px; margin-right: 2px;">
					              	<fmt:formatNumber value="${activitylog.breakfast+activitylog.dinner+activitylog.lunch}" maxFractionDigits="3" groupingUsed="False"/>
					              	</div><p><br>&nbsp;Food</p>
					              </div>
					              <div class="col-md-1" style="horizontal-align: middle;"><p style="font-size: 2em; padding-left: 10px; margin-top: -10px"><b>+</b></p></div>
					              <div class="col-md-1" style="padding-left: 0px !important; padding-right: 0px !important;" id="ecal">
					              
					              	<%-- ${execal} --%>
					              	<div style="border: outset #3c8dbc; margin-left:2px; margin-right: 2px;">
					              	<fmt:formatNumber value="${activitylog.exercise}" maxFractionDigits="3" groupingUsed="False"/>
					              	</div><p><br>&nbsp;Exercise</p>
					              </div>
					              <div class="col-md-1" style="horizontal-align: middle;"><p style="font-size: 2em; padding-left: 10px; margin-top: -10px"><b>=</b></p></div>
					              <div class="col-md-1" style="padding-left: 0px !important; padding-right: 0px !important;" id="tcal">
					              <div style="border: outset #3c8dbc; margin-left:2px; margin-right: 2px;">
					              <c:set value="${calGoal-activitylog.breakfast-activitylog.lunch-activitylog.dinner+activitylog.exercise}" var="remaining"></c:set>
					              <fmt:formatNumber value="${remaining}" maxFractionDigits="1" groupingUsed="False"/>
					              </div><p><br>&nbsp;Remaining</p>					              
					              </div>
					              </div>
					              </div>
					              <div class="box-footer">   
					            	<button type="button" class="btn btn-primary btn-flat btn-block"  onclick="location.href = '${pageContext.request.contextPath }/nutrienthistory/${activitylog.date }';">Nutrients Details</button>					            
					            </div>
					            <div class="box-footer">
					            	<div class="alert alert-${remaining<5 and remaining >-5?'success':'warning'} alert-dismissible">
										<button class="close" type="button" data-dismiss="alert" aria-hidden="true">&times;</button>
										
										<i class="icon fa fa-${remaining<5 and remaining >-5?'check':'warning'}"></i>
											<c:choose>
												<c:when test="${remaining<5 and remaining >-5}">Well done</c:when>
												<c:when test="${remaining>5 }">Eating Not Sufficient</c:when>
												<c:otherwise>Eating Too Much</c:otherwise>
											</c:choose>
										
									
									</div>
					            </div>
					            <div class="box-footer">
					            	<div class="row">
					              <div class="col-md-1 col-md-offset-1" style="padding-left: 0px !important; padding-right: 0px !important;">
					              <div style="border: outset #3c8dbc; margin-left:2px; margin-right: 2px;">
					              <%-- ${watergoal} --%>
					              <fmt:formatNumber value="${watergoal}" maxFractionDigits="0" groupingUsed="False"/>
					              </div><p><br>&nbsp;Goal<br>&nbsp;(Glass)</p>
					              </div>
					              <div class="col-md-1" style="horizontal-align: middle;"><p style="font-size: 2em; padding-left: 10px; margin-top: -10px"><b>-</b></p></div>
					              
					              <div class="col-md-1" style="padding-left: 0px !important; padding-right: 0px !important;">
					              	<%-- ${foodcal} --%>
					              	<div style="border: outset #3c8dbc; margin-left:2px; margin-right: 2px;">
					              	<fmt:formatNumber value="${activitylog.water}" maxFractionDigits="3" groupingUsed="False"/>
					              	</div><p><br>&nbsp;Water</p>
					              </div>
					              
					              <div class="col-md-1" style="horizontal-align: middle;"><p style="font-size: 2em; padding-left: 10px; margin-top: -10px"><b>=</b></p></div>
					              <div class="col-md-1" style="padding-left: 0px !important; padding-right: 0px !important;">
					              <div style="border: outset #3c8dbc; margin-left:2px; margin-right: 2px;">
					              <c:set value="${watergoal-activitylog.water}" var="waterremaining"></c:set>
					              <fmt:formatNumber value="${waterremaining}" maxFractionDigits="1" groupingUsed="False"/>
					              </div><p><br>&nbsp;Remaining</p>					              
					              </div>
					              </div>					              	
					            </div>
					            <div class="box-footer">
					            	<div class="alert alert-${waterremaining <= 0?'success':'warning'} alert-dismissible">
										<button class="close" type="button" data-dismiss="alert" aria-hidden="true">&times;</button>
										
										<i class="icon fa fa-${waterremaining <= 0?'check':'warning'}"></i>
											<c:choose>
												<c:when test="${waterremaining<=0}">
													You are taking sufficient water
												</c:when>
												<c:otherwise>
													You are not taking sufficient water
												</c:otherwise>
											</c:choose>
										
										
									</div>
					            </div>
						            </div>
						            <!-- /.box-body -->
						          </div>
					           </div>
					   			</c:forEach>
				                <!-- </div> -->
				              <!-- </div> -->
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
	  	
	  });
</script>