/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package helpers.user;

import dao.UserDao;
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
@WebServlet("/updateUser")
public class updateUser extends HttpServlet {

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
             
             
        
            String passport_no="";
            
            String name=request.getParameter("name");
            String phone=request.getParameter("phone").trim();
            String mail=request.getParameter("mail").trim();
            String address=request.getParameter("address");
            String nat=request.getParameter("nat");
            String nid_no=request.getParameter("nid_no");
            passport_no=request.getParameter("passport_no");
            String uid=request.getParameter("uid");
            String pass=request.getParameter("pass").trim();
            String pic_name=request.getParameter("pic_name");
            String status=request.getParameter("status");

//            
           int st=0;
            
            String sql="update user_tb set name='"+name+"',phone='"+phone+"',mail='"+mail+"',address='"+address+"',pass='"+pass+"',status='"+status+"' where id='"+id+"' ";
            String sql2="update user_tb set name='"+name+"',phone='"+phone+"',mail='"+mail+"',address='"+address+"',pass='"+pass+"' where id='"+id+"' ";
            
             if(session.getAttribute("type").equals("admin")){   
             st=UserDao.updateUser(sql);
             
             }
             else{
             st=UserDao.updateUser(sql2);
             }
             if(st > 0 ){
             
                 
              if(session.getAttribute("type").equals("admin")||session.getAttribute("type").equals("super")){   
                 
             response.sendRedirect("viewUser.jsp?filter=all");
              }
              else{
               response.sendRedirect("userDash.jsp");
              }
             }
             else{
                 out.print("Not Updated!!!!!!!");
             }
       
          
    }

}
