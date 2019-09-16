/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package helpers.car;

import dao.CarRentDao;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Bappy
 */
@WebServlet(name = "updateCarRent", urlPatterns = {"/updateCarRent"})
public class updateCarRent extends HttpServlet {
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
         
            HttpSession session = request.getSession();
            
            String car_id="",comments="",status="",tx_id="",rent_id="",confirmed_by="";
            int id=Integer.parseInt(session.getAttribute("id").toString());
            //getting values
            
//             if(session.getAttribute("type").equals("admin")){
            car_id=request.getParameter("car_id");
            comments=request.getParameter("comments");
            status=request.getParameter("status");
//             }
//             else{
            tx_id=request.getParameter("tx_id");
            rent_id=request.getParameter("rent_id");
            confirmed_by=session.getAttribute("uid").toString();
            
//             }
//          

            int st=0,st1=0;
           
            String admin_sql="update car_rent_tb set comments='"+comments+"',status='"+status+"',confirmed_by='"+confirmed_by+"' where id='"+id+"' ";
            String user_sql="update car_rent_tb set tx_id='"+tx_id+"' where id='"+id+"' ";
            
          
            
             if(session.getAttribute("type").equals("admin")){ 
                 
             st=CarRentDao.updateCarRentDetails(admin_sql);
             }
             else if(session.getAttribute("type").equals("user")){
              st=CarRentDao.updateCarRentDetails(user_sql);
             }
             
             if(st > 0 ){
             if(session.getAttribute("type").equals("admin")){ 
             response.sendRedirect("viewCarRent.jsp?status=pending");
             }
             else{
             
             response.sendRedirect("userDash.jsp");
              }
             }
             else{
                 out.print("Not Updated!!!!!!!");
             }
       
          
    }
}
