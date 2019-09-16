
<% if((session.getAttribute("type")==null)  )
        {
        response.sendRedirect("index.jsp");
        }
%>


<%@page import="dao.TrainingRentDao"%>
<%@page import="models.TrainingRent"%>
<%@page import="dao.BikeRentDao"%>
<%@page import="models.BikeRent"%>
<%@page import="dao.BikeInfoDao"%>
<%@page import="models.BikeInfo"%>
<%
   if(session.getAttribute("type").equals("admin")){ 
 %>  
<jsp:include page="adminHeader.jsp"/>

<%
    }
else{
    %>
 <jsp:include page="landing_header.jsp"/>   
<% }
%>
<%@page import="dao.UserDao"%>
<%@page import="models.User"%>
<%@page import="helpers.user.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<% 
    try {
            
        
    int id=Integer.parseInt(request.getParameter("id"));
    
    TrainingRent st=TrainingRentDao.getTrainingRentById(id);
   
    String rent_id=st.getRent_id();
    String tr_id=st.getTr_id();
    String comments=st.getComments();
    String tx_id=st.getTx_id();
    String status=st.getStatus();
    
    
    session.setAttribute("id",id);
    
       
%>


<div style="background: white">
        
        <h1>Edit Info</h1>
        
        
        <div class="container">
            <div class="row">
                <div class="col-sm-4">
        <form method="POST" action="updateTrainingRent">
      
     
        <label>Rent ID</label>
        <input name="rent_id" type="text" value="<%=rent_id%>" required=""class="form-control" readonly="">    
            
        <label>Tr. ID</label>
        <input name="Bike_id" type="text" value="<%=tr_id%>" required="" class="form-control" readonly="">
       
        <%
        if(session.getAttribute("type").equals("user")){ 
      %>  
      <label>TX ID</label>
      <input name="tx_id" type="text" value="<%=tx_id%>" maxlength="50" required="" class="form-control" >
        <% }
              if(session.getAttribute("type").equals("admin")){
            %>
        
        <label>Comments</label>
        <input name="comments" type="text" value="<%=comments%>" class="form-control" >
        
        <label>Status</label>
        <input list="tp" name="status" class="form-control" value="<%=status%>"  required="">
		<datalist id="tp">
		 <option  value="pending">Pending</option>
                 <option value="advanced">Advanced</option>
		</datalist>
       
            
            <% 
            }
            %>
            
            <br><br>
            <input type="submit" name="submit" value="Submit" class="btn btn-success">
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
<%
   if(session.getAttribute("type").equals("admin")){ 
 %>  
<jsp:include page="adminFooter.jsp"/>

<%
    }
else{
    %>
 <jsp:include page="landing_footer.jsp"/>   
<% }
%>
