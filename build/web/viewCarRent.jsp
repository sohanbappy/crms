<% if((session.getAttribute("type")==null) || session.getAttribute("type").equals("user") )
        {
        response.sendRedirect("index.jsp");
        }
%>

<%@page import="java.util.ArrayList"%>
<%@page import="models.CarInfo"%>
<%@page import="dao.CarInfoDao"%>
<%@page import="dao.CarRentDao"%>
<%@page import="models.CarRent"%>
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


        <% 
            int gTotal= CarRentDao.CarTotal();
            int gAdvance= CarRentDao.CarAdvance();
            int gDue= CarRentDao.CarDue();
            int pReq=CarRentDao.countRentPending();
        
        
        %>

    <br><br>
        <a href="viewCarRent.jsp?status=all"  class="btn btn-primary">ALL</a>
        <a href="viewCarRent.jsp?status=pending" class="btn btn-warning" > PENDING</a>
        
        <label style="padding-left: 30px; font-size: 30px;">Total : </label> &nbsp; <span style="font-size: 30px; color: red;"> <b><%=gTotal%> </b></span> &nbsp;&nbsp;&nbsp;&nbsp;
          <label style="font-size: 30px;">Advance : </label> &nbsp; <span style="font-size: 30px; color: red;"> <b><%=gAdvance%> </b></span> &nbsp;&nbsp;&nbsp;&nbsp;
              <label style="font-size: 30px;">Due : </label> &nbsp; <span style="font-size: 30px; color: red;"> <b><%=gDue%> </b></span> &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 
            <label style="font-size: 30px;">Pending Requests : </label> &nbsp; <span style="font-size: 30px; color: red;"> <b><%=pReq%> </b></span> &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 
              
            <a href="viewCarRent.jsp?status=admin" class="btn btn-warning" > By <%=session.getAttribute("uid")%></a>
              
              
            
              <form method="GET" action=""><br>
             <label style="">From : </label> <input type="date" name="from" id="f_date" onchange="checkDate()"  />
            <label style="padding-left: 10px">To : </label> <input type="date" name="to" id="t_date" onchange="checkDate()"  />
            <input type="submit" name="status" value="View" class="btn btn-primary"  /></form>
        
            <form class='navbar-form' method="GET" action="" style="">
                    
                      <div class="form-group">
                          <input type="text" name="crent" class="form-control" id="homeSearch" placeholder="enter rent id no.....">
                      </div>
                    <button type="submit" name="status" value="CarRentSearch"  class="btn btn-danger">Search</button>
                  </form> 
            
            <a href="allCarRentPdf" class="btn btn-warning" > All Pdf</a>
            
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
        <h1>All Car Rent Info</h1>
    
       
        
        <table class="table" >
            <thead class="thread-dark" style="color:red;background: black;text-align: center;">
            
            <th>Rent ID</th><th>Car ID</th><th>User ID</th><th>Rent Type</th>
            <th>TX ID</th><th>Advance</th><th>Request Time</th><th>Comments</th><th>Status</th><th>Admin</th><th colspan="3" style="text-align: center;">Action</th> </thead>
            <%
                try {
                        
                   
                List<CarRent> users = new ArrayList<>();
                
                if(request.getParameter("status").equals("pending")){  
                   
                     users = CarRentDao.getAllPendingMembers();
                      }
                      else if(request.getParameter("status").equals("all")){
                       users = CarRentDao.getAllMembers();
                      }
                       else if(request.getParameter("status").equals("CarRentSearch")){
                       users = CarRentDao.getMemberByRentId(request.getParameter("crent"));
                      }
                        else if(request.getParameter("status").equals("admin")){
                       users = CarRentDao.getAllMembersByAdmin(session.getAttribute("uid").toString());
                      }
                      else if(request.getParameter("status").equals("View"))
                      {
                       users = CarRentDao.getCarDateMembers(request.getParameter("from").toString(),request.getParameter("to").toString());
                    
                      }
                
                

                for (CarRent us : users) {
                    
                    int id=us.getId();
                    String status=us.getStatus();
                    
                    CarInfo car=CarInfoDao.getCarInfoByCarId(us.getCar_id());
                    int cid=car.getId();
                    
            %>
            
            <tr>
                
                
                
                 <td><a href="user_car_rent_view.jsp?rent_id=<%=us.getRent_id()%>" ><%=us.getRent_id()%></a></td>
                 <td><a href="car_info_view.jsp?id=<%=cid%>" ><%=us.getCar_id()%></a></td>
                 <td><a href="user_info_view.jsp?uid=<%=us.getUid()%>" ><%=us.getUid()%></a></td>
                 <td><%=us.getRent_type()%></td>
                 <td><%=us.getTx_id()%></td>
                 <td><%=us.getAdvance()%></td>
                 <td><%=us.getRequest_time()%></td>
                 <td><%=us.getComments()%></td>
                 <td><%=status%></td>
                <td><%=us.getConfirmed_by()%></td>
                <td><a href="updateCarRent.jsp?id=<%=id%>" class="btn btn-primary">Update</a></td>
                
                <td><a href="deleteCarRent?id=<%=id%>" class="btn btn-warning">Settle</a></td>
                
                <td><a href="carRentPdf?id=<%=id%>" class="btn btn-danger">PDF</a></td>
            </tr>
           
       <% 
        }
        
             } catch (Exception e) {
                        out.println("Problem is: "+e);
                    }
        %>
        </table>
       
            </div>
        <br><br><br>
     
       

<jsp:include page="adminFooter.jsp"/>