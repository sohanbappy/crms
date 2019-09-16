/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package helpers.car;

import dao.CarInfoDao;
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
import models.CarInfo;

/**
 *
 * @author Baappy
 */
@WebServlet("/addCarInfo")
@MultipartConfig(
fileSizeThreshold = 1024*1024*2,
maxFileSize = 1024*1024*10,
maxRequestSize = 1024*1024*50
     
)
public class addCarInfo extends HttpServlet {
        
       public static final String SAVE_DIR = "images";
       
    
   
        
        
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        

                
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
            
            
            String car_id=request.getParameter("car_id");
            String car_model=request.getParameter("car_model");
            String c_lic_no=request.getParameter("c_lic_no");
            String c_eng_no=request.getParameter("c_eng_no");
            String rent_type=request.getParameter("rent_type");
            String category=request.getParameter("category");
            
            String pic_name="";
            String picture="";
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
            
            
            
       
           
 
         //Image Variables
         String savepath = "E:\\NetbeansProjects\\CarRentalManagementSystem1\\web"+File.separator+SAVE_DIR;
         File fileSaveDir=new File(savepath);
         
         Part part=request.getPart("picture");
         pic_name=extractFileName(part);
         
            part.write(savepath+File.separator+pic_name);
            picture=savepath+File.separator+pic_name;
           
            CarInfo car=new CarInfo();
            
           car.setCar_id(car_id);
           car.setCar_model(car_model);
           car.setC_lic_no(c_lic_no);
           car.setC_eng_no(c_eng_no);
           car.setRent_type(rent_type);
           car.setCategory(category);
           car.setPic_name(pic_name);
           car.setPicture(picture);
           car.setP_day(p_day);
           car.setP_hr(p_hr);
           car.setStatus(status);
           
           
         
           
            CarInfoDao.saveCarInfo(car);
             
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Manage Car Info</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Car info saved successfully!!!!!!!!</h1>");
            out.println("</body>");
            out.println("</html>");
            
            response.sendRedirect("viewCarInfo.jsp?filter=all"); 
        
             
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

            

