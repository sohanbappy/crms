<% if((session.getAttribute("type")==null) || session.getAttribute("type").equals("user") )
        {
        response.sendRedirect("index.jsp");
        }
%>

<%@page import="java.util.ArrayList"%>
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
        <a href="viewCarInfo.jsp?filter=all"  class="btn btn-primary" style="margin-left: 20px;">ALL</a>
        <a href="viewCarInfo.jsp?filter=garaged" class="btn btn-warning" style=""> Garaged</a>
        <a href="car_info_form.jsp" class="btn btn-success" style="margin-left: 20px;"> Add New</a>
        
        <form class='navbar-form' method="GET" action="" style="">
                    
                      <div class="form-group">
                          <input type="text" name="carKey" class="form-control" id="homeSearch" placeholder="enter car id no.....">
                      </div>
                    <button type="submit" name="filter" value="CarInfoSearch"  class="btn btn-danger">Search</button>
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
        <h1>Car Info</h1>
    
        <table class="table" >
            <thead class="thread-dark" style="color:red;background: black;text-align: center;">
            <th>Car ID</th>
            <th>Car License No</th>
            <th>Rent Type</th>
            <th>Category</th>
            <th>Picture</th>
            <th>Status</th>
            <th colspan="2">Action</th> 
        </thead>
            <%
                try {
                        
              List<CarInfo> users = new ArrayList<>();
                
                
                     if(request.getParameter("filter").equals("all")){  
                     users = CarInfoDao.getAllMembers();
                    
                      }
                      else if(request.getParameter("filter").equals("garaged")){
                        users = CarInfoDao.getAllGaragedMembers();
                      }
                      else if(request.getParameter("filter").equals("CarInfoSearch")){
                         users = CarInfoDao.getMemberByCarId(request.getParameter("carKey"));
                      }

                for (CarInfo c : users) {
                    
                    int id=c.getId();
                    
                    String car_id=c.getCar_id();
                    String c_lic_no=c.getC_lic_no();
                    String pic_name=c.getPic_name();
                    String rent_type=c.getRent_type();
                    String category=c.getCategory();
                    String status=c.getStatus();
                    
                    
            %>
            
            <tr>
                <td><a href="car_info_view.jsp?id=<%=id%>" > <%=car_id%></a></td>
                <td><%=c_lic_no%></td>
                <td><%=rent_type%></td>
                <td><%=category%></td>
                <td><img src="images/<%=pic_name%>" height="100" width="80"/></td>
                <td><%=status%></td>
                
                <td><a href="updateCarInfo.jsp?id=<%=id%>" class="btn btn-primary">Update</a></td>
<!--                <td><a href="deleteCarInfo?id=<%=id%>" class="btn btn-danger">Delete</a></td>-->
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