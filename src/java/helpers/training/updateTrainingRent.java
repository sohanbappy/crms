/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package helpers.training;

import dao.BikeRentDao;
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
@WebServlet(name = "updateTrainingRent", urlPatterns = {"/updateTrainingRent"})
public class updateTrainingRent extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
         
            HttpSession session = request.getSession();
            
            String comments="",status="",tx_id="",confirmed_by="";
            
            int id=Integer.parseInt(session.getAttribute("id").toString());
            //getting values

            String tr_id=request.getParameter("tr_id");
            String rent_id=request.getParameter("rent_id");
            
            comments=request.getParameter("comments");
            status=request.getParameter("status");
            tx_id=request.getParameter("tx_id");
            confirmed_by=session.getAttribute("uid").toString();
        

            int st=0;
           
            String admin_sql="update training_rent_tb set comments='"+comments+"',status='"+status+"',confirmed_by='"+confirmed_by+"' where id='"+id+"' ";
            String user_sql="update training_rent_tb set tx_id='"+tx_id+"' where id='"+id+"' ";
         
            
             if(session.getAttribute("type").equals("admin")){ 
                 
             st=BikeRentDao.updateBikeRentDetails(admin_sql);
             }
             else if(session.getAttribute("type").equals("user")){
              st=BikeRentDao.updateBikeRentDetails(user_sql);
             }
             
             if(st > 0 ){
             if(session.getAttribute("type").equals("admin")){ 
             response.sendRedirect("viewTrainingRent.jsp?status=pending");
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
