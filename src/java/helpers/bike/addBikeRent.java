/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package helpers.bike;

import dao.BikeRentDao;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.BikeRent;

/**
 *
 * @author Bappy
 */
@WebServlet(name = "addBikeRent", urlPatterns = {"/addBikeRent"})
public class addBikeRent extends HttpServlet {

       
        
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        

                
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
            
        
        
            String rent_id=request.getParameter("rent_id");
            String uid=request.getParameter("uid");
            String u_lic_no=request.getParameter("u_lic_no");
            String g_nid=request.getParameter("g_nid");
            String bike_id=request.getParameter("bike_id");
            String b_lic_no=request.getParameter("b_lic_no");
            String category=request.getParameter("category");
            
            
            String from_date=request.getParameter("from_date");
            String to_date=request.getParameter("to_date");
            String pick_point=request.getParameter("pick_point");
            String drop_point=request.getParameter("drop_point");
            
            String tx_id=request.getParameter("tx_id");
            String total=request.getParameter("total");
            String advance=request.getParameter("advance");
            String due=request.getParameter("due");
            
            
                                BikeRent c=new BikeRent();
            
                                c.setRent_id(rent_id);
                                c.setUid(uid);
                                c.setU_lic_no(u_lic_no);
                                c.setG_nid(g_nid);
				c.setBike_id(bike_id);
                                c.setB_lic_no(b_lic_no);
                                c.setCategory(category);
                                c.setFrom_date(from_date);
                                c.setTo_date(to_date);
                                c.setPick_point(pick_point);
                                c.setDrop_point(drop_point);
                                c.setTx_id(tx_id);
                                c.setTotal(total);
                                c.setAdvance(advance);
                                c.setDue(due);
           
          
                                
            BikeRentDao.saveBikeRent(c);
             
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Manage Bike Rent</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Bike Rent saved successfully!!!!!!!!</h1>");
            out.println("</body>");
            out.println("</html>");
            
            response.sendRedirect("userDash.jsp"); 
        
             
          }
    
    
}
