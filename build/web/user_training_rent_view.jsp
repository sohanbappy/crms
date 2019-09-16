
<% if((session.getAttribute("type")==null) )
        {
        response.sendRedirect("index.jsp");
        }
%>


<%@page import="dao.TrainingInfoDao"%>
<%@page import="models.TrainingInfo"%>
<%@page import="models.TrainingInfo"%>
<%@page import="models.TrainingRent"%>
<%@page import="dao.TrainingRentDao"%>
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
   
                TrainingRent st=TrainingRentDao.getTrainingRentByRentId(id);

                String rent_id=st.getRent_id();
                String uid=st.getUid();
                
                String tr_id=st.getTr_id();
                TrainingInfo tr=TrainingInfoDao.getTrainingInfoByTrId(tr_id);
                String trainer=tr.getTrainer();
                String start=tr.getStart_date();
                
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
                  
                        
                </div>
                <div class="col-sm-4">
                    <h2><b><%=rent_id%></b></h2>
                    <h4><b>User ID: </b>&nbsp;&nbsp;<%=uid%></h4>					
                    <div class="price">
                         <h4><b>Trainer: </b>&nbsp;&nbsp; <span><%=trainer%></span></h4>
                        <h4><b>Start From: </b> &nbsp;&nbsp; <span><%=start%></span></h4>
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
