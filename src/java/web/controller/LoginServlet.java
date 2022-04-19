/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package web.controller;


import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import web.exception.*;
import web.model.Security;


/**
 *
 * @author lawrence
 */
public class LoginServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    
    //initialize 
    Connection conn;
    PreparedStatement pstmt;
    ResultSet dbParameters;
    String query;
            
    public void init(ServletConfig config) throws ServletException {
           super.init(config);
                    
           try {
                    // get initParameter for jdbcClass from the deployment descriptor
                    Class.forName(config.getInitParameter("jdbcClass"));
                    
                    // get initParameter for database username from the deployment descriptor
                    String username = config.getInitParameter("dbUName");
                    
                    // get initParameter for database password from the deployment descriptor
                    String password = config.getInitParameter("dbPass");

                    // get initParameter for database driver from the deployment descriptor and append database host, port and name respectively
                    StringBuffer url = new StringBuffer(config.getInitParameter("jdbcDriver"))
                            .append("://")
                            .append(config.getInitParameter("dbHost"))
                            .append(":")
                            .append(config.getInitParameter("dbPort"))
                            .append("/")
                            .append(config.getInitParameter("dbName"));
                  
                    // establish the connection with the database once the servlet is called ( because of innit )
                    conn = DriverManager.getConnection(url.toString(), username, password);
                    
                    // give the initParameter value of "dbQuery"
                    query = config.getInitParameter("dbQuery");
               
            } catch (SQLException sqle){
                    System.out.println("SQLException error occured - " 
                            + sqle.getMessage());
            } catch (ClassNotFoundException nfe){
                    System.out.println("ClassNotFoundException error occured - " 
                    + nfe.getMessage());
            }
    }
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
          response.setContentType("text/html;charset=UTF-8");
         
          try {
              // initialize values for resultSet
              String dbUname="", dbPassword="", dbRole="",  dbRole2="", dbAvatar="";
              
              // get values from login parameters to be used for checking
              String username= request.getParameter("username");
              String password= Security.encrypt(request.getParameter("password"));
             
              // create preparedstatement object for query and setString for ? parameters in the query
              pstmt= conn.prepareStatement(query);
              pstmt.setString(1, username);
           
              // execute the query
              dbParameters= pstmt.executeQuery();
              
              // put values from resultSet into string values
              if (dbParameters.next()) {
                dbUname= dbParameters.getString("USERNAME");
                dbPassword= dbParameters.getString("PASSWORD");
                dbRole= dbParameters.getString("ROLE_1");
                dbRole2= dbParameters.getString("ROLE_2");
                dbAvatar= dbParameters.getString("AVATAR");
                
              }
               
              HttpSession session= request.getSession();
              if (dbRole.equals("admin"))
              {
                 session.setAttribute("sRole", "admin");
              }
              else if(dbRole.equals("member")){
                 session.setAttribute("sRole", "member");
              }
              else{
                  session.setAttribute("sRole", "guest");
              }
              
              if(dbRole2 != null){
                 session.setAttribute("sRole2", "coach"); 
              }
              else{
                  session.setAttribute("sRole2", null); 
              }
              
             
              // error values for each authenticationexception thrown
              int error;
              
              // null value exception
              if( username.isEmpty() && password.isEmpty() )
              {
                  throw new NullValueException();
              }
              // if the username is not in the DB, and password is blank
              else if( dbUname.isEmpty() && password.isEmpty() )
              {
                  error= 1;
                  request.setAttribute("error", error);
                  throw new AuthenticationException();
              }
              
              // if the username is correct but incorrect password
              else if( username.equals(dbUname) && !password.equals(dbPassword))
              {
                  error= 2;
                  request.setAttribute("error", error);
                  throw new AuthenticationException();
              }   
         
              // if the username and password are both incorrect, both are not blank
              else if(!username.equals(dbUname) && !password.equals(dbPassword))
              {
                  error= 3;
                  request.setAttribute("error", error);
                  throw new AuthenticationException();
              }
              // go to success page
              else if( username.equals(dbUname) && password.equals(dbPassword) )
              {    
                  // bind the resultSet values into a name value pair of the session
                  session.setAttribute("sUname", dbUname);
                  session.setAttribute("sPassword", dbPassword);
                  session.setAttribute("sAvatar", dbAvatar);
                  
                  session.setAttribute("adminCheck", "admin");
                  session.setAttribute("memberCheck", "member");
                  session.setAttribute("guestCheck", "guest");
                  session.setAttribute("coachCheck", "coach");
                  
                  // redirect to success.jsp
                  response.sendRedirect("main-lol.jsp");
           
              }
              
          } catch (SQLException sqle){
          
          }
          catch (NullPointerException npe){
              
              // if going to success page without session
              response.sendRedirect("ErrorPages/error_session.jsp");
              npe.printStackTrace();
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
