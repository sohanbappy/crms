/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package helpers.training;

import dao.BikeInfoDao;
import dao.TrainingInfoDao;
import static helpers.bike.addBikeInfo.SAVE_DIR;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import models.BikeInfo;
import models.TrainingInfo;

/**
 *
 * @author Bappy
 */
@WebServlet(name = "addTrainingInfo", urlPatterns = {"/addTrainingInfo"})
public class addTrainingInfo extends HttpServlet {
        
        @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        

                
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
            
            
            String tr_id=request.getParameter("tr_id");
            String tr_name=request.getParameter("tr_name");
            String duration=request.getParameter("duration");
            String seats=request.getParameter("seats");
            String start_date=request.getParameter("start_date");
            String cost=request.getParameter("cost");
            String trainer=request.getParameter("trainer");
            String type=request.getParameter("type");
            String status=request.getParameter("status");
            
            
            TrainingInfo training=new TrainingInfo();
            
           training.setTr_id(tr_id);
           training.setTr_name(tr_name);
           training.setDuration(duration);
           training.setSeats(seats);
           training.setStart_date(start_date);
           training.setCost(cost);
           training.setTrainer(trainer);
           training.setType(type);
           training.setStatus(status);
           
            TrainingInfoDao.saveTrainingInfo(training);
            
            
            
            response.sendRedirect("viewTrainingInfo.jsp?filter=all"); 
        
             
          }
}
