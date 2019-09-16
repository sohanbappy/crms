
<% if((session.getAttribute("type")==null) )
        {
        response.sendRedirect("index.jsp");
        }
%>


<%@page import="models.User"%>
<%@page import="dao.UserDao"%>
<%@page import="models.BikeInfo"%>
<%@page import="dao.BikeInfoDao"%>


<jsp:include page="adminHeader.jsp" />


<div class="main" style="background: window;  padding-left:  100px">
    <div class="content">
        <div class="section group">
            <%
                
                String id=request.getParameter("uid");
    
                User st=UserDao.getUserByUid(id);

                
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
                
                
             %>   

            <div class="product-desc">
              
            </div>

            <div class="row">				
                <div class="col-sm-4">
                    <img src="images/<%=pic_name%>" style="padding-top: 50px" alt="bike_image" height="200" width="200" />
                        
                </div>
                <div class="col-sm-4">
                    <h2><b><%=name%></b></h2>
                    <h4><b>User ID: </b>&nbsp;&nbsp;<%=id%></h4>					
                    <div class="price">
                        <h4 style="color: green"><b>Phone: &nbsp;&nbsp; <span><%=phone%></span></b></h4> 
                        <h4><b>Mail: </b>&nbsp;&nbsp; <span><%=mail%></span></h4>
                        <h4><b>Address: </b> &nbsp;&nbsp; <span><%=address%></span></h4>
                         <h4><b>Nationality: </b> &nbsp;&nbsp; <span><%=nat%></span></h4>
                          <h4><b>NID: </b> &nbsp;&nbsp; <span><%=nid_no%></span></h4>
                           <h4><b>Passport: </b> &nbsp;&nbsp; <span><%=passport_no%></span></h4>
                    </div>
              
                            
                </div>
                  
                       
            </div>

            
        </div>
    </div>
</div>



<jsp:include page="adminFooter.jsp" />
