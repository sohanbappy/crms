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
import com.itextpdf.text.Image;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Rectangle;
import com.itextpdf.text.pdf.BaseFont;
import com.itextpdf.text.pdf.PdfContentByte;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import dao.BikeRentDao;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.BikeRent;



/**
 *
 * @author Bappy
 */
@WebServlet(name = "bikeRentPdf", urlPatterns = {"/bikeRentPdf"})
public class bikeRentPdf extends HttpServlet {


    
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        response.setContentType("application/pdf");
   
        
         int id=Integer.parseInt(request.getParameter("id"));

                    BikeRent st=BikeRentDao.getBikeRentById(id);

                    String rent_id=st.getRent_id();
                    String user=st.getUid();
                    String bike_id=st.getBike_id();
                    String from_date=st.getFrom_date();
                    String to_date=st.getTo_date();
                    String total=st.getTotal();
                    String advance=st.getAdvance();
                    String due=st.getDue();
                    String comments=st.getComments();
                    String tx_id=st.getTx_id();
                    String r_time=st.getRequest_time();
                    String status=st.getStatus();

        
                    OutputStream out=response.getOutputStream();
        
        try{
            
                    Rectangle pageSize = new Rectangle(780, 525);
                    Document document = new Document(pageSize);
                    
                    PdfWriter writer=PdfWriter.getInstance(document, response.getOutputStream());
                    document.open();
//                    document.add(new Paragraph("User: "+user));

                    
                   
                    float[] colsWidth1 = {1f, 1f, 1f,1f,1f}; // Code 1
                    
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
                   
                    PdfPTable table1 = new PdfPTable(8);
                    table1.getDefaultCell().setBorder(0);
                    table1.setWidthPercentage(100); // Code 2
                    table1.setHorizontalAlignment(Element.ALIGN_LEFT);//Code 3 
                    
                    
                     table1.addCell("");
                    table1.addCell("User >>>");
                    table1.addCell(user);
                    table1.addCell("");
                    table1.addCell("");
                      table1.addCell("Rent ID >>>");
                    table1.addCell(rent_id);
                    table1.addCell("");
                    document.add(table1);
                    
                    Font boldFont = new Font(Font.FontFamily.TIMES_ROMAN, 12, Font.BOLD);
                    
                    
                    
                    table1 = new PdfPTable(colsWidth1);
                    table1.getDefaultCell().setBorder(0);
                    table1.setWidthPercentage(100); // Code 2
                    table1.setHorizontalAlignment(Element.ALIGN_LEFT);//Code 3
                    document.add(table1);
                    document.add( Chunk.NEWLINE );
                    
                    PdfPTable table = new PdfPTable(2);
                    PdfPCell cell = new PdfPCell(new Paragraph("Bike Rent Report", boldFont ));
                    cell.setColspan(8);
                    cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                    cell.setPadding(10.0f);
                    table.addCell(cell);

                   
                    table.addCell("Bike ID");
                    table.addCell(bike_id);
                    table.addCell("From Date");
                    table.addCell(from_date);
                    table.addCell("To Date");
                    table.addCell(to_date);
                    table.addCell("Total");
                    table.addCell(total);
                    table.addCell("Advance");
                    table.addCell(advance);
                    table.addCell("Due");
                    table.addCell(due);
                    table.addCell("Comments");
                    table.addCell(comments);
                    table.addCell("Tx ID");
                    table.addCell(tx_id);
                    table.addCell("Req. Time");
                    table.addCell(r_time);
                    table.addCell("Status");
                    table.addCell(status);

                    document.add(table);
                    
                    document.add(new Paragraph("Printed: "+new Date().toString()));
                    
                    
                    PdfContentByte cb = writer.getDirectContent();
                    cb.setFontAndSize(BaseFont.createFont(BaseFont.HELVETICA, BaseFont.WINANSI, false), 24);
                    cb.setLineWidth(3);
                    cb.moveTo(10, 515);
                    cb.lineTo(770,515 );
                    cb.moveTo(10, 10);
                    cb.lineTo(770,10 );
                    cb.moveTo(770, 515);
                    cb.lineTo(770, 10);
                    cb.moveTo(10, 515);
                    cb.lineTo(10, 10);
                    cb.stroke();
                    
                    
                    document.close();

                    
                }
                catch(Exception e){
                    e.toString();
                }
    }

   

}
