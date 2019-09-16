
<% if((session.getAttribute("type")==null) || session.getAttribute("type").equals("admin") )
        {
        response.sendRedirect("index.jsp");
        }
%>

<%@page import="dao.BikeRentDao"%>
<%@page import="models.BikeRent"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Random"%>
<%@page import="java.util.concurrent.TimeUnit"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="dao.BikeInfoDao"%>
<%@page import="models.BikeInfo"%>

<jsp:include page="landing_header.jsp"/>

<%@page import="dao.UserDao"%>
<%@page import="models.User"%>
<%@page import="helpers.user.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<center style="background:white" ><nav>
        
      
        
        <h1>Bike Rent Info</h1>
        
        <div class="container">
            <div class="row">
                <div class="col-sm-4">
      
              
            <%
                Random rnd=new Random();
                int tempRnd=rnd.nextInt(100);
                SimpleDateFormat df;
                df= new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	        Date date = new Date();
                df.format(date); 
                String id="BR-"+session.getAttribute("uid")+date.getDate()+date.getMonth()+date.getMinutes()+tempRnd;//ID Generator

                %>      
                    
        <form method="POST" action="addBikeRent">
      
          
        <label>Rent ID</label>
        <input name="rent_id" type="text" value="<%=id%>"  required=""class="form-control" readonly="">   
            
        <label>Bike ID</label>
        <input name="bike_id" type="text" value="<%=request.getParameter("bike_id")%>"  required=""class="form-control" readonly="">
     
        <label>License No.</label>
        <input name="b_lic_no" type="text" value="<%=request.getParameter("b_lic_no")%>" required=""class="form-control" readonly="">
        
        <label>Category</label>
        <input name="category" type="text" value="<%=request.getParameter("category")%>" required=""class="form-control" readonly="">
                      
            
        
       
        <label>Per Day</label><br>
        <input name="p_day" type="text" value="<%=request.getParameter("p_day")%>"  class="form-control" readonly="">
        
        <label>From Date</label><br>
        <input name="from_date" type="text" value="<%=request.getParameter("from_date")%>" class="form-control" readonly>
       
        <label>To Date</label><br>
        <input name="to_date" type="text" value="<%=request.getParameter("to_date")%>" class="form-control" readonly="">
        <br>
        
      </div>  
            
        
        
        <div class="col-sm-4"> 
            
            <%
                double VAT=0;
               if(request.getParameter("category")!=null && request.getParameter("category").equals("a") ){ 
               VAT=15; 
               }
               else{
               VAT=10;
               }
           final double needToPay=.25;  //40%
           double tempVat=0,totalVat=0,tempTotal=0,total=0,diff=0,adPay=0,due=0;
          
            
           SimpleDateFormat frmt = new SimpleDateFormat("yyyy-MM-dd"); 
           Date from,to;
           from=frmt.parse(request.getParameter("from_date"));
           to=frmt.parse(request.getParameter("to_date"));
           
           
           
           long diffInMillies = Math.abs(to.getTime() - from.getTime());
           diff = TimeUnit.DAYS.convert(diffInMillies, TimeUnit.MILLISECONDS)+1;
         
           tempTotal=diff*(Integer.parseInt(request.getParameter("p_day")));
           
           tempVat=VAT/100;
           totalVat=tempVat*tempTotal;
           total=Math.round(tempTotal+totalVat);
           adPay=Math.round(needToPay *total);
           due=Math.round(total-adPay);   
           
           //comparing
           List<BikeRent> users = BikeRentDao.getAllMembersByBikeId(request.getParameter("bike_id"));
                String temp_status="",temp_from_date="",temp_to_date="";
                for (BikeRent us : users) {
                    
                     int temp_id=us.getId();
                     temp_status=us.getStatus();  
                     temp_from_date=us.getFrom_date();
                     temp_to_date=us.getTo_date();
                     
                        Date t_from,t_to;
                        t_from=frmt.parse(temp_from_date);
                        t_to=frmt.parse(temp_to_date);
                     
                      
                        
                     if((from.compareTo(t_from)>=0) && (from.compareTo(t_to)<=0) && ((temp_status.equals("pending")) || (temp_status.equals("advanced")) )  ){
                   session.setAttribute("check","from_failed");      
                   response.sendRedirect("bike_rent_form.jsp?id="+request.getParameter("id")); 
                     }
                     else if((to.compareTo(t_from)>=0) && (to.compareTo(t_to)<=0) && ((temp_status.equals("pending")) || (temp_status.equals("advanced"))) ) {
                     
                      session.setAttribute("check","to_failed"); 
                      session.setAttribute("check","to_failed"); response.sendRedirect("bike_rent_form.jsp?id="+request.getParameter("id"));
                     }
                     
                     else{
                         session.setAttribute("check",""); 
  
                }
              } 
           %>
            
            
            
            
        <label>Total</label><br>
        <input name="total" type="text" class="form-control" value="<%=total%>" readonly="">
        
        <label>Advance Amount</label><br>
        <input name="advance" type="text" class="form-control" value="<%=adPay%>" readonly="">
       
        <label>Due Amount</label><br>
        <input name="due" type="text" class="form-control" value="<%=due%>" readonly="">
        
        <label>Pick UP</label>
        <input name="pick_point" type="text" value="<%=request.getParameter("pick_point")%>"  required=""class="form-control" readonly="">
        
         <label>Drop</label>
        <input name="drop_point" type="text" value="<%=request.getParameter("drop_point")%>"  required=""class="form-control" readonly="">
       
        <br><br>
         <input type="submit" name="submit" value="Confirm" class="btn btn-success">

        </div>
        
       
       <div class="col-sm-4">
        <label>User ID</label>
        <input name="uid" type="text" value="<%=session.getAttribute("uid")%>"  required=""class="form-control" readonly="">
         
        <label>License No.</label>
        <input name="u_lic_no" type="text" maxlength="20" class="form-control" required="">
        
        <label>Guarantor's NID.</label>
        <input name="g_nid" type="text" maxlength="20" class="form-control" required="">
         
        <label>Transaction ID</label><br>
        <input name="tx_id" type="text" maxlength="30" class="form-control" required="">
        
        
        <h5 >Payment Rules</h5>


        <i class="fa fa-check-circle-o"> Only one payment option(bKash).
        </i><i class="fa fa-check-circle-o"> Merchant ID: 01766334885.
        </i><i class="fa fa-check-circle-o"> Enter into payment option in bKash. 
        </i><i class="fa fa-check-circle-o"> Enter Rent ID as Reference.
        </i><i class="fa fa-check-circle-o"> Enter Branch ID as Counter NO.  
        </i><i class="fa fa-check-circle-o"> Pay the Advance(exact amount) only. 
        </i><i class="fa fa-check-circle-o"> For wrong TX ID you can change later.
        </i><i class="fa fa-check-circle-o"> For any kind of failure please contact.</i>
     
        <br><br>

        </form>
     
               
        
                </div>
            </div>
        </div>
    
</nav></center>   
            
<jsp:include page="landing_footer.jsp"/>
