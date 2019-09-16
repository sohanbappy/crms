
<%@page import="dao.TrainingRentDao"%>
<%@page import="models.TrainingInfo"%>
<%@page import="dao.TrainingInfoDao"%>
<%@page import="models.BikeInfo"%>
<%@page import="dao.BikeInfoDao"%>
<% 
    if(session.getAttribute("type")!=null && ((session.getAttribute("type").equals("admin")) || (session.getAttribute("type").equals("super")))){

%>
<jsp:include page="adminHeader.jsp" />
<% } 
else{ %>
<jsp:include page="landing_header.jsp" />
<% } 

%>

<div class="main" style="background: window;  padding-left:  100px">
    <div class="content">
        <div class="section group">
            <%
            int id=Integer.parseInt(request.getParameter("id"));

            TrainingInfo st=TrainingInfoDao.getTrainingInfoById(id);
            
            String driving="";
            
            String tr_id=st.getTr_id();
            
            int av_seats=TrainingRentDao.countSeats(tr_id);
            
            String tr_name=st.getTr_name();
            String duration=st.getDuration();
            String type=st.getType();
            if(type.equals("car_dr"))
            {
                driving="Car Driving";
            }
            else{
                driving="Bike Driving";
            }
            String seats=st.getSeats();
            String st_date=st.getStart_date();
            String cost=st.getCost();
            String trainer=st.getTrainer();
            String status=st.getStatus(); 
                
             int rest=Integer.parseInt(seats)-av_seats;


             %>   

            <div class="product-desc">
              
            </div>

            <div class="row">				
                <div class="col-sm-4" style="padding-top: 10px">
                   <h2><b><%=tr_name%></b></h2>
                    <p><%=driving%></p>	
                    <h3 style="font-weight:bold;">Possible Start Date &nbsp;&nbsp; <span style="color: blue; font-weight: bold"><%=st_date%></span> </h3>
                      <h3 style="font-weight:bold;"> Available Seats: &nbsp;&nbsp; <span style="color: blue; font-weight: bold"><%=rest%></span> </h3>
                </div>
                <div class="col-sm-4">
                    
                    				
                    <div class="price">
                        <h3 style="font-weight:bold;"> Total Seats: &nbsp;&nbsp; <span style="color: blue; font-weight: bold"><%=seats%></span> </h3>	
                        <p style="color: green"><b>Cost: &nbsp;&nbsp; <span><%=cost%> &nbsp; BDT</span></b></p> 
                        <p>Duration: &nbsp;&nbsp; <span style="color: blue; font-weight: bold"><%=duration%> &nbsp;&nbsp; month/s</span></p>
                        <p>Trainer Name: &nbsp;&nbsp; <span><%=trainer%></span></p>
                    </div>
                    
                        <% 
                               if(session.getAttribute("type")== null || session.getAttribute("type").equals("user")) {
                                  
                            if(rest > 0){
                        %>
                    
                     <div style="padding-top: 20px;">
                        <form  method="get" action="training_rent_form.jsp">
                            <input type="hidden"  name="id" value="<%=id%>" />
                            <input type="submit" class="btn btn-block" name="submit" value="Enroll Now" style="color: red; font-weight:bolder; " />
                        </form><br>
                        <span style="color:red">
                        </span>		
                    </div>
                    <% } else{ %>
                    <h3 style="color: red;">Sorry!!No seats Available!!!!!!</h3>
                      <% } 
                     }
                      %>      
                </div>
                  
                       
            </div>

            
        </div>
    </div>
</div>

<%  if(session.getAttribute("type")!=null && ((session.getAttribute("type").equals("admin")))){
        
%>
<jsp:include page="adminFooter.jsp" />
<% } 
else{ %>
<jsp:include page="landing_footer.jsp" />
<% } 

%>