


<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="connection.dbConfig"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.List"%>
<%@page import="models.CarInfo"%>
<%@page import="dao.CarInfoDao"%>
<%@page import="dao.CarInfoDao"%>
<%@page import="dao.CarInfoDao"%>
<jsp:include page="landing_header.jsp" />


<!--Showcase for Car-->
        <div class="showcase block block-border-bottom-grey" style="background: whitesmoke">
            <div class="container" >
                <div  >
        <h2 class="block-title">
            Available Bikes
          </h2>
        <p>Select your dream bike and enjoy your ride at a cheaper rate. Feel the freedom of life. Login and Book NOW!!!!!!</p>
                </div>
        <div class="item-carousel" data-toggle="owlcarousel" data-owlcarousel-settings='{"items":4, "pagination":true, "navigation":true, "itemsScaleUp":true}' >
         
              <%
                
                    
                    int pageNumber=1;
                    int totalRecords=0;
                    int recordsPerPage=4;
                    int startIndex=0;
                    int noOfPages=0;
                   if(request.getParameter("pageno")!=null){
                    String pageNo=request.getParameter("pageno");
                    pageNumber=Integer.parseInt(pageNo);
                    }
                    
                    startIndex=(pageNumber*recordsPerPage)-recordsPerPage+1;
                    
                    
                		try {
                                    
                        ResultSet rs;          
			Connection con = dbConfig.getConnection();
                        Statement st = con.createStatement();
                        if(request.getParameter("bikeKey")!=null){
                            
                            String key=request.getParameter("bikeKey");
                            
                        rs = st.executeQuery("select * from bike_info_tb WHERE status='available' AND  bike_model LIKE '%"+key+"%'  ");
                        }
                        
                        else{
			rs = st.executeQuery("select * from bike_info_tb where status='available' ");
                        }
                        rs.absolute(startIndex);
                        int i=0;
                        int newLine=0;
			do {
			       	newLine++; 
				int id=rs.getInt(1);
				String C_ID=rs.getString(2);
                                String C_M=rs.getString(3);
//                                c.setC_lic_no(rs.getString(4));
//                                c.setC_eng_no(rs.getString(5));
                                String P_Name=rs.getString(7);
//                                c.setPicture(rs.getString(7));
//                                c.setRent_type(rs.getString(8));
//                                c.setCategory(rs.getString(9));
//                                c.setP_day(rs.getString(10));
//                                c.setP_hr(rs.getString(11));
//                                c.setStatus(rs.getString(12));


                                
                     
            %> 
            <div class="item">
                <a href="bike_info_view.jsp?id=<%=id%>" class="overlay-wrapper">
                    <img src="images/<%=P_Name%>" alt="<%=P_Name%>" height="200" width="200">
                <span class="overlay">
                  <span class="overlay-content"> <span class="h4"><%=C_ID%></span> </span>
                </span>
              </a>
            <div class="item-details bg-noise">
              <h4 class="item-title">
                  <p href="#">Model:   <%=C_M%></p>
                </h4>
              <a href="bike_info_view.jsp?id=<%=id%>" class="btn btn-more"><i class="fa fa-plus"></i>Read more</a>
            </div>
           </div>     
                        <% 
                             if(newLine==2){
                             newLine=0;
                             %>
                             
<!--                             <br><br><br><br><br><br><br><br><br><br>-->
                             
                             <%
                             }
                            
                   }while (rs.next() && i !=recordsPerPage);
                 

                           totalRecords = CarInfoDao.countCar(); 
                           rs.close();    

                     noOfPages=totalRecords/recordsPerPage;
                     if(totalRecords > noOfPages * recordsPerPage)
                      {
                          noOfPages= noOfPages + 1;
                    }
                     for(int k=1;k<=noOfPages;k++){
              

                     %>
                     
               </div> 
              </div>       
                     <br>
                     <br>
<!--                     <span style="text-align: center"><b><a href="viewAllBikeGallery.jsp?pageno=<%=k%>" >  <%=k%> </a></b></span>-->
                     &nbsp;&nbsp;&nbsp;&nbsp;
<%
                                        }
                                        st.close();
                                        con.close();

             } catch (Exception e) {
                        out.println("Problem is: "+e);
                    }
        %>
          
        
      
    </div>
        
    <jsp:include page="landing_footer.jsp" />
    
        