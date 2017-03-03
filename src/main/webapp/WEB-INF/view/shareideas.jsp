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
  
   <script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.0.3/sockjs.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.js"></script>
<!--

//-->
</script>
<style>
<!--
th{
	text-align: justify;
}
.modal-footer {
    
    padding: 15px !important;
    text-align: right !important;
    margin:0 !important;
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
      <form action="#" method="get" class="sidebar-form"style="display:none;">
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
        <li class="active treeview">
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
        Share Ideas
        <small>Fatfitandhealthy</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-user"></i> Home</a></li>
        <li class="active">Share Ideas</li>
        
      </ol>
    </section>



			<section class="content">
			<div class="row">
			
				<div class="col-md-8 col-md-offset-2">
				
					
						
							<div class="box box-primary">
					            <div class="box-header with-border">
					              <h3 class="box-title">Share Ideas</h3>
				            </div>
							
							<div class="box box-solid">
					            <div class="box-header with-border">
					             <i class="fa fa-comments"  aria-hidden="true"></i>
								 
					              <h3 class="box-title">Make Posts, Like and Comment</h3>
					            </div>
					            <!-- /.box-header -->
					            
					            <!-- box body for textarea post -->
					            	<div class="box-body">
					            		<form action="#" method="post">
							                <img class="img-responsive img-circle img-sm" src="${pageContext.request.contextPath }/resources/image/user/${cookie.uimage.value}" alt="Alt Text">
							                <!-- .img-push is used to add margin to elements next to floating images -->
							                <div class="img-push">
							                  <textarea class="form-control" rows="3" placeholder="What is on your mind ? Post Here ...." id="potext"></textarea>
							                  <button class="btn btn-primary btn-block btn-sm po" type="button" style="margin-top: 2px;">Post</button>
							                </div>
							                
							              </form>
					            	</div>
					            
					            <!-- /box body for textarea post -->
					            
					            
					            <div class="show">
					            
									 <!-- Box Comment -->
          <div class="box box-widget">
            <div class="box-header with-border">
              <div class="user-block">
                <img class="img-circle" src="${pageContext.request.contextPath }/resources/image/user/${cookie.uimage.value}" alt="User Image">
                <span class="username"><a href="#">Ria Bhatt</a></span>
                <span class="description">Shared publicly - 7:30 PM Today</span>
              </div>
              <!-- /.user-block -->
              <div class="box-tools">
                <button type="button" class="btn btn-box-tool" data-toggle="tooltip" title="Upadate Post">
                  <i class="fa fa-pencil"></i></button>
                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                </button>
                <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
              </div>
              <!-- /.box-tools -->
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <!-- post text -->
              <p>Far far away, behind the word mountains, far from the
                countries Vokalia and Consonantia, there live the blind
                texts. Separated they live in Bookmarksgrove right at</p>

              <p>the coast of the Semantics, a large language ocean.
                A small river named Duden flows by their place and supplies
                it with the necessary regelialia. It is a paradisematic
                country, in which roasted parts of sentences fly into
                your mouth.</p>

             

              <!-- Social sharing buttons -->
              
              <button type="button" class="btn btn-default btn-xs like"><i class="fa fa-thumbs-o-up"></i> Like</button>
              <span class="pull-right text-muted">45 likes - 2 comments</span>
            </div>
            <!-- /.box-body -->
            <div class="box-footer box-comments">
              <div class="box-comment">
                <!-- User image -->
                <img class="img-circle img-sm" src="${pageContext.request.contextPath }/resources/image/user/${cookie.uimage.value}" alt="User Image">

                <div class="comment-text">
                      <span class="username">
                        Maria Gonzales
                        <span class="text-muted">at 8:03 PM Today</span>
                        <span class="pull-right">
							<button class="btn btn-box-tool" type="button" data-toggle="tooltip" title="" data-original-title="Upadate Comment">
							<i class="fa fa-pencil"></i>
							</button>
							<button type="button" class="btn btn-box-tool" data-comment="remove" data-toggle="tooltip" data-original-title="Delete Comment"><i class="fa fa-times"></i></button>
							</span>
                      </span><!-- /.username -->
                  It is a long established fact that a reader will be distracted
                  by the readable content of a page when looking at its layout.
                </div>
                <!-- /.comment-text -->
              </div>
              <!-- /.box-comment -->
              <div class="box-comment">
                <!-- User image -->
                <img class="img-circle img-sm" src="${pageContext.request.contextPath }/resources/image/user/${cookie.uimage.value}" alt="User Image">

                <div class="comment-text">
                      <span class="username">
                        Nora Havisham
                        <span class="text-muted">at 8:03 PM Today</span>
                        <span class="pull-right">
							<button class="btn btn-box-tool" type="button" data-toggle="tooltip" title="" data-original-title="Upadate Comment">
							<i class="fa fa-pencil"></i>
							</button>
							<button type="button" class="btn btn-box-tool" box-comment="remove" data-toggle="tooltip" data-original-title="Delete Comment"><i class="fa fa-times"></i></button>
							</span>
                      </span><!-- /.username -->
                  The point of using Lorem Ipsum is that it has a more-or-less
                  normal distribution of letters, as opposed to using
                  'Content here, content here', making it look like readable English.
                </div>
                <!-- /.comment-text -->
              </div>
              <!-- /.box-comment -->
            </div>
            <!-- /.box-footer -->
            <div class="box-footer">
              <form action="#" method="post">
                <img class="img-responsive img-circle img-sm" src="${pageContext.request.contextPath }/resources/image/user/${cookie.uimage.value}" alt="Alt Text">
                <!-- .img-push is used to add margin to elements next to floating images -->
                <div class="img-push">
                  <input type="text" class="form-control input-sm" placeholder="Press enter to post comment">
                </div>
              </form>
            </div>
            <!-- /.box-footer -->
          </div>
          <!-- /.box -->	
					              
					            
					            
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
	  var stompClient = null;
	  connect();
	  post();
	  //comment(4);
	  
	  		//giving like
			$(".show").on("click",".like",function(e){
					
					 if($(this).html()=='<i class="fa fa-thumbs-o-up"></i> Like')
						{
							$(this).html('<i class="fa fa-thumbs-o-up"></i> Liked');
							$(this).removeClass('btn-default');
							$(this).addClass('btn-primary');
							
						}
					 else{
						 $(this).html('<i class="fa fa-thumbs-o-up"></i> Like');
						 $(this).removeClass('btn-primary');
						 $(this).addClass('btn-default');
						 }
					 //alert();
					 var str={
								"uid" : ${cookie.id.value},
								"postid" : $(this).parent().attr('class').replace( /^\D+/g, '')
							 }; 
					 sendLike(str);
				});
			$(".show").on("submit",".co",function(e){
					e.preventDefault();
					var uid=${cookie.id.value};
					var input=$(this).find('input');
					var postid=input.attr('class').replace( /^\D+/g, '');
					var ctext=input.val();
					var uimage="${cookie.uimage.value}";
					var uname="${cookie.uname.value}";
					if(ctext==''){
							return;
						}
					//alert(ctext);
					var str = {
							"uid" : uid,
							"postid" : postid,
							"ctext" : ctext,
							"image" : uimage,
							"uname" : uname
						};
					sendComment(str);
					$(this)[0].reset();
				});

			//edit comment
			$(".show").on("click","button[data-original-title='Update Comment']",function(e){
					//alert("Update Comment");
					var commenttext=$(this).parent().parent().parent();
					//alert();
					commenttext.html("<form class='ce' action='#' method='post'><div class='img-push'> <input class='form-control input-sm' placeholder='Press enter to edit comment' type='text' value='"+commenttext.children().eq(1).html()+"' name='edit'> </div></form>");
				});
			$(".show").on("submit",".ce",function(e){
					e.preventDefault();
					//alert(($(this).serializeArray())[0].name);
					var ctext=$(this).children().children().val();
					//alert(postdata);
					var cid=$(this).parent().parent().attr('id').replace( /^\D+/g, '');
					//alert(cid);
					var commenttext=$(this).parent();
					//alert(commenttext.html());
					$.ajax(
							{
								url : "${pageContext.request.contextPath }/editcomment",
								type: "POST",
								data : {"cid":cid,"ctext":ctext},
								success:function(data, textStatus, jqXHR) 
								{
									//alert(data.ctext);
									moment.locale('en', {
							        'calendar' : {
							            'lastDay' : 'D MMMM',
							             'sameDay' : 'h:mm A',
							            'nextDay' : 'D MMMM',
							            'lastWeek' : 'D MMMM',
							            'nextWeek' : 'D MMMM',
							            'sameElse' : 'D MMMM'
							       }
							    });
									
								var utime=new Date((data.ctime).replace(/-/g, "/"));
									var append="<span class='username'>";
									append+="${cookie.uname.value}";
									append+="<span class='text-muted'> at "+moment(utime).calendar()+"</span>";
									append+="<span class='pull-right'>";
									
									append+="<button class='btn btn-box-tool' type='button' data-toggle='tooltip' title='' data-original-title='Update Comment'>";
									append+="<i class='fa fa-pencil'></i>";
									append+="</button>";
									append+="<button type='button' class='btn btn-box-tool' data-comment='remove' data-toggle='tooltip' data-original-title='Delete Comment'><i class='fa fa-times'></i></button>";
									
									append+="</span>";
									append+="</span><!-- /.username -->";
									append+="<span id='ec"+data.id+"'>"+data.ctext+"</span>";
									commenttext.html(append);									
											
								},
								error: function(jqXHR, textStatus, errorThrown) 
								{
									//if fails		
								}
							});
				});

			//deleting comment
			$(".show").on("click","button[data-original-title='Delete Comment']",function(e){
					//alert("Delete Comment");
					var commenttext=$(this).parent().parent().parent();
					//alert();
					var cid=commenttext.parent().attr('id').replace( /^\D+/g, '');
					//alert(cid);
					var modal="<div class='modal modal-warning'>";
					modal+="<div class='modal-dialog'>";
					modal+="<div class='modal-content'>";
					modal+="<div class='modal-header'>";
					modal+="<button type='button' class='close' data-dismiss='modal' aria-label='Close'>";
					modal+="<span aria-hidden='true'>&times;</span></button>";
					modal+="<h4 class='modal-title'>Delete Comment</h4>";
					modal+="</div>";
					modal+="<div class='modal-body'>";
					modal+="<p>Are you sure you want to delete the comment '"+commenttext.children().eq(1).html()+"' ?</p>";
					modal+="</div>";
					modal+="<div class='modal-footer'>";
					modal+="<button type='button' class='btn btn-outline pull-left' data-dismiss='modal'>No</button>";
					modal+="<button type='button' class='btn btn-outline save'>Yes</button>";
					modal+="</div>";
					modal+="</div>";
					modal+="<!-- /.modal-content -->";
					modal+="</div>";
					modal+="<!-- /.modal-dialog -->";
					modal+="</div>";
					//modal+="<!-- /.modal -->";
					var confirmmodal=$(modal);
					confirmmodal.modal('show');
					 confirmmodal.find('.save').click(function(event) {
						 $.ajax(
									{
										url : "${pageContext.request.contextPath }/deletecomment",
										type: "POST",
										data : {"cid":cid},
										success:function(data, textStatus, jqXHR) 
										{
											var postno=commenttext.parent().parent().attr('id').replace( /^\D+/g, '');
											commenttext.parent().remove();
											
											var commentno=$("#comment"+postno);
											//alert(commentno.html());
											commentno.html(parseInt(commentno.html())-1);						
													
										},
										error: function(jqXHR, textStatus, errorThrown) 
										{
											//if fails		
										}
									});
					      confirmmodal.modal('toggle');
					    });
				});
				//deleting posts
				
				//$("button[data-widget='remove']")
				$(".show").on("click","button[data-widget='remove']",function(e){

						var copy = $.extend(true, {}, e);
						e.stopPropagation();
						var postid=$(this).parent().parent().parent().attr('postid');
						//e.preventDefault();
						var re=$(this).parent().parent().parent();
						//alert(postid);
						var modal="<div class='modal modal-warning'>";
						modal+="<div class='modal-dialog'>";
						modal+="<div class='modal-content'>";
						modal+="<div class='modal-header'>";
						modal+="<button type='button' class='close' data-dismiss='modal' aria-label='Close'>";
						modal+="<span aria-hidden='true'>&times;</span></button>";
						modal+="<h4 class='modal-title'>Delete Post</h4>";
						modal+="</div>";
						modal+="<div class='modal-body'>";
						modal+="<p>Are you sure you want to delete this post ?</p>";
						modal+="</div>";
						modal+="<div class='modal-footer'>";
						modal+="<button type='button' class='btn btn-outline pull-left' data-dismiss='modal'>No</button>";
						modal+="<button type='button' class='btn btn-outline pd'>Yes</button>";
						modal+="</div>";
						modal+="</div>";
						modal+="<!-- /.modal-content -->";
						modal+="</div>";
						modal+="<!-- /.modal-dialog -->";
						modal+="</div>";
						//modal+="<!-- /.modal -->";
						var confirmmodal=$(modal);
						confirmmodal.modal('show');
						confirmmodal.find('.pd').click(function(event) {
							 $.ajax(
										{
											url : "${pageContext.request.contextPath }/deletepost",
											type: "POST",
											data : {"postid":postid},
											success:function(data, textStatus, jqXHR) 
											{
												//e=e.originalEvent;
												//e.startPropagation();	
												//e.live();
												//$(copy.target.parentNode).trigger(copy);	
												re.slideUp();				
														
											},
											error: function(jqXHR, textStatus, errorThrown) 
											{
												//if fails		
											}
										});
						      confirmmodal.modal('toggle');
						    });
					});

			//updating the post
			$(".show").on("click","button[data-original-title='Update Post']",function(e){
					//alert("Update Post");
					var pelement=$(this).parent().parent().parent().children().eq(1).children().eq(0);
					var posttext=pelement.html();
					var postid=$(this).parent().parent().parent().attr('postid');
					//alert(postid);
		
					var modal="<div class='modal'>";
					modal+="<div class='modal-dialog'>";
					modal+="<div class='modal-content'>";
					modal+="<div class='modal-header'>";
					modal+="<button type='button' class='close' data-dismiss='modal' aria-label='Close'>";
					modal+="<span aria-hidden='true'>&times;</span></button>";
					modal+="<h4 class='modal-title'>Update Post</h4>";
					modal+="</div>";
					modal+="<div class='modal-body'>";
					//modal+="<p>One fine body&hellip;</p>";
					modal+="<div class='img-push'><textarea id='eptext' class='form-control' rows='3' placeholder='Update Post'>"+posttext+"</textarea></div>";
					modal+="</div>";
					modal+="<div class='modal-footer'>";
					modal+="<button type='button' class='btn btn-default pull-left' data-dismiss='modal'>Cancel</button>";
					modal+="<button type='button' class='btn btn-primary ep'>Save changes</button>";
					modal+="</div>";
					modal+="</div>";
					modal+="<!-- /.modal-content -->";
					modal+="</div>";
					modal+="<!-- /.modal-dialog -->";
					modal+="</div>";
					var confirmmodal=$(modal);
					confirmmodal.modal('show');
					confirmmodal.find('#eptext').focus();
					confirmmodal.find('.ep').click(function(event) {
						var epotext=confirmmodal.find('#eptext').val();
						
						  $.ajax(
									{
										url : "${pageContext.request.contextPath }/updatepost",
										type: "POST",
										data : {"postid":postid,"ptext":epotext},
										success:function(data, textStatus, jqXHR) 
										{
											pelement.html(epotext);		
													
										},
										error: function(jqXHR, textStatus, errorThrown) 
										{
											//if fails		
										}
									}); 
					      confirmmodal.modal('toggle');
					      //alert(epotext);
					    });
				});
				
			//adding new post
			$(".po").click(function(){
				var ptext=$("#potext").val();
				var uid=${cookie.id.value};
				var uimage="${cookie.uimage.value}";
				var uname="${cookie.uname.value}";
				if(ptext==''){
						return;
					}
				//alert(uimage);
				var str = {
						"uid" : uid,
						"ptext" : ptext,
						"image" : uimage,
						"uname" : uname
					};
				sendPost(str);
				//sendComment({"name":"RIA"});
				});
			
	  });
  function connect() {
	    var socket = new SockJS('/fatfitandhealthy/gs-guide-websocket');
	    stompClient = Stomp.over(socket);
	    stompClient.connect({}, function (frame) {
	        
	        console.log('Connected: ' + frame);
	        stompClient.subscribe('/topic/post', function (greeting) {
	            showGreeting(JSON.parse(greeting.body));
	        });
	        stompClient.subscribe('/topic/comment', function (greeting) {
	            showComment(JSON.parse(greeting.body));
	        });
	        stompClient.subscribe('/topic/like', function (greeting) {
	            showLike(JSON.parse(greeting.body));
	        });
	    });
	}
	function sendComment(str) {
		stompClient.send("/app/shareideas/comment",{},JSON.stringify(str));
	}

	function sendPost(str) {
		stompClient.send("/app/shareideas", {}, JSON.stringify(str));
	}
	function sendLike(str) {
		stompClient.send("/app/shareideas/like", {}, JSON.stringify(str));
	}

  function disconnect() {
	    if (stompClient != null) {
	        stompClient.disconnect();
	    }
	   
	    console.log("Disconnected");
	}
  $(window).unload(function(){
		disconnect();
	});
  function showGreeting(message) {
	    //alert(message.uname);
		/*  moment.lang('en', {
        'calendar' : {
            'lastDay' : 'D MMMM',
             'sameDay' : 'h:mmA',
            'nextDay' : 'D MMMM',
            'lastWeek' : 'D MMMM',
            'nextWeek' : 'D MMMM',
            'sameElse' : 'D MMMM'
       }
    }); */
		var utime=new Date((message.ctime).replace(/-/g, "/"));
	    var append="<div class='box box-widget existing' postid='"+message.id+"'>";
	    append+="<div class='box-header with-border'>";
	    append+="<div class='user-block'>";
	    append+="<img class='img-circle' src='${pageContext.request.contextPath }/resources/image/user/"+message.image+"' alt='User Image'>";
	    append+="<span class='username'><a href='#'>"+message.uname+"</a></span>";
	    append+="<span class='description'>Shared publicly -  "+moment(utime).fromNow()+"</span>";
	    append+="</div>";
	    append+="<!-- /.user-block -->";
	    append+="<div class='box-tools'>";
	    if(${cookie.id.value}==message.uid){
	    append+="<button type='button' class='btn btn-box-tool' data-toggle='tooltip' title='Update Post'>";
	    append+="<i class='fa fa-pencil'></i></button>";
	    }
	    append+="<button type='button' class='btn btn-box-tool' data-widget='collapse'><i class='fa fa-minus'></i>";
	    append+="</button>";
	    if(${cookie.id.value}==message.uid){
	    append+="<button type='button' class='btn btn-box-tool' data-widget='remove'><i class='fa fa-times'></i></button>";
	    }
	    append+="</div>";
	    append+="<!-- /.box-tools -->";
	    append+="</div>";
	    append+="<!-- /.box-header -->";
	    append+="<div class='box-body posto "+message.id+"'>";
	    append+="<!-- post text -->";
	    append+="<p>"+message.ptext+"</p>";
	    append+="<!-- Social sharing buttons -->";
	    append+="<button type='button' class='btn btn-default btn-xs like'><i class='fa fa-thumbs-o-up'></i> Like</button>";
	    append+="<span class='pull-right text-muted'> <span id='like"+message.id+"'>"+message.likes+"</span> likes - <span id='comment"+message.id+"'>"+0+"</span> comments</span>";
	    append+="</div>";
	    append+="<!-- /.box-body -->";
	    append+="<div class='box-footer box-comments' id='getcomment"+message.id+"'>";
	    append+="</div>";
	    append+="<!--/.box-footer -->";
	    append+="<div class='box-footer'>";
	    append+="<form action='#' method='post' class='co'>";
	    append+="<img class='img-responsive img-circle img-sm' src='${pageContext.request.contextPath }/resources/image/user/${cookie.uimage.value}' alt='Alt Text'>";
	    append+="<!-- .img-push is used to add margin to elements next to floating images -->";
	    append+="<div class='img-push'>";
	    append+="<input type='text' class='form-control input-sm value"+message.id+"' placeholder='Press enter to post comment'>";
	    append+="</div>";
	    append+="</form>";
	    append+="</div>";
	    append+="<!-- /.box-footer -->";
	    append+="</div>";
	    $(".show").prepend(append);
	    $("#potext").val('');
	}
	function showComment(message) {
		moment.locale('en', {
	        'calendar' : {
	            'lastDay' : 'D MMMM',
	             'sameDay' : 'h:mm A',
	            'nextDay' : 'D MMMM',
	            'lastWeek' : 'D MMMM',
	            'nextWeek' : 'D MMMM',
	            'sameElse' : 'D MMMM'
	       }
	    });
			
		var utime=new Date((message.ctime).replace(/-/g, "/"));
		var append="<div class='box-comment' id='x"+message.id+"'>";
		append+="<!-- User image -->";
		append+="<img class='img-circle img-sm' src='${pageContext.request.contextPath }/resources/image/user/"+message.image+"' alt='User Image'>";
		append+="<div class='comment-text'>";
		append+="<span class='username'>";
		append+=message.uname;
		append+="<span class='text-muted'> at "+moment(utime).calendar()+"</span>";
		append+="<span class='pull-right'>";
		if(${cookie.id.value}==message.uid){
		append+="<button class='btn btn-box-tool' type='button' data-toggle='tooltip' title='' data-original-title='Update Comment'>";
		append+="<i class='fa fa-pencil'></i>";
		append+="</button>";
		append+="<button type='button' class='btn btn-box-tool' data-comment='remove' data-toggle='tooltip' data-original-title='Delete Comment'><i class='fa fa-times'></i></button>";
		}
		append+="</span>";
		append+="</span><!-- /.username -->";
		append+="<span id='ec"+message.id+"'>"+message.ctext+"</span>";
		append+="</div>";
		append+="<!-- /.comment-text -->";
		append+="</div>";
		append+="<!-- /.box-comment -->";
		$("#getcomment"+message.postid).prepend(append);
		var cn=$("#comment"+message.postid);
		cn.html(parseInt(cn.html())+1);
	}
	function showLike(message) {
		//alert();
		var like=$("#like"+message.postid);
		if (message.action=='delete') {
			//alert('-');
			//alert(Number(like.text()));
			like.html(parseInt(like.text())-1);
		}
		else{
			like.html(parseInt(like.text())+1);
			}		
	}
	function post() {
		//alert();
		$.ajax({
			type:"POST",
			url:"${pageContext.request.contextPath }/fetchposts",
			success:function(data)
			{	
				//alert("success");
				var res=eval(data.post);
				$(".show").empty();
				$.each(res,function(index,value){
					//alert(res[index]);
					var k=res[index];
					var utime=new Date((k[4]).replace(/-/g, "/"));
				    var append="<div class='box box-widget existing' postid='"+k[0]+"'>";
				    append+="<div class='box-header with-border'>";
				    append+="<div class='user-block'>";
				    append+="<img class='img-circle' src='${pageContext.request.contextPath }/resources/image/user/"+k[8]+"' alt='User Image'>";
				    append+="<span class='username'><a href='#'>"+k[6]+" "+k[7]+"</a></span>";
				    append+="<span class='description'>Shared publicly -  "+moment(utime).fromNow()+"</span>";
				    append+="</div>";
				    append+="<!-- /.user-block -->";
				    append+="<div class='box-tools'>";
				    if(${cookie.id.value}==k[1]){
				    append+="<button type='button' class='btn btn-box-tool' data-toggle='tooltip' title='Update Post'>";
				    append+="<i class='fa fa-pencil'></i></button>";
				    }
				    append+="<button type='button' class='btn btn-box-tool' data-widget='collapse'><i class='fa fa-minus'></i>";
				    append+="</button>";
				    if(${cookie.id.value}==k[1]){
				    append+="<button type='button' class='btn btn-box-tool' data-widget='remove'><i class='fa fa-times'></i></button>";
				    }
				    append+="</div>";
				    append+="<!-- /.box-tools -->";
				    append+="</div>";
				    append+="<!-- /.box-header -->";
				    append+="<div class='box-body posto "+k[0]+"'>";
				    append+="<!-- post text -->";
				    append+="<p>"+k[2]+"</p>";
				    append+="<!-- Social sharing buttons -->";
				    append+="<button type='button' class='btn btn-default btn-xs like'><i class='fa fa-thumbs-o-up'></i> Like</button>";
				    append+="<span class='pull-right text-muted'> <span id='like"+k[0]+"'>"+k[3]+"</span> likes - <span id='comment"+k[0]+"'>"+0+"</span> comments</span>";
				    append+="</div>";
				    append+="<!-- /.box-body -->";
				    append+="<div class='box-footer box-comments' id='getcomment"+k[0]+"'>";
				    append+="</div>";
				    append+="<!--/.box-footer -->";
				    append+="<div class='box-footer'>";
				    append+="<form action='#' method='post' class='co'>";
				    append+="<img class='img-responsive img-circle img-sm' src='${pageContext.request.contextPath }/resources/image/user/${cookie.uimage.value}' alt='Alt Text'>";
				    append+="<!-- .img-push is used to add margin to elements next to floating images -->";
				    append+="<div class='img-push'>";
				    append+="<input type='text' class='form-control input-sm value"+k[0]+"' placeholder='Press enter to post comment'>";
				    append+="</div>";
				    append+="</form>";
				    append+="</div>";
				    append+="<!-- /.box-footer -->";
				    append+="</div>";
				    $(".show").prepend(append);
					
					comment(k[0]);
				});
				//comment(1);
	  		 	//$("#value").focus();
	  		 	//$("#co")[0].reset();
				$.ajax(
						{
							url : "${pageContext.request.contextPath }/fetchlike",
							type: "POST",
							data : {"uid":${cookie.id.value}},
							success:function(data, textStatus, jqXHR) 
							{
								var res=eval(data.post);
								$.each(res,function(index,value){
									//alert(res[index]);
									var k=res[index];
									var btn=$("."+k[2]+" button");
									btn.html('<i class="fa fa-thumbs-o-up"></i> Liked');
									btn.removeClass('btn-default');
									btn.addClass('btn-primary');
								});
										
							},
							error: function(jqXHR, textStatus, errorThrown) 
							{
								//if fails		
							}
						});
			}
		}
			);
	}
	function comment(postid) {
		$.ajax(
				{
					url : "${pageContext.request.contextPath }/fetchcomments",
					type: "POST",
					data : {"postid":postid},
					success:function(data, textStatus, jqXHR) 
					{
						var res=eval(data.post);
						$.each(res,function(index,value){
							//alert(res[index]);
							var k=res[index];
							var message={
											"id" : k[0],
											"uid" : k[1],
											"ctext" : k[2],
											"ctime" : k[3],
											"utime" : k[4],
											"uname" : k[5]+" "+k[6],
											"image" : k[7],
											"postid" : k[8]
									}
							showComment(message);
							
						});	
						//$("#comment"+postid).html(res.length);	
					},
					error: function(jqXHR, textStatus, errorThrown) 
					{
						//if fails		
					}
				});
	}
</script>