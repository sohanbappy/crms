         

<%@page import="java.util.ArrayList"%>
<%@page import="models.TrainingInfo"%>
<%@page import="dao.TrainingInfoDao"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<jsp:include page="landing_header.jsp" />


<!--Showcase for Training-->

<div class="showcase block block-border-bottom-grey" style="background: whitesmoke">
      <div class="container">
        <h2 class="block-title">
            Available Training
          </h2>
        <p>Select your dream car and enjoy your ride at a cheaper rate. Feel the freedom of life. Login and Book NOW!!!!!!</p>
        <div class="item-carousel" data-toggle="owlcarousel" data-owlcarousel-settings='{"items":4, "pagination":true, "navigation":true, "itemsScaleUp":true}'>
         
              <%
                try {
                    
                     List<TrainingInfo> users =new ArrayList();
                    
                     if(request.getParameter("type")!=null){
                            String type=request.getParameter("type").toString();
                            
                            users = TrainingInfoDao.getAllMembersByType(type); 
                       }
                     else{
                   users = TrainingInfoDao.getAllAvailableMembers();
                     }
                for (TrainingInfo us : users) {
                    int id=us.getId();
                    String T_ID=us.getTr_id();
                    String T_C=us.getCost();
                    String T_Name=us.getTr_name();
                    String T_StartDate=us.getStart_date();
            %> 
            <div class="item">
                <a href="training_rent_form.jsp?id=<%=id%>" class="overlay-wrapper">
               
              </a>
            <div class="item-details bg-noise">
              <h4 class="item-title">
                  <p href="#">Training Name:   &nbsp;  <%=T_Name%></p>
                  <p href="#" style="color: red" >Cost:  &nbsp;   <%=T_C%> Tk</p>
                  <p href="#">Start From:  &nbsp;   <%=T_StartDate%></p>
                </h4>
              <a href="training_info_view.jsp?id=<%=id%>" class="btn btn-more"><i class="fa fa-plus"></i>Read More</a>
            </div>
           </div>     
                        <% 
        }
             } catch (Exception e) {
                        out.println("Problem is: "+e);
                    }
        %>
          
        </div>
      </div>
    </div>
        
        
        <jsp:include page="landing_footer.jsp" />      