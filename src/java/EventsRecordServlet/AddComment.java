
package EventsRecordServlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Database.ConnectToDB;

@WebServlet(name = "AddComment", urlPatterns = { "/AddComment" })
public class AddComment extends HttpServlet {
    Connection conn;
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

        try {
            HttpSession session = request.getSession();
            String role = (String) session.getAttribute("role");

            String comment = request.getParameter("comments");
            String firstName = request.getParameter("fname");
            String lastName = request.getParameter("lname");
            String email = request.getParameter("email");
            String course = request.getParameter("course");

            String query = "INSERT INTO comment (comment, first_name, last_name, email, course) VALUES (?, ?, ?, ?, ?)";
            db.updateQuery(query, new String[] { comment, firstName, lastName, email, course }, conn);
            if("admin".equalsIgnoreCase(role)){
                response.sendRedirect("subpage/authenticatedContacts.jsp");
            }else{
                response.sendRedirect("subpage/contact.jsp");
            }
            // redirect back to contact page
        } catch (Exception e) {
             response.sendRedirect("errorPages/Error404.jsp");
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
