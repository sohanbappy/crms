<% if((session.getAttribute("type")==null) || session.getAttribute("type").equals("user") )
        {
        response.sendRedirect("index.jsp");
        }
%>

<%@page import="java.util.ArrayList"%>
<%@page import="dao.BranchDao"%>
<%@page import="models.Branch"%>
<%@page import="models.TrainingInfo"%>
<%@page import="dao.TrainingInfoDao"%>
<%@page import="dao.TrainingInfoDao"%>
<%@page import="dao.CarInfoDao"%>
<%@page import="models.CarInfo"%>
<jsp:include page="adminHeader.jsp"/>

<%@page import="models.User"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="dao.UserDao" %>
<%@page import="helpers.user.*" %>

     <br><br>
        <a href="branch_info_form.jsp"  class="btn btn-warning">ADD BRANCH</a>
         <a href="viewBranchInfo.jsp?filter=all"  class="btn btn-primary">ALL</a>
        
        <form class='navbar-form' method="GET" action="" style="">
                    <div class="form-group">
                          <input type="text" name="branchKey" class="form-control" id="homeSearch" placeholder="enter branch id no.....">
                      </div>
                    <button type="submit" name="filter" value="BranchSearch"  class="btn btn-danger">Search</button>
                  </form> 
        
        <h1>Branch Info</h1>
    
        <table class="table" >
            <thead class="thread-dark" style="color:red;background: black;text-align: center;">
            <th>BR. ID</th>
            <th>Branch Name</th>
            <th>Location</th>
            <th>Admin Name</th>
            <th>Uname</th>
            <th>Status</th>
            <th colspan="2">Action</th> 
        </thead>
            <%
                try {
                        
                   
                List<Branch> branch = new ArrayList<>();
                
                
                if(request.getParameter("filter").equals("all")){  
                     branch = BranchDao.getAllMembers();
                    
                      }
                      else if(request.getParameter("filter").equals("BranchSearch")){
                         branch = BranchDao.getMemberByBranchId(request.getParameter("branchKey"));
                      }

                for (Branch c : branch) {
                    
                    int id=c.getId();
                    
                    String br_id=c.getBr_id();
                    String name=c.getName();
                    String location=c.getLocation();
                    String admin_name=c.getAdmin_name();
                    String uname=c.getUname();
                    String pass=c.getPass();
                    String status=c.getStatus();
                    
                    
            %>
            
            <tr>
                <td><%=br_id%></td>
                <td><%=name%></td>
                <td><%=location%></td>
                <td><%=admin_name%></td>
                <td><%=uname%></td>
                <td><%=status%></td>
                
                <td><a href="updateBranchInfo.jsp?id=<%=id%>" class="btn btn-primary">Update</a></td>
                
            </tr>
           
       <% 
        }
        
             } catch (Exception e) {
                        out.println("Problem is: "+e);
                    }
        %>
        </table>
       
        <br><br><br>
        
       

<jsp:include page="adminFooter.jsp"/>