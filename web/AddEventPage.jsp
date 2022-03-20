<%-- Document : AddEventPage Created on : Mar 20, 2022, 10:35:01 AM Author : Oracle --%>

    <%@page contentType="text/html" pageEncoding="UTF-8" %>
        <!DOCTYPE html>
        <html>
        <html>

        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">

            <link rel="icon" href="assets/logo.svg">
            <link rel="stylesheet" href="assets/css/asset-sheet.css">
            <link rel="stylesheet" href="assets/css/navbar-style.css">
            <link rel="stylesheet" href="assets/css/about-style.css">
            <link rel="stylesheet" href="assets/css/AddEventPage-style.css">


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
                <!-- //make a box in the middle of the page-->
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
                <div class="centerbox">
                    <h1>Add Event</h1>
                    <div class="box-body-content-body">
                        <form action="AddEvent" method="post" enctype="multipart/form-data">
                            <div class="form-group">
                                <label for="eventName">Event Name</label>
                                <input type="text" class="form-control" id="eventName" name="eventName"
                                    placeholder="Enter Event Name">
                            </div>
                            <div class="form-group">
                                <label for="eventDescription">Event Description</label>
                                <input type="text" class="form-control" id="eventDescription" name="eventDescription"
                                    placeholder="Enter Event Description">
                            </div>
                            <div class="form-group">
                                <label for="eventDate">Event Date</label>
                                <input type="date" class="form-control" id="eventDate" name="eventDate"
                                    placeholder="Enter Event Date">
                            </div>
                            <div class="form-group">
                                <label for="eventImage">Event Image</label>
                                <input name="imageInput" type="file" class="thumbnailUpload" accept="image/*">
                            </div>
                            <div class="form-group">
                                <input type="submit" value="Submit" class="btn" />
                            </div>

                        </form>
                    </div>
                </div>
        </body>

        </html>