/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package web.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import java.util.Date;
import java.util.Calendar;

import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Document;
import com.itextpdf.text.Element;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.pdf.PdfWriter;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.Rectangle;
import com.itextpdf.text.Paragraph;





import java.io.OutputStream;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.http.HttpSession;


import com.itextpdf.text.Phrase;
import com.itextpdf.text.pdf.ColumnText;
import com.itextpdf.text.pdf.PdfPageEventHelper;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;

import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletConfig;
/**
 *
 * @author Admin
 */
@WebServlet(name = "PdfServletTransaction", urlPatterns = {"/PdfServletTransaction"})
public class PdfServletTransaction extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
     
    String user;
    
    //initialize 
    Connection conn;
    PreparedStatement pstmt;
    ResultSet rs;
    String query;
    
   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/pdf;charset=UTF-8");
        
        HttpSession session= request.getSession();
        user= session.getAttribute("sUname").toString();
        System.out.println(user);
        
        Calendar currDate= Calendar.getInstance();
        // year month and days
        String year=  String.valueOf(currDate.get(Calendar.YEAR));
        int e= 1+ currDate.get(Calendar.MONTH);
        String month= String.valueOf(e);    
        String day= String.valueOf(currDate.get(Calendar.DATE));
    
        // hour minute and seconds
        String hour= String.valueOf(currDate.get(Calendar.HOUR));
        String min= String.valueOf(currDate.get(Calendar.MINUTE));
        String sec= String.valueOf(currDate.get(Calendar.SECOND));  
        
        String filename= year+ month + day + hour + min + sec + "-transaction.pdf";
        response.setHeader("content-disposition", "attachment; filename="+ filename);
        
        OutputStream os= response.getOutputStream();
        
        try {
            // create document
            Document doc = new Document();
            Rectangle rect= new Rectangle(PageSize.A4);
            doc.setPageSize(rect);
            
            // set page event for header footer
            HeaderFooterPageEvent event = new HeaderFooterPageEvent();
            PdfWriter writer= PdfWriter.getInstance(doc, os);
            writer.setPageEvent(event);
            doc.open();
            
            // setup table
            float [] colSize= {10, 35, 40, 30};
            PdfPTable table= new PdfPTable(4);
            table.setWidths(colSize);
            
            //Title Header
            PdfPCell cellT= new PdfPCell(new Paragraph("Transaction History"));
            cellT.setColspan(4);
            cellT.setPadding(5);
            cellT.setHorizontalAlignment(Element.ALIGN_CENTER);
            cellT.setBackgroundColor(BaseColor.LIGHT_GRAY);table.addCell(cellT);
            table.addCell(" ");

            //Username Header
            PdfPCell cellUH= new PdfPCell(new Paragraph("USERNAME" ));
        
            table.addCell(cellUH);

            //Role Header
            PdfPCell cellPH= new PdfPCell(new Paragraph("PRODUCT"));
      
            table.addCell(cellPH);
            
            PdfPCell cellDH= new PdfPCell(new Paragraph("TRANSACTION DATE"));
      
            table.addCell(cellDH);
            
            
             // Load Driver
            String driver= "org.apache.derby.jdbc.ClientDriver";
            Class.forName(driver);
            
            // Register URL, username and password and Connect to Database
            String url= "jdbc:derby://localhost:1527/UserDB";
            conn= DriverManager.getConnection(url, "app", "app");
            
            // Execute Query
            String username= (String)session.getAttribute("sUname");
            query= "SELECT * FROM TRANSACTIONS WHERE USERNAME=? ORDER BY TRANSACTION_DATE DESC";
            pstmt  = conn.prepareStatement(query);
            pstmt.setString(1, username);
          
            rs= pstmt.executeQuery();
                
            // for number of records
            int x= 1;
                
            // list records in table
            while(rs.next()){
                String y= String.valueOf(x);
                
                // add record in numbering column
                PdfPCell cellN= new PdfPCell(new Paragraph(y));
                cellN.setPadding(3);
                table.addCell(cellN);
                    
                //check if user from db is equal to user from parameter

                // put asterisk beside name if true and 
                // add record in username column
                PdfPCell cellU= new PdfPCell(new Paragraph(rs.getString("USERNAME").trim()));   
                cellU.setPadding(3);    
                table.addCell(cellU);
             
                
                // add record in role column
                PdfPCell cellP= new PdfPCell(new Paragraph(rs.getString("PRODUCT").trim()));
                cellP.setPadding(3);
                table.addCell(cellP);
                
                
                 // add record in role column
                
                PdfPCell cellD= new PdfPCell(new Paragraph(rs.getString("TRANSACTION_DATE").trim()));    
                cellD.setPadding(3);
                table.addCell(cellD);
                
                
                
                x++;
            }
            
            // add table to document
            doc.add(table);
           
            rs.close();
            pstmt.close();
            conn.close();
            doc.close();
            
        }catch(Exception ex){
            ex.printStackTrace();
        
        }
    }
    
    public class HeaderFooterPageEvent extends PdfPageEventHelper {

        // event for header
        public void onStartPage(PdfWriter writer, Document document) {
          
            ColumnText.showTextAligned(writer.getDirectContent(), Element.ALIGN_CENTER, new Phrase("USER: "+ user), 75, 820, 0);
            ColumnText.showTextAligned(writer.getDirectContent(), Element.ALIGN_CENTER, new Phrase(getServletContext().getInitParameter("header")), 300, 820, 0);
        }

        // event for footer
        public void onEndPage(PdfWriter writer, Document document) {
            Date currDate= new Date();
            String dateString= DateFormat.getDateInstance(DateFormat.SHORT).format(currDate);
            String timeString= DateFormat.getTimeInstance(DateFormat.MEDIUM).format(currDate);
            ColumnText.showTextAligned(writer.getDirectContent(), Element.ALIGN_CENTER, new Phrase(dateString + " "+ timeString), 75, 15, 0);

            ColumnText.showTextAligned(writer.getDirectContent(), Element.ALIGN_CENTER, new Phrase(getServletContext().getInitParameter("footer")), 300, 15, 0);
            ColumnText.showTextAligned(writer.getDirectContent(), Element.ALIGN_CENTER, new Phrase("page " + document.getPageNumber()), 550, 15, 0);
        }

    }
  

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
