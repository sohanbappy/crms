/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package helpers.training;

import dao.BikeRentDao;
import dao.TrainingRentDao;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.BikeRent;
import models.TrainingRent;

/**
 *
 * @author Bappy
 */
@WebServlet(name = "addTrainingRent", urlPatterns = {"/addTrainingRent"})
public class addTrainingRent extends HttpServlet {

         
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        

                
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
            
        
        
            String rent_id=request.getParameter("rent_id");
            String uid=request.getParameter("uid");
            String tr_id=request.getParameter("tr_id");
            String tx_id=request.getParameter("tx_id");
            String total=request.getParameter("total");
            String advance=request.getParameter("advance");
            String due=request.getParameter("due");
            

            TrainingRent c=new TrainingRent();

            c.setRent_id(rent_id);
            c.setUid(uid);
            c.setTr_id(tr_id);
            c.setTx_id(tx_id);
            c.setTotal(total);
            c.setAdvance(advance);
            c.setDue(due);
                       
            TrainingRentDao.saveTrainingRent(c);
            
            response.sendRedirect("userDash.jsp"); 
        
             
          }
    
}
