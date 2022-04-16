<%-- 
    Document   : addRecordAdmin
    Created on : 03 16, 22, 12:46:41 AM
    Author     : Admin
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <link rel="icon" href="assets/logo.svg">
        <link rel="stylesheet" href="assets/css/asset-sheet.css">
        <link rel="stylesheet" href="assets/css/navbar-style.css">
        <link rel="stylesheet" href="assets/css/login-style.css">

        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>

        <link href="https://fonts.googleapis.com/css2?family=Amaranth&family=VT323&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Audiowide&effect=anaglyph">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Press+Start+2P&effect=anaglyph">

        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons+Outlined" rel="stylesheet">
        <title>UST-TGS</title>
    </head>
    <body>
	<%
	    response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");
	%>         
	<!-- navbar -->
        <div class="bar"> 
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
                    <form style="color:#B92432;" action="MyAccountServlet">
			<input type="hidden" name="verify" value="${verify}" />
                        <input type="submit" value="ADMIN"  class="button"/>
                    </form>

                </div>
            </div>
        </div>

        <section class="login-section">
            <div class="login-container">

		<% try {
			conn = DriverManager.getConnection(url, username, password);
			
			String uname = request.getParameter("uname");
			session.setAttribute("primaryusername",uname);
			String query = "SELECT * FROM APP.VERIFIEDDB where USERNAME=?";
			PreparedStatement pstmt = conn.prepareStatement(query);
			pstmt.setString(1, uname);
			ResultSet records = pstmt.executeQuery();
			if(records.next() == false){
			response.sendRedirect("ViewAllRecord.jsp");
			}
			else {
		%>
                <div class="input-container">
                    <form class="lg-form" method="POST" action="UpdateRecordServlet">

			<div class="input">
			    <h1>Email: </h1><input type="email" placeholder="<%=records.getString("EMAIL")%>" name="email">
			</div>

			<div class="input">
			    <h1>Username: </h1><input type="text" placeholder="<%=records.getString("USERNAME")%>" name="uname">
			</div>

			<div class="input">
			    <h1>Password: </h1><input type="text" placeholder="<%=records.getString("PASSWORD")%>" name="pass">
			</div>
			<div class="input">

			    <h1>Name: </h1><input type="text" placeholder="<%=records.getString("NAME")%>" name="myname">
			</div>
			<div class="input">

			    <h1>Course: </h1><input type="text" placeholder="<%=records.getString("COURSE")%>" name="course">
			</div>
			<div class="input">

			    <h1>Age: </h1><input type="number" placeholder="<%=records.getString("AGE")%>" name="age">
			</div>

			<div class="input">

			    <h1>Birthday: </h1><input type="date" placeholder="<%=records.getString("BIRTHDAY")%>" name="birthday">
			</div>

			<div class="input">

			    <h1>Gender: </h1><input type="text" placeholder="<%=records.getString("GENDER")%>" name="gender">
			</div>

			<div class="input">

			    <h1>Student Number: </h1><input type="number" placeholder="<%=records.getString("STUDENTNUMBER")%>" name="snumber">
			</div>

			<div class="input">

			    <h1>Favorite Game: </h1><input type="text" placeholder="<%=records.getString("FAVORITEGAME")%>" name="favgame">
			</div>

			<div class="input">

			    <h1>Contact Number: </h1><input type="number" placeholder="<%=records.getString("CONTACTNUMBER")%>" name="cnumber">
			</div>

			<div class="input">

			    <h1>Address: </h1><input type="text" placeholder="<%=records.getString("ADDRESS")%>" name="homeaddress">
			</div>
			<div class="input">

			    <h1>Role: </h1><input type="text" placeholder="<%=records.getString("ROLE")%>" name="userrole">
			</div>


			<button type="submit" name="recbutton" value="update">SUBMIT</button>
			<%
				}
				records.close();
			    } catch (Exception e) {
				e.printStackTrace();
			    }%>
		    </form>
                </div>


            </div>
        </section>       
    </body>
</html>
