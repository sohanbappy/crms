
<% if((session.getAttribute("type")==null) || session.getAttribute("type").equals("admin") )
        {
        response.sendRedirect("index.jsp");
        }
%>

<%@page import="java.util.List"%>
<%@page import="models.CarInfo"%>
<%@page import="dao.CarInfoDao"%>
<jsp:include page="landing_header.jsp" />

<style>
    center{
        background: white;
        
    }
</style>

<!--
<script type="text/javascript">
    function showHide(){
    var value=document.getElementById("rent_type").value;
    var car_id=document.getElementById("c_id");
    var fn1=document.getElementById("p_day");
    var fn2=document.getElementById("p_hr");
   
     
    if(value=='per_day'){
    
      car_id.value="";
      fn1.style.display="block"; 
      fn2.style.display="none";
      
      }
     
     else {
      car_id.value="";   
      fn1.style.display="none"; 
      fn2.style.display="block";
     }
   
 
    }
    
 </script> -->
 <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
        <script type="text/javascript">
            function getCarDetails(c_id,rent_type,divid){
                $.ajax({
                    url: 'load_details.jsp?c_id='+c_id+'&rent_type='+rent_type, //call storemdata.php to store form data
                    success: function(html) {
                        var ajaxDisplay = document.getElementById(divid);
                        ajaxDisplay.innerHTML = html;
                    }
                });
            }
        </script>   
 

<center><nav>
        
        <h2><b>Car Booking Info</b></h2>
        <div class="container">
            <div class="row">
                <div class="col-sm-4">
        <form  method="POST" action="">
	
        <label>User ID</label><br>
        <input name="uid" type="text" value="<%=session.getAttribute("uid")%>" class="form-control" readonly="">
       
        <label>User License No</label><br>
        <input name="u_lic_no" type="text"class="form-control">
        
        <label>Guarantor's NID</label><br>
        <input name="g_nid" type="text"class="form-control" required="">
       <label>Select Type</label><br>
       
         <select name="rent_type" id="rent_type"  class="form-control"  required="">
            <option  value="per_day" >Per Day</option>
            <option value="per_hour">Per Hour</option>
        </select>
       
       <label>Car ID</label>
       <input list="typ" name="type" id="c_id" class="form-control" onchange="getCarDetails(this.value,rent_type.value, 'displaydetails')"   required="">
		<datalist id="typ">
                  <%
                try {
                        
                List<CarInfo> users = CarInfoDao.getAllMembers();

                for (CarInfo us : users) {
                    String C_ID=us.getCar_id();
                    String C_M=us.getCar_model();
            %>   
		<option value="<%=C_ID%>">| <%=C_M%></option>
              <% 
        }
        
             } catch (Exception e) {
                        out.println("Problem is: "+e);
                    }
        %>  
		</datalist>
                
             
       
        <label>Car License No</label><br>
        <input name="c_lic_no" type="text" class="form-control" readonly="">
       
     </div>
                
       <div class="col-sm-4">     
       
       <div id="displaydetails"></div>       
           
<!--           <div id="p_day"  >
        <label>Per Day</label><br>
        <input name="c_lic_no" type="text" class="form-control">
        
        <label>From Date</label><br>
        <input name="from_date" type="date" class="form-control">
       
        <label>To Date</label><br>
        <input name="from_date" type="date" class="form-control">
        </div>
         
        <div id="p_hr" style="display:none" >
        <label>Per Hour</label><br>
        <input name="c_lic_no" type="text" class="form-control">
     
        <label>Date</label><br>
        <input name="from_date" type="date" class="form-control">

        <label>From </label><br>
        <input name="from_date" type="date" class="form-control">
        
        <label>To </label><br>
        <input name="from_date" type="date" class="form-control">
        </div>-->
         
      </div>
        
        <div class="col-sm-4" >
        <label>Total</label><br>
        <input name="total" type="text" class="form-control" readonly="">
        
        <label>Advance Amount</label><br>
        <input name="advance" type="text" class="form-control">
       
        <label>Transaction ID</label><br>
        <input name="tx_id" type="text" class="form-control">
        
        <label>Due Amount</label><br>
        <input name="due" type="text" class="form-control">
        
        <label>Comments</label><br>
        <input name="c_lic_no" type="text" class="form-control">
        
        <label>Status</label><br>
        <select name="status" required="" class="form-control" >
            <option selected value="Pending">Pending</option>
            <option hidden="">Accepted</option>
            <option hidden="">Due</option>
            <option hidden="">Invalid</option>
        </select>
        <br>
        <br>
        
        <input type="submit" name="submit" class="btn btn-success btn-block" value="Book Now">
        </form>
                    <br><br><br>
                 </div>
            </div>
        </div>
    </nav></center>


<jsp:include page="landing_footer.jsp" />
