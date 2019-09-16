
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
    
    try {
            
        
    int id=Integer.parseInt(request.getParameter("id"));
    
    BikeInfo st=BikeInfoDao.getBikeInfoById(id);
   
    String bike_id=st.getBike_id();
    String b_model=st.getBike_model();
    String b_lic_no=st.getB_lic_no();
    String b_eng_no=st.getB_eng_no();
    String category=st.getCategory();
    String pic_name=st.getPic_name();
    String p_day=st.getP_day();
    String status=st.getStatus();
    
    
%>

<script type="text/javascript">
    
    function checkDate(){
         
    var from=document.getElementById("f_date").value;
    var to=document.getElementById("t_date").value;
    
    
    if(Date.parse(from) > Date.parse(to)){
        alert("Invalid Date Range!\nStart Date cannot be after End Date!");
            document.getElementById("t_date").focus();
            document.getElementById("t_date").value="";
        
        return false;
    }
   }
</script>

<% if(session.getAttribute("check")!=null && session.getAttribute("check")!="" ){
        if(session.getAttribute("check").equals("from_failed")){
%>
<script>
    alert("From Date is not available!!!!");
</script>
<%         }else if(session.getAttribute("check").equals("to_failed")){
%>
<script>
    alert("To Date is not available!!!!");
</script>
<% 

}

session.setAttribute("check", ""); 

} %>

       


<center style="background:white" ><nav>
        
        <h1>Bike Rent Info</h1>
          <div style="background: whitesmoke;color: black ">
<!--        <marquee>If Date is not Available then You will be redirected to this page...</marquee>-->
        </div>
        
        <div class="container">
            <div class="row">
                <div class="col-sm-4">
        <form method="POST" action="bike_rent_form2.jsp">
      
            <input type="hidden" name="id" value="<%=id%>">
            
        <label>Bike ID</label>
        <input name="bike_id" type="text" value="<%=bike_id%>" required="" class="form-control" readonly="">
       
        <label>Bike Model</label>
        <input name="bike_model" type="text" value="<%=b_model%>" required="" class="form-control" readonly="">
     
        <label>License No.</label>
        <input name="b_lic_no" type="text" value="<%=b_lic_no%>" required="" class="form-control" readonly="">
    
        <label>Engine No.</label>
        <input type="text" name="b_eng_no" value="<%=b_eng_no%>" class="form-control" readonly >
      
       
         <label>Category</label><br>
         <input type="text" name="category" value="<%=category%>" class="form-control" readonly >
       
         </div>
      <%
          SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd"); 
          Date now=new Date();
          

        %>
        <div class="col-sm-4">
        <label>Per Day</label><br>
        <input name="p_day" type="text" value="<%=p_day%>" class="form-control" readonly="">
        
        <label>From Date</label><br>
        <input name="from_date" id="f_date" type="date"   min="<%=formatter.format(now)%>" class="form-control" onchange="checkDate()" required="">
       
        <label>To Date</label><br>
        <input  name="to_date" id="t_date" type="date"   min="<%=formatter.format(now)%>"  class="form-control" onchange="checkDate()" required="">
     
         
        

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
                
         <input type="submit" name="submit" value="Check Availability" class="btn btn-primary">
        </div>
                <div class="col-sm-4">
                    <img src="images/<%=pic_name%>" alt="<%=pic_name%>" height="200" width="200">
                    
                    
                    <h5 >Terms and Conditions</h5>


        <i class="fa fa-check-circle-o"> This rate is excluding Fuel cost.
        </i><i class="fa fa-check-circle-o"> Please wear helmet.
        </i><i class="fa fa-check-circle-o"> Check papers before taken.
        </i><i class="fa fa-check-circle-o"> Any damages will be recovered by the customer. 
        </i><i class="fa fa-check-circle-o"> Authority has no deal with any kind of police offense. 
        </i><i class="fa fa-check-circle-o"> Penalty will be taken for late submission.
        </i><i class="fa fa-check-circle-o"> Authority has all kind of rights to make any change. 
        </i><i class="fa fa-check-circle-o"> Please follow traffic rules.</i>
        <i class="fa fa-check-circle-o"> <a href="tc.jsp">For Details</a></i>
                    
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
