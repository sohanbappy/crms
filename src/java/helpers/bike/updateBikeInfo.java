/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package helpers.bike;

import dao.BikeInfoDao;
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
@WebServlet(name = "updateBikeInfo", urlPatterns = {"/updateBikeInfo"})
public class updateBikeInfo extends HttpServlet {

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
             
             String p_day=request.getParameter("p_day");
             String status=request.getParameter("status");

//            
           
            
            String sql="update bike_info_tb set p_day='"+p_day+"',status='"+status+"' where id='"+id+"' ";
             
             int st=BikeInfoDao.updateBikeInfo(sql);
             if(st > 0 ){
             
             response.sendRedirect("viewBikeInfo.jsp?filter=all");
             }
             else{
                 out.print("Not Updated!!!!!!!");
             }
       
          
    }

}
