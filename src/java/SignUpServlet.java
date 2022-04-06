/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Exceptions.*;
import java.sql.PreparedStatement;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Properties;
import java.util.Random;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpSession;

/**
 *
 * @author HP
 */
public class SignUpServlet extends HttpServlet {

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
	HttpSession httpsession = request.getSession();
	DateTimeFormatter dtf = DateTimeFormatter.ofPattern("uuuu-MM-dd");
	LocalDate now = LocalDate.now();
	String date = dtf.format(now);

	String uname = (String) httpsession.getAttribute("uname");
	String psw = (String) httpsession.getAttribute("psw");
	String email = (String) httpsession.getAttribute("email");
	String code = (String) httpsession.getAttribute("code");

	String verify = request.getParameter("verify");
	try {

	    if (code.equals(verify)) {

		String query = "INSERT INTO APP.USERDB(username,password,email,role,date)VALUES(?,?,?,?,?)";

		PreparedStatement pst = conn.prepareStatement(query);

		pst.setString(1, uname);
		pst.setString(2, psw);
		pst.setString(3, email);
		pst.setString(4, "member");
		pst.setString(5, date);
		pst.executeUpdate();
		response.sendRedirect("authenticatedHome.jsp");
	    } else {
		request.setAttribute("Incorrect", "Incorrect code");
		request.getRequestDispatcher("verificationPage.jsp").forward(request, response);
	    }

	} catch (Exception e) {
	    response.sendRedirect("errPages/Error404.jsp");
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
