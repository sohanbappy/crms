/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package events;

import com.itextpdf.text.Chunk;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import dao.BikeRentDao;
import dao.TrainingRentDao;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.BikeRent;
import models.TrainingRent;



/**
 *
 * @author Bappy
 */
@WebServlet(name = "allTrainingRentPdf", urlPatterns = {"/allTrainingRentPdf"})
public class allTrainingRentPdf extends HttpServlet {


    
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        response.setContentType("application/pdf");
   
        
                     
                    
        
                    OutputStream out=response.getOutputStream();
        
        try{
                    Document document = new Document();
                    PdfWriter.getInstance(document,out);
                    document.open();
//                    document.add(new Paragraph("User: "));

                     Font hFont = new Font(Font.FontFamily.TIMES_ROMAN, 22, Font.BOLD);
                     Font hFont2 = new Font(Font.FontFamily.TIMES_ROMAN, 15, Font.NORMAL);
                     Font hFont3 = new Font(Font.FontFamily.TIMES_ROMAN, 12, Font.NORMAL);

                   
                  
                   
                    Paragraph title=new Paragraph("Easca Car Rental Solutions",hFont);
                    title.setAlignment(1);
                    document.add(title);
                    
                    Paragraph add1=new Paragraph(" 12/B,Marine Drive,Cox's Bazar, Bangladesh",hFont2);
                    add1.setAlignment(1);
                    document.add(add1);
                    
                    Paragraph add2=new Paragraph(" Phone: +8801766334885, +8801515205145",hFont3);
                    add2.setAlignment(1);
                    document.add(add2);
                    
                    Paragraph add3=new Paragraph(" info@eascacrms.com",hFont3);
                    add3.setAlignment(1);
                    document.add(add3);
                     document.add( Chunk.NEWLINE );



                    PdfPTable table = new PdfPTable(10);
                    
                    PdfPCell cell = new PdfPCell(new Paragraph("All Training Rent Report"));
                    cell.setColspan(10);
                    cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                    cell.setPadding(10.0f);
                    table.addCell(cell);
                   
                    table.addCell("Rent ID");
                     table.addCell("User ID");
                     table.addCell("Training ID");
                       table.addCell("Request Time");
                        table.addCell("Total");
                        table.addCell("Advance");
                         table.addCell("Due");
                         table.addCell("Comments");
                          table.addCell("Tx ID");
                          table.addCell("Status");

                    
                    
                    List<TrainingRent> br=new ArrayList<>();
                    br =TrainingRentDao.getAllMembers();
                    for (TrainingRent st : br) {

                    String rent_id=st.getRent_id();
                    String user=st.getUid();
                    String bike_id=st.getTr_id();
                    String req_time=st.getRequest_time();
                    String total=st.getTotal();
                    String advance=st.getAdvance();
                    String due=st.getDue();
                    String comments=st.getComments();
                    String tx_id=st.getTx_id();
                    String status=st.getStatus();

                    
                    table.addCell(rent_id);
                   
                    table.addCell(user);
                    
                    table.addCell(bike_id);
                   
                    table.addCell(req_time);
                   
                    table.addCell(total);
                    
                    table.addCell(advance);
                   
                    table.addCell(due);
                    
                    table.addCell(comments);
                   
                    table.addCell(tx_id);
                    
                    table.addCell(status);
                    }
                    document.add(table);
                    
                    document.add(new Paragraph("Printed: "+new Date().toString()));
                    document.close();

                    
                }
                catch(Exception e){
                    e.toString();
                }
    }

   

}
