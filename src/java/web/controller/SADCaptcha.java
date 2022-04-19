package web.controller;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */



import javax.servlet.annotation.WebServlet;
import java.awt.Color;
import java.awt.Font;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import nl.captcha.Captcha;
import nl.captcha.text.renderer.DefaultWordRenderer;
import nl.captcha.gimpy.*;


import nl.captcha.servlet.CaptchaServletUtil;


/**
 *
 * @author Admin
 */
@WebServlet(name = "SADCaptcha", urlPatterns = {"/SADCaptcha"})
public class SADCaptcha extends HttpServlet {
        private static final long serialVersionUID = 1L;
        
    // dimensions for the captcha
    private static int width = 150; 
    private static int height = 50;
    
    
    // colors for the captcha text render
    private static final List<Color> COLORS = new ArrayList<Color>(2);
    private static final List<Font> FONTS = new ArrayList<Font>(1);

    static {
      COLORS.add(Color.BLUE);
      COLORS.add(Color.RED);
      FONTS.add(new Font("Helvetica", 2, 40));
    }
    
    //custom captcha for the webpage
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        DefaultWordRenderer wordRenderer = new DefaultWordRenderer(COLORS, FONTS);
        Captcha captcha = (new Captcha.Builder(width, height)).addText(wordRenderer)
          .gimp(new FishEyeGimpyRenderer())
          .addNoise()
          .addBorder()
          .build();
        CaptchaServletUtil.writeImage(response, captcha.getImage());
        HttpSession session=  request.getSession(false);
        String captchaA= captcha.getAnswer();      
        session.setAttribute("captchaA",captchaA);
        session.setAttribute("simpleCaptcha", captcha);
      
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
