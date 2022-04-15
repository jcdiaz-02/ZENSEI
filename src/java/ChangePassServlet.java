/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import Exceptions.AuthenticationExceptionPassword;
import Exceptions.AuthenticationExceptionUsername;
import Exceptions.NullValueException;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author merki
 */
public class ChangePassServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    String username;
    String password;

    Connection conn;

    @Override
    public void init(ServletConfig config) throws ServletException {
	username = config.getInitParameter("DBusername");
	password = config.getInitParameter("DBpassword");
	super.init(config);
	try {
	    Class.forName(config.getInitParameter("DBdriver"));
	    String url = config.getInitParameter("DBurl");
	    conn = DriverManager.getConnection(url, username, password);
	} catch (SQLException sqle) {
	    System.out.println("SQLException error occured - "
		    + sqle.getMessage());
	} catch (ClassNotFoundException nfe) {
	    System.out.println("ClassNotFoundException error occured - "
		    + nfe.getMessage());
	}

    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
	    throws ServletException, IOException {
	response.setContentType("text/html;charset=UTF-8");
	try {
	    HttpSession httpsession = request.getSession();
	    String email = (String) request.getAttribute("email");
	    String psw = request.getParameter("psw");
	    String cpsw = request.getParameter("cpsw");

	    if (psw != null & cpsw != null) {
		if (!cpsw.equals(psw)) {
		    httpsession.setAttribute("error", "1");
		    response.sendRedirect("");
		} else {
		    String query = "SELECT PASSWORD FROM APP.USERDB where EMAIL=?";
		    PreparedStatement pstmt = conn.prepareStatement(query);
		    pstmt.setString(1, email);
		    ResultSet records = pstmt.executeQuery();
		    if (records.next() == false) {

			query = "SELECT PASSWORD FROM APP.VERIFIEDDB where EMAIL=?";
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, email);
			records = pstmt.executeQuery();
			if (records.next() == false) {
			    throw new AuthenticationExceptionUsername();
			} else {
			    query = "UPDATE APP.VERIFIEDDB set PASSWORD=?";
			    pstmt = conn.prepareStatement(query);
			    pstmt.setString(1, psw);
			    pstmt.executeUpdate();
			}
		    } else {
			query = "UPDATE APP.USERDBs set PASSWORD=?";
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, psw);
			pstmt.executeUpdate();
		    }
		}
	    }
	} catch (SQLException sqle) {
	    response.sendRedirect("error404.jsp");
	} catch (Exception ex) {
	    ex.printStackTrace();
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
