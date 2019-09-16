
<%@page import="models.CarInfo"%>
<%@page import="dao.CarInfoDao"%>


<% 
    if(session.getAttribute("type")!=null && ((session.getAttribute("type").equals("admin")) )){

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
            
            CarInfo st;    
                
            int id=Integer.parseInt(request.getParameter("id"));

            st=CarInfoDao.getCarInfoById(id);

            String car_id=st.getCar_id();
            String c_model=st.getCar_model();
            String c_lic_no=st.getC_lic_no();
            String c_eng_no=st.getC_eng_no();
            String rent_type=st.getRent_type();
            String category=st.getCategory();
            String pic_name=st.getPic_name();
            String p_day=st.getP_day();
            String p_hr=st.getP_hr();
            String status=st.getStatus(); 
                
                
             %>   

            <div class="product-desc">
              
            </div>

            <div class="row">				
                <div class="col-sm-4">
                    <img src="images/<%=pic_name%>" style="padding-top: 50px" alt="car_image" height="200" width="200" />
                        
                </div>
                <div class="col-sm-4">
                    <h2><b><%=c_model%></b></h2>
                    <p><%=car_id%></p>					
                    <div class="price">
                        <p>Rent Type: &nbsp;&nbsp; <span><%=rent_type%></span></p>
                        <% if(rent_type.equals("per_day")){ %>
                        <p style="color: green"><b>Per Day: &nbsp;&nbsp; <span><%=p_day%> &nbsp; BDT</span></b></p> 
                        <% } else{  %>
                        <p style="color: green"><b>Per Hour: &nbsp;&nbsp; <span><%=p_hr%> &nbsp; BDT</span></b></p> 
                        <% } %>
                        <p>License No: &nbsp;&nbsp; <span><%=c_lic_no%></span></p>
                        <p>Category: &nbsp;&nbsp; <span><%=category%></span></p>
                    </div>
                    
      
                        <%   if(session.getAttribute("type")== null || session.getAttribute("type").equals("user") ){ %>
                     <div style="padding-top: 20px;">
                        <form  method="get" action="car_rent_form2.jsp">
                            <input type="hidden"  name="id" value="<%=id%>" />
                            <input type="submit" class="btn btn-block" name="submit" value="Book Now" style="color: red; font-weight:bolder; " />
                        </form><br>
                        <span style="color:red">
                        </span>		
                    </div>
                    
                       <% } %> 
                </div>
                  
                       
            </div>

            
        </div>
    </div>
</div>

<%  if(session.getAttribute("type")!=null && ((session.getAttribute("type").equals("admin")) || (session.getAttribute("type").equals("super")))){
    
        
%>
<jsp:include page="adminFooter.jsp" />
<% } 
else{ %>
<jsp:include page="landing_footer.jsp" />
<% } 

%>