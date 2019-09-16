
<% if((session.getAttribute("type")==null) || session.getAttribute("type").equals("user") )
        {
        response.sendRedirect("index.jsp");
        }
%>


<%@page import="java.util.ArrayList"%>
<%@page import="dao.CarInfoDao"%>
<%@page import="dao.CarInfoDao"%>
<%@page import="models.TrainingInfo"%>
<%@page import="dao.TrainingInfoDao"%>
<%@page import="models.TrainingRent"%>
<%@page import="dao.TrainingRentDao"%>
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



     <% 
            int gTotal= TrainingRentDao.TrainingTotal();
            int gAdvance= TrainingRentDao.TrainingAdvance();
            int gDue= TrainingRentDao.TrainingDue();
            int pReq=TrainingRentDao.countRentPending();
        
        
        %>
        <br><br>
        <a href="viewTrainingRent.jsp?status=all"  class="btn btn-primary">ALL</a>
        <a href="viewTrainingRent.jsp?status=pending" class="btn btn-warning" > PENDING</a>
        
        <label style="padding-left: 30px; font-size: 30px;">Total : </label> &nbsp; <span style="font-size: 30px; color: red;"> <b><%=gTotal%> </b></span> &nbsp;&nbsp;&nbsp;&nbsp;
          <label style="font-size: 30px;">Advance : </label> &nbsp; <span style="font-size: 30px; color: red;"> <b><%=gAdvance%> </b></span> &nbsp;&nbsp;&nbsp;&nbsp;
              <label style="font-size: 30px;">Due : </label> &nbsp; <span style="font-size: 30px; color: red;"> <b><%=gDue%> </b></span> &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 
                <label style="font-size: 30px;">Pending Requests : </label> &nbsp; <span style="font-size: 30px; color: red;"> <b><%=pReq%> </b></span> &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 
           
                <a href="viewTrainingRent.jsp?status=admin" class="btn btn-warning" > By <%=session.getAttribute("uid")%></a> 
                
                <form method="GET" action=""><br>
                    <label style="">From : </label> <input type="date" name="from" id="f_date" onchange="checkDate()" />
                    <label style="padding-left: 10px">To : </label> <input type="date" name="to" id="t_date" onchange="checkDate()"  />
                    <input type="submit" name="status" value="View" class="btn btn-primary"  /></form>
        
             <form class='navbar-form' method="GET" action="" style="">
                    
                      <div class="form-group">
                          <input type="text" name="trent" class="form-control" id="homeSearch" placeholder="enter rent id no.....">
                      </div>
                    <button type="submit" name="status" value="TrRentSearch"  class="btn btn-danger">Search</button>
                  </form> 
            <a href="allTrainingRentPdf" class="btn btn-warning" > All Pdf</a>
            
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
            <div id="print">
        <h1>All Training Enrollment Info</h1>
    
        <table class="table" >
            <thead  style="color:red;background: black;">
                
            <th>Rent ID</th><th>User ID</th><th>Training ID</th>
            <th>TX ID</th><th>Total</th><th>Advance</th><th>Due</th><th>Request Time</th><th>Comments</th><th>Status</th><th>Admin</th><th colspan="3" style="text-align: center;">Action</th> 
        
          </thead>
          
             <%
                try {
                        
                   
                List<TrainingRent> users = new ArrayList<>();
                
                if(request.getParameter("status").equals("pending")){  
                   
                     users = TrainingRentDao.getAllPendingMembers();
                      }
                      else if(request.getParameter("status").equals("all")){
                       users = TrainingRentDao.getAllMembers();
                      }
                       else if(request.getParameter("status").equals("TrRentSearch")){
                       users = TrainingRentDao.getMemberByRentId(request.getParameter("trent"));
                      }
                        else if(request.getParameter("status").equals("admin")){
                       users = TrainingRentDao.getAllMembersByAdmin(session.getAttribute("uid").toString());
                      }
                      else if(request.getParameter("status").equals("View"))
                      {
                       users = TrainingRentDao.getTrDateMembers(request.getParameter("from").toString(),request.getParameter("to").toString());
                    
                      }
                

                for (TrainingRent us : users) {
                    
                    int id=us.getId();
                    String status=us.getStatus();    
                    
                   
                    TrainingInfo tr=TrainingInfoDao.getTrainingInfoByTrId(us.getTr_id());
                    int tid=tr.getId();
                    
            %>
            
           
          <tbody>
            <tr>
                
                <td><%=us.getRent_id()%></td>
                 <td><a href="user_info_view.jsp?uid=<%=us.getUid()%>" ><%=us.getUid()%></a></td>
                 <td><a href="training_info_view.jsp?id=<%=tid%>" ><%=us.getTr_id()%></a></td>
                 <td><%=us.getTx_id()%></td>
                 <td><%=us.getTotal()%></td>
                 <td><%=us.getAdvance()%></td>
                 <td><%=us.getDue()%></td>
                 <td><%=us.getRequest_time()%></td>
                 <td><%=us.getComments()%></td>
                 <td><%=status%></td>
                 <td><%=us.getConfirmed_by()%></td>
                <td><a href="updateTrainingRent.jsp?id=<%=id%>" class="btn btn-primary">Update</a></td>
                
                <td><a href="deleteTrainingRent?id=<%=id%>" class="btn btn-warning">Settle</a></td>
                
                <td><a href="trainingRentPdf?id=<%=id%>" class="btn btn-danger">PDF</a></td>
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
     
       

<jsp:include page="adminFooter.jsp"/>