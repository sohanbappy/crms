
<%@page import="models.CarRent"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page import="models.BikeRent"%>
<% if((session.getAttribute("type")==null) || session.getAttribute("type").equals("user") )
        {
        response.sendRedirect("index.jsp");
        }
%>


<%@page import="dao.UserDao"%>
<%@page import="dao.TrainingRentDao"%>
<%@page import="dao.BikeRentDao"%>
<%@page import="dao.CarRentDao"%>
<jsp:include page="adminHeader.jsp"/>

<% 
    try{
    int pending1=CarRentDao.countRentPending();
     int pending2=BikeRentDao.countRentPending();
       int pending3=TrainingRentDao.countRentPending();
       
       int pReq=UserDao.countPendingUser();
       
       int cTotal=CarRentDao.CarTotal();
        int bTotal=BikeRentDao.BikeTotal();


%>

  <%  
      //auto refresh
     // response.setIntHeader("Refresh", 10); 
  
  %>
  
  
  <%
   //update Bike Status
    List<BikeRent> users = BikeRentDao.getAllMembers();
  
    for (BikeRent us : users) {
                    
                   
                    String status=us.getStatus();  

                    //update status
                     SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
                     Date now = new Date();
                     df.format(now); 
                     
                     Date t_from,t_to;
                     t_from=df.parse(us.getFrom_date());
                     t_to=df.parse(us.getTo_date());
                     
                     if((now.compareTo(t_from)>0) && (now.compareTo(t_to)<0) && (us.getStatus().equals("advanced"))){
                     
                       String sql="update bike_rent_tb set status='ongoing' where rent_id='"+us.getRent_id()+"' ";
                       int st=BikeRentDao.updateBikeRentDetails(sql);
                       if(st>0){
                       
                       }
                     }
                        if((now.compareTo(t_to)>0)){
                     
                       String sql2="update bike_rent_tb set status='expired' where rent_id='"+us.getRent_id()+"' ";
                       int st2=BikeRentDao.updateBikeRentDetails(sql2);
                       if(st2>0){
                       
                       }
                     }
                 } 


    try{
                    //update Car Status
    List<CarRent> users2 = CarRentDao.getAllMembers();
  
    for (CarRent us2 : users2) {
                    
                    String rent_type=us2.getRent_type();
                    String status2=us2.getStatus(); 
                    

                    //update status
                    
                     SimpleDateFormat df2 = new SimpleDateFormat("HH:mm");
                     Date now2 = new Date();
                     df2.format(now2); 
                    
                     SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd") ;
                     Date now = new Date();
                     df.format(now); 
                     
                     
                     if(rent_type.equals("per_day")){
                         
                          Date t_from,t_to;
                     
                     String temp_day_from=us2.getDay_from();
                     String temp_day_to=us2.getDay_to();
                     
                 
                     
                     t_from=df.parse(temp_day_from);
                     t_to=df.parse(temp_day_to);
                         
                     if((now.getYear()>=t_from.getYear()) && (now.getYear()<=t_to.getYear())  && (status2.equals("advanced"))){
                          if((now.getMonth()>=t_from.getMonth()) && (now.getMonth())<=t_to.getMonth()){
                                if((now.getDate()>=t_from.getDate()) && (now.getDate())<=t_to.getDate()){
                     
                       String sql="update car_rent_tb set status='ongoing' where rent_id='"+us2.getRent_id()+"' ";
                       int st=CarRentDao.updateCarRentDetails(sql);
                       if(st>0){
                       
                       }
                     }
                   }  
                 }   
                     else if((now.compareTo(t_to)>0)){
                     
                       String sql2="update car_rent_tb set status='expired' where rent_id='"+us2.getRent_id()+"' ";
                       int st2=CarRentDao.updateCarRentDetails(sql2);
                       if(st2>0){
                       
                       }
                     }
                 }
                     
                     if(rent_type.equals("per_hour")){
                         
                         
                           
                     Date hr_date,h_from,h_to;
                     hr_date=df.parse(us2.getHr_date());
                     
                     h_from=df2.parse(us2.getHr_from());
                     h_to=df2.parse(us2.getHr_to());
                         
                         if((hr_date.getYear()==now.getYear())){
                             if(hr_date.getMonth()==now.getMonth()){
                                if(hr_date.getDate()==now.getDate()){  
                               
                         
                     if((now2.getHours()>=h_from.getHours()) && (now2.getHours()<= h_to.getHours()) && (status2.equals("advanced"))){
                            
                           
                       String sql="update car_rent_tb set status='ongoing' where rent_id='"+us2.getRent_id()+"' ";
                       int st=CarRentDao.updateCarRentDetails(sql);
                       if(st>0){
                       
                       }
                     }
                    
                     if((now2.getHours()>=h_to.getHours())){
                         if(now2.getMinutes()>h_to.getMinutes()){
                     
                         
                            
                       String sql2="update car_rent_tb set status='expired' where rent_id='"+us2.getRent_id()+"' ";
                       int st2=CarRentDao.updateCarRentDetails(sql2);
                       if(st2>0){
                       
                          }
                        }
                       } 
                      }
                             
                    }
                   }
                         else if(now.compareTo(hr_date)>0){
                             
                             
                       String sql2="update car_rent_tb set status='expired' where rent_id='"+us2.getRent_id()+"' ";
                       int st2=CarRentDao.updateCarRentDetails(sql2);
                       if(st2>0){
                       
                       }
                         }
                 }
              }
    }
    catch(Exception e){
    out.print("Problem is: "+e);
    }
  
  %>   
  
  
  
  
  
  

    <section class="content-header">
      <h1>
        Dashboard
        <small>Control panel</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">Dashboard</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
      <!-- Small boxes (Stat box) -->
      <div class="row">
        <div class="col-lg-6 col-xs-6">
          <!-- small box -->
          <div class="small-box bg-aqua">
            <div class="inner">
              <h3><%=pending1%></h3>

              <p>Pending Requests</p>
            </div>
            <div class="icon">
              <i class="fa fa-car"></i>
            </div>
            <a href="#" class="small-box-footer">Car Rent </a>
          </div>
        </div>
        <!-- ./col -->
        <div class="col-lg-6 col-xs-6">
          <!-- small box -->
          <div class="small-box bg-green">
            <div class="inner">
              <h3><%=cTotal%><sup style="font-size: 20px">tk(car)</sup></h3>
              <h3><%=bTotal%><sup style="font-size: 20px">tk(bike)</sup></h3>
              
            </div>
            <div class="icon">
              <i class="ion ion-stats-bars"></i>
            </div>
            <a href="viewDetails.jsp" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
          </div>
        </div>
        <!-- ./col -->
        <div class="col-lg-6 col-xs-6">
          <!-- small box -->
          <div class="small-box bg-yellow">
            <div class="inner">
              <h3><%=pending2%></h3>

              <p>Pending Requests</p>
            </div>
            <div class="icon">
              <i class="fa fa-motorcycle"></i>
            </div>
            <a href="#" class="small-box-footer">Bike Rent</a>
          </div>
        </div>
        <!-- ./col -->
        <div class="col-lg-6 col-xs-6">
          <!-- small box -->
          <div class="small-box bg-red">
            <div class="inner">
              <h3><%=pReq%></h3>

              <p>User Requests</p>
            </div>
            <div class="icon">
              <i class="ion ion-person-add"></i>
            </div>
            <a href="#" class="small-box-footer">User Info</a>
          </div>
        </div>
        <!-- ./col -->
        <div class="col-lg-6 col-xs-6">
          <!-- small box -->
          <div class="small-box bg-olive">
            <div class="inner">
              <h3><%=pending3%></h3>

              <p>Pending Requests</p>
            </div>
            <div class="icon" style="padding-right: 150px;">
                <i  class="fa fa-cogs fa-stack-1x fa-inverse"></i>
            </div>
            <a href="#" class="small-box-footer">Training Enroll</a>
          </div>
        </div>
      </div> 
      
        </section>
              
              <% 
              }
              catch(Exception e){
                
                    out.print("Failed to access DB!! Please check the server ");
                    }
              
              %>
    <jsp:include page="adminFooter.jsp"/>