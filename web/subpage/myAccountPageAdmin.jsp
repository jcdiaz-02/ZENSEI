<%-- 
    Document   : myAccountPageAdmin
    Created on : 03 15, 22, 10:33:45 PM
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
        <link rel="stylesheet" href="../assets/css/myaccountpageadmin-style.css">


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

	    if (uname == null) {
		response.sendRedirect("home.jsp");
	    }
	%>
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
                    <a class="option" href="../authenticatedHome.jsp">Home</a>
                    <a class="option" href="../authenticatedAbout.jsp">About</a>
                    <a class="option" href="/">Events</a>
                    <a class="option" href="/">Contact</a>
                    <form style="color:#B92432;" action="myAccountPageAdmin.jsp">

                        <input type="submit" value="ADMIN"  class="button"/>
                    </form>

                </div>
            </div>
        </div>

	<!-- 1st section/ about -->
        <section class="myaccount-section">
            <div class="myaccount-container">

                <div>
                    <form class="lg-form" method="POST" action ="../ViewAllRecord.jsp">
                        <button class="button" name="uname" value="<c:out value="${username}"/>">View All Records</button>
		    </form>
                </div>	
		<div>
                    <form class="lg-form" method="POST" action ="../ViewTodayRecord.jsp">
                        <button class="button">View Today's Record</button>
                    </form>
                </div>	
		<div>
                    <form class="lg-form" method="POST" action ="../addRecordAdmin.jsp">
                        <button class="button">Add Record</button>
                    </form>
                </div>	
		<div>

                    <form class="lg-form" method="POST" action="../LogoutServlet">
                        <button class="button">Logout</button>
                    </form>
                </div>

	    </div>
	</div>
    </section>
</body>
</html>
