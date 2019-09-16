
<% if((session.getAttribute("type")==null) || session.getAttribute("type").equals("user") )
        {
        response.sendRedirect("index.jsp");
        }
%>


<%@page import="dao.CarInfoDao"%>
<%@page import="models.CarInfo"%>
<jsp:include page="adminHeader.jsp"/>

<%@page import="dao.UserDao"%>
<%@page import="models.User"%>
<%@page import="helpers.user.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<% 
    try {
            
        
    int id=Integer.parseInt(request.getParameter("id"));
    
    CarInfo st=CarInfoDao.getCarInfoById(id);
   
    String car_id=st.getCar_id();
    String car_model=st.getCar_model();
    String c_lic_no=st.getC_lic_no();
    String c_eng_no=st.getC_eng_no();
    String pic_name=st.getPic_name();
    String picture=st.getPicture();
    
    String rent_type=st.getRent_type();
    String category=st.getCategory();
    
    String p_day=st.getP_day();
    String p_hr=st.getP_hr();
    String status=st.getStatus();
    
    
    session.setAttribute("id",id);
    session.setAttribute("pic_name", pic_name);
    session.setAttribute("image_path", picture);
    
       
%>


        
        <h1>Edit Info</h1>
        
        
        <div class="container">
            <div class="row">
                <div class="col-sm-4">
        <form method="POST" action="updateCarInfo">
      
     
        <label>Car ID</label>
        <input name="car_id" type="text" value="<%=car_id%>" required="" class="form-control" readonly="">
       
        <label>Car Model</label>
        <input name="car_model" type="text" value="<%=car_model%>" required=""class="form-control" readonly="">
     
        <label>License No.</label>
        <input name="c_lic_no" type="email" value="<%=c_lic_no%>" required=""class="form-control" readonly="">
    
        <label>Engine No.</label>
        <input type="text" name="c_eng_no" value="<%=c_eng_no%>" class="form-control" readonly >
      
        <label >Rent Type</label>
        <input  name="rent_type" type="text"value="<%=rent_type%>"  required=""class="form-control" readonly="">
        
        <label >Category</label>
        <input  name="category" type="text"value="<%=category%>"  required=""class="form-control" readonly="">
        
        <% 
        if(rent_type.equals("per_day"))
        {
        %>
        
        <label >Per Day</label>
        <input  name="p_day" type="text"value="<%=p_day%>"  required=""class="form-control">
        <% 
        }
            else{ 
        %>
        
        
        <label>Per Hour</label>
        <input   name="p_hr" value="<%=p_hr%>"  type="text" class="form-control">
        
        <% }
        %>
         <label>Status</label>
        <select  name="status" class="form-control" value="<%=status%>"  required="">
		 <option  value="available">Available</option>
                 <option value="garaged">Garaged</option>
        </select><br><br>
        
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
<jsp:include page="adminFooter.jsp"/>
