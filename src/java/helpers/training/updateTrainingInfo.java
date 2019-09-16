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
import javax.servlet.http.HttpSession;

/**
 *
 * @author Bappy
 */
@WebServlet(name = "updateTrainingInfo", urlPatterns = {"/updateTrainingInfo"})
public class updateTrainingInfo extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
         
            HttpSession session = request.getSession();
            
           
            int id=Integer.parseInt(session.getAttribute("id").toString());
             
            String tr_name=request.getParameter("tr_name");
            String duration=request.getParameter("duration");
            String seats=request.getParameter("seats");
            String start_date=request.getParameter("start_date");
            String cost=request.getParameter("cost");
            String trainer=request.getParameter("trainer");
            String status=request.getParameter("status");
         
           
            
           String sql="update training_info_tb set tr_name='"+tr_name+"',duration='"+duration+"',seats='"+seats+"',start_date='"+start_date+"',cost='"+cost+"',trainer='"+trainer+"',status='"+status+"' where id='"+id+"' ";
             
             int st=TrainingInfoDao.updateTrainingInfo(sql);
             if(st > 0 ){
             
             response.sendRedirect("viewTrainingInfo.jsp?filter=all");
             }
             else{
                 out.print("Not Updated!!!!!!!");
             }
       
          
    }
}
