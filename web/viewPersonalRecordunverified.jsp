<%-- Document : viewPersonalRecordunverified Created on : 02 28, 22, 12:46:41 AM Author : Admin --%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <link rel="icon" href="assets/logo.svg">
        <link rel="stylesheet" href="assets/css/asset-sheet.css">
        <link rel="stylesheet" href="assets/css/navbar-style.css">
        <link rel="stylesheet" href="assets/css/about-style.css">
        <link rel="stylesheet" href="assets/css/viewPersonalRecord_unverified.css">


        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>

        <link href="https://fonts.googleapis.com/css2?family=Amaranth&family=VT323&display=swap"
              rel="stylesheet">
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
                    <img class="nav-logo" src="assets/logo.svg" alt="UST-TGS logo">
                    <a class="" href="/">
                        <h1>UST Thomasian Gaming Society</h1>
                    </a>
                </div>
                <div class="nav-options">
                    <a class="option" href="subpage/authenticatedHome.jsp">Home</a>
                    <a class="option" href="subpage/authenticatedAbout.jsp">About</a>
                    <a class="option" href="EventOverview">Events</a>
                    <a class="option" href="subpage/authenticatedContacts.jsp">Contact</a>
                    <form style="color:#B92432;" action="myAccountPage.jsp">
                        <input type="hidden" name="verify" value="${verify}" />
                        <input type="submit" value="My Account" class="button" />
                    </form>

                </div>
            </div>
        </div>

        <!-- 1st section/ about -->
        <section class="personalrecord-section">
            <div class="personalrecord-container">
                <% response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");
                    String uname = (String) session.getAttribute("username");
                    session.setAttribute("verify",
                            session.getAttribute("verify"));
                    session.setAttribute("username", uname);
                            if (uname == null) {
                                response.sendRedirect("home.jsp");
                            }%>
                <h2>View Personal Record</h2>
                <div class="input-container">
                    <div class="input">
                        <h3>EMAIL:
                            <c:out value="${email}" />
                        </h3>
                        <h3>USERNAME:
                            <c:out value="${username}" />
                        </h3>
                        <h3>PASSWORD:
                            <c:out value="${password}" />
                        </h3>

                    </div>

                    <form class="lg-form" method="POST" action="subpage/myAccountPage.jsp">
                        <button class="button">Go Back</button>
                    </form>
                    <form class="lg-form" method="POST" action="LogoutServlet">
                        <button class="button">Logout</button>
                    </form>


                    <h1> Your account is not yet verified</h1>

                </div>
            </div>
        </section>
    </body>

</html>