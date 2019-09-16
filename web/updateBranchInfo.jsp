
<% if((session.getAttribute("type")==null) || session.getAttribute("type").equals("user") )
        {
        response.sendRedirect("index.jsp");
        }
%>


<%@page import="dao.BranchDao"%>
<%@page import="models.Branch"%>
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
    
    Branch c=BranchDao.getBranchById(id);
   
    String br_id=c.getBr_id();
    String name=c.getName();
    String location=c.getLocation();
    String admin_name=c.getAdmin_name();
    String uname=c.getUname();
    String pass=c.getPass();
    String status=c.getStatus();
    
    
    session.setAttribute("id",id);
    
       
%>


        
        <h1>Edit Info</h1>
        
        <div class="container">
            <div class="row">
                <div class="col-sm-4">
        <form method="POST" action="updateBranch" >
      
     
       <label>Branch ID</label><br>
        <input name="br_id" type="text" value="<%=br_id%>" class="form-control"  readonly="">
       
        <label>Branch Name</label><br>
        <input name="name" type="text" value="<%=name%>" class="form-control" required="">
        
        <label>Location </label><br>
        <textarea name="location"  class="form-control" required=""> <%=location%> </textarea>
      
        <label>Admin Name</label><br>
        <input name="admin_name" type="text" value="<%=admin_name%>" class="form-control" required="">
        
         <label>User Name</label><br>
        <input name="uname" type="text" value="<%=uname%>" class="form-control" required="">
        
         <label>Password</label><br>
        <input name="pass" type="password" value="<%=pass%>" class="form-control" required="">
       
        
         <label>Status</label>
        <input list="tp" name="status" class="form-control" value="<%=status%>"  required="">
		<datalist id="tp">
		 <option  value="available">Available</option>
                 <option value="removed">Removed</option>
		</datalist>
                <br><br>
        
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

