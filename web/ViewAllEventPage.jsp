<%-- Document : ViewAllEventPage Created on : Mar 20, 2022, 10:34:45 AM Author : Oracle --%>

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
            <link rel="stylesheet" href="assets/css/viewallrecord-style.css">


            <link rel="preconnect" href="https://fonts.googleapis.com">
            <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>

            <link href="https://fonts.googleapis.com/css2?family=Amaranth&family=VT323&display=swap" rel="stylesheet">
            <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Audiowide&effect=anaglyph">
            <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Press+Start+2P&effect=anaglyph">

            <link href="https://fonts.googleapis.com/icon?family=Material+Icons+Outlined" rel="stylesheet">
            <title>UST-TGS</title>

        </head>

        <body>
            <% response.setHeader("Cache-Control", "no-cache" ); response.setHeader("Cache-Control", "no-store" );
                response.setHeader("Pragma", "no-cache" ); response.setDateHeader("Expires", 0);
                session.setAttribute("verify", session.getAttribute("verify")); %>
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
                            <a class="option" href="authenticatedHome.jsp">Home</a>
                            <a class="option" href="authenticatedAbout.jsp">About</a>
                            <a class="option" href="EventPage.jsp">Events</a>
                            <a class="option" href="ContactPage">Contact</a>
                            <form style="color:#B92432;" action="MyAccountServlet">
                                <input type="hidden" name="verify" value="${verify}" />
                                <input type="submit" value="My Account" class="button" />
                            </form>

                        </div>
                    </div>
                </div>

                <h1>Hello World!</h1>
        </body>

        </html>