<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<% if((session.getAttribute("type")==null) || session.getAttribute("type").equals("user") )
        {
        response.sendRedirect("index.jsp");
        }
%>


<%@page import="java.util.ArrayList"%>
<%@page import="dao.BikeRentDao"%>
<%@page import="models.BikeRent"%>
<jsp:include page="adminHeader.jsp"/>

<%@page import="models.User"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="dao.UserDao" %>
<%@page import="helpers.user.*" %>

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



<!--<script>
function confirmDelete() {
  var txt;
  var r = confirm("Are you want to delete?? Sure??");
  if (r === false) {
    
    return false;
  } 
 
}
</script>-->
        
        
        
        <% 
            int gTotal= BikeRentDao.BikeTotal();
            int gAdvance= BikeRentDao.BikeAdvance();
            int gDue= BikeRentDao.BikeDue();
            int pReq=BikeRentDao.countRentPending();
        
        
        %>
        
        <div style="">
        
        <br><br>
        <a href="viewBikeRent.jsp?status=all"  class="btn btn-primary">ALL</a>
        <a href="viewBikeRent.jsp?status=pending" class="btn btn-warning" > PENDING</a>
        
        <label style="padding-left: 30px; font-size: 30px;">Total : </label> &nbsp; <span style="font-size: 30px; color: red;"> <b><%=gTotal%> </b></span> &nbsp;&nbsp;&nbsp;&nbsp;
          <label style="font-size: 30px;">Advance : </label> &nbsp; <span style="font-size: 30px; color: red;"> <b><%=gAdvance%> </b></span> &nbsp;&nbsp;&nbsp;&nbsp;
              <label style="font-size: 30px;">Due : </label> &nbsp; <span style="font-size: 30px; color: red;"> <b><%=gDue%> </b></span> &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 
                <label style="font-size: 30px;">Pending Requests : </label> &nbsp; <span style="font-size: 30px; color: red;"> <b><%=pReq%> </b></span> &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 
            
                <a href="viewBikeRent.jsp?status=admin" class="btn btn-warning" > By &nbsp; <%=session.getAttribute("uid")%></a>
                
             <form method="GET" action=""><br>
                 <label style="">From : </label> <input type="date" id="f_date" name="from" onchange="checkDate()"   />
            <label style="padding-left: 10px">To : </label> <input type="date" id="t_date" name="to" onchange="checkDate()"  />
            <input type="submit" name="status" value="View" class="btn btn-primary" /></form>
        
            <form class='navbar-form' method="GET" action="" style="">
                    
                      <div class="form-group">
                          <input type="text" name="brent" class="form-control" id="homeSearch" placeholder="enter rent id no.....">
                      </div>
                    <button type="submit" name="status" value="BikeRentSearch"  class="btn btn-danger">Search</button>
                  </form> 
                
            <a href="allBikeRentPdf" class="btn btn-warning" > All Pdf</a>
            
            <input type="submit" onclick="printDiv('print')" class="btn btn-primary" value="Print Table">
            
  

                <script language="javascript">
                function printDiv(DivID) {
                var disp_setting="toolbar=yes,location=no,";
                disp_setting+="directories=yes,menubar=yes,";
                disp_setting+="scrollbars=yes,width=650, height=600, left=100, top=25";
                   var content_vlue = document.getElementById(DivID).innerHTML;
                   var docprint=window.open("","",disp_setting);
                   docprint.document.open();
                   docprint.document.write('<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"');
                   docprint.document.write('"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">');
                   docprint.document.write('<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">');
                   docprint.document.write('<head><title>Car Rental Management System</title>');
                   docprint.document.write('<style type="text/css">body{ margin:0px;');
                   docprint.document.write('font-family:verdana,Arial;color:#000;');
                   docprint.document.write('font-family:Verdana, Geneva, sans-serif; font-size:12px;}');
                   docprint.document.write('a{color:#000;text-decoration:none;} </style>');
                   docprint.document.write('</head><body onLoad="self.print()"><center>');
                   docprint.document.write(content_vlue);
                   docprint.document.write('</center></body></html>');
                   docprint.document.close();
                   docprint.focus();
                }
                </script>
            
            <br><br> <br><br>
            <div id="print" >   
            <h1>All Bike Rent Info</h1><br>
            
            
            <table class="table table-striped table-dark">
            <thead style="color:red;background: black;text-align: center;">
             <%
                try {
                    
                    List<BikeRent> users=new ArrayList<>();
                      if(request.getParameter("status").equals("pending")){  
                   
                     users = BikeRentDao.getAllPendingMembers();
                      }
                      else if(request.getParameter("status").equals("all")){
                       users = BikeRentDao.getAllMembers();
                      }
                      else if(request.getParameter("status").equals("BikeRentSearch")){
                       users = BikeRentDao.getMemberByRentId(request.getParameter("brent"));
                      }
                      else if(request.getParameter("status").equals("admin")){
                       users = BikeRentDao.getAllMembersByAdmin(session.getAttribute("uid").toString());
                      }
                      else if(request.getParameter("status").equals("View"))
                      {
                       users = BikeRentDao.getBikeDateMembers(request.getParameter("from").toString(),request.getParameter("to").toString());
                    
                      }
                    
            %>
            <th scope="col">Rent ID</th><th scope="col">User ID</th><th scope="col">Bike ID</th><th scope="col">Category</th>
            <th scope="col">TX ID</th><th scope="col">Advance</th><th scope="col">Request Time</th><th scope="col">Comments</th><th scope="col">Status</th><th scope="col">Admin</th><th colspan="3" style="text-align: center;">Action</th> 
            </thead>
           
            <tbody>
            <tr scope="row">
                <%
                     for (BikeRent us : users) {
                    
                    int id=us.getId();
                    String status=us.getStatus();  

                    //update status
//                     SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
//                     Date now = new Date();
//                     df.format(now); 
//                     
//                     Date t_from,t_to;
//                     t_from=df.parse(us.getFrom_date());
//                     t_to=df.parse(us.getTo_date());
//                     
//                     if((now.compareTo(t_from)>0) && (now.compareTo(t_to)<0) && (us.getStatus().equals("advanced"))){
//                     
//                       String sql="update bike_rent_tb set status='ongoing' where rent_id='"+us.getRent_id()+"' ";
//                       int st=BikeRentDao.updateBikeRentDetails(sql);
//                       if(st>0){
//                       
//                       }
//                     }
//                        if((now.compareTo(t_to)>0)){
//                     
//                       String sql2="update bike_rent_tb set status='expired' where rent_id='"+us.getRent_id()+"' ";
//                       int st2=BikeRentDao.updateBikeRentDetails(sql2);
//                       if(st2>0){
//                       
//                       }
//                     }
                   

                    %>
                
                
                 <td><a href="user_bike_rent_view.jsp?rent_id=<%=us.getRent_id()%>"> <%=us.getRent_id()%> </a></td>
                 <td><a href="user_info_view.jsp?uid=<%=us.getUid()%>"> <%=us.getUid()%> </a></td>
                 <td><a href="bike_info_view.jsp?bike_id=<%=us.getBike_id()%>"> <%=us.getBike_id()%> </a></td>
                 <td><%=us.getCategory()%></td>
                 <td><%=us.getTx_id()%></td>
                 <td><%=us.getAdvance()%></td>
                 <td><%=us.getRequest_time()%></td>
                 <td><%=us.getComments()%></td>
                 <td><%=status%></td>
                <td><%=us.getConfirmed_by()%></td>
                <td><a href="updateBikeRent.jsp?id=<%=id%>" class="btn btn-primary">Update</a></td>
                
                <td><a href="deleteBikeRent?id=<%=id%>" class="btn btn-warning"  >Settle</a></td>
                <td><a href="bikeRentPdf?id=<%=id%>" class="btn btn-danger">PDF</a></td>
            
             </tr>
           
       <% 
        }
        
             } catch (Exception e) {
                        out.println("Problem is: "+e);
                    }
        %>
        
         </tbody>
        </table>
       
        
</div>
        <br><br><br>
     
</div>   

<jsp:include page="adminFooter.jsp"/>