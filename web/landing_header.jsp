<html lang="en">

<head>
  <meta charset="utf-8">
  <title>CRMS</title>
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
  <meta content="" name="keywords">
  <meta content="" name="description">

  <!-- Facebook Opengraph integration: https://developers.facebook.com/docs/sharing/opengraph -->
  <meta property="og:title" content="">
  <meta property="og:image" content="">
  <meta property="og:url" content="">
  <meta property="og:site_name" content="">
  <meta property="og:description" content="">

  <!-- Twitter Cards integration: https://dev.twitter.com/cards/  -->
  <meta name="twitter:card" content="summary">
  <meta name="twitter:site" content="">
  <meta name="twitter:title" content="">
  <meta name="twitter:description" content="">
  <meta name="twitter:image" content="">

  <!-- Fav and touch icons -->
  <link rel="shortcut icon" href="img/icons/favicon.png">
  <link rel="apple-touch-icon-precomposed" sizes="114x114" href="img/icons/114x114.png">
  <link rel="apple-touch-icon-precomposed" sizes="72x72" href="img/icons/72x72.png">
  <link rel="apple-touch-icon-precomposed" href="img/icons/default.png">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Roboto:400,100,300,500,700,900" rel="stylesheet">

  <!-- Bootstrap CSS File -->
  <link href="lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Libraries CSS Files -->
  <link href="lib/font-awesome/css/font-awesome.min.css" rel="stylesheet">
  <link href="lib/owlcarousel/owl.carousel.min.css" rel="stylesheet">
  <link href="lib/owlcarousel/owl.theme.min.css" rel="stylesheet">
  <link href="lib/owlcarousel/owl.transitions.min.css" rel="stylesheet">

  <!-- Main Stylesheet File -->
  <link href="css/style.css" rel="stylesheet">

  <!--Your custom colour override - predefined colours are: colour-blue.css, colour-green.css, colour-lavander.css, orange is default-->
  <link href="#" id="colour-scheme" rel="stylesheet">


</head>



<body>

  <!--Change the background class to alter background image, options are: benches, boots, buildings, city, metro -->
  <div id="background-wrapper" class="buildings" data-stellar-background-ratio="0.1">

      <div style=" background: #00cc66; padding: 10px; font-size: 70px;   ">
          <h1 style="font-weight: bolder;color:  #1a75ff;" >Easca<span style="font-size:30px; margin-left: 20px;">Car Rental Solutions</span> <sub><span style="font-size: 20px;font-family: Comic Sans MS;color:red;  ">drive as your own..feel the taste of driving</span> </sub>  <img src="images/rent_car_logo_2.jfif" alt="car_logo"  style="float: right;  width:445px; height: 65px;  " > 
      </h1>
      </div>
      
      <div class="container">
        <div class="navbar navbar-default">
          <!--mobile collapse menu button-->
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target=".navbar-collapse" aria-expanded="false"> <span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> </button>
          <!--social media icons-->
          <div class="navbar-text social-media social-media-inline pull-right">
            <!--@todo: replace with company social media details-->
            
            <div class="col-md-8">
              <!--navbar-branding/logo - hidden image tag & site name so things like Facebook to pick up, actual logo set via CSS for flexibility -->
                   <div class="col-md-4">
              <!--user menu-->
             
             
            </div>
            </div>
            <!--header rightside-->
       
          
          </div>
          
        
          
          <!--everything within this div is collapsed on mobile-->
          <div class="navbar-collapse collapse" style="width: 100%">
            <ul class="nav navbar-nav" id="main-menu">
              <li class="icon-link">
                <a href="index.jsp"><i class="fa fa-home"></i></a>
              </li>
 
            
              <li class="dropdown dropdown-mm">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">Hire<b class="caret"></b></a>
                <!-- Dropdown Menu -->
                <ul class="dropdown-menu dropdown-menu-mm dropdown-menu-persist">
                  <li class="row">
                    <ul class="col-md-6">
                      <li class="dropdown-header">Cars<i class="fa fa-car"></i></li>
                      <li><a href="viewAllCarGallery.jsp?type=per_day">Hire a car Day basis</a></li>
                      <li><a href="viewAllCarGallery.jsp?type=per_hour">Hire a car Hour basis</a></li>
                    </ul>
                    <ul class="col-md-6">
                      <li class="dropdown-header">Stylish Bike<i class="fa fa-motorcycle"></i></li>
                      <li><a href="viewAllBikeGallery.jsp">Hire a Bike day basis</a></li>
                    </ul>
                  </li>
                  <li class="dropdown-footer">
                    <div class="row">
                      <div class="col-md-7">Wanna try Now? <strong>Get registered soon...</strong></div>
                      <div class="col-md-5">
                        <a href="user_form.jsp" class="btn btn-more btn-lg pull-right"><i class="fa fa-cloud-download"></i> Register</a>
                      </div>
                    </div>
                  </li>
                </ul>
              </li>
              <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">Training<b class="caret"></b></a>
                <!-- Dropdown Menu -->
                <ul class="dropdown-menu">
                  <li class="dropdown-header">Training Type</li>
                  <li><a href="viewAllTrainingGallery.jsp?type=car_dr" tabindex="-1" class="menu-item">Car Driving</a></li>
                  <li><a href="viewAllTrainingGallery.jsp?type=bike_dr" tabindex="-1" class="menu-item">Bike Driving</a></li>
                  <li class="dropdown-footer">Drive ur own</li>
                </ul>
              </li>
                <%
              if(session.getAttribute("uid")==null){    
              %>
              <li><a href="login.jsp?success=0">Login</a></li>
              <li><a href="user_form.jsp">Registration</a></li>
              <% } %>
              
              
              <li><a  href="about.jsp" data-toggle="collapse" data-target=".header-hidden">About Us</a></li>
              <li><a  href="tempContact.jsp" data-toggle="collapse" data-target=".header-hidden">Contact</a></li>
              
              
              
               
              <%
                  try{
                  if(session.getAttribute("type").equals("user")){
              
              %>
              <li><a href="userDash.jsp" class="btn btn-info btn-xs">
            <span class="glyphicon glyphicon-user"></span> <%=session.getAttribute("uid")%>
            </a></li>
              <li><a href="logout.jsp" style="color:blue">LogOut</a></li>
               <%  } else{
                  %>
                  
                  
               
                 <%   }
                     }
                     catch(Exception e){
                        
                    }
                 %> 
              </ul>
<!--              
              <form class='navbar-form' >
                  <div class="form-group">
                      <input type="text" class="form-control" id="homeSearch" placeholder="enter model no.....">
                  </div>
                  <button type="submit" name="search"  class="btn btn-danger">Search</button>
              </form>
              -->
              
          </div>
          <!--/.navbar-collapse -->
          
          
          
        </div>
              <div style="padding:1px;font-family: Lucida Sans Unicode; background: #80ccff;color: red;font-size: 18px; " >
              <marquee>Welcome to Easca Car Solutions....... Pay Advance using bKash !!! </marquee>
          </div>
              
      </div>
    </div>

</body>
