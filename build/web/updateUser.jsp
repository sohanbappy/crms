
<% if((session.getAttribute("type")==null))
        {
        response.sendRedirect("index.jsp");
        }
%>


<%
   if(session.getAttribute("type").equals("admin")||session.getAttribute("type").equals("super")){ 
 %>   

<jsp:include page="adminHeader.jsp"/>

<%
    }
else{
    %>
<jsp:include page="landing_header.jsp"/>
    <%
        }
   %>
<%@page import="dao.UserDao"%>
<%@page import="models.User"%>
<%@page import="helpers.user.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<% 
    try {
          
    int id=Integer.parseInt(request.getParameter("id"));
    
    User st=UserDao.getUserById(id);
    
    String name=st.getName();
    String phone=st.getPhone();
    String mail=st.getMail();
    String address=st.getAddress();
    String nat=st.getNat();
    String nid_no=st.getNid_no();
    String passport_no=st.getPassport_no();
 
    String pic_name=st.getPic_name();
    String picture=st.getPicture();
    
    String uid=st.getUid();
    String pass=st.getPass();
    String status=st.getStatus();
    
    
    session.setAttribute("id",id);
    session.setAttribute("pic_name", pic_name);
    session.setAttribute("image_path", picture);
    
        

%>


<div style="background: white;">
        <h1>Edit Info</h1>
        
        
        <div class="container">
            <div class="row">
                <div class="col-sm-4">
                    <form method="POST" action="updateUser" >
      
      <% if(session.getAttribute("type").equals("user")){ %>
        <label>Name</label>
        <input name="name" type="text" value="<%=name%>" maxlength="50" required="" class="form-control">
       
        <label>Phone</label>
        <input name="phone" type="text" value="<%=phone%>" maxlength="11" required=""class="form-control">
     
        <label>Mail</label>
        <input name="mail" type="email" value="<%=mail%>"  required=""class="form-control">
    
        <label>Address</label>
        <textarea rows="5" wrap="off" name="address" maxlength="150" class="form-control" ><%=address%></textarea>
      <% }else{ %>
        <label>Name</label>
        <input name="name" type="text" value="<%=name%>" required="" class="form-control" readonly="">
       
        <label>Phone</label>
        <input name="phone" type="text" value="<%=phone%>" required=""class="form-control" readonly="">
     
        <label>Mail</label>
        <input name="mail" type="email" value="<%=mail%>" required=""class="form-control" readonly="">
    
        <label>Address</label>
        <textarea rows="5" wrap="off" name="address" class="form-control"  readonly=""><%=address%></textarea>
        <% } %>
      
       </div>
        
        <div class="col-sm-4"> 
           
        <label>Nationality</label>
        <select name="nat" required=""  value="<%=nat%>" class="form-control" readonly="">
            <option  value="<%=nat%>"><%=nat%></option>
        </select>   
            
        <label >NID Number</label>
        <input  name="nid_no" type="text"value="<%=nid_no%>"  required=""class="form-control" readonly="">
      
        <label>Passport Number</label>
        <input   name="passport_no" value="<%=passport_no%>"  type="text" class="form-control" readonly="">
        
        <label>User ID</label>
        <input name="uid" type="text" value="<%=uid%>"  required=""class="form-control" readonly="">
      
         <% if(session.getAttribute("type").equals("user")){ %>
        <label>Password</label>
        <input name="pass" type="password" value="<%=pass%>" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" maxlength="20" required=""class="form-control">
          <% } %>
           
        </div>
          
        <div class="col-sm-4">
        <label>Photo</label>
        <img src="images/<%=pic_name%> " height="200" width="200" ><br>
        
     <%
   if(session.getAttribute("type").equals("admin")||session.getAttribute("type").equals("super")){ 
 %>     
      
        <label>Status</label>
        <input list="st" name="status" class="form-control"  value="<%=status%>" required="">
        <datalist id="st">
            <option selected value="Pending">Pending</option>
            <option  value="Accepted">Accepted</option>
        </datalist> 
     
            
        <%
            
        }

        %>
            
            
        <br><br>
            <input type="submit" name="submit" value="Submit" class="btn btn-success">
            <br><br>
        </form>
                </div>
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
   if(session.getAttribute("type").equals("admin")||session.getAttribute("type").equals("super")){ 
 %>   

<jsp:include page="adminFooter.jsp"/>

<%
    }
else{
    %>
<jsp:include page="landing_footer.jsp"/>
    <%
        }
   %>
