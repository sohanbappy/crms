/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package helpers.training;

import dao.BikeInfoDao;
import dao.TrainingInfoDao;
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
@WebServlet(name = "deleteTrainingInfo", urlPatterns = {"/deleteTrainingInfo"})
public class deleteTrainingInfo extends HttpServlet {

   @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
            int id=Integer.parseInt(request.getParameter("id"));
        
            
            //delete
            TrainingInfoDao.deleteTrainingInfo(id);
       response.sendRedirect("viewTrainingInfo.jsp?filter=all");
    }
}
