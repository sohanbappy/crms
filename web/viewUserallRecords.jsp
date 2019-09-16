
<% if((session.getAttribute("type")==null) || session.getAttribute("type").equals("admin") )
        {
        response.sendRedirect("index.jsp");
        }
%>

<%@page import="models.TrainingInfo"%>
<%@page import="dao.TrainingInfoDao"%>
<%@page import="dao.TrainingInfoDao"%>
<%@page import="dao.BikeInfoDao"%>
<%@page import="models.BikeInfo"%>
<%@page import="dao.CarInfoDao"%>
<%@page import="models.CarInfo"%>
<%@page import="dao.TrainingRentDao"%>
<%@page import="models.TrainingRent"%>
<%@page import="models.TrainingRent"%>
<%@page import="dao.BikeRentDao"%>
<%@page import="models.BikeRent"%>
<%@page import="dao.CarRentDao"%>
<%@page import="models.CarRent"%>
<jsp:include page="landing_header.jsp"/>

<%@page import="models.User"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="dao.UserDao" %>
<%@page import="helpers.user.*" %>

<div style="background: white">
          
        <h1>View All Rent Info</h1>
    
        
        <table class="table" border="1px black" >
            
            <thead class="thread-dark" style="background: darkcyan">
       
            <th>Rent ID</th><th>Car ID</th><th>Rent Type</th>
            <th>TX ID</th><th>Request Time</th><th>Comments</th><th>Status</th><th colspan="2">Action</th>
            </thead>

               
        <%
                try {
                        
                 
                    
                List<CarRent> users = CarRentDao.getAllRentByUser(session.getAttribute("uid").toString());

                for (CarRent us : users) {
                    
                    int id=us.getId();
                    String status=us.getStatus();
                   
                   CarInfo car=CarInfoDao.getCarInfoByCarId(us.getCar_id());
                   int tempId=car.getId();
            %>   
              <tr>
                 <td><a href="user_car_rent_view.jsp?rent_id=<%=us.getRent_id()%>"> <%=us.getRent_id()%> </a></td>
                  <td><a href="car_info_view.jsp?id=<%=tempId%>"> <%=us.getCar_id()%> </a></td>
                 <td><%=us.getRent_type()%></td>
                 <td><%=us.getTx_id()%></td>
<!--                 <td><%=us.getTotal()%></td>
                 <td><%=us.getAdvance()%></td>
                 <td><%=us.getDue()%></td>-->
                 <td><%=us.getRequest_time()%></td>
                 <td><%=us.getComments()%></td>
                 <td><%=status%></td>
                
                <td><a href="updateCarRent.jsp?id=<%=id%>" class="btn btn-primary">Update</a></td>
                <td><a href="carRentPdf?id=<%=id%>" class="btn btn-primary">PDF</a></td>
            </tr>
           
       <% 
        }
        
             } catch (Exception e) {
                        out.println("Problem is: "+e);
                    }
        %>
        </table>
        
        
        <table class="table" border="1px black">
            
            <thead class="thread-dark" style="background: darkcyan">
       
            <th>Rent ID</th><th>Bike ID</th>
            <th>TX ID</th><<th>Request Time</th><th>Comments</th><th>Status</th><th colspan="2">Action</th>
            </thead>

               
        <%
                try {
                        
                   
                List<BikeRent> users = BikeRentDao.getAllRentByUser(session.getAttribute("uid").toString());

                for (BikeRent us : users) {
                    
                    int id=us.getId();
                    String status=us.getStatus();
                      
                    BikeInfo car=BikeInfoDao.getBikeInfoByBikeId(us.getBike_id());
                   int tempId=car.getId();
            %>   
              <tr>
                 <td><a href="user_bike_rent_view.jsp?rent_id=<%=us.getRent_id()%>"> <%=us.getRent_id()%> </a></td>
                  <td><a href="bike_info_view.jsp?id=<%=tempId%>"> <%=us.getBike_id()%> </a></td>
                 <td><%=us.getTx_id()%></td>
<!--                 <td><%=us.getTotal()%></td>
                 <td><%=us.getAdvance()%></td>
                 <td><%=us.getDue()%></td>-->
                 <td><%=us.getRequest_time()%></td>
                 <td><%=us.getComments()%></td>
                 <td><%=status%></td>
                
                <td><a href="updateBikeRent.jsp?id=<%=id%>" class="btn btn-primary">Update</a></td>
                <td><a href="bikeRentPdf?id=<%=id%>" class="btn btn-primary">PDF</a></td>
                
            </tr>
           
       <% 
        }
        
             } catch (Exception e) {
                        out.println("Problem is: "+e);
                    }
        %>
        </table>
        
        
        
         <table class="table" border="1px black">
            
            <thead class="thread-dark" style="background: darkcyan">
       
            <th>Rent ID</th><th>Tr. ID</th>
            <th>TX ID</th>
<!--            <th>Total</th><th>Advance</th><th>Due</th>-->
            <th>Request Time</th><th>Comments</th><th>Status</th><th colspan="2">Action</th>
            </thead>

               
        <%
                try {
                        
                   
                List<TrainingRent> users = TrainingRentDao.getAllTrainingRentByUser(session.getAttribute("uid").toString());

                for (TrainingRent us : users) {
                    
                    int id=us.getId();
                    String status=us.getStatus();
                     
                   TrainingInfo car=TrainingInfoDao.getTrainingInfoByTrId(us.getTr_id());
                   int tempId=car.getId();

            %>   
              <tr>
                 <td><a href="user_training_rent_view.jsp?rent_id=<%=us.getRent_id()%>"> <%=us.getRent_id()%> </a></td>
              <td><a href="training_info_view.jsp?id=<%=tempId%>"> <%=us.getTr_id()%> </a></td>
                 <td><%=us.getTx_id()%></td>
<!--                 <td><%=us.getTotal()%></td>
                 <td><%=us.getAdvance()%></td>
                 <td><%=us.getDue()%></td>-->
                 <td><%=us.getRequest_time()%></td>
                 <td><%=us.getComments()%></td>
                 <td><%=status%></td>
                
                <td><a href="updateTrainingRent.jsp?id=<%=id%>" class="btn btn-primary">Update</a></td>
                <td><a href="trainingRentPdf?id=<%=id%>" class="btn btn-primary">PDF</a></td>
            </tr>
           
       <% 
        }
        
             } catch (Exception e) {
                        out.println("Problem is: "+e);
                    }
        %>
        </table>
       
        <br><br><br>
</div>
       

<jsp:include page="landing_footer.jsp"/>