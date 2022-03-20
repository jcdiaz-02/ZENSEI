

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
public class UserVerification extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
	    throws ServletException, IOException {
	String uname = request.getParameter("uname");
	String psw = request.getParameter("psw");
	String email = request.getParameter("email");
	Random r = new Random();
	String randomNumber = String.format("%04d", r.nextInt(1001));

	String subject = "verification";
	String messageText = "Verification code is: " + randomNumber;//messageString;
	String fromemail = "";
	String frompassword = "";

	HttpSession httpsession = request.getSession();
	try {
	    Properties properties = new Properties();
	    properties.put("mail.smtp.auth", "true");
	    properties.put("mail.smtp.starttls.enable", "true");
	    properties.put("mail.smtp.host", "smtp.gmail.com");
	    properties.put("mail.smtp.port", "587");

	    Session session = Session.getInstance(properties, new javax.mail.Authenticator() {
		protected PasswordAuthentication getPasswordAuthentication() {
		    return new PasswordAuthentication(fromemail, frompassword);
		}
	    });
	    MimeMessage msg = new MimeMessage(session);

	    msg.setFrom(
		    new InternetAddress(fromemail));
	    msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(email));
	    msg.setSubject(subject);

	    msg.setText(messageText);

	    Transport.send(msg);

	    httpsession.setAttribute(
		    "code", randomNumber);
	    httpsession.setAttribute(
		    "uname", uname);
	    httpsession.setAttribute(
		    "pass", psw);
	    httpsession.setAttribute(
		    "email", email);
	    response.sendRedirect(
		    "verificationPage.jsp");

	} catch (MessagingException e) {
	    response.sendRedirect("home.jsp");
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
