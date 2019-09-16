package helpers.bike;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


import dao.BikeInfoDao;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import models.BikeInfo;

/**
 *
 * @author Baappy
 */
@WebServlet("/addBikeInfo")
@MultipartConfig(
fileSizeThreshold = 1024*1024*2,
maxFileSize = 1024*1024*10,
maxRequestSize = 1024*1024*50
     
)
public class addBikeInfo extends HttpServlet {
        
       public static final String SAVE_DIR = "images";
       
    
   
        
        
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        

                
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
            
            
            String bike_id=request.getParameter("bike_id");
            String bike_model=request.getParameter("bike_model");
            String b_lic_no=request.getParameter("b_lic_no");
            String b_eng_no=request.getParameter("b_eng_no");
            String category=request.getParameter("category");
            String pic_name="";
            String picture="";
            String p_day=request.getParameter("p_day");
            String status=request.getParameter("status");
            
            
            
       
           
 
         //Image Variables
         String savepath = "E:\\NetbeansProjects\\CarRentalManagementSystem1\\web"+File.separator+SAVE_DIR;
         File fileSaveDir=new File(savepath);
         
         Part part=request.getPart("picture");
         pic_name=extractFileName(part);
         
            part.write(savepath+File.separator+pic_name);
            picture=savepath+File.separator+pic_name;
           
            BikeInfo Bike=new BikeInfo();
            
           Bike.setBike_id(bike_id);
           Bike.setBike_model(bike_model);
           Bike.setB_lic_no(b_lic_no);
           Bike.setB_eng_no(b_eng_no);
           Bike.setCategory(category);
           Bike.setPic_name(pic_name);
           Bike.setPicture(picture);
           Bike.setP_day(p_day);
           Bike.setStatus(status);
           
            BikeInfoDao.saveBikeInfo(Bike);
             
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Manage Bike Info</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Bike info saved successfully!!!!!!!!</h1>");
            out.println("</body>");
            out.println("</html>");
            
            response.sendRedirect("viewBikeInfo.jsp?filter=all"); 
        
             
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

            

