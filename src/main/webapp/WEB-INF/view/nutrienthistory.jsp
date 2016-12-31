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
        Nutrients History
        <small>Fatfitandhealthy</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-user"></i> Home</a></li>
        <li>View History</li>
        <li class="active">Nutrients History</li>
        
      </ol>
    </section>



			<section class="content">
			<div class="row">
			
				<div class="col-md-8 col-md-offset-2">
				
					
						
							<div class="box box-primary">
					            <div class="box-header with-border">
					              <h3 class="box-title">Nutrients History</h3>
				            </div>
							
							<div class="box box-solid">
					            <div class="box-header with-border">
					             <i class="fa fa-cutlery"  aria-hidden="true"></i>
								 
					              <h3 class="box-title">Daily Nutrients History</h3>
					            </div>
					            <!-- /.box-header -->
					            <div class="box-body table-responsive no-padding">
									<table class="table table-hover">
									<col width="200">
									<col>
									<col>
									<col>
										<tbody>
											<tr>
												<th></th>
												<th>Total</th>
												<th>Goal</th>
												<th>Left</th>
											</tr>
											<tr>
												<th>Fat</th>
												<td><fmt:formatNumber value="${fat}" maxFractionDigits="3" groupingUsed="False"/> g</td>
												<td><fmt:formatNumber value="${goal.fat}" maxFractionDigits="3" groupingUsed="False"/> g</td>
												<td <%if(((NutritionGoal)request.getAttribute("goal")).getFat()-(Float)request.getAttribute("fat")<0){out.println("style='color:red'");} %>><fmt:formatNumber value="${goal.fat -fat}" maxFractionDigits="3" groupingUsed="False"/> g</td>
											</tr>
											<tr>
												<th>Cholesterol</th>
												<td><fmt:formatNumber value="${cholesterol}" maxFractionDigits="3" groupingUsed="False"/> mg</td>
												<td><fmt:formatNumber value="${goal.cholesterol}" maxFractionDigits="3" groupingUsed="False"/> mg</td>
												<td <%if(((NutritionGoal)request.getAttribute("goal")).getCholesterol()-(Float)request.getAttribute("cholesterol")<0){out.println("style='color:red'");} %>><fmt:formatNumber value="${goal.cholesterol-cholesterol}" maxFractionDigits="3" groupingUsed="False"/> mg</td>
											</tr>
											<tr>
												<th>Sodium</th>
												<td><fmt:formatNumber value="${sodium}" maxFractionDigits="3" groupingUsed="False"/> mg</td>
												<td><fmt:formatNumber value="${goal.sodium}" maxFractionDigits="3" groupingUsed="False"/> mg</td>
												<td <%if(((NutritionGoal)request.getAttribute("goal")).getSodium()-(Float)request.getAttribute("sodium")<0){out.println("style='color:red'");} %>><fmt:formatNumber value="${goal.sodium-sodium}" maxFractionDigits="3" groupingUsed="False"/> mg</td>
											</tr>
											<tr>
												<th>Potassium</th>
												<td><fmt:formatNumber value="${potassium}" maxFractionDigits="3" groupingUsed="False"/> mg</td>
												<td><fmt:formatNumber value="${goal.potassium}" maxFractionDigits="3" groupingUsed="False"/> mg</td>
												<td <%if(((NutritionGoal)request.getAttribute("goal")).getPotassium()-(Float)request.getAttribute("potassium")<0){out.println("style='color:red'");} %>><fmt:formatNumber value="${goal.potassium-potassium}" maxFractionDigits="3" groupingUsed="False"/> mg</td>
											</tr>
											<tr>
												<th>Carbohydrates</th>
												<td><fmt:formatNumber value="${carbs}" maxFractionDigits="3" groupingUsed="False"/> g</td>
												<td><fmt:formatNumber value="${goal.carbohydrates}" maxFractionDigits="3" groupingUsed="False"/> g</td>
												<td <%if(((NutritionGoal)request.getAttribute("goal")).getCarbohydrates()-(Float)request.getAttribute("carbs")<0){out.println("style='color:red'");} %>><fmt:formatNumber value="${goal.carbohydrates-carbs}" maxFractionDigits="3" groupingUsed="False"/> g</td>
											</tr>
											<tr>
												<th>Fiber</th>
												<td><fmt:formatNumber value="${fiber}" maxFractionDigits="3" groupingUsed="False"/> g</td>
												<td><fmt:formatNumber value="${goal.fiber}" maxFractionDigits="3" groupingUsed="False"/> g</td>
												<td <%if(((NutritionGoal)request.getAttribute("goal")).getFiber()-(Float)request.getAttribute("fiber")<0){out.println("style='color:red'");} %>><fmt:formatNumber value="${goal.fiber-fiber}" maxFractionDigits="3" groupingUsed="False"/> g</td>
											</tr>
											<tr>
												<th>Sugars</th>
												<td><fmt:formatNumber value="${sugars}" maxFractionDigits="3" groupingUsed="False"/> g</td>
												<td><fmt:formatNumber value="${goal.sugars}" maxFractionDigits="3" groupingUsed="False"/> g</td>
												<td <%if(((NutritionGoal)request.getAttribute("goal")).getSugars()-(Float)request.getAttribute("sugars")<0){out.println("style='color:red'");} %>><fmt:formatNumber value="${goal.sugars-sugars}" maxFractionDigits="3" groupingUsed="False"/> g</td>
											</tr>
											<tr>
												<th>Protein</th>
												<td><fmt:formatNumber value="${protein}" maxFractionDigits="3" groupingUsed="False"/> g</td>
												<td><fmt:formatNumber value="${goal.protein}" maxFractionDigits="3" groupingUsed="False"/> g</td>
												<td <%if(((NutritionGoal)request.getAttribute("goal")).getProtein()-(Float)request.getAttribute("protein")<0){out.println("style='color:red'");} %>><fmt:formatNumber value="${goal.protein-protein}" maxFractionDigits="3" groupingUsed="False"/> g</td>
											</tr>
										</tbody>
									</table>
									</div>
									
								<c:set value="${goal.protein-protein}" var="proteinleft"></c:set>
								<c:if test="${proteinleft le 0 or proteinleft gt 10}">
					              <div class="box-footer">
					              
					              	<div class="alert alert-${proteinleft <= 0?'success':'warning'} alert-dismissible">
										<button class="close" type="button" data-dismiss="alert" aria-hidden="true">&times;</button>
										
										<i class="icon fa fa-${proteinleft <= 0?'check':'warning'}"></i>
											<c:choose>
												<c:when test="${proteinleft<=0}">
													Congrats ! Protein goal is crossed !
												</c:when>
												<c:when test="${proteinleft>10}">
													You are not taking sufficient Protein.
												</c:when>
												<c:otherwise>
													Your goal is OK.
												</c:otherwise>
											</c:choose>
										
										
									</div>
					              </div>
					              </c:if>
					            
					            <c:set value="${goal.cholesterol-cholesterol}" var="cholesterolleft"></c:set>
								<c:if test="${cholesterolleft lt 0}">
					              <div class="box-footer">
					              
					              	<div class="alert alert-danger alert-dismissible">
										<button class="close" type="button" data-dismiss="alert" aria-hidden="true">&times;</button>
										
										<i class="icon fa fa-ban"></i>
										Your cholesterol goal is crossed !
										
										
									</div>
					              </div>
					              </c:if>
					              
					            <c:set value="${goal.carbohydrates-carbs}" var="carbsleft"></c:set>
								<c:if test="${carbsleft lt 0}">
					              <div class="box-footer">
					              
					              	<div class="alert alert-warning alert-dismissible">
										<button class="close" type="button" data-dismiss="alert" aria-hidden="true">&times;</button>
										
										<i class="icon fa fa-warning"></i>
										Your carbohydrates goal is crossed !
										
										
									</div>
					              </div>
					              </c:if>
					              
					            <c:set value="${goal.fiber-fiber}" var="fiberleft"></c:set>
								<c:if test="${fiberleft le 0 or fiberleft gt 2}">
					              <div class="box-footer">
					              
					              	<div class="alert alert-${fiberleft <= 0?'success':'warning'} alert-dismissible">
										<button class="close" type="button" data-dismiss="alert" aria-hidden="true">&times;</button>
										
										<i class="icon fa fa-${fiberleft <= 0?'check':'warning'}"></i>
											<c:choose>
												<c:when test="${fiberleft<=0}">
													Congrats ! Fiber goal is crossed !
												</c:when>
												<c:when test="${fiberleft>2}">
													You are not taking sufficient Fiber.
												</c:when>
												<c:otherwise>
													Your goal is OK.
												</c:otherwise>
											</c:choose>
										
										
									</div>
					              </div>
					              </c:if>
					              
					            <div class="box-footer">
					            
					            <button class="btn btn-primary" style="float: right;" onclick="location.href = '${pageContext.request.contextPath }/caloriehistory';">Back</button>
					            </div>
					            <!-- /.box-body -->
					          
          <!-- /.box -->
          					
					            
					          
					          </div>
							
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
<script>

  $(document).ready(function(){

	  });
</script>