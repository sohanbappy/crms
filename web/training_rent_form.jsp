
<% if((session.getAttribute("type")==null) || session.getAttribute("type").equals("admin") )
        {
        response.sendRedirect("login.jsp?success=0");
        }
%>

<%@page import="dao.TrainingRentDao"%>
<%@page import="dao.TrainingInfoDao"%>
<%@page import="models.TrainingInfo"%>
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




<% 
   
    if(session.getAttribute("uid")!=null)
    {
    
    
    int temp_id=Integer.parseInt(request.getParameter("id"));
    
    TrainingInfo st=TrainingInfoDao.getTrainingInfoById(temp_id);
    
    String tr_id=st.getTr_id();
    int  fill_up=TrainingRentDao.countSeats(tr_id);
    String cost=st.getCost();
    int seats=Integer.parseInt(st.getSeats());
    
    if(fill_up >= seats){
    
    response.sendRedirect("viewAllTrainingGallery.jsp");
    }
    else{
    
%>


<center style="background:white" ><nav>
        
        <h1>Training Rent Info</h1>
        
        
        <div class="container" style="padding-bottom:25px">
            <div class="row">
                <div class="col-sm-4">
      
              
            <%
                Random rnd=new Random();
                int tempRnd=rnd.nextInt(100);
                SimpleDateFormat df,frmt;
                df= new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	        Date date = new Date();
                df.format(date); 
                String id="TR-"+session.getAttribute("uid")+date.getDate()+date.getMonth()+date.getMinutes()+tempRnd;//ID Generator

                %>      
                    
        <form method="POST" action="addTrainingRent">
      
          
        <label>Rent ID</label>
        <input name="rent_id" type="text" value="<%=id%>"  required=""class="form-control" readonly="">   
            
        <label>Training ID</label>
        <input name="tr_id" type="text" value="<%=tr_id%>"  required=""class="form-control" readonly="">
     
        
      </div>  
            
        
        
        <div class="col-sm-4"> 
            
            <%
       
           final double VAT=15; 
           final double needToPay=.4;  //40%
           double tempVat=0,totalVat=0,tempTotal=0,total=0,diff=0,adPay=0,due=0;
          
           tempTotal=Integer.parseInt(cost);
           
           tempVat=VAT/100;
           totalVat=tempVat*tempTotal;
           total=Math.round(tempTotal+totalVat);
           adPay=Math.round(needToPay *total);
           due=Math.round(total-adPay);   
            

           
           %>
            
            
            
            
        <label>Total</label><br>
        <input name="total" type="text" class="form-control" value="<%=total%>" readonly="">
        
        <label>Advance Amount</label><br>
        <input name="advance" type="text" class="form-control" value="<%=adPay%>" readonly="">
       
        <label>Due Amount</label><br>
        <input name="due" type="text" class="form-control" value="<%=due%>" readonly="">
        
        </div>
        
       
       <div class="col-sm-4">
        <label>User ID</label>
        <input name="uid" type="text" value="<%=session.getAttribute("uid")%>"  required="" class="form-control" readonly="">
       
        <label>Transaction ID</label><br>
        <input name="tx_id" type="text" maxlength="30" class="form-control"  required="">
        
       
        <br><br>
            <input type="submit" name="submit" value="Confirm" class="btn btn-success">
        </form>
     
               
        
                </div>
            </div>
        </div>
    
</nav></center> 
        
        <% 
        }
}
else{
  
}
        %>
            
<jsp:include page="landing_footer.jsp"/>
