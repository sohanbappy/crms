

<%@page import="dao.UserDao"%>
<%@page import="models.User"%>
<%@ page import="java.sql.*" %>

<%
    try{
    
    
    String sql="";
    
    String uid=request.getParameter("uid").trim();
    String pass=request.getParameter("pass").trim();
    String type=request.getParameter("type");
    
    String answer=request.getParameter("answer");
    
    String branch=request.getParameter("branch");
    
    Class.forName("com.mysql.jdbc.Driver");
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/crms","root","");
    
    if(type.equals("user")){
     sql="Select * From user_tb Where uid='"+uid+"' AND pass='"+pass+"' AND status='Accepted' ";
     Statement st=con.createStatement();
    ResultSet rs=st.executeQuery(sql);
    
    if(rs.next())
    {
        int id=rs.getInt(1);
                
        
        //get Info
      User us= UserDao.getUserById(id);
       
        //session variable
     session.setAttribute("id", us.getId());   
     session.setAttribute("uid", us.getUid());
     session.setAttribute("name",us.getName());
     session.setAttribute("type",type);
     
     response.sendRedirect("userDash.jsp");
     
    out.println("Logged In!! Welcome User");
    }
    else{
    response.sendRedirect("loginFailed.jsp");
      }
    }
    else if(type.equals("admin")){
    sql="Select * From branch_tb Where uname='"+uid+"' And pass='"+pass+"' and br_id='"+branch+"' ";
    Statement st=con.createStatement();
    ResultSet rs=st.executeQuery(sql);
    
    if(rs.next())
    {
     
     session.setAttribute("type",type);
     session.setAttribute("uid",uid);
     
     response.sendRedirect("adminDashboard.jsp");
     
    }
    else{
    
    response.sendRedirect("loginFailed.jsp");
       }
    }
    
//     else if(type.equals("super") && answer.equalsIgnoreCase("iubat")){
//         
//    sql="Select * From admin_tb Where uid='"+uid+"' And password='"+pass+"' ";
//    Statement st=con.createStatement();
//    ResultSet rs=st.executeQuery(sql);
//    
//    if(rs.next())
//    {
//     
//     session.setAttribute("type",type);
//     session.setAttribute("uid",uid);
//     
//     response.sendRedirect("adminDashboard.jsp");
//     
//    }
//    
//    //Default
//    else if(uid.equals("root") && pass.equals("12345")){
//          session.setAttribute("type",type);
//     session.setAttribute("uid",uid);
//    response.sendRedirect("adminDashboard.jsp");
//    
//    }
//    
//    else{
//    
//    response.sendRedirect("loginFailed.jsp");
//       }
//    }
//    
    else{
    
      response.sendRedirect("loginFailed.jsp");
    
    }
  }
    catch(Exception ex){
    
        out.print("something went wrong!! Check the Server <a href='login.jsp?success=0'> Back to Login</a> ");
    }
    
%>
