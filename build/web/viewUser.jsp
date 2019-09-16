
<% if((session.getAttribute("type")==null) || session.getAttribute("type").equals("user") )
        {
        response.sendRedirect("index.jsp");
        }
%>


<jsp:include page="adminHeader.jsp"/>

<%@page import="models.User"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="dao.UserDao" %>
<%@page import="helpers.user.*" %>

        <br><br>
         <div class="navbar-collapse collapse" >
        <a href="viewUser.jsp?filter=all"  class="btn btn-primary" style="margin-left: 20px;">ALL</a>
        <a href="viewUser.jsp?filter=pending" class="btn btn-warning" style=""> PENDING</a>
        <form class='navbar-form' method="GET" action="" style="">
                    <div class="form-group">
                          <input type="text" name="userKey" class="form-control" id="homeSearch" placeholder="enter user id no.....">
                      </div>
                    <button type="submit" name="filter" value="UserSearch"  class="btn btn-danger">Search</button>
                  </form> 
        
         </div>
        
        <input type="submit" onclick="printDiv('print')" class="btn btn-primary" value="Print Div">
            
  

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
        
        <br>
        
        <div id="print">
        <h1>User Info</h1>
    
        <table class="table" >
            <thead class="thread-dark" style="color:red;background: black;text-align: center;"><th>Name</th><th>Phone</th><th>Mail</th><th>User ID</th><th>Status</th><th colspan="2">Action</th> </thead>
            <%
                try {
                        
                   
                List<User> users = UserDao.getAllMembers();
                
                
                     if(request.getParameter("filter").equals("all")){  
                     users = UserDao.getAllMembers();
                    
                      }
                      else if(request.getParameter("filter").equals("pending")){
                        users = UserDao.getAllPendingMembers();
                      }
                      else if(request.getParameter("filter").equals("UserSearch")){
                         users = UserDao.getMemberByUid(request.getParameter("userKey"));
                      }

                for (User us : users) {
                    
                    int id=us.getId();
                    String name=us.getName();
                    String phone=us.getPhone();
                    String mail=us.getMail();
                    String address=us.getAddress();
                    String nat=us.getNat();
                    String nid_no=us.getNid_no();
                    String passport_no=us.getPassport_no();
                    String pic_name=us.getPic_name();
                    String uid=us.getUid();
                    String status=us.getStatus();
                    
                    
                    
            %>
            
            <tr>
                
                
                <td><%=name%></td>
                <td><%=phone%></td>
                <td><%=mail%></td>
<!--                <td><%=address%></td>
                <td><%=nat%></td>
                <td><%=nid_no%></td>
                <td><%=passport_no%></td>-->
                
                <td><a href="user_info_view.jsp?uid=<%=uid%>"> <%=uid%> </a></td>
<!--                <td><img src="images/<%=pic_name%>" height="100" width="80"/></td>-->
                <td><%=status%></td>
                <td><a href="updateUser.jsp?id=<%=id%>" class="btn btn-primary">Update</a></td>
                <td><a href="deleteUser?id=<%=id%>" class="btn btn-danger">Delete</a></td>
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
      
<!--        <a href="user_form.jsp">Click to Add New Info</a><br><br><br>-->
       
<!--	<script>
	function printDetails(d){
	var restorpage=document.body.innerHTML;
	var printDiv=document.getElementById(d).innerHTML;
	document.body.innerHTML=printDiv;
	window.print();
	document.body.innerHTML=restorpage;
	}
	</script>-->
        
<jsp:include page="adminFooter.jsp"/>