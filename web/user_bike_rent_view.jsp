
<% if((session.getAttribute("type")==null) )
        {
        response.sendRedirect("index.jsp");
        }
%>


<%@page import="dao.BikeRentDao"%>
<%@page import="models.BikeRent"%>
<%@page import="dao.BikeInfoDao"%>
<%@page import="models.BikeInfo"%>
<%@page import="models.CarInfo"%>
<%@page import="dao.CarInfoDao"%>
<%@page import="models.CarRent"%>
<%@page import="models.CarRent"%>
<%@page import="dao.CarRentDao"%>
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

   <div class="main" style="background: window;  padding-left:  100px">
    <div class="content">
        <div class="section group">
            <%
                
                String id=request.getParameter("rent_id");
   
                BikeRent st=BikeRentDao.getBikeRentByRentId(id);

                String rent_id=st.getRent_id();
                String uid=st.getUid();
                String u_lic_no=st.getU_lic_no();
                String g_nid=st.getG_nid();
                
                String b_id=st.getBike_id();
                BikeInfo bike=BikeInfoDao.getBikeInfoByBikeId(b_id);
                String pic_name=bike.getPic_name();
                String b_lic_no=st.getB_lic_no();
                
                String day_from=st.getFrom_date();
                String day_to=st.getTo_date();
                String pick=st.getPick_point();
                String drop=st.getDrop_point();
                String total=st.getTotal();
                String advance=st.getAdvance();
                String due=st.getDue();
                String comments=st.getComments();
                String tx_id=st.getTx_id();
                String status=st.getStatus();
                
               
                
                
             %>   

            <div class="product-desc">
              
            </div>

            <div class="row">				
                <div class="col-sm-4">
                    <img src="images/<%=pic_name%>" style="padding-top: 50px" alt="bike_image" height="200" width="200" />
                        
                </div>
                <div class="col-sm-4">
                    <h2><b><%=rent_id%></b></h2>
                    <h4><b>User ID: </b>&nbsp;&nbsp;<%=uid%></h4>					
                    <div class="price">
                        <h4><b>License NO: </b> &nbsp;&nbsp; <span><%=u_lic_no%></span></h4>
                        <h4><b>Gurantor: </b> &nbsp;&nbsp; <span><%=g_nid%></span></h4>
                         <h4><b>Pick Point: </b> &nbsp;&nbsp; <span><%=pick%></span></h4>
                          <h4><b>Drop Point: </b> &nbsp;&nbsp; <span><%=drop%></span></h4>
                         <h4><b>From: </b>&nbsp;&nbsp; <span><%=day_from%></span></h4>
                        <h4><b>To: </b> &nbsp;&nbsp; <span><%=day_to%></span></h4>
                        <h4><b>Total: </b>&nbsp;&nbsp; <span><%=total%></span></h4>
                        <h4><b>Advance: </b> &nbsp;&nbsp; <span><%=advance%></span></h4>
                         <h4><b>Due: </b> &nbsp;&nbsp; <span><%=due%></span></h4>
                          <h4><b>Feedbacks: </b> &nbsp;&nbsp; <span><%=comments%></span></h4>
                           <h4><b>Tx ID: </b> &nbsp;&nbsp; <span><%=tx_id%></span></h4>
                          <h4 style="color: green"><b>Status:  &nbsp;&nbsp; <%=status%> </b></h4>
                    </div>
              
                            
                </div>
                  
                       
            </div>

            
        </div>
    </div>
</div>
   
   
   


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
