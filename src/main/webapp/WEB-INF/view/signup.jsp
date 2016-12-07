<jsp:include page="header.jsp"></jsp:include>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/user/form.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/plugins/datepicker/datepicker3.css">
<div style="display: block; height: 100px;"></div>
<div class="container">
	<div class="row">
		<div class="col-md-3"></div>
		<div class="col-md-6">
          <!-- general form elements -->
          <div class="box box-primary">
            <div class="box-header with-border">
              <h3 class="box-title">Sign up</h3>
            </div>
            <!-- /.box-header -->
            <!-- form start -->
            <form role="form" action="${pageContext.request.contextPath }/signup" method="post"  enctype="multipart/form-data">
              <div class="box-body">
                <div class="form-group">
                  <label for="exampleInputEmail1">Email address</label>
                  <input type="email" class="form-control" id="exampleInputEmail1" placeholder="Enter email" name="email">
                </div>
                <div class="form-group">
                  <label for="exampleInputPassword1">Password</label>
                  <input type="password" class="form-control" id="exampleInputPassword1" placeholder="Password" name="password">
                </div>
                
                <div class="form-group">
                  <label for="exampleInputEmail1">First name</label>
                  <input type="text" class="form-control" id="exampleInputEmail1" name="firstname" placeholder="Enter firstname">
                </div>
                <div class="form-group">
                  <label for="exampleInputEmail1">Last name</label>
                  <input type="text" class="form-control" name="lastname" id="exampleInputEmail1" placeholder="Enter lastname">
                </div>
                <div class="form-group">
                	<label>Gender</label><br>
                  
                    <label class="radio-inline">
                      <input type="radio" name="gender" id="optionsRadios1" value="male" checked>Male
                     </label>
                     <label class="radio-inline">
                      <input type="radio" name="gender" id="optionsRadios1" value="female">female
                     </label>
                  
                </div>
                <div class="form-group">
                  <label for="exampleInputFile">Image</label><br>
                  <img src="#" class="img-thumbnail" alt="Profile pic" width="150" height="150" id="output"><br>
                  <input type="file" id="image" name="file" required="true" class="file"  onchange="loadFile(event)">
                  <input type="hidden" name="image" value="" class="image">

                  <p class="help-block">Insert image that you want to give as profile picture</p>
                </div>
                <div class="form-group">
					<label>Date Of Birth</label>
					<div class="input-group date">
					<div class="input-group-addon">
						<i class="fa fa-calendar"></i>
					</div>
					<input id="datepicker" class="form-control pull-right" type="text" name="dob">
					</div>
				</div>
				<div class="form-group">
                  <label for="exampleInputEmail1">Mobile number</label>
                  <input type="number" class="form-control" id="exampleInputEmail1" name="mobile" oninput="maxLengthCheck(this)" maxlength = "10">
                </div>
                <div class="form-group">
                  <label for="exampleInputEmail1">Weight (in kg)</label>
                  <input type="number" class="form-control" id="exampleInputEmail1" name="weight" oninput="maxLengthCheck(this)" maxlength = "4" step="0.01">
                </div>
                <div class="form-group">
                  <label for="exampleInputEmail1">Height (in cm)</label>
                  <input type="number" class="form-control" id="exampleInputEmail1" name="height" oninput="maxLengthCheck(this)" maxlength = "6" step="0.01">
                </div>
                <div class="form-group">
                  <label>Activity Factor</label>
                  <select name="activity_factor" class="form-control">
                  	<option selected="selected">----select----</option>
                  	<option value="sedentary">sedentary</option>
                  	<option value="lightly active">lightly active</option>
                  	<option value="moderetely active">moderetly active</option>
                  	<option value="very active">very active</option>
                  	<option value="extra active">extra active</option>
                  </select>
		        </div>
		         <div class="form-group">
                  <label>Weight Goal</label>
                  <select name="weight_goal" class="form-control" onchange="kgs();" id="a">
                  	<option selected="selected">----select----</option>
                  	<option value="maintain weight">maintain weight</option>
                  	<option value="loose weight">loose weight</option>
                  	<option value="gain weight">gain weight</option>
                  	
                  </select>
		         </div> 
                <div class="form-group" id="kg" style="display: none">
                  <label for="exampleInputEmail1" id="kglabel"></label>
                  <select name="kg" class="form-control">
                  	<option selected="selected">----select----</option>
                  	<option value="0.5">0.5 kg</option>
                  	<option value="0.25">0.25 kg</option>
                  	
                  	
                  </select>
                </div>
              </div>
              <!-- /.box-body -->

              <div class="box-footer">
                <button type="submit" class="btn btn-primary">Submit</button>
              </div>
            </form>
          </div>
         </div>
         <div class="col-md-3"></div>
         </div>
         </div>
<jsp:include page="footer.jsp"></jsp:include>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.11.2/moment.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/plugins/datepicker/bootstrap-datepicker.js"></script>
<script type="text/javascript">
var loadFile = function(event) {
	//alert("cvd");
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
  function kgs() {
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
	  kgs();
	   $(".file").change(function(){
			var filename=$(this).val();
			//alert(filename);
			$(".image").val(filename);
		}); 
	   $('#datepicker').datepicker({
		      autoclose: true
		    });
	});
</script>