<%-- 
    Document   : addRecord
    Created on : 03 13, 22, 12:46:41 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <link rel="icon" href="assets/logo.svg">
        <link rel="stylesheet" href="assets/css/asset-sheet.css">
        <link rel="stylesheet" href="assets/css/navbar-style.css">
        <link rel="stylesheet" href="assets/css/addrecord-style.css">

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
	    session.setAttribute("username", session.getAttribute("username"));
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
                        <input type="submit" value="My Account"  class="button"/>
                    </form>

                </div>
            </div>
        </div>

        <section class="login-section">
            <div class="login-container">


                <div class="input-container">
		    
                    <form class="lg-form" method="POST" action="AddRecordServlet">

			<h1>Name: </h1><input type="text" placeholder="Enter Name" name="myname"><br>


			<h1>Course: </h1><input type="text" placeholder="Enter Course" name="course"><br>


			<h1>Age: </h1><input type="text" placeholder="Enter Age" name="age"><br>

			<h1>Birthday: </h1><input type="date" placeholder="Enter Birthday" name="birthday"><br>


			<h1>Gender: </h1><input type="text" placeholder="Enter Gender" name="gender"><br>

			<h1>Student Number: </h1><input type="text" placeholder="Enter Student Number" name="snumber"><br>

			<h1>Contact Number: </h1><input type="text" placeholder="Enter Conatct Number" name="cnumber"><br>

			<h1>Favorite Game: </h1><input type="text" placeholder="Enter Favorite Game" name="favgame"><br>

			<h1>Address: </h1><input type="text" placeholder="Enter Address" name="address"><br>

			<button type="submit">SUBMIT</button>
                    </form>
		    
		    <form class="lg-form" action="subpage/myAccountPageVerified.jsp" class="lg-form">
			<input type="submit" value="GO BACK"  class="button"/>
		    </form>
                </div>



                <a href="/">Forgot Password?</a>
            </div>
        </section>       
    </body>
</html>
