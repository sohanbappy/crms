


<%@page import="dao.CarInfoDao"%>
<%@page import="models.CarInfo"%>
<%@page import="dao.UserDao"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%
    String sql="";
    
    try{
    String c_id=request.getParameter("c_id");
    String r_type=request.getParameter("rent_type");
     
    Class.forName("com.mysql.jdbc.Driver");
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/crms","root","");
    
  
     sql="Select * From car_info_tb Where car_id='"+c_id+"'  ";
     Statement st=con.createStatement();
     ResultSet rs=st.executeQuery(sql);
    
    if(rs.next())
    {
        int id=rs.getInt(1);
                
        //get Info
      CarInfo us= CarInfoDao.getCarInfoById(id);
      String car_id=us.getCar_id();
      String car_Pday=us.getP_day();
      String car_Phr=us.getP_hr();
     
        //session variable
     session.setAttribute("c_id", car_id);
    }
     if(r_type.equals("per_day")){
     
%>

      <div id="p_day"  >
        <label>Per Day</label><br>
        <input name="c_lic_no" type="text" class="form-control">
        
        <label>From Date</label><br>
        <input name="from_date" type="date" class="form-control">
       
        <label>To Date</label><br>
        <input name="from_date" type="date" class="form-control">
        </div>
        
    
<%
    }
else if(r_type.equals("per_hour")){


%>
       <div id="p_hr"  >
        <label>Per Hour</label><br>
        <input name="c_lic_no" type="text" class="form-control">
     
        <label>Date</label><br>
        <input name="from_date" type="date" class="form-control">

        <label>From </label><br>
        <input name="from_date" type="date" class="form-control">
        
        <label>To </label><br>
        <input name="from_date" type="date" class="form-control">
        </div>


<%
}
else{
  }
    }
 
catch(Exception e ){

  }
%>