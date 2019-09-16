/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package helpers.car;

import dao.CarInfoDao;
import dao.UserDao;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Baappy
 */
@WebServlet("/deleteCarInfo")
public class deleteCarInfo extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
            int id=Integer.parseInt(request.getParameter("id"));
        
            //delete
            CarInfoDao.deleteCarInfo(id);
            
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Manage Car Info</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Car info Deleted successfully!!!!!!!!</h1>");
            out.println("</body>");
            out.println("</html>");
       response.sendRedirect("viewCarInfo.jsp?filter=all");
    }

}
