<%-- 
    Document   : myAccountPageVerified
    Created on : 03 01, 22, 10:33:45 PM
    Author     : Admin
--%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
    String driver = "org.apache.derby.jdbc.ClientDriver";
    String url = "jdbc:derby://localhost:1527/userDB";
    String username = "app";
    String password = "app";
    Connection conn;
    try {
	Class.forName(driver);

    } catch (ClassNotFoundException e) {
	e.printStackTrace();
    }
    Connection connection = null;
    Statement statement = null;
    ResultSet resultSet = null;
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <link rel="icon" href="../assets/logo.svg">
        <link rel="stylesheet" href="../assets/css/asset-sheet.css">
        <link rel="stylesheet" href="../assets/css/navbar-style.css">
        <link rel="stylesheet" href="../assets/css/profile-page-style.css">


        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>

        <link href="https://fonts.googleapis.com/css2?family=Amaranth&family=Quicksand&family=VT323&family=Poppins&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Audiowide&effect=anaglyph">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Press+Start+2P&effect=anaglyph">

        <script language="JavaScript" type="text/javascript" src="/js/jquery-1.2.6.min.js"></script>
        <script language="JavaScript" type="text/javascript" src="/js/jquery-ui-personalized-1.5.2.packed.js"></script>
        <script language="JavaScript" type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>

        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons+Outlined" rel="stylesheet">
	<title>UST-TGS</title>

    </head>
    <body>
        <!-- navbar -->
        <div class="bar"> 
            <div class="nav-content">
                <div class="nav-title">
                    <img class="nav-logo" src="../assets/logo.svg" alt="UST-TGS logo">
                    <a class="" href="/"> 
                        <h1>UST Thomasian Gaming Society</h1>
                    </a>
                </div>
                <div class="nav-options" >
                    <a class="option" href="authenticatedHome.jsp">Home</a>
                    <a class="option" href="authenticatedAbout.jsp">About</a>
                    <a class="option" href="authenticatedEvents.jsp">Events</a>
                    <a class="option" href="authenticatedContacts.jsp">Contact</a>
                    <form style="color:#B92432;" action="myAccountPageVerified.jsp">

                        <input type="submit" value="My Account"  class="button"/>
                    </form>

                </div>
            </div>
        </div>

	<!-- 1st section/ about -->
	<section class="profile-section">
            <div class="profile-container">
		<%
		    response.setHeader("Cache-Control", "no-cache");
		    response.setHeader("Cache-Control", "no-store");
		    response.setHeader("Pragma", "no-cache");
		    response.setDateHeader("Expires", 0);
		    session.setAttribute("verify", session.getAttribute("verify"));
		    String uname = (String) session.getAttribute("username");
		    session.setAttribute("username", uname);
		    if (uname == null) {
			response.sendRedirect("../login.jsp");
		    }
		    try {
			conn = DriverManager.getConnection(url, username, password);
			String query = "SELECT NAME FROM APP.VERIFIEDDB where USERNAME=?";
			PreparedStatement pstmt = conn.prepareStatement(query);
			pstmt.setString(1, uname);
			ResultSet records = pstmt.executeQuery();

                %>
		<button class="button"onclick="location.href = '../PersonalRecordServlet';" name="uname" <c:out value="${username}"/> >
		    <span class="material-icons-outlined">badge</span> 
		    View Personal Record</button>

		<button class="button" onclick="location.href = '../addRecord.jsp';"  name="uname" value="<c:out value="${username}"/>" ${ records.next() != null || records.next() != false ? 'disabled="disabled"': ''}>
		    <span class="material-icons-outlined">person_add_alt</span>
		    Add Record</button>

		<button class="button" onclick="location.href = '../LogoutServlet';">
		    <span class="material-icons-outlined">power_settings_new</span>
		    Logout</button>

		<div class="profile-verify-msg">
                    <span class="material-icons" style="color:green;">check_circle</span>
                    <p> Your account has been verified and you can now add your record.</p>
                </div>
		<%		    } catch (Exception e) {
			e.printStackTrace();
		    }%>

	    </div>
	</div>
    </section>
</body>
</html>
