
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
             BikeInfo st=new BikeInfo(); 
             int id=0;
             String b_id="";
             
                
            if(request.getParameter("id")!=null){
            id=Integer.parseInt(request.getParameter("id"));     
            st=BikeInfoDao.getBikeInfoById(id);
            }    
                
            if(request.getParameter("bike_id")!=null){
            b_id=request.getParameter("bike_id");     
            st=BikeInfoDao.getBikeInfoByBikeId(b_id);
            }

            String bike_id=st.getBike_id();
            String b_model=st.getBike_model();
            String b_lic_no=st.getB_lic_no();
            String b_eng_no=st.getB_eng_no();
            String category=st.getCategory();
            String pic_name=st.getPic_name();
            String p_day=st.getP_day();
            String status=st.getStatus(); 
                
                
             %>   

            <div class="product-desc">
              
            </div>

            <div class="row">				
                <div class="col-sm-4">
                    <img src="images/<%=pic_name%>" style="padding-top: 50px" alt="bike_image" height="200" width="200" />
                        
                </div>
                <div class="col-sm-4">
                    <h2><b><%=b_model%></b></h2>
                    <p><%=bike_id%></p>					
                    <div class="price">
                        <p style="color: green"><b>Per Day: &nbsp;&nbsp; <span><%=p_day%> &nbsp; BDT</span></b></p> 
                        <p>License No: &nbsp;&nbsp; <span><%=b_lic_no%></span></p>
                        <p>Category: &nbsp;&nbsp; <span><%=category%></span></p>
                    </div>
                    
                       
                       <%  if(session.getAttribute("type")== null || session.getAttribute("type").equals("user") ){ %>
                     <div style="padding-top: 20px;">
                        <form  method="get" action="bike_rent_form.jsp">
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