/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package web.controller;

import web.exception.AuthenticationException;
import java.sql.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.util.Date;
import java.util.Calendar;


import web.exception.*;
import web.model.Security;

/**
 *
 * @author Admin
 */
@WebServlet(name = "SignupServlet", urlPatterns = {"/SignupServlet"})
public class SubscribeServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    
    Connection conn;
    PreparedStatement pstmt, pstmt1, pstmt2;
    ResultSet dbParameters;
    String query, iQuery, uQuery;
            
    public void init(ServletConfig config) throws ServletException {
            super.init(config);            
         
    }
    
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
                try {
                     // get initParameter for jdbcClass from the deployment descriptor
                     Class.forName(getServletConfig().getInitParameter("jdbcClass"));

                     // get initParameter for database username from the deployment descriptor
                     String username = getServletConfig().getInitParameter("dbUName");

                     // get initParameter for database password from the deployment descriptor
                     String password = getServletConfig().getInitParameter("dbPass");

                     // get initParameter for database driver from the deployment descriptor and append database host, port and name respectively
                     StringBuffer url = new StringBuffer(getServletConfig().getInitParameter("jdbcDriver"))
                             .append("://")
                             .append(getServletConfig().getInitParameter("dbHost"))
                             .append(":")
                             .append(getServletConfig().getInitParameter("dbPort"))
                             .append("/")
                             .append(getServletConfig().getInitParameter("dbName"));

                     // establish the connection with the database once the servlet is called ( because of innit )
                     conn = DriverManager.getConnection(url.toString(), username, password);

                     // give the initParameter value of "dbQuery"
                     query = getServletConfig().getInitParameter("dbQuery");
                     iQuery= getServletConfig().getInitParameter("dbInsertQuery");
                     uQuery= getServletConfig().getInitParameter("dbUpdateQuery");

             } catch (SQLException sqle){
                     System.out.println("SQLException error occured - " 
                             + sqle.getMessage());
             } catch (ClassNotFoundException nfe){
                     System.out.println("ClassNotFoundException error occured - " 
                     + nfe.getMessage());
             } 
              // get values from signup parameters to be used for checking
              // UPDATE ZENSEI_USERS SET ROLE_1=? WHERE USERNAME=?
              HttpSession session = request.getSession();
              String username= (String)session.getAttribute("sUname");
              String role1 = "member";
              String product= "Subscription";
              // initialize values for resultSet
              String dbUname="", dbPassword="", dbRole="",  dbRole2="", dbAvatar="";
              
              Date currDate = new Date();
              DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
              String myDate = formatter.format(currDate);
              //java.sql.Date sqlDate = new java.sql.Date(myDate.getTime());
              System.out.println(myDate);
              
              // statement to update the role of user from guest to member
              // UPDATE ZENSEI_USERS SET ROLE_1=? WHERE USERNAME=?
              pstmt= conn.prepareStatement(uQuery);
              pstmt.setString(1, role1);
              pstmt.setString(2, username);
              
              // execute the query
              pstmt.executeUpdate();
              
              // statement to insert a transaction
              // INSERT INTO TRANSACTIONS(USERNAME, PRODUCT, TRANSACTION_DATE) VALUES (?, ?, ?)
              pstmt1= conn.prepareStatement(iQuery);
              pstmt1.setString(1, username);
              pstmt1.setString(2, product);
              pstmt1.setString(3, myDate);
              
              // execute the query
              pstmt1.executeUpdate();
              
               // create preparedstatement object for query and setString for ? parameters in the query
              pstmt2= conn.prepareStatement(query);
              pstmt2.setString(1, username);
           
              // execute the query
              dbParameters= pstmt2.executeQuery();
              
              // put values from resultSet into string values
              if (dbParameters.next()) {
                dbUname= dbParameters.getString("USERNAME");
                dbPassword= dbParameters.getString("PASSWORD");
                dbRole= dbParameters.getString("ROLE_1");
                dbRole2= dbParameters.getString("ROLE_2");
                dbAvatar= dbParameters.getString("AVATAR");
                
              }
              
              session.setAttribute("sRole", dbRole);
              response.sendRedirect("subscription-success.jsp");
              
              pstmt.close();
              conn.close();
        }
        catch (SQLException sqle){
          
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
