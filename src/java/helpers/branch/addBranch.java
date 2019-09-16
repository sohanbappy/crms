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
import models.Branch;
import models.TrainingInfo;

/**
 *
 * @author Bappy
 */
@WebServlet(name = "addBranch", urlPatterns = {"/addBranch"})
public class addBranch extends HttpServlet {

           @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        

                
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
            
            
            String br_id=request.getParameter("br_id");
            String name=request.getParameter("name");
            String location=request.getParameter("location");
            String admin_name=request.getParameter("admin_name");
            String uname=request.getParameter("uname").trim();
            String pass=request.getParameter("pass").trim();
            String status=request.getParameter("status");
            
            
            Branch branch=new Branch();
            
            branch.setBr_id(br_id);
            branch.setName(name);
            branch.setLocation(location);
            branch.setAdmin_name(admin_name);
            branch.setUname(uname);
            branch.setPass(pass);
            branch.setStatus(status);
           
            BranchDao.saveBranch(branch);
            
            
            
            response.sendRedirect("viewBranchInfo.jsp?filter=all"); 
        
             
          }

}
