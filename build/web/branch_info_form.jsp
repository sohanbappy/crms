
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
                String id="Br-"+date.getHours()+date.getMinutes()+date.getDate()+date.getMonth()+tempRnd;//ID Generator

                %>
                
                

<center style="background: white"><nav >
        <div class="container">
            <div class="row">
                <div class="col-sm-4">
         <h2><b>Branch Info</b></h2>
        <form  method="POST" action="addBranch" >
	 
        <label>Branch ID</label><br>
        <input name="br_id" type="text" value="<%=id%>" class="form-control"  readonly="">
       
        <label>Branch Name</label><br>
        <input name="name" type="text" maxlength="150" class="form-control" required="">
        
        <label>Location </label><br>
        <textarea name="location"  class="form-control" maxlength="200" required=""> </textarea>
      
        <label>Admin Name</label><br>
        <input name="admin_name" type="text" maxlength="50" class="form-control" required="">
        
         <label>User Name</label><br>
         <input name="uname" type="text" maxlength="15" class="form-control" required="">
        
         <label>Password</label><br>
         <input name="pass" type="password" maxlength="15" class="form-control" required="">
       
        
        <label>Status</label><br>
        <select name="status"  class="form-control" required="">
            <option selected value="available">Available</option>
            <option value="removed" hidden="">Removed</option>
        </select>
        <br><br>
        
        <input type="submit" name="submit" class="btn btn-success" value="Submit">
      
        </form>
        
                       </div>
                </div>
              </div>
        
        </nav></center>


<jsp:include page="adminFooter.jsp" />