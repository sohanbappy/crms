    <%
    session.setAttribute("uid", null);
    session.invalidate();
    
    response.sendRedirect("login.jsp?success=0");
    %>