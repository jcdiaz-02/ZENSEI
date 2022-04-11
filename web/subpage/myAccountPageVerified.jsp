<%-- 
    Document   : myAccountPageVerified
    Created on : 03 01, 22, 10:33:45 PM
    Author     : Admin
--%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <link rel="icon" href="../assets/logo.svg">
        <link rel="stylesheet" href="../assets/css/asset-sheet.css">
        <link rel="stylesheet" href="../assets/css/navbar-style.css">
        <link rel="stylesheet" href="../assets/css/about-style.css">
        <link rel="stylesheet" href="../assets/css/myaccountpage-style.css">


        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>

        <link href="https://fonts.googleapis.com/css2?family=Amaranth&family=VT323&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Audiowide&effect=anaglyph">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Press+Start+2P&effect=anaglyph">

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
                    <a class="option" href="../EventOverview">Events</a>
                    <a class="option" href="authenticatedContacts.jsp">Contact</a>
                    <form style="color:#B92432;" action="myAccountPageVerified.jsp">
		
                        <input type="submit" value="My Account"  class="button"/>
                    </form>

                </div>
            </div>
        </div>

	<!-- 1st section/ about -->
        <section class="myaccount-section">
            <div class="myaccount-container">
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

                %>
                <div>
                    <form class="lg-form" method="POST" action ="../PersonalRecordServlet">
                        <button class="button" name="uname" value="<c:out value="${username}"/>">View Personal Record</button>
                    </form>
                </div>	
		<div>
                    <form class="lg-form" method="POST" action ="../addRecord.jsp">
                        <button class="button" name="uname" value="<c:out value="${username}"/>">Add Record</button>
                    </form>
                </div>	
		<div>

                    <form class="lg-form" method="POST" action="../LogoutServlet">
                        <button class="button">Logout</button>
                    </form>
                </div>

                <h1> Your account has been verified</h1>

	    </div>
	</div>
    </section>
</body>
</html>
