
       

<%@page import="models.Branch"%>
<%@page import="dao.BranchDao"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title> Log in</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.7 -->
  <link rel="stylesheet" href="asset/bower_components/bootstrap/dist/css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="asset/bower_components/font-awesome/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="asset/bower_components/Ionicons/css/ionicons.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="asset/dist/css/AdminLTE.min.css">
  <!-- iCheck -->
  <link rel="stylesheet" href="asset/plugins/iCheck/square/blue.css">


  <!-- Google Font -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
 
  <script type="text/javascript">
    
    function showHide(){
    var type=document.getElementById("type").value;
    var branch=document.getElementById("admin");
   
     
    if(type=='admin'){
      branch.style.display="block";
      branch.required=true;
      }
     else{
          branch.style.display="none";
          branch.required=false;
     }
    }
    
 </script>

<!--  <script type="text/javascript">
    
    function showHide(){
    var type=document.getElementById("type").value;
    var QA=document.getElementById("superQA");
   
     
    if(type=='super'){
      QA.style.display="block"; 
      }
     else{
          QA.style.display="none"; 
     }
    }
    
 </script> -->
  
  <%
  if((session.getAttribute("loginSuccess")!=null) && (session.getAttribute("loginSuccess").equals("save"))){    
  
  %>
  <script>
      alert("Info is submitted!!!!!\n Application will be reviewed \n please wait for login. ");
  </script>
  
  <%  
      session.setAttribute("loginSuccess","");
     }
 %>
 
 
  
  
  <style>
    body{

      background-image: url("loginbg.jpg") !important;
     background-repeat: no-repeat !important;
    background-size: 100% !important;
    height: 80%;
    }
  </style>
  
  <% 
        if((session.getAttribute("checkLogin")!=null) && (session.getAttribute("checkLogin").equals("fail"))){
  %>
  <script>alert("Information is not Correct!!!!Try Again.")</script>
  <%
      session.setAttribute("checkLogin","");
      }
  %>
  
  
</head>
<body>
<div class="login-box">
  <div class="login-logo">
    <a href="index.jsp"><b style="color: black;">Easca Car Solutions</b></a>
  </div>
  <!-- /.login-logo -->
  <div class="login-box-body">
    <p class="login-box-msg">Sign in to start your session</p>

    <form action="loginCheck.jsp" method="post">
      <div class="form-group has-feedback">
          <input type="text" name="uid" class="form-control" placeholder="User ID" required="">
        <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
      </div>
      <div class="form-group has-feedback">
          <input type="password" name="pass" class="form-control" placeholder="Password" required="">
        <span class="glyphicon glyphicon-lock form-control-feedback"></span>
      </div>
        <div class="form-group has-feedback">
        <label>Type</label>
        <select  id="type" name="type" class="form-control" onchange="showHide()" required="">
		<option value="user">User</option>
                <option value="admin">Admin</option>
<!--                <option value="super">Super Admin</option>-->
       </select>
      </div>
<!--        
     <div id="superQA" style="display:none" >  
         <div class="form-group has-feedback">
        <label>Ur university Name??</label>
        <input type="password" name="answer" class="form-control" placeholder="answer plz" >
         </div>
    </div>       -->
            
<div id="admin" style="display:none" >
    <div class="form-group has-feedback">
       <label>Select Branch</label>
       <input list="p_p" name="branch"  class="form-control"  >
		<datalist id="p_p">
                  <%
                try {
                        
                List<Branch> br = BranchDao.getAllMembers();

                for (Branch us : br) {
                    String B_id=us.getBr_id();
                    String B_name=us.getName();
            %>   
		<option value="<%=B_id%>">| <%=B_name%></option>
              <% 
        }
        
             } catch (Exception e) {
                        out.println("Problem is: "+e);
                    }
        %>  
		</datalist>
    </div>

</div>     
        
      <div class="row">
       
        <!-- /.col -->
        <div class="col-xs-4">
          <button type="submit" name="submit" class="btn btn-primary btn-block btn-flat">Login</button>
        </div>
        <h4>Not Registered? <a href="user_form.jsp">Click here</a></h4>
      </div>
    </form>


    <!-- /.social-auth-links -->
<!-- 
    <a href="#">I forgot my password</a><br>
    <a href="register.html" class="text-center">Register a new membership</a> -->

  </div>
  <!-- /.login-box-body -->
</div>
<!-- /.login-box -->

<!-- jQuery 3 -->
<script src="asset/bower_components/jquery/dist/jquery.min.js"></script>
<!-- Bootstrap 3.3.7 -->
<script src="asset/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<!-- iCheck -->
<script src="asset/plugins/iCheck/icheck.min.js"></script>
<script>
  $(function () {
    $('input').iCheck({
      checkboxClass: 'icheckbox_square-blue',
      radioClass: 'iradio_square-blue',
      increaseArea: '20%' /* optional */
    });
  });
</script>


</body>
</html>



