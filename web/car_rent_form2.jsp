
<% if((session.getAttribute("type")==null) || session.getAttribute("type").equals("admin") )
        {
        response.sendRedirect("login.jsp?success=0");
        }
%>


<%@page import="java.util.GregorianCalendar"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="dao.BranchDao"%>
<%@page import="models.Branch"%>
<%@page import="java.util.List"%>
<%@page import="dao.CarInfoDao"%>
<%@page import="models.CarInfo"%>

<jsp:include page="landing_header.jsp"/>

<%@page import="dao.UserDao"%>
<%@page import="models.User"%>
<%@page import="helpers.user.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>



<script type="text/javascript">
    
    function checkDate(){
        
    var from=document.getElementById("f_date").value;
    var to=document.getElementById("t_date").value;
    
   
    if(Date.parse(from) > Date.parse(to)){
        alert("Invalid Date Range!\n Start Date cannot be after End Date!");
            document.getElementById("t_date").focus();
            document.getElementById("t_date").value="";
        
        return false;
    }
   }
   
   function checkHour(){
       
       
       
    var from_time=document.getElementById("hr_from").value;
    var to_time=document.getElementById("hr_to").value;
    
    
    
    
    var timeA = new Date();
    timeA.setHours(from_time.split(":")[0],from_time.split(":")[1]);
    var timeB = new Date();
    timeB.setHours(to_time.split(":")[0],to_time.split(":")[1]);
    
//    alert("From: "+timeA+"To: "+timeB)
   
    if( timeA > timeB ){
        
        alert("Invalid Time Range!\n Start Time cannot be after End Time!");
        
            document.getElementById("hr_to").value="";
            document.getElementById("hr_to").focus();
           
        
        return false;
    }
   }
   
   
</script>

<% if(session.getAttribute("check")!=null && session.getAttribute("check")!="" ){
        if(session.getAttribute("check").equals("from_failed")){
%>
<script>
    alert("From Date is not available!!!!\n please select another date");
</script>
<%         }else if(session.getAttribute("check").equals("to_failed")){
%>
<script>
    alert("To Date is not available!!!!\n please select another date");
</script>
<%         }else if(session.getAttribute("check").equals("hr_from_failed")){
%>
<script>
    alert("From Time is not available!!!!\n please select another time");
</script>
<%         }else if(session.getAttribute("check").equals("hr_to_failed")){
%>
<script>
    alert("To Time is not available!!!!\n please select another time");
</script>
<% 

}

session.setAttribute("check", ""); 

   }

%>




