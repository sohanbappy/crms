/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package helpers.car;

import dao.CarInfoDao;
import dao.CarRentDao;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import models.CarInfo;
import models.CarRent;

/**
 *
 * @author Bappy
 */
@WebServlet(name = "addCarRent", urlPatterns = {"/addCarRent"})
public class addCarRent extends HttpServlet {

          public static final String SAVE_DIR = "images";
       
    
   
        
        
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        

                
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
            
        
          String hr_date="",hr_from="",hr_to="",day_from="",day_to="";
          
        
        
            String rent_id=request.getParameter("rent_id");
            String car_id=request.getParameter("car_id");
            String car_lic_no=request.getParameter("car_lic_no");
            String uid=request.getParameter("uid");
            String category=request.getParameter("category");
            String rent_type=request.getParameter("rent_type");
            String pick_point=request.getParameter("pick_point");
            String drop_point=request.getParameter("drop_point");
            
            if(rent_type.equals("per_hour")){
            hr_date=request.getParameter("hr_date");
            hr_from=request.getParameter("hr_from");
            hr_to=request.getParameter("hr_to");
            }
            if(rent_type.equals("per_day")){
            day_from=request.getParameter("day_from");
            day_to=request.getParameter("day_to");
            }
            
            String tx_id=request.getParameter("tx_id");
            String total=request.getParameter("total");
            String advance=request.getParameter("advance");
            String due=request.getParameter("due");
            
            
                                CarRent c=new CarRent();
            
                                c.setRent_id(rent_id);
				c.setCar_id(car_id);
                                c.setCar_lic_no(car_lic_no);
                                c.setUid(uid);
                                c.setCategory(category);
                                c.setRent_type(rent_type);
                                c.setPick_point(pick_point);
                                c.setDrop_point(drop_point);
                                c.setHr_date(hr_date);
                                c.setHr_from(hr_from);
                                c.setHr_to(hr_to);
                                c.setDay_from(day_from);
                                c.setDay_to(day_to);
                                c.setTx_id(tx_id);
                                c.setTotal(total);
                                c.setAdvance(advance);
                                c.setDue(due);
           
            CarRentDao.saveCarRent(c);
             
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Manage Car Rent</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Car Rent saved successfully!!!!!!!!</h1>");
            out.println("</body>");
            out.println("</html>");
            
            response.sendRedirect("userDash.jsp"); 
        
             
          }
    
    
}
