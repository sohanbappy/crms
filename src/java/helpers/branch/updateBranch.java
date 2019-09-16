/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package helpers.branch;

import dao.BranchDao;
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
@WebServlet(name = "updateBranch", urlPatterns = {"/updateBranch"})
public class updateBranch extends HttpServlet {

  
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
         
            HttpSession session = request.getSession();
            
           
            int id=Integer.parseInt(session.getAttribute("id").toString());
             
          
            String name=request.getParameter("name");
            String location=request.getParameter("location");
            String admin_name=request.getParameter("admin_name");
            String uname=request.getParameter("uname").trim();
            String pass=request.getParameter("pass").trim();
            String status=request.getParameter("status");
         
           
            
           String sql="update branch_tb set name='"+name+"',location='"+location+"',admin_name='"+admin_name+"',uname='"+uname+"',pass='"+pass+"',status='"+status+"' where id='"+id+"' ";
             
             int st=BranchDao.updateBranch(sql);
             if(st > 0 ){
             
             response.sendRedirect("viewBranchInfo.jsp?filter=all");
             }
             else{
                 out.print("Not Updated!!!!!!!");
             }
       
          
    }

}
