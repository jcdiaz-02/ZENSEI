/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package EventsRecordServlet;

import java.io.IOException;
import javax.servlet.ServletException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import javax.servlet.ServletConfig;
import java.sql.Connection;
import java.sql.SQLException;

import Database.ConnectToDB;
import EventsRecordKeeper.EventRecord;

@WebServlet(name = "DeleteEvent", urlPatterns = { "/DeleteEvent" })
public class DeleteEvent extends HttpServlet {
    Connection conn;
    EventRecord eventRecord;
    ConnectToDB db;

    @Override
    public void init(ServletConfig config) throws ServletException {
        String username = config.getInitParameter("DBusername");
        String password = config.getInitParameter("DBpassword");
        String url = config.getInitParameter("DBurl");
        super.init(config);
        db = new ConnectToDB();
        try {
            conn = db.getConnection(url, username, password);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        String username = (String) session.getAttribute("username");
        String role = (String) session.getAttribute("role");
        role = "admin";

        String record_id = request.getParameter("record_id");
        String query = "DELETE FROM event_record WHERE record_id = ?";
        try {
            if ("admin".equals(role)) {
                db.updateQuery(query, record_id, conn);
            }
            // redirect back to view all event
            response.sendRedirect("ViewAllEventPage.jsp");
        } catch (Exception e) {

        }
    }

    // #region
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the
    // + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request  servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException      if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request  servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException      if an I/O error occurs
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
     // #endregion
}
