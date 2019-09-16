
<% if((session.getAttribute("type")==null) || session.getAttribute("type").equals("admin") )
        {
        response.sendRedirect("index.jsp");
        }
%>

<%@page import="dao.CarRentDao"%>
<%@page import="models.CarRent"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Random"%>
<%@page import="java.util.concurrent.TimeUnit"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="dao.CarInfoDao"%>
<%@page import="models.CarInfo"%>

<jsp:include page="landing_header.jsp"/>

<%@page import="dao.UserDao"%>
<%@page import="models.User"%>
<%@page import="helpers.user.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>



<script type="text/javascript">
    
    function showHide(){
    var value=document.getElementById("rent_type").value;
    var final=document.getElementById("calc");
    var fn1=document.getElementById("p_day");
    var fn2=document.getElementById("p_hr");
   
     
    if(value==='per_day'){
    
      fn1.style.display="block"; 
      fn2.style.display="none";
      final.style.display="block";
      
      }
     
     else if(value==='per_hour'){
         
      fn1.style.display="none"; 
      fn2.style.display="block";
      final.style.display="block";
     }
      else{
         
      fn1.style.display="none"; 
      fn2.style.display="none";
      final.style.display="none";
     }
   
 
    }
    
 </script> 

<center style="background:white;margin-bottom: 10px;"><nav>
        
        <h1>Car Rent Info</h1>
        
        
        <div class="container">
            <div class="row">
                <div class="col-sm-4">
        <form method="POST" action="addCarRent">
      
            <%
                Random rnd=new Random();
                int tempRnd=rnd.nextInt(100);
                
               SimpleDateFormat df = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
	        Date date = new Date();
                df.format(date); 
                String id="CR-"+session.getAttribute("uid")+date.getDate()+date.getMonth()+date.getMinutes()+tempRnd;//ID Generator

                %>
          
        <label>Rent ID</label>
        <input name="rent_id" type="text" value="<%=id%>"  required=""class="form-control" readonly="">   
            
        <label>Car ID</label>
        <input name="car_id" type="text" value="<%=request.getParameter("car_id")%>"  required=""class="form-control" readonly="">
     
        <label>License No.</label>
        <input name="car_lic_no" type="text" value="<%=request.getParameter("car_lic_no")%>" required=""class="form-control" readonly="">
        
        <label>Category</label>
        <input name="category" type="text" value="<%=request.getParameter("category")%>" required=""class="form-control" readonly="">
        
         <label>Rent Type</label>
        <input name="rent_type" type="text" value="<%=request.getParameter("rent_type")%>" required=""class="form-control" readonly="">
        
        
        </div>  
        <div class="col-sm-4"> 
        
        
        <%
             
           double VAT=0;
               if(request.getParameter("category").equals("a")){ 
               VAT=15; 
               }
               else{
               VAT=10;
               }
               
           final double needToPay=.25;  //25%
           double tempVat=0,totalVat=0,tempTotal=0,total=0,diff=0,adPay=0,due=0;
           SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd") ;
           
           
           String pre_id=request.getParameter("id");
           
           
           String type=request.getParameter("rent_type");
           
           if(type!=null){
               
           if(type.equals("per_day")){
             //for Per Day
          
           Date from,to;
           from=format.parse(request.getParameter("day_from"));
           to=format.parse(request.getParameter("day_to"));
           
                   long diffInMillies = Math.abs(to.getTime() - from.getTime());
                   diff = TimeUnit.DAYS.convert(diffInMillies, TimeUnit.MILLISECONDS)+1;
                   tempTotal=diff*(Integer.parseInt(request.getParameter("p_day")));

                   tempVat=VAT/100;
                   totalVat=tempVat*tempTotal;
                   total=Math.round(tempTotal+totalVat);
                   adPay=Math.round(needToPay *total);
                   due=Math.round(total-adPay);
          

           //comparing
           
           List<CarRent> users = CarRentDao.getAllMembersByCarId(request.getParameter("car_id"));
                String temp_status="",temp_from_date="",temp_to_date="";
                for (CarRent us : users) {
                    
                     int temp_id=us.getId();
                     temp_status=us.getStatus();  
                     temp_from_date=us.getDay_from();
                     temp_to_date=us.getDay_to();
                     
                        Date t_from,t_to;
                        t_from=format.parse(temp_from_date);
                        t_to=format.parse(temp_to_date);
                     
                  if((from.compareTo(t_from)>=0) && (from.compareTo(t_to)<=0) && ((temp_status.equals("pending")) || (temp_status.equals("advanced")) )  ){
                       session.setAttribute("check","from_failed"); 
                      response.sendRedirect("car_rent_form2.jsp?id="+pre_id);
                  
                     }
                 else if((to.compareTo(t_from)>=0) && (to.compareTo(t_to)<=0) && ((temp_status.equals("pending")) || (temp_status.equals("advanced"))) ) {
                      session.setAttribute("check","to_failed"); 
                     response.sendRedirect("car_rent_form2.jsp?id="+pre_id);
                     
                     }
                else{ 

                      session.setAttribute("check",""); 
                        }
                    }
                    
           %>
            
         <div id="p_day"  > 
        <label>Per Day</label><br>
        <input name="p_day" type="text" value="<%=request.getParameter("p_day")%>"  class="form-control" readonly="">
        
        <label>From Date</label><br>
        <input name="day_from" type="text"value="<%=request.getParameter("day_from")%>" class="form-control" readonly>
       
        <label>To Date</label><br>
        <input name="day_to" type="text" value="<%=request.getParameter("day_to")%>" class="form-control" readonly="">
        <br>
        </div>
        
        
         <%
             
         }
       
        else if(request.getParameter("rent_type").equals("per_hour")){
         
         //for Per Hour
           SimpleDateFormat format2 = new SimpleDateFormat("HH:mm"); 
           Date hr_date,hr_from,hr_to;
           
           hr_date=format.parse(request.getParameter("hr_date"));
           hr_from=format2.parse(request.getParameter("hr_from"));
           hr_to=format2.parse(request.getParameter("hr_to"));
           long diffInMillies2 = Math.abs(hr_to.getTime() - hr_from.getTime());
           diff = TimeUnit.MINUTES.convert(diffInMillies2, TimeUnit.MILLISECONDS); 

           
           if(diff<60){
           diff=60;
             }

           double tday=Integer.parseInt(request.getParameter("p_hr"));
           tempTotal=diff*(tday/60);



           tempVat=VAT/100;
           totalVat=tempVat*tempTotal;
           total=Math.round(tempTotal+totalVat);
           adPay=Math.round(needToPay * total);  //upto 2 decimal
           due=Math.round(total-adPay);
           

           //comparing
           
           List<CarRent> users = CarRentDao.getAllMembersByCarId(request.getParameter("car_id"));
                String temp_status="",temp_hr_date="",temp_hr_from="",temp_hr_to="";
                for (CarRent us : users) {
                    
                     int temp_id=us.getId();
                     temp_status=us.getStatus();
                     temp_hr_date=us.getHr_date();
                     temp_hr_from=us.getHr_from();
                     temp_hr_to=us.getHr_to();
                     
                    Date t_hr_date,t_from,t_to;
                    t_hr_date=format.parse(temp_hr_date);
                    t_from=format2.parse(temp_hr_from);
                    t_to=format2.parse(temp_hr_to);
                     

                       //comparing date
                  if((hr_date.equals(t_hr_date))  && ((temp_status.equals("pending")) || (temp_status.equals("advanced")) )  )
                     {
                    
                    //comparing time
                    
                    if((hr_from.compareTo(t_from)>=0) && (hr_from.compareTo(t_to)<=0) && ((temp_status.equals("pending")) || (temp_status.equals("advanced"))))
                    
                         {
                              session.setAttribute("check","hr_from_failed"); 
                             response.sendRedirect("car_rent_form2.jsp?id="+pre_id);
                        }
                    else if((hr_to.compareTo(t_from)>=0) && (hr_to.compareTo(t_to)<=0) && ((temp_status.equals("pending")) || (temp_status.equals("advanced"))))
                    {
                        session.setAttribute("check","hr_to_failed"); 
                        response.sendRedirect("car_rent_form2.jsp?id="+pre_id);
                    }
                    else{
                                //hour compare
                            
                                    session.setAttribute("check",""); 

                    
                        }
                    }  
//                    out.print(t_from+""+t_to);
                }
         %>
        <div id="p_hr"   >  
            
            <%// out.print("Hr From: "+hr_from+"Hr To: "+hr_to+"Diff1: "+diffInMillies2+"Diff2:"+diff+"temTotal: "+tempTotal+"temVat: "+tempVat+"totalVat: "+totalVat); %>
            
            
        <label>Per Hour</label><br>
        <input name="p_hr" type="text" value="<%=request.getParameter("p_hr")%>"  class="form-control" readonly="" >
     
        <label>Date</label><br>
        <input name="hr_date" type="date" value="<%=request.getParameter("hr_date")%>"  class="form-control" readonly="">

        <label>From </label><br>
        <input name="hr_from" type="time" value="<%=request.getParameter("hr_from")%>" class="form-control" readonly="">
        
        <label>To </label><br>
        <input name="hr_to" type="time" value="<%=request.getParameter("hr_to")%>" class="form-control" readonly="">
         <br>
        </div>   
        <%    }
        
        else{

                 }
        
        %>
        
        <label>Total</label><br>
        <input name="total" type="text" class="form-control" value="<%=total%>" readonly="">
        
        <label>Advance Amount</label><br>
        <input name="advance" type="text" class="form-control" value="<%=adPay%>" readonly="">
       
        <label>Due Amount</label><br>
        <input name="due" type="text" class="form-control" value="<%=due%>" readonly="">
        
        
        

        </div>
       
       <div class="col-sm-4">
           
        <label>Transaction ID</label><br>
        <input name="tx_id" type="text" maxlength="30" class="form-control" required="">
           
        <label>User ID</label>
        <input name="uid" type="text" value="<%=session.getAttribute("uid")%>"  required=""class="form-control" readonly="">
         
         <label>Pick UP</label>
        <input name="pick_point" type="text" value="<%=request.getParameter("pick_point")%>"  required=""class="form-control" readonly="">
        
         <label>Drop</label>
        <input name="drop_point" type="text" value="<%=request.getParameter("drop_point")%>"  required=""class="form-control" readonly="">
     
        
         <h5 >Payment Rules</h5>


        <i class="fa fa-check-circle-o"> Only one payment option(bKash).
        </i><i class="fa fa-check-circle-o"> Merchant ID: <b>01766334885</b>.
        </i><i class="fa fa-check-circle-o"> Enter into payment option in bKash. 
        </i><i class="fa fa-check-circle-o"> Enter Rent ID as Reference.
        </i><i class="fa fa-check-circle-o"> Enter Branch ID as Counter NO.  
        </i><i class="fa fa-check-circle-o"> Pay the Advance(exact amount) only. 
        </i><i class="fa fa-check-circle-o"> For wrong TX ID you can change later.
        </i><i class="fa fa-check-circle-o"> For any kind of failure please contact.</i>
        
       
        <br><br>
            <input type="submit" name="submit" value="Confirm" class="btn btn-success">
        </form>
     
                 <%
           

        }
                else{


                }
   


            %> 
        
        
        
        
                </div>
            </div>
        </div>
    
</nav></center>   
            
<jsp:include page="landing_footer.jsp"/>
