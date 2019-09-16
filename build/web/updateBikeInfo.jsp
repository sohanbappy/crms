
<% if((session.getAttribute("type")==null) || session.getAttribute("type").equals("user") )
        {
        response.sendRedirect("index.jsp");
        }
%>


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
    
    BikeInfo st=BikeInfoDao.getBikeInfoById(id);
   
    String bike_id=st.getBike_id();
    String bike_model=st.getBike_model();
    String b_lic_no=st.getB_lic_no();
    String b_eng_no=st.getB_eng_no();
     String category=st.getCategory();
    String pic_name=st.getPic_name();
    String picture=st.getPicture();
    String p_day=st.getP_day();
    String status=st.getStatus();
    
    
    session.setAttribute("id",id);
    session.setAttribute("pic_name", pic_name);
    session.setAttribute("image_path", picture);
    
       
%>


        
        <h1>Edit Info</h1>
        
        <div class="container">
            <div class="row">
                <div class="col-sm-4">
        <form method="POST" action="updateBikeInfo" >
      
     
        <label>Bike ID</label>
        <input name="bike_id" type="text" value="<%=bike_id%>" required="" class="form-control" readonly="">
       
        <label>Bike Model</label>
        <input name="bike_model" type="text" value="<%=bike_model%>" required=""class="form-control" readonly="">
     
        <label>License No.</label>
        <input name="b_lic_no" type="email" value="<%=b_lic_no%>" required=""class="form-control" readonly="">
    
        <label>Engine No.</label>
        <input type="text" name="b_eng_no" value="<%=b_eng_no%>" class="form-control" readonly >
      
        <label >Category</label>
        <input  name="category" type="text"value="<%=category%>"  required="" class="form-control" readonly="">
        
        <label >Per Day</label>
        <input  name="p_day" type="text"value="<%=p_day%>"  required="" class="form-control">
      
        
        <label>Status</label>
        <input list="st"  name="status" class="form-control" value="<%=status%>"  required="">
        <datalist id="st">
		 <option  value="available">Available</option>
                 <option value="garaged">Garaged</option>
         </datalist>
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

