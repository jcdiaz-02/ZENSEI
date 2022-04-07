<%-- 
    Document   : viewPersonalRecordverified
    Created on : 03 13, 22, 12:46:41 AM
    Author     : Admin
--%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <link rel="icon" href="assets/logo.svg">
        <link rel="stylesheet" href="assets/css/asset-sheet.css">
        <link rel="stylesheet" href="assets/css/navbar-style.css">
        <link rel="stylesheet" href="assets/css/about-style.css">
        <link rel="stylesheet" href="assets/css/viewPersonalRecord_verified.css">


        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>

        <link href="https://fonts.googleapis.com/css2?family=Amaranth&family=VT323&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Audiowide&effect=anaglyph">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Press+Start+2P&effect=anaglyph">

        <link href="https://fonts.googleapis.com/icon?family=Material+Icons+Outlined" rel="stylesheet">
        <title>UST-TGS</title>

    </head>
    <body>
	<%
	    response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");
	    String uname = (String) session.getAttribute("username");
	    String role = (String) session.getAttribute("role");
	    if (uname == null) {
		response.sendRedirect("home.jsp");
	    }
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
                    <%
			if (role.equalsIgnoreCase("member")) {
		    %>
		    <form action="MyAccountServlet">
			<input type="hidden" name="verify" value="${verify}" />
			<input type="submit" value="My Account"  class="button"/>
		    </form>
		    <%    } else if (role.equalsIgnoreCase("admin")) { %>
		    <form action="MyAccountServlet">
			<input type="hidden" name="verify" value="${verify}" />
			<input type="submit" value="ADMIN"  class="button"/>
		    </form>
		    <% }%>   

                </div>
            </div>
        </div>

	<!-- 1st section/ about -->
        <section class="personalrecord-section">
            <div class="personalrecord-container">

                <h2>View Personal Record</h2>
                <div class="input-container">
                    <div class ="input">

                        <h3>EMAIL:<c:out value="${email}"/></h3>
			<h3>USERNAME: <c:out value="${username}"/></h3>
			<h3>PASSWORD: <c:out value="${password}"/></h3>
			<h3>NAME:<c:out value="${name}"/></h3>
			<h3>COURSE: <c:out value="${course}"/></h3>
			<h3>AGE:<c:out value="${age}"/></h3>
			<h3>BIRTHDAY: <c:out value="${birthday}"/></h3>
			<h3>GENDER: <c:out value="${gender}"/></h3>
			<h3>STUDENT NUMBER:<c:out value="${snumber}"/></h3>
			<h3>FAVORITE GAME: <c:out value="${favgame}"/></h3>
			<h3>CONTACT NUMBER: <c:out value="${cnumber}"/></h3>
			<h3>ADDRESS:<c:out value="${address}"/></h3>

                    </div>

		    <form class="lg-form" method="POST" action="subpage/myAccountPageVerified.jsp">
                        <button class="button">Go Back</button>
                    </form>
		    <form class="lg-form" method="POST" action="LogoutServlet">
                        <button class="button">Logout</button>
                    </form>
		    <form  class="lg-form" method="POST" action="PDFServlet">
                        <button name="pdfbutton" value ="ownpdf" class="button">Print PDF</button>
                    </form>


		    <h1> Your account has been verified</h1>

                </div>
            </div>
        </section>
    </body>
</html>