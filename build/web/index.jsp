 <%@page import="dao.UserDao"%>
<%@page import="dao.BikeInfoDao"%>
<%@page import="models.BikeInfo"%>
<%@page import="java.util.List"%>
<%@page import="models.CarInfo"%>
<%@page import="dao.CarInfoDao"%>
<jsp:include page="landing_header.jsp" />

 <script>
   var img1=new Image();
 img1.src="img/slides/car_slide1.jpg";
 
 var img2=new Image();
 img2.src="img/slides/bike_slide1.jpg";
 
 var img3=new Image();
 img3.src="img/slides/car_slide2.jpg";
 
 var img4=new Image();
 img4.src="img/slides/bike_slide2.jpg";
  </script>

  <%  
      //auto refresh
      response.setIntHeader("Refresh", 500); 
        try{
  
  %>
      
  
  
    <div class="hero" id="highlighted">
      <div class="inner">
        <!--Slideshow-->
        <div id="highlighted-slider" class="container">
          <div class="item-slider" data-toggle="owlcarousel" data-owlcarousel-settings='{"singleItem":true, "navigation":true, "transitionStyle":"fadeUp"}'>
            <!--Slideshow content-->
            <!--Slide 1-->
            <div >
                <img src="img/slides/car_slide1.jpg" name="slider" style="width: 100%; height:400px" />
            </div>
          </div>
        </div>
      </div>
    </div>

  <!-- ======== @Region: #content ======== -->
  <div id="content">
    <!-- Mission Statement -->
    <div class="mission text-center block block-pd-sm block-bg-noise">
      <div class="container">
        <h2 class="text-shadow-white">
            We are a full digital car or bike rental agency based in Cox's Bazar. We are experienced in car,bike rental and training solutions.
            <a href="about.jsp" class="btn btn-more"><i class="fa fa-plus"></i>Read more</a>
          </h2>
      </div>
    </div>
    <!--Showcase for Car-->
    <div class="showcase block block-border-bottom-grey" id="car">
      <div class="container">
        <h4 class="block-title">
            <div class="navbar-collapse collapse" >
             <ul class="nav navbar-nav" id="main-menu" style="padding-right: 540px">
                 <li><h2>Available Car</h2></li>
            </ul>
                <a style="float:left;margin-top:13px;margin-right: 30px; " href="viewAllCarGallery.jsp" class="btn btn-warning"  >View All</a>

                <form class='navbar-form' method="GET" action="viewAllCarGallery.jsp" >
                    <input type="hidden" name="pageno" value="1" />
                  <div class="form-group">
                      <input type="text" name="carKey" class="form-control" id="homeSearch" placeholder="enter model no.....">
                  </div>
                  <button type="submit" name="search" value="carSearch" class="btn btn-danger">Search</button>
              </form>    
            </div>
      </h4>
      
        <p>Select your dream car and enjoy your ride at a cheaper rate. Feel the freedom of life. Login and Book NOW!!!!!!</p>
        <div class="item-carousel" data-toggle="owlcarousel" data-owlcarousel-settings='{"items":4, "pagination":false, "navigation":true, "itemsScaleUp":true}'>
         
              <%
                try {
                        
                List<CarInfo> users = CarInfoDao.getAllAvailableMembers();

                for (CarInfo us : users) {
                    int id=us.getId();
                    String C_ID=us.getCar_id();
                    String C_M=us.getCar_model();
                    String R_T=us.getRent_type();
                    String P_Name=us.getPic_name();
            %> 
            <div class="item">
                <a href="car_info_view.jsp?id=<%=id%>" class="overlay-wrapper">
                    <img src="images/<%=P_Name%>" alt="<%=P_Name%>" height="200" width="200">
                <span class="overlay">
                  <span class="overlay-content"> <span class="h4"><%=C_ID%></span> </span>
                </span>
              </a>
            <div class="item-details bg-noise">
              <h4 class="item-title">
                  <p href="#">Model:   <%=C_M%></p>
                  <p href="#">Rent Type:   <%=R_T%></p>
                </h4>
              <a href="car_info_view.jsp?id=<%=id%>" class="btn btn-more"><i class="fa fa-plus"></i>Read more</a>
            </div>
           </div>     
                        <% 
        }
             } catch (Exception e) {
                        out.println("Problem is: "+e);
                    }
        %>
          
        </div>
      </div>
    </div>
        
            <!--Showcase for BIke-->

            <div class="showcase block block-border-bottom-grey" id="bike">
      <div class="container">
    <h4 class="block-title">
                <div class="navbar-collapse collapse" >
                 <ul class="nav navbar-nav" id="main-menu" style="padding-right: 530px">
                     <li><h2>Available Bike</h2></li>
                </ul>
                  <a style="float:left;margin-top:13px;margin-right: 30px; " href="viewAllBikeGallery.jsp" class="btn btn-warning"  >View All</a>  
                    
                <form class='navbar-form' method="GET" action="viewAllBikeGallery.jsp">
                    <input type="hidden" name="pageno" value="1" />
                      <div class="form-group">
                          <input type="text" name="bikeKey" class="form-control" id="homeSearch" placeholder="enter model no.....">
                      </div>
                    <button type="submit" name="search" value="bikeSearch"  class="btn btn-danger">Search</button>
                  </form>    
                </div>
          </h4>
        <p>Select your dream car and enjoy your ride at a cheaper rate. Feel the freedom of life. Login and Book NOW!!!!!!</p>
        <div class="item-carousel" data-toggle="owlcarousel" data-owlcarousel-settings='{"items":4, "pagination":false, "navigation":true, "itemsScaleUp":true}'>
         
              <%
                try {
                        
                List<BikeInfo> users = BikeInfoDao.getAllAvailableMembers();

                for (BikeInfo us : users) {
                    int id=us.getId();
                    String B_ID=us.getBike_id();
                    String B_M=us.getBike_model();
                    String P_Name=us.getPic_name();
            %> 
            <div class="item">
                <a href="bike_info_view.jsp?id=<%=id%>" class="overlay-wrapper">
                    <img src="images/<%=P_Name%>" alt="<%=P_Name%>" height="200" width="200">
                <span class="overlay">
                  <span class="overlay-content"> <span class="h4"><%=B_ID%></span> </span>
                </span>
              </a>
            <div class="item-details bg-noise">
              <h4 class="item-title">
                  <p href="#">Model:   <%=B_M%></p>
                </h4>
              <a href="bike_info_view.jsp?id=<%=id%>" class="btn btn-more"><i class="fa fa-plus"></i>Read more</a>
            </div>
           </div>     
                        <% 
        }
             } catch (Exception e) {
                        out.println("Problem is: "+e);
                    }
        %>
          
        </div>
      </div>
    </div>
  </div>    
        
        
    
    <!-- Services -->
    <div class="services block block-bg-gradient block-border-bottom">
      <div class="container">
        <h2 class="block-title">
            Our Services
          </h2>
        <div class="row">

          <div class="col-md-12 text-center">
            <span class="fa-stack fa-5x">
              <i class="fa fa-circle fa-stack-2x text-primary"></i>
              <i class="fa fa-cogs fa-stack-1x fa-inverse"></i> </span>
            <h4 class="text-weight-strong">
                Enroll a training
              </h4>
            <p>We offer best driving training at a cheaper rate.......</p>
            <p>
              <a href="viewAllTrainingGallery.jsp" class="btn btn-more i-right">View All <i class="fa fa-angle-right"></i></a>
            </p>
          </div>
        </div>
      </div>
    </div>
    
    <!--
Background image callout with CSS overlay
Usage: data-block-bg-img="IMAGE-URL" to apply a background image clearly via jQuery .block-bg-overlay = overlays the background image, colour is inherited from block-bg-* classes .block-bg-overlay-NUMBER = determines opcacity value of overlay from 1-9 (default is 5) ie. .block-bg-overlay-2 or .block-bg-overlay-6
-->
    <div class="col-sm-4" style="background-position: 0px 28.9312px; color: white;">
      <h2 class="h-xlg h1 m-a-0">
          <span data-counter-up><%=UserDao.countUser()%></span>s
        </h2>
      <h3 class="h-lg m-t-0 m-b-lg">
          Of Happy Customers!
        </h3>
       <br><br><br>
    </div>
    
       <div class="col-sm-4" style="background-position: 0px 28.9312px; color: white;">
      <h2 class="h-xlg h1 m-a-0">
          <span data-counter-up><%=CarInfoDao.countCar()%></span>s
        </h2>
      <h3 class="h-lg m-t-0 m-b-lg">
          Of Car Collection!
        </h3>
       <br><br><br>
    </div>
        
       <div class="col-sm-4" style="background-position: 0px 28.9312px; color: white;">
      <h2 class="h-xlg h1 m-a-0">
          <span data-counter-up><%=BikeInfoDao.countBike()%></span>s
        </h2>
      <h3 class="h-lg m-t-0 m-b-lg">
          Of Bike Collection!
        </h3>
        <br><br><br>
    </div> 
  
                <script type="text/javascript">
	
                var step=1;
                function slideStart(){
                document.images.slider.src=eval("img"+step+".src");

          if(step<4)
              step++; 
          else
              step=1;
                  setTimeout("slideStart()",2000);
                }

                slideStart();
	
 </script>

     <% 
     }
     catch(Exception e){
        out.print("Failed to access DB!!! Please check the server.");
    }
     
     
     %>
 
  <jsp:include page="landing_footer.jsp" />