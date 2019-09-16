
<% if((session.getAttribute("type")==null) || session.getAttribute("type").equals("user") )
        {
        response.sendRedirect("index.jsp");
        }
%>


<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="dao.TrainingInfoDao"%>
<%@page import="models.TrainingInfo"%>
<%@page import="dao.BikeInfoDao"%>
<%@page import="models.BikeInfo"%>
<jsp:include page="adminHeader.jsp"/>

<%@page import="dao.UserDao"%>
<%@page import="models.User"%>
<%@page import="helpers.user.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<% 
    try {
            
        
    int id=Integer.parseInt(request.getParameter("id"));
    
    TrainingInfo st=TrainingInfoDao.getTrainingInfoById(id);
   
    String tr_id=st.getTr_id();
    String tr_name=st.getTr_name();
    String duration=st.getDuration();
    String seats=st.getSeats();
     String start_date=st.getStart_date();
    String cost=st.getCost();
    String trainer=st.getTrainer();
    String status=st.getStatus();
    
    
    session.setAttribute("id",id);
    
       
%>


        
        <h1>Edit Info</h1>
        
        <div class="container">
            <div class="row">
                <div class="col-sm-4">
        <form method="POST" action="updateTrainingInfo" >
      
     
       <label>Training ID</label><br>
        <input name="tr_id" type="text" value="<%=tr_id%>" class="form-control"  readonly="">
       
        <label>Training Name and Location</label><br>
        <input name="tr_name" type="text" value="<%=tr_name%>" class="form-control" required="">
        
        <label>Duration(months) </label><br>
        <input name="duration" type="number" min="1" value="<%=duration%>" class="form-control" required="">
      
        <label>Seats</label><br>
        <input name="seats" type="number" min="1" value="<%=seats%>" class="form-control" required="">
       
       
        <% SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd"); Date now=new Date(); %>
        
        <label>Start Date</label><br>
        <input name="start_date" type="date"  value="<%=start_date%>" class="form-control" >
       
        <label>Cost(tk)</label><br>
        <input name="cost" type="number" min="1" value="<%=cost%>" class="form-control" >
       
        <label>Trainer</label><br>
        <input name="trainer" type="text" value="<%=trainer%>" class="form-control" >
        
        
       <label>Status</label>
       <input list="st" name="status" class="form-control" value="<%=status%>"  required="">
       <datalist id="st">
                <option  value="available">Available</option>
                 <option value="canceled">Canceled</option>
		
        </datalist><br><br>
        
        <input type="submit" name="submit" class="btn btn-success" value="Update">
        </form>
                </div>
            </div>
        </div>
    
       
              <%
                 }
     catch (Exception e) {
         out.println("Failed to access DB!!!!!<a href='adminDashboard.jsp'> Admin Home</a>");
        }
                  
   %>

