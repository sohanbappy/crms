/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package helpers.car;

import dao.CarInfoDao;
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
 * @author Baappy
 */
@WebServlet("/updateCarInfo")
public class updateCarInfo extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
         
            HttpSession session = request.getSession();
            
            //getting name & path
             String p_name=session.getAttribute("pic_name").toString();
             String image_path=session.getAttribute("image_path").toString();
             int id=Integer.parseInt(session.getAttribute("id").toString());
             
             String p_day,p_hr;
        
             if(request.getParameter("p_day")==null)
            {
            p_day="";
            }
            else{
            p_day=request.getParameter("p_day");
            }
            if(request.getParameter("p_hr")==null)
            {
            p_hr="";
            }
            else{
            p_hr=request.getParameter("p_hr");
            }
            
            String status=request.getParameter("status");

//            
           
            
            String sql="update car_info_tb set p_day='"+p_day+"',p_hr='"+p_hr+"',status='"+status+"' where id='"+id+"' ";
             
             int st=CarInfoDao.updateCarInfo(sql);
             if(st > 0 ){
             
             response.sendRedirect("viewCarInfo.jsp?filter=all");
             }
             else{
                 out.print("Not Updated!!!!!!!");
             }
       
          
    }

}
