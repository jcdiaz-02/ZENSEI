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
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import nl.captcha.*;

import web.exception.*;
import web.model.Security;

/**
 *
 * @author Admin
 */
@WebServlet(name = "SignupServlet", urlPatterns = {"/SignupServlet"})
public class SignupCoachServlet extends HttpServlet {

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
    PreparedStatement pstmt;
    ResultSet dbParameters;
    String query, iQuery;
            
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

             } catch (SQLException sqle){
                     System.out.println("SQLException error occured - " 
                             + sqle.getMessage());
             } catch (ClassNotFoundException nfe){
                     System.out.println("ClassNotFoundException error occured - " 
                     + nfe.getMessage());
             } 
              // get values from signup parameters to be used for checking
              String username= request.getParameter("username").trim();
              String password= request.getParameter("password");
              String game= request.getParameter("game");
              String cfPassword= request.getParameter("cfPassword");
              String role1 = "guest";
              String role2 = "coach";
        
               HttpSession session = request.getSession();
              String ePassword;
              // make statement for select query to find if whether username already exists
              pstmt= conn.prepareStatement(query);
              pstmt.setString(1, username);
              
              // execute the query
              dbParameters= pstmt.executeQuery();
              
              Captcha captcha = (Captcha) request.getSession(false).getAttribute(Captcha.NAME);
              String answer = request.getParameter("answer");
              
              int error;
              
              // checks if name already exists in database
              if(dbParameters.next() == true){
                  error= 4;
                  request.setAttribute("error", error);
                  throw new AuthenticationException();
              }
              // checks if passwords are not the same
              else if (!password.equals(cfPassword))
              {
                  error= 5 ;
                  request.setAttribute("error", error);
                  throw new AuthenticationException();
              }
              
              // checks if captcha is invalid
              else if (!captcha.isCorrect(answer)) {
                  String msg= "Captcha is invalid!";
                  session.setAttribute("msg", msg);
                  response.sendRedirect(request.getHeader("Referer"));
              }
              
              // if all parameters are filled and valid
              else if (password.equals(cfPassword) && captcha.isCorrect(answer))
              {
                  // encrypt the registered password
                  ePassword= Security.encrypt(password);
                  
                  // execute update query to put record in database
                  pstmt= conn.prepareStatement(iQuery);
                  pstmt.setString(1, username);
                  pstmt.setString(2, ePassword);
                  pstmt.setString(3, role1);
                  pstmt.setString(4, game);
                  pstmt.setString(5, role2);
                  pstmt.setString(6, null);
                  pstmt.executeUpdate();
                  
                  
                  response.sendRedirect("signup-success.jsp");
              }
              
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
