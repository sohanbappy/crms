

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
                int tempRnd=rnd.nextInt(1000);
                
                SimpleDateFormat df = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
	        Date date = new Date();
                df.format(date); 
                String id="Bike-"+date.getHours()+date.getDate()+date.getMonth()+date.getMinutes()+tempRnd;//ID Generator

                %>
                
                

<center style="background: white;text-align: center;padding-left: 250px; " ><nav >
        <div class="container">
            <div class="row">
                <div class="col-sm-4">
         <h2><b>Bike Info</b></h2>
        <form  method="POST" action="addBikeInfo" enctype="multipart/form-data">
	 
        <label>Bike ID</label><br>
        <input name="bike_id" type="text" value="<%=id%>" class="form-control"  readonly="">
       
        <label>Bike Model</label><br>
        <input name="bike_model" type="text" maxlength="20" class="form-control" required="">
        
        <label>License No</label><br>
        <input name="b_lic_no" type="text" maxlength="20" class="form-control" required="">
      
        <label>Engine No</label><br>
        <input name="b_eng_no" type="text" maxlength="50" class="form-control" required="">
       
        
        <label>Category</label><br>
        <select name="category"   class="form-control"  required=""  >
             <option selected value="a">A</option>
            <option value="b" >B</option>
        </select>
        
        <label>Photo</label><br>
        <input name="picture" type="file" class="form-control" required="">
        
        
        <div id="pday" >
        <label>Per Day Amount</label><br>
        <input name="p_day" type="number" min="1" max="2000" maxlength="5"  class="form-control" >
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
