package Database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class ConnectToDB {

    public Connection getConnection(String dbUrl, String dbUser, String dbPassword) throws SQLException {
        Connection conn;
        try {
            final String url = "jdbc:mysql://localhost:3306/GamingArchives?useSSL=false";
            final String user = "root";
            final String password = "root";
            conn = DriverManager.getConnection(url, user, password);
            return conn;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            return null;
        }
    }

    public ResultSet getTableResultSet(String tablename, Connection conn) {
        try {
           String query = "SELECT * FROM " + tablename;
            Statement pstmt = conn.createStatement();
            ResultSet rs = pstmt.executeQuery(query);
            return rs;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            return null;
        }
    }

    public ResultSet getSortedTableRS(String tablename, Connection conn) {
        try {
            String query = "SELECT * FROM " + tablename +" ORDER BY event_date DESC";
            Statement pstmt = conn.createStatement();
            ResultSet rs = pstmt.executeQuery(query);
            return rs;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            return null;
        }
    }

    public ResultSet getResultSet(String query, String[] var, Connection conn) throws SQLException {
        try {
            PreparedStatement pstmt = conn.prepareStatement(query);
            int count = 1;
            for (String i : var) {
                pstmt.setString(count, i);
                count++;
            }
            ResultSet rs = pstmt.executeQuery();
            return rs;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            return null;
        }
    }

    public ResultSet getResultSet(String query, String var, Connection conn) throws SQLException {
        try {
            PreparedStatement pstmt = conn.prepareStatement(query);
            pstmt.setString(1, var);
            ResultSet rs = pstmt.executeQuery();
            return rs;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            return null;
        }
    }

    public int updateQuery(String query, String[] var, Connection conn) {
        try {
            PreparedStatement pstmt = conn.prepareStatement(query);
            int count = 1;
            for (String i : var) {
                pstmt.setString(count, i);
                count++;
            }
            return pstmt.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            return -1;
        }
    }

    public int updateQuery(String query, String var, Connection conn) {
        try {
            PreparedStatement pstmt = conn.prepareStatement(query);
            pstmt.setString(1, var);
            return pstmt.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            return -1;
        }
    }

    public List<String> resultSetToList(ResultSet rs, String columnName) throws SQLException {
        List<String> list = new ArrayList<>();
        while (rs.next()) {
            list.add(rs.getString(columnName));
        }
        return list;
    }

}
