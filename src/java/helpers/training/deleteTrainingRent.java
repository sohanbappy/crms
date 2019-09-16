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

/**
 *
 * @author Bappy
 */
@WebServlet(name = "deleteTrainingRent", urlPatterns = {"/deleteTrainingRent"})
public class deleteTrainingRent extends HttpServlet {

   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
            int id=Integer.parseInt(request.getParameter("id"));
        
            
            //delete
            TrainingRentDao.deleteTrainingRent(id);
           
       response.sendRedirect("viewTrainingRent.jsp?status=pending");
    }
}
