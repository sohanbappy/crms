/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package helpers.user;


import dao.UserDao;
import java.io.File;
import models.User;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author Baappy
 */
@WebServlet("/addUser")
@MultipartConfig(
fileSizeThreshold = 1024*1024*2,
maxFileSize = 1024*1024*10,
maxRequestSize = 1024*1024*50
     
)
public class addUser extends HttpServlet {
        
       public static final String SAVE_DIR = "images";
       
    
   
        
        
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        

                
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        HttpSession session=request.getSession();
        
            
            String passport_no="";
        
            String name=request.getParameter("name");
            String phone=request.getParameter("phone").trim();
            String mail=request.getParameter("mail").trim();
            String address=request.getParameter("address");
            String nat=request.getParameter("nat");
            String nid_no=request.getParameter("nid_no").trim();
            passport_no=request.getParameter("passport_no").trim();
            String pic_name="";
            String picture="";
            String uid=request.getParameter("uid");
            String pass=request.getParameter("pass").trim();
            String status=request.getParameter("status");
            
            
       
           
 
         //Image Variables
         String savepath = "E:\\NetbeansProjects\\CarRentalManagementSystem1\\web"+File.separator+SAVE_DIR;
         File fileSaveDir=new File(savepath);
         
         Part part=request.getPart("picture");
         pic_name=extractFileName(part);
         
            part.write(savepath+File.separator+pic_name);
            picture=savepath+File.separator+pic_name;
           
            User user=new User();
            
            user.setName(name);
            user.setPhone(phone);
            user.setMail(mail);
            user.setAddress(address);
            user.setNat(nat);
            user.setNid_no(nid_no);
            user.setPassport_no(passport_no);
            user.setPic_name(pic_name);
            user.setPicture(picture);
            user.setUid(uid);
            user.setPass(pass);
            user.setStatus(status);
            
            
                UserDao.saveUser(user);
 
                
                session.setAttribute("loginSuccess","save");
                response.sendRedirect("login.jsp?success=1"); 
            
        
             
          }
    
    
    
          public String extractFileName(Part part){
          String contentDisp=part.getHeader("content-disposition");
          String[] items=contentDisp.split(";");
          
          for(String s : items){
          
              if(s.trim().startsWith("filename")){
              
               return s.substring(s.indexOf("=") + 2, s.length()-1);
              }
          
          }  
          
       return "";
      
      }
    }

            

