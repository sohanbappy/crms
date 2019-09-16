<jsp:include page="landing_header.jsp" />


    <body>
<!--      Information is not Correct!!!!!<br><br>
      Plz Try Again <a href="login.jsp?success=0">Click Here</a>-->
      
<%
   session.setAttribute("checkLogin", "fail");
   response.sendRedirect("login.jsp?success=0");
 %>   
    </body>
    
    <jsp:include page="landing_footer.jsp" />