<% 
    
    if(session.getAttribute("uid")!=null)
    {
    
    try {
            
        
    int id=Integer.parseInt(request.getParameter("id"));
    
    CarInfo st=CarInfoDao.getCarInfoById(id);
   
    String car_id=st.getCar_id();
    String car_model=st.getCar_model();
    String c_lic_no=st.getC_lic_no();
    String c_eng_no=st.getC_eng_no();
    String rent_type=st.getRent_type();
    String category=st.getCategory();
    String pic_name=st.getPic_name();
    String p_day=st.getP_day();
    String p_hr=st.getP_hr();
    String status=st.getStatus();
    
    
    
       
%>




<center style="background:white" ><nav>
        
        <h1>Car Rent Info</h1>
          <div style="background: whitesmoke;color: black ">
<!--        <marquee>If Date or Hour is not Available then You will be redirected to this page...</marquee>-->
        </div>
        
        <div class="container">
            <div class="row">
                <div class="col-sm-4">
        <form method="POST" action="car_rent_form3.jsp">
      
            <input type="hidden" name="id" value="<%=id%>" readonly="">   
            
        <label>Car ID</label>
        <input name="car_id" type="text" value="<%=car_id%>" required="" class="form-control" readonly="">
       
        <label>Car Model</label>
        <input name="car_model" type="text" value="<%=car_model%>" required=""class="form-control" readonly="">
     
        <label>License No.</label>
        <input name="car_lic_no" type="text" value="<%=c_lic_no%>" required=""class="form-control" readonly="">
    
        <label>Engine No.</label>
        <input type="text" name="car_eng_no" value="<%=c_eng_no%>" class="form-control" readonly >
      
        
         <label>Rent Type</label><br>
         <input type="text" name="rent_type" id="" value="<%=rent_type%>" class="form-control" readonly >
         
         <label>Category</label><br>
         <input type="text" name="category" value="<%=category%>" class="form-control" readonly >
        </div>
         
        <div class="col-sm-4">
       
        
        <%
          SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd"); 
          Date now=new Date();
          
            if(rent_type.equals("per_day")){
        %>
        
        <label>Per Day</label><br>
        <input name="p_day" type="text" value="<%=p_day%>" class="form-control" readonly="" >
        
        <label>From Date</label><br>
        <input name="day_from" id="f_date" type="date" min="<%=formatter.format(now)%>" class="form-control" onchange="checkDate()" required=""  >
       
        <label>To Date</label><br>
        <input name="day_to" id="t_date" type="date" min="<%=formatter.format(now)%>" class="form-control" onchange="checkDate()" required="" >
        <br>

         <% 
         }
        else{
         %>
        
        <label>Per Hour</label><br>
        <input name="p_hr" type="text" value="<%=p_hr%>" class="form-control" readonly="">
     
        
        <label>Date</label><br>
        <input name="hr_date" id="hr_date" type="date" min="<%=formatter.format(now)%>" class="form-control" required="" >

        <label>From </label><br>
        <input name="hr_from" id="hr_from" type="time"  class="form-control"  required="" >
        
        <label>To </label><br>
        <input name="hr_to" id="hr_to" type="time" class="form-control" onchange="checkHour()" required >
         <br>
        
         <%  } 
         
         %>
         
       <label>Pick Up Point </label>
       <input list="p_p" name="pick_point" id="c_id" class="form-control"    required="">
		<datalist id="p_p">
                  <%
                try {
                        
                List<Branch> br = BranchDao.getAllAvailableMembers();

                for (Branch us : br) {
                    String B_id=us.getBr_id();
                    String B_name=us.getName();
            %>   
		<option value="<%=B_id%>">| <%=B_name%></option>
              <% 
        }
        
             } catch (Exception e) {
                        out.println("Problem is: "+e);
                    }
        %>  
		</datalist>
                 <label>Drop Point </label>
       <input list="d_p" name="drop_point" id="c_id" class="form-control"    required="">
		<datalist id="d_p">
                  <%
                try {
                        
                List<Branch> br = BranchDao.getAllAvailableMembers();

                for (Branch us : br) {
                    String B_id=us.getBr_id();
                    String B_name=us.getName();
            %>   
		<option value="<%=B_id%>">| <%=B_name%></option>
              <% 
        }
        
             } catch (Exception e) {
                        out.println("Problem is: "+e);
                    }
        %>  
		</datalist>
        <br>
         <input type="submit" name="submit" value="Check Availability" class="btn btn-primary" >
         <br><br>
        </div>
                <div class="col-sm-4">
                    <img src="images/<%=pic_name%>" alt="<%=pic_name%>" height="200" width="200">
                    <h5 >Terms and Conditions</h5>


        <i class="fa fa-check-circle-o"> This rate is excluding Fuel cost.
        </i><i class="fa fa-check-circle-o"> No Driver will be provided.
        </i><i class="fa fa-check-circle-o"> Check papers before taken.
        </i><i class="fa fa-check-circle-o"> Any damages will be recovered by the customer. 
        </i><i class="fa fa-check-circle-o"> Authority has no deal with any kind of police offense. 
        </i><i class="fa fa-check-circle-o"> Penalty will be taken for late submission.
        </i><i class="fa fa-check-circle-o"> Authority has all kind of rights to make any change. 
        </i><i class="fa fa-check-circle-o"> Please follow traffic rules.</i>
        <i class="fa fa-check-circle-o"><a href="tc.jsp">More in Details</a></i>
                </div>    
                
        </form>
                </div>
            </div>
        </div>
    
</nav></center>   
              <%
                 }
     catch (Exception e) {
         out.println("Failed to access DB!!!!!<a href='adminDashboard.jsp'> Admin Home</a>");
        }
}
else{


    
}
                  
   %>
<jsp:include page="landing_footer.jsp"/>
