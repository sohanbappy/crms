
<% if((session.getAttribute("type")==null) || session.getAttribute("type").equals("user") )
        {
        response.sendRedirect("index.jsp");
        }
%>

<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Random"%>
<jsp:include page="adminHeader.jsp" />

            <%
                Random rnd=new Random();
                int tempRnd=rnd.nextInt(100);
                
                SimpleDateFormat df = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
	        Date date = new Date();
                df.format(date); 
                String id="T-"+date.getHours()+date.getDate()+date.getMinutes()+date.getMonth()+tempRnd;//ID Generator

                %>
                
                

<center style="background: white"><nav >
        <div class="container">
            <div class="row">
                <div class="col-sm-4">
         <h2><b>Training Info</b></h2>
        <form  method="POST" action="addTrainingInfo" >
	 
        <label>Training ID</label><br>
        <input name="tr_id" type="text" value="<%=id%>" class="form-control"  readonly="">
       
        <label>Training Name</label><br>
        <input name="tr_name" type="text" maxlength="30" class="form-control" required="">
        
        <label>Duration(months) </label><br>
        <input name="duration" type="number" min="1" max="12" class="form-control" required="">
      
        <label>Seats</label><br>
        <input name="seats" type="number" min="1" max="20" class="form-control" required="">
       
        <label>Training Type</label><br>
        <select name="type"   class="form-control" required=""  >
             <option selected value="car_dr">Car Driving</option>
            <option value="bike_dr" >Bike Driving</option>
        </select>
        
        <% SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd"); Date now=new Date(); %>
        
        <label>Start Date</label><br>
        <input name="start_date" type="date" min="<%=formatter.format(now)%>" class="form-control" required="" >
       
        <label>Cost(tk)</label><br>
        <input name="cost" type="number" min="1" max="20000" class="form-control" required="" >
       
        <label>Trainer</label><br>
        <input name="trainer" type="text" maxlength="50" class="form-control" required="" >
        
        
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