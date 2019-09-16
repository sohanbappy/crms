<% if((session.getAttribute("type")==null) || session.getAttribute("type").equals("user") )
        {
        response.sendRedirect("index.jsp");
        }
%>

<%@page import="java.util.ArrayList"%>
<%@page import="models.TrainingInfo"%>
<%@page import="dao.TrainingInfoDao"%>
<%@page import="dao.TrainingInfoDao"%>
<%@page import="dao.CarInfoDao"%>
<%@page import="models.CarInfo"%>
<jsp:include page="adminHeader.jsp"/>

<%@page import="models.User"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="dao.UserDao" %>
<%@page import="helpers.user.*" %>

        <br><br>
         <div class="navbar-collapse collapse" >
        <a href="viewTrainingInfo.jsp?filter=all"  class="btn btn-primary" style="margin-left: 20px;">ALL</a>
        <a href="viewTrainingInfo.jsp?filter=available" class="btn btn-warning" style=""> Available</a>
        <a href="training_info_form.jsp" class="btn btn-success" style="margin-left: 20px;"> Add New</a>
        
        <form class='navbar-form' method="GET" action="" style="">
                    
                      <div class="form-group">
                          <input type="text" name="trKey" class="form-control" id="homeSearch" placeholder="enter training id no.....">
                      </div>
                    <button type="submit" name="filter" value="TrInfoSearch"  class="btn btn-danger">Search</button>
                  </form> 
         </div>
        
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
        
        <br><br><br>
        <div id="print">
        <h1>Training Info</h1>
    
        <table class="table" >
            <thead class="thread-dark" style="color:red;background: black;text-align: center;">
            <th>TR. ID</th>
            <th>Training Name</th>
            <th>Duration</th>
            <th>Seats</th>
            <th>Start Date</th>
            <th>Cost</th>
            <th>Trainer</th>
            <th>Type</th>
            <th>Status</th>
            <th colspan="2">Action</th> 
        </thead>
            <%
                try {
                        
                   
                List<TrainingInfo> users = new ArrayList<>();

                if(request.getParameter("filter").equals("all")){  
                     users = TrainingInfoDao.getAllMembers();
                    
                      }
                      else if(request.getParameter("filter").equals("available")){
                        users = TrainingInfoDao.getAllAvailableMembers();
                      }
                      else if(request.getParameter("filter").equals("TrInfoSearch")){
                         users = TrainingInfoDao.getMemberByTrId(request.getParameter("trKey"));
                      }
                
                
                for (TrainingInfo c : users) {
                    
                    int id=c.getId();
                    
                    String car_id=c.getTr_id();
                    String car_model=c.getTr_name();
                    String c_lic_no=c.getDuration();
                    String c_eng_no=c.getSeats();
                    String pic_name=c.getStart_date();
                    String rent_type=c.getCost();
                    String category=c.getTrainer();
                    String p_day=c.getType();
                    String status=c.getStatus();
                    
                    
            %>
            
            <tr>
                <td><%=car_id%></td>
                <td><%=car_model%></td>
                <td><%=c_lic_no%></td>
                <td><%=c_eng_no%></td>
                <td><%=pic_name%></td>
                <td><%=rent_type%></td>
                <td><%=category%></td>
                <td><%=p_day%></td>
                <td><%=status%></td>
                
                <td><a href="updateTrainingInfo.jsp?id=<%=id%>" class="btn btn-primary">Update</a></td>
<!--                <td><a href="deleteTrainingInfo?id=<%=id%>" class="btn btn-danger">Delete</a></td>-->
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