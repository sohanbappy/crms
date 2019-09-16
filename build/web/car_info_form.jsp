
<% if((session.getAttribute("type")==null) || session.getAttribute("type").equals("user") )
        {
        response.sendRedirect("index.jsp");
        }
%>



<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Random"%>
<jsp:include page="adminHeader.jsp" />
<script type="text/javascript">
    
    function showHide(){
    var value=document.getElementById("rent_type").value;
    var fn1=document.getElementById("pday");
    var fn2=document.getElementById("phr");
   
     
    if(value=='per_day'){
    
      fn1.style.display="block"; 
      fn2.style.display="none";
      
      }
     
     else{
         
      fn1.style.display="none"; 
      fn2.style.display="block";
     }
   
 
    }
    
 </script> 

            <%
                Random rnd=new Random();
                int tempRnd=rnd.nextInt(100);
                
                SimpleDateFormat df = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
	        Date date = new Date();
                df.format(date); 
                String id="Car-"+date.getHours()+date.getDate()+date.getMonth()+date.getMinutes()+tempRnd;//ID Generator

                %>
                
                

<center style="background: white;"><nav >
        <div class="container">
            <div class="row">
                <div class="col-sm-4">
         <h2><b>Car Info</b></h2>
        <form  method="POST" action="addCarInfo" enctype="multipart/form-data">
	 
        <label>Car ID</label><br>
        <input name="car_id" type="text" value="<%=id%>" class="form-control"  readonly="">
       
        <label>Car Model</label><br>
        <input name="car_model" type="text"class="form-control" required="">
        
        <label>License No</label><br>
        <input name="c_lic_no" type="text" maxlength="50" class="form-control" required="">
      
        <label>Engine No</label><br>
        <input name="c_eng_no" type="text" maxlength="100" class="form-control" required="">
       
        <label>Photo</label><br>
        <input name="picture" type="file" class="form-control" required="">
        
        <label>Category</label><br>
        <select name="category"   class="form-control"  required=""  >
             <option selected value="a">A</option>
            <option value="b" >B</option>
        </select>
        
        <label>Rent Type</label><br>
        <select name="rent_type" id="rent_type"  class="form-control" onchange="showHide();" required=""  >
             <option selected value="per_day">Per Day</option>
            <option value="per_hour" >Per Hour</option>
        </select>
        
        <div id="pday" >
        <label>Per Day Amount</label><br>
        <input name="p_day" type="number" min="1" max="20000" class="form-control" >
        </div>
        
        <div id="phr" style="display: none">
        <label>Per Hour Amount</label><br>
        <input name="p_hr" type="number" min="1" max="3000" class="form-control" >
        </div>
        
        <label>Status</label><br>
        <select name="status"  class="form-control" required="">
            <option selected value="available">Available</option>
        </select>
        <br><br>
        <input type="submit" name="submit" class="btn btn-success" value="Submit">
      
        </form>
        
                       </div>
                </div>
              </div>
        
        </nav></center>


<jsp:include page="adminFooter.jsp" />
