
<% if((session.getAttribute("type")==null) || session.getAttribute("type").equals("user") )
        {
        response.sendRedirect("index.jsp");
        }
%>

<%@page import="models.CarRent"%>
<%@page import="models.BikeRent"%>
<%@page import="dao.UserDao"%>
<%@page import="dao.TrainingRentDao"%>
<%@page import="dao.CarRentDao"%>
<%@page import="dao.BikeRentDao"%>
<jsp:include page="adminHeader.jsp"/>

       <% 
            int bTotal= BikeRentDao.BikeTotal();
            int bAdvance= BikeRentDao.BikeAdvance();
            int bDue= BikeRentDao.BikeDue();
            int bReq=BikeRentDao.countRentPending();
        
            int cTotal= CarRentDao.CarTotal();
            int cAdvance= CarRentDao.CarAdvance();
            int cDue= CarRentDao.CarDue();
            int cReq=CarRentDao.countRentPending();

            int tTotal= TrainingRentDao.TrainingTotal();
            int tAdvance= TrainingRentDao.TrainingAdvance();
            int tDue= TrainingRentDao.TrainingDue();
            int tReq=TrainingRentDao.countRentPending();
        
            //total
        int overAllTotal=cTotal+bTotal+tTotal;

        %>
        <br><br><br><br>

              
           <div class="row">
               
               <div class="col-lg-12 col-xs-12">
          <!-- small box -->
          <div class="small-box bg-green">
            <div class="inner">
                
                <table cellpadding="5">      
              <!-- For Bike  -->
              <tr>
                  <td><label style="font-size: 32px;color: blue;">From Bike===></label></td>
                  <td><label style="padding-left: 30px; font-size: 30px;">Total : </label> &nbsp; <span style="font-size: 30px; color: red;"> <b><%=bTotal%> </b></span></td> 
                  <td><label style="font-size: 30px;">Advance : </label> &nbsp; <span style="font-size: 30px; color: red;"> <b><%=bAdvance%> </b></span></td> 
                  <td><label style="font-size: 30px;">Due : </label> &nbsp; <span style="font-size: 30px; color: red;"> <b><%=bDue%> </b></span></td> 
                  <td><label style="font-size: 30px;">Total Requests : </label> &nbsp; <span style="font-size: 30px; color: red;"> <b><%=bReq%> </b></span></td> 
                </tr>
   <!-- For Car  -->
   <tr>
       <td><label style="font-size: 32px;color: blue;">From Car===></label>
       <td><label style="padding-left: 30px; font-size: 30px;">Total : </label> &nbsp; <span style="font-size: 30px; color: red;"> <b><%=cTotal%> </b></span></td> 
       <td><label style="font-size: 30px;">Advance : </label> &nbsp; <span style="font-size: 30px; color: red;"> <b><%=cAdvance%> </b></span></td> 
       <td><label style="font-size: 30px;">Due : </label> &nbsp; <span style="font-size: 30px; color: red;"> <b><%=cDue%> </b></span></td> 
       <td><label style="font-size: 30px;">Total Requests : </label> &nbsp; <span style="font-size: 30px; color: red;"> <b><%=cReq%> </b></span></td>        
       </tr>
                
   <!-- For Training  -->
   <tr>
       <td><label style="font-size: 32px;color: blue;">From Trng.===></label>
       <td><label style="padding-left: 30px; font-size: 30px;">Total : </label> &nbsp; <span style="font-size: 30px; color: red;"> <b><%=tTotal%> </b></span></td> 
       <td><label style="font-size: 30px;">Advance : </label> &nbsp; <span style="font-size: 30px; color: red;"> <b><%=tAdvance%> </b></span></td> 
       <td> <label style="font-size: 30px;">Due : </label> &nbsp; <span style="font-size: 30px; color: red;"> <b><%=tDue%> </b></span></td> 
       <td>  <label style="font-size: 30px;">Total Requests : </label> &nbsp; <span style="font-size: 30px; color: red;"> <b><%=tReq%> </b></span></td>              
       </tr>
                </table>
              
            </div>
          </div>
        </div>
               
               
               
        <div class="col-lg-6 col-xs-6">
          <!-- small box -->
          <div class="small-box bg-aqua">
            <div class="inner">
              <h3><%=overAllTotal%></h3>

              <h3>Over All Total</h3>
            </div>
            <div class="icon">
              <i class="ion ion-stats-bars"></i>
            </div>
            <a href="#" class="small-box-footer"> </a>
          </div>
        </div>
         .
         <% BikeRent bR=BikeRentDao.getMaxRentedBike(); 
            CarRent cR=CarRentDao.getMaxRentedCar();
         %>
         
         
        <div class="col-lg-6 col-xs-6">
          <div class="small-box bg-yellow">
            <div class="inner">
                <h3 style="color:black">Most Rented</h3>
                <h3 style="color:whitesmoke"> <%=cR.getCar_id()%></h3>
              <h3 style="color:whitesmoke"> <%=bR.getBike_id()%></h3>
            </div>
            <div class="icon">
              <i class="ion ion-stats-bars"></i>
            </div>
            <a href="" class="small-box-footer"></a>
          </div>
        </div>
  
        
      </div>   
            
            
            
            
            
            
 <jsp:include page="adminFooter.jsp"/>         