<%-- 
    Document   : ViewTodaylRecord.jsp
    Created on : 03 17, 22, 10:33:45 PM
    Author     : Admin
--%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.time.format.DateTimeFormatter"%>
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

        <link rel="icon" href="assets/logo.svg">
        <link rel="stylesheet" href="assets/css/asset-sheet.css">
        <link rel="stylesheet" href="assets/css/navbar-style.css">
        <link rel="stylesheet" href="assets/css/about-style.css">
	<link rel="stylesheet" href="assets/css/records-all-style.css">


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

        <script src="https://kit.fontawesome.com/db09b338f9.js" crossorigin="anonymous"></script>
	<title>UST-TGS</title>

    </head>
    <body>
	<%
	    response.setHeader("Cache-Control", "no-cache");
	    response.setHeader("Cache-Control", "no-store");
	    response.setHeader("Pragma", "no-cache");
	    response.setDateHeader("Expires", 0);

	    session.setAttribute("verify", session.getAttribute("verify"));

	    if (session.getAttribute("username") == null) {
		response.sendRedirect("login.jsp");
	    }

	%>
        <!-- navbar -->
        <div class="bar"> 
	    <input type="checkbox" id="check">
            <label for="check" class="checkbtn">
		<i class="fas fa-bars"></i>
            </label>
            <div class="nav-content">
                <div class="nav-title">
                    <img class="nav-logo" src="assets/logo.svg" alt="UST-TGS logo">
                    <a class="" href="/"> 
                        <h1>UST Thomasian Gaming Society</h1>
                    </a>
                </div>
                <div class="nav-options" >
                    <a class="option" href="subpage/authenticatedHome.jsp">Home</a>
                    <a class="option" href="subpage/authenticatedAbout.jsp">About</a>
                    <a class="option" href="subpage/authenticatedEvents.jsp">Events</a>
                    <a class="option" href="subpage/authenticatedContacts.jsp">Contact</a>
		    <form action="MyAccountServlet">
			<input type="hidden" name="verify" value="${verify}" />
			<input type="submit" value="ADMIN"  class="button"/>
		    </form>

                </div>
            </div>
        </div>

	<!-- 1st section/ about -->
	<section class="all-records-section">
            <div class="all-records-container">
                <div class="all-records-head">
		    <h2>Today's Records</h2>          
                </div>
		<table class="records-table">
		    <tr>
		    <td>Name</td>
		    <td>Course</td>
		    <td>Email</td>
		    <td>Username</td>
		    <td>Password</td>
		    <td>Age</td>
		    <td>Birthday</td>
		    <td>Gender</td>
		    <td>Student Number</td>
		    <td>Favorite Game</td>
		    <td>Contact Number</td>
		    <td>Address</td>
		    <td>Verification</td>
		    </tr>
		    <% try {
			    DateTimeFormatter dtf = DateTimeFormatter.ofPattern("uuuu-MM-dd");
			    LocalDate today = LocalDate.now();
			    String todaydate = dtf.format(today);
			    conn = DriverManager.getConnection(url, username, password);
			    String query = "SELECT * FROM APP.USERDB where DATE=?";
			    PreparedStatement pstmt = conn.prepareStatement(query);
			    pstmt.setString(1, todaydate);
			    ResultSet records = pstmt.executeQuery();
			    while (records.next()) {
		    %>
		    <tr>
			<td>null</td>
			<td>null</td>
			<td><%=records.getString("EMAIL")%></td>
			<td><%=records.getString("USERNAME")%></td>
			<td><%=records.getString("PASSWORD")%></td>
			<td>null</td>
			<td>null</td>
			<td>null</td>
			<td>null</td>
			<td>null</td>
			<td>null</td>
			<td>null</td>
			<td>UNVERIFIED</td>	 
		    </tr>
		    <%
			}
			String query1 = "SELECT * FROM APP.VERIFIEDDB where DATE=?";
			pstmt = conn.prepareStatement(query1);
			pstmt.setString(1, todaydate);
			records = pstmt.executeQuery();
			while (records.next()) {
		    %>
		    <tr>
			<td><%=records.getString("NAME")%></td>
			<td><%=records.getString("COURSE")%></td>
			<td><%=records.getString("EMAIL")%></td>
			<td><%=records.getString("USERNAME")%></td>
			<td><%=records.getString("PASSWORD")%></td>
			<td><%=records.getString("AGE")%></td>
			<td><%=records.getString("BIRTHDAY")%></td>
			<td><%=records.getString("GENDER")%></td>
			<td><%=records.getString("STUDENTNUMBER")%></td>
			<td><%=records.getString("FAVORITEGAME")%></td>
			<td><%=records.getString("CONTACTNUMBER")%></td>
			<td><%=records.getString("ADDRESS")%></td>
			<td>VERIFIED</td>	 
		    </tr>
		    <%
			    }
			} catch (Exception e) {
			    e.printStackTrace();
			}%>

		</table>

		<div class="all-records-buttons"> 
                    <form action="subpage/myAccountPageAdmin.jsp">
                        <input type="submit" value="GO BACK"  class="button"/>
                    </form>

		    <button class="button" onclick="deleteOpenForm()">Delete </button>
		    <button class="button" onclick="verifyOpenForm()">Verify</button>
		    <button class="button" onclick="openForm()">Update </button>

		    <form method="POST" action ="PDFServlet">
			<button class="button" name="pdfbutton" value="alluserpdf">Download PDF</button>
		    </form>

                    <form  action="LogoutServlet">
                        <input type="submit" value="LOGOUT"  class="button"/>
                    </form>
                </div>  


		<div class="form-popup" id="myForm">
		    <form action="updateRecord.jsp" class="form-container">
			<h1>Update Record</h1>

			<label for="uname"><b>Username of record being updated (verified usernames only)</b></label>
			<input type="text" placeholder="Enter Username" name="uname" required>

			<button type="submit" class="submit">Submit</button>
			<button type="button" class="cancel" onclick="closeForm()">Cancel</button>
		    </form>
		</div>

		<div class="form-popup" id="verifyForm">
		    <form action="TransferUserServlet" class="form-container">
			<h1>Verify Record</h1>

			<label for="uname"><b>Username of record being verified</b></label>
			<input type="text" placeholder="Enter Username" name="uname" required>

			<button type="submit" class="submit">Submit</button>
			<button type="button" class="cancel" onclick="verifyCloseForm()">Cancel</button>
		    </form>
		</div>
		<div class="form-popup" id="deleteForm">
		    <form action="DeleteRecordServlet" class="form-container">
			<h1>Delete Record</h1>

			<label for="uname"><b>Username of record being deleted</b></label>
			<input type="text" placeholder="Enter Username" name="uname" required>

			<button type="submit" class="submit">Submit</button>
			<button type="button" class="cancel" onclick="verifyCloseForm()">Cancel</button>
		    </form>
		</div>
		<script>
		    function openForm() {
			document.getElementById("myForm").style.display = "block";
		    }
		    function closeForm() {
			document.getElementById("myForm").style.display = "none";
		    }
		    function verifyOpenForm() {
			document.getElementById("verifyForm").style.display = "block";
		    }
		    function verifyCloseForm() {
			document.getElementById("verifyForm").style.display = "none";
		    }
		    function deleteOpenForm() {
			document.getElementById("deleteForm").style.display = "block";
		    }
		    function deleteCloseForm() {
			document.getElementById("deleteForm").style.display = "none";
		    }

		</script>
	    </div>
	</div>
    </section>
</body>
</html>
